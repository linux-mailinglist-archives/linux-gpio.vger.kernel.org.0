Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A674300480
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbhAVNrz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:47:55 -0500
Received: from mga01.intel.com ([192.55.52.88]:13959 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727354AbhAVNry (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 08:47:54 -0500
IronPort-SDR: tGOcFnDhSlJBFqCUlznYAIcpt0FiLOgpV+rcrymWtCwQrOFn3TirYNO8FOU5039oU9230dpFMU
 2ouIAjz4QJZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198201668"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="198201668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 05:46:08 -0800
IronPort-SDR: 4BL0vArxNw3ZdNqAVcbM8MDF/4gF4tiCdn901uRVYnoDyRAunXmYSri1TgBPp0yknlrasQGgKr
 e2Pm49LPv/PQ==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="467927162"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 05:46:07 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2wmM-008w6t-5x; Fri, 22 Jan 2021 15:47:10 +0200
Date:   Fri, 22 Jan 2021 15:47:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] lib/cmdline: Update documentation to reflect
 behaviour
Message-ID: <YArXXlPLtMB4cdlO@smile.fi.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
 <20210122123853.75162-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdVxNNh+L-Hz7_QURPCWzGfKd-jTKyQXn2WbMpX4habDSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVxNNh+L-Hz7_QURPCWzGfKd-jTKyQXn2WbMpX4habDSA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 02:10:17PM +0100, Geert Uytterhoeven wrote:
> On Fri, Jan 22, 2021 at 1:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > get_options() API has some tricks to optimize that may be not so obvious
> > to the caller. Update documentation to reflect current behaviour.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Thanks for your patch!

Thanks for review.
I'll fix this in my repo w/o sending a v4.

> > --- a/lib/cmdline.c
> > +++ b/lib/cmdline.c
> > @@ -83,7 +83,7 @@ EXPORT_SYMBOL(get_option);
> >   *     get_options - Parse a string into a list of integers
> >   *     @str: String to be parsed
> >   *     @nints: size of integer array
> > - *     @ints: integer array
> > + *     @ints: integer array (must have a room for at least one element)
> 
> must have room
> 
> >   *
> >   *     This function parses a string containing a comma-separated
> >   *     list of integers, a hyphen-separated range of _positive_ integers,
> > @@ -91,6 +91,11 @@ EXPORT_SYMBOL(get_option);
> >   *     full, or when no more numbers can be retrieved from the
> >   *     string.
> >   *
> > + *     Returns:
> > + *
> > + *     The first element is filled by the amount of the collected numbers
> 
> the number of collected integers?
> 
> Yes, the lack of articles in RU can be a disadvantage...

:-)

> 
> > + *     in the range. The rest is what was parsed from the @str.
> > + *
> >   *     Return value is the character in the string which caused
> >   *     the parse to end (typically a null terminator, if @str is
> >   *     completely parseable).
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
With Best Regards,
Andy Shevchenko


