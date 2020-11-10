Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBF82ADC97
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 18:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgKJRHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 12:07:42 -0500
Received: from mga06.intel.com ([134.134.136.31]:34408 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKJRHl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 12:07:41 -0500
IronPort-SDR: Xb6czI0S6OaBFIIULk/AFLiHRZyExTwWkuWtyfDTDaSiG3AKSmdF0Eq82qN6RA9z17OKrCeYZD
 a/UuiBUfrrGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="231638326"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="231638326"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 09:07:21 -0800
IronPort-SDR: 8lIBQlt+omhWuHSiOpSF8Q0IiNYjUHG45vxp8GFZHhK1l5FrEaEqJGwsW0QGCKFOPcwYGEWVwK
 XQscQG0o+yNg==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="356227904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 09:07:19 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kcX80-005Wtq-IO; Tue, 10 Nov 2020 19:08:20 +0200
Date:   Tue, 10 Nov 2020 19:08:20 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
Message-ID: <20201110170820.GC4077@smile.fi.intel.com>
References: <20201110145552.23024-1-brgl@bgdev.pl>
 <20201110145552.23024-7-brgl@bgdev.pl>
 <20201110150447.GW4077@smile.fi.intel.com>
 <20201110151022.GY4077@smile.fi.intel.com>
 <CAMRc=MfsLc_DKuCaOwq-xDjT0V8yk3rGt8buJ9qgbGNj25youA@mail.gmail.com>
 <20201110161225.GZ4077@smile.fi.intel.com>
 <CAMpxmJV4hsV34YS0Ez9_GsnBakXGgr3NTu8oBd+3Apg+921aRQ@mail.gmail.com>
 <CAHp75VcBp4HLBf1EVxkHYW-=wtJpFPx_14L2xZfBfB9yx5GM7w@mail.gmail.com>
 <CAMRc=McyHfti_9ner8vyF=J=srzWJXsa7GRmwKF1TJ=ksGQM5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McyHfti_9ner8vyF=J=srzWJXsa7GRmwKF1TJ=ksGQM5g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 05:52:26PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 10, 2020 at 5:43 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Nov 10, 2020 at 6:37 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Tue, Nov 10, 2020 at 5:17 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > It's not a typo. But thinking again. This is basically done in regmap
> > to support serial buses. Here we have MMIO pretty much with 32-bit or
> > 64-bit address accesses. I didn't dig into regmap implementation to
> > understand the consequences of changing this to the different values
> > (it seems like rather offset, and in this case 11 is a correct one,
> > not a typo, and regmap is okay with that).
> > But I would rather ask Jan to actually mount debugfs and dump
> > registers and see if it screws up the UART (because it may go all over
> > important registers), that's why I think this configuration is still
> > missing some strict rules about what addresses (offsets) driver may or
> > may not access.
> 
> Ok now I get it. Yes 11 seems to be right in this case for the max
> address. We can implement the readable/writable callbacks to be very
> strict about the register accesses but isn't it overkill? This driver
> is very small and only accesses a couple registers. I don't see such
> strict checking very often except for very complicated modules (like
> pca953x you mentioned).

Maybe a comment in commit message or code that this has no protection against
access to out of boundary registers.

Keep my tag after choosing 11 and whatever you decide for access to non-GPIO
registers from this driver. I'm not blocking this from upstreaming since we
have got a confirmation that main functionality works as expected.


-- 
With Best Regards,
Andy Shevchenko


