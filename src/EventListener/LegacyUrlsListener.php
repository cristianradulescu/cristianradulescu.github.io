<?php

namespace App\EventListener;

use Staccato\Event\SiteBuiltEvent;
use Symfony\Component\EventDispatcher\Attribute\AsEventListener;
use Symfony\Component\Filesystem\Filesystem;
use Twig\Environment;

/**
 * Keeps URLs from the Jigsaw version of the site working: Jigsaw paginated under /N/
 * and published the feed at /blog/feed.atom. Renamed articles are redirected with `aliases` instead.
 */
#[AsEventListener]
final class LegacyUrlsListener
{
    private const PAGINATION_REDIRECTS = [2, 3];

    public function __construct(private readonly Environment $twig)
    {
    }

    public function __invoke(SiteBuiltEvent $event): void
    {
        $filesystem = new Filesystem();

        foreach (self::PAGINATION_REDIRECTS as $number) {
            $filesystem->dumpFile(
                $event->buildDirectory.'/'.$number.'/index.html',
                $this->twig->render('@Staccato/redirect.html.twig', [
                    'page' => ['title' => 'Page '.$number, 'urlPath' => '/page/'.$number.'/'],
                ]),
            );
        }

        // Feed readers do not follow HTML redirects, so serve the feed itself at the old path.
        $filesystem->copy($event->buildDirectory.'/rss.xml', $event->buildDirectory.'/blog/feed.atom', true);
    }
}
