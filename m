Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D431555AD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2020 11:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgBGKaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Feb 2020 05:30:17 -0500
Received: from mga17.intel.com ([192.55.52.151]:32679 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgBGKaQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Feb 2020 05:30:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Feb 2020 02:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,412,1574150400"; 
   d="scan'208";a="220754738"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2020 02:30:11 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j00tp-0004oC-2z; Fri, 07 Feb 2020 12:30:13 +0200
Date:   Fri, 7 Feb 2020 12:30:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: Re: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
Message-ID: <20200207103013.GJ10400@smile.fi.intel.com>
References: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJWWxuc6epswobHsHj9=FsP7D5gjtUAkEbEXHCsMjNfi8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWWxuc6epswobHsHj9=FsP7D5gjtUAkEbEXHCsMjNfi8g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 07, 2020 at 11:13:43AM +0100, Bartosz Golaszewski wrote:
> czw., 6 lut 2020 o 19:14 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > User may ask device helper tool, for example, udev, to create a specific
> > symbolic link to a device node. GPIO chip character device node is not
> > exceptional. However, libgpiod in the commit d9b1c1f14c6b
> > ("core: harden gpiod_chip_open()") went way too far in the hardening device
> > node check.
> >
> > Relax that hardening for symbolic link to fix the regression.
> >
> > Reproducer:
> >
> >   % gpioinfo /dev/gpiochip5
> >   gpiochip5 - 16 lines:
> >       line   0:  "MUX33_DIR" "uart1-rx-oe" output active-high [used]
> >       ...
> >
> >   % ln -sf /dev/gpiochip5 /dev/MyGPIO_5
> >
> >   % gpioinfo /dev/MyGPIO_5
> >   gpioinfo: looking up chip /dev/MyGPIO_5: Inappropriate ioctl for device
> >
> > Link: https://stackoverflow.com/questions/60057494/gpio-issue-with-sym-link
> > Fixes: d9b1c1f14c6b ("core: harden gpiod_chip_open()")
> > Cc: Bartosz Golaszewski <bartekgola@gmail.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Hi Andy,
> 
> thanks for this - it makes perfect sense. One nit though: could you
> keep the includes ordered alphabetically?

Probably not. The user space relies a lot on header ordering. And limits.h
sounds like one needed to be included first in many cases. That's why I moved
it to the top. I can do it if you insist, but I consider it wrong approach for
the record.

> Also: it would be great if
> you could add a test case for this to tests/tests-chip.c.

I will look at it if I can do quickly something.

For the record I have tested it on Intel Edison with real GPIO chips (so,
that's how reproducer code appears in the commit message).

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


