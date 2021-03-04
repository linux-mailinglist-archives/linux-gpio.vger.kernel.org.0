Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7962A32D154
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 12:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239213AbhCDLAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 06:00:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:23011 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239212AbhCDLAF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 06:00:05 -0500
IronPort-SDR: friwKbRkLyQ45Fj+y30t5ibN11MQWqyauzSKbftBuE4GdpwIYY3irEveV8LnZWc6DuuKvBR4ad
 zfbvgNNC8z8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174507475"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="174507475"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 02:58:19 -0800
IronPort-SDR: Pz2VyUquBb9azIc1O51nDtKqJMbK0ZToGPO7EKOTYrthZ+lPzlkBYT8ImUhNrPBxaA+ucZGs1M
 0CH/yLmzHQeQ==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="400557230"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 02:58:17 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lHlgN-009rQ0-4a; Thu, 04 Mar 2021 12:58:15 +0200
Date:   Thu, 4 Mar 2021 12:58:15 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 2/2] gpio: aggregator: Replace custom get_arg() with a
 generic next_arg()
Message-ID: <YEC9R+nSkFNqVyNG@smile.fi.intel.com>
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
 <20210301165932.62352-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXdjN+8DzNOMbs4Xde39sVYjU-7zqPiYLw1iy=cm_-Aeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXdjN+8DzNOMbs4Xde39sVYjU-7zqPiYLw1iy=cm_-Aeg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 10:01:46AM +0100, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Mon, Mar 1, 2021 at 5:59 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > cmdline library provides next_arg() helper to traverse over parameters
> > and their values given in command line. Replace custom approach in the driver
> > by it.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -93,13 +68,9 @@ static int aggr_parse(struct gpio_aggregator *aggr)
> >         if (!bitmap)
> >                 return -ENOMEM;
> >
> > -       for (name = get_arg(&args), offsets = get_arg(&args); name;
> > -            offsets = get_arg(&args)) {
> > -               if (IS_ERR(name)) {
> > -                       pr_err("Cannot get GPIO specifier: %pe\n", name);
> > -                       error = PTR_ERR(name);
> > -                       goto free_bitmap;
> > -               }
> > +       args = next_arg(args, &name, &p);
> > +       while (*args) {
> > +               args = next_arg(args, &offsets, &p);
> 
> As name and offsets should not contain equal signs (can they?),
> I guess using next_arg() is fine.

Even though we can use double quotes (AFAICU the next_arg() code).

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


