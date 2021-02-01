Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DAE30A53E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 11:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbhBAKV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 05:21:27 -0500
Received: from mga14.intel.com ([192.55.52.115]:28116 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232752AbhBAKVX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Feb 2021 05:21:23 -0500
IronPort-SDR: INRPGqexD9NLwoLsUxjkSbA7fMm4CfYOXYfDAmmo81TtqluJ0tjyfDHaJk4eowneEcQRnko2ny
 Gwa5bvBjpCOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="179886442"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="179886442"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:19:32 -0800
IronPort-SDR: ZvShelBViC+QoJw7CsRqYxq9B+j6EaXC5vdg3U9jWMc0d6I96+YSrWotYUxx5uRUqJP5pADF3K
 9xpu7huXTtuw==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="506784591"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:19:29 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6WIo-0016BM-65; Mon, 01 Feb 2021 12:19:26 +0200
Date:   Mon, 1 Feb 2021 12:19:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 5/8] lib: bitmap: remove the 'extern' keyword from
 function declarations
Message-ID: <YBfVrj1BPCo+YAvH@smile.fi.intel.com>
References: <20210129134624.9247-1-brgl@bgdev.pl>
 <20210129134624.9247-6-brgl@bgdev.pl>
 <YBQw3+K/6GDPK5xa@smile.fi.intel.com>
 <CAMRc=Md74KunuEvVsofn9cqcoKEqprepKadPdZA+JV_GMH7X7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md74KunuEvVsofn9cqcoKEqprepKadPdZA+JV_GMH7X7g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 30, 2021 at 09:25:08PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 29, 2021 at 4:59 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jan 29, 2021 at 02:46:21PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > The 'extern' keyword doesn't have any benefits in header files. Remove it.
> >
> > > +int __bitmap_equal(const unsigned long *bitmap1,
> > > +                const unsigned long *bitmap2, unsigned int nbits);
> >
> > Why not
> >
> > int __bitmap_equal(const unsigned long *bitmap1, const unsigned long *bitmap2,
> >                    unsigned int nbits);
> >
> > and so on?
> >
> > It's even in 80 limit.
> >
> 
> I feel like this is purely a matter of taste. No rules define exactly
> how the lines should be broken. I prefer the longer part to be below,
> it just looks better to my eyes.

In above case it's even logically better to split as I proposed.

-- 
With Best Regards,
Andy Shevchenko


