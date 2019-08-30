Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E0CA3B29
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 17:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfH3P7y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 11:59:54 -0400
Received: from verein.lst.de ([213.95.11.211]:56753 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbfH3P7x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Aug 2019 11:59:53 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 50407227A81; Fri, 30 Aug 2019 17:59:49 +0200 (CEST)
Date:   Fri, 30 Aug 2019 17:59:49 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/9] drivers: add new variants of
 devm_platform_ioremap_resource()
Message-ID: <20190830155949.GA26757@lst.de>
References: <20190829143742.24726-1-brgl@bgdev.pl> <CAMuHMdW8d1h-81jy-dgDiLfGB3MGPx+f-Zqz+4D5S+gtmk3-BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8d1h-81jy-dgDiLfGB3MGPx+f-Zqz+4D5S+gtmk3-BQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 29, 2019 at 04:48:36PM +0200, Geert Uytterhoeven wrote:
> Hi Bartosz,
> 
> On Thu, Aug 29, 2019 at 4:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The new devm_platform_ioremap_resource() helper has now been widely
> > adopted and used in many drivers. Users of nocache and write-combined
> > ioremap() variants could profit from the same code shrinkage. This
> > series provides two new versions of devm_platform_ioremap_resource()
> > and uses it in a few example drivers with the assumption that - just
> > like was the case previously - a coccinelle script will be developed
> > to ease the transition for others.
> 
> Please be aware that the number of ioremap() variants is being
> reduced, as some of them are redundant (e.g. ioremap() already creates
> an uncached mapping, so ioremap_nocache() is not needed).
> So less is better than more ;-)

Yes.  If I can get the ia64 and openrisc patch in I plan to send Linus
a scripted removal of ioremap_nocache after -rc1.  I already have a
local patch for current mainline as of about two weeks ago.
