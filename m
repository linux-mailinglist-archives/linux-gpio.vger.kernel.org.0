Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADD83464CA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 17:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhCWQRk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 12:17:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:34508 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233234AbhCWQRU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 12:17:20 -0400
IronPort-SDR: 9KRLV87FPyKQKZNZgmnGw0HRbpH8Hzs46Qe1BdlUqVf8YZDiSTFTjWSjZSSey2nUP4ENMMT9sE
 JGXxPXC7gUYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="275609961"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="275609961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 09:17:17 -0700
IronPort-SDR: nLWhYoIZ0EWA97i60IPA6BgWvFvZM5xvluDBzr/QCpXr3XXHeNZPpXKh9sTKVGB2DlEnY9HAmY
 SFbS6A5CJ7wQ==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="524882427"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 09:17:13 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lOjiQ-00F3h9-2l; Tue, 23 Mar 2021 18:17:10 +0200
Date:   Tue, 23 Mar 2021 18:17:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 00/11] gpio: implement the configfs testing module
Message-ID: <YFoUhlEG8NcJ3jfi@smile.fi.intel.com>
References: <20210315091400.13772-1-brgl@bgdev.pl>
 <CAMRc=MfQnofWQKz9tbnTA_1M8BkN37FcxbJpK4hs0RoRebWWkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfQnofWQKz9tbnTA_1M8BkN37FcxbJpK4hs0RoRebWWkw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 03:32:24PM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 15, 2021 at 10:14 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This series adds a new GPIO testing module based on configfs committable items
> > and sysfs. The goal is to provide a testing driver that will be configurable
> > at runtime (won't need module reload) and easily extensible. The control over
> > the attributes is also much more fine-grained than in gpio-mockup.
> >
> > This series also contains a respin of the patches I sent separately to the
> > configfs maintainers - these patches implement the concept of committable
> > items that was well defined for a long time but never actually completed.
> >
> > Apart from the new driver itself, its selftests and the configfs patches, this
> > series contains some changes to the bitmap API - most importantly: it adds
> > devres managed variants of bitmap_alloc() and bitmap_zalloc().

> FYI The configfs patches from this series have been on the mailing
> list for months (long before the GPIO part) and have been re-sent
> several times. You have neither acked or opposed these changes. I
> don't want to delay the new testing driver anymore so I intend to
> apply the entire series and take it upstream through the GPIO tree by
> the end of this week.

Fine with me, feel free to add
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
where it's appropriate.

-- 
With Best Regards,
Andy Shevchenko


