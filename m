Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B43C51508D7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 15:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgBCO4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 09:56:15 -0500
Received: from mga03.intel.com ([134.134.136.65]:7751 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgBCO4P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Feb 2020 09:56:15 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 06:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="429464990"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2020 06:56:11 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iyd93-00083w-CA; Mon, 03 Feb 2020 16:56:13 +0200
Date:   Mon, 3 Feb 2020 16:56:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/3] gpiolib: fix a regression introduced by
 gpio_do_set_config()
Message-ID: <20200203145613.GG32742@smile.fi.intel.com>
References: <20200203133026.22930-1-brgl@bgdev.pl>
 <20200203143106.GF32742@smile.fi.intel.com>
 <CAMRc=Mc1Du1D_-Xsgj6rtGqOd229J1dVqK3XXSx1Q3vvqM1sow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc1Du1D_-Xsgj6rtGqOd229J1dVqK3XXSx1Q3vvqM1sow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 03, 2020 at 03:35:41PM +0100, Bartosz Golaszewski wrote:
> pon., 3 lut 2020 o 15:31 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > On Mon, Feb 03, 2020 at 02:30:23PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > These three patches fix a regression introduced by commit d90f36851d65
> > > ("gpiolib: have a single place of calling set_config()"). We first need
> > > to revert patches that came on top of it, then apply the actual fix.
> >
> > Thank you for addressing this!
> >
> > It might be good to add Fixes / Depends-on to the first two, but I didn't look
> > if they are in any of v5.5 or older release.
> >
> 
> They're not - the patch in question was merged for v5.6 and then the
> "fixes" came on top of it once it got into next. We're fine here IMO.

Good to know.

P.S. A bit of offtopic. Since you are going to send a PR for v5.6-rc2,
     perhaps you can include fixes for MAINTAINERS data base.

-- 
With Best Regards,
Andy Shevchenko


