Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36A51556AF
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2020 12:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgBGL2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Feb 2020 06:28:17 -0500
Received: from mga11.intel.com ([192.55.52.93]:52340 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgBGL2R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Feb 2020 06:28:17 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Feb 2020 03:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; 
   d="scan'208";a="279957878"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2020 03:28:14 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j01o0-0005bt-MF; Fri, 07 Feb 2020 13:28:16 +0200
Date:   Fri, 7 Feb 2020 13:28:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: Re: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
Message-ID: <20200207112816.GK10400@smile.fi.intel.com>
References: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJWWxuc6epswobHsHj9=FsP7D5gjtUAkEbEXHCsMjNfi8g@mail.gmail.com>
 <20200207103013.GJ10400@smile.fi.intel.com>
 <CAMpxmJUHyby59OOppzk2uWgF6BzOBZnwtKN+=mYKWts-7w68pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUHyby59OOppzk2uWgF6BzOBZnwtKN+=mYKWts-7w68pw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 07, 2020 at 12:01:46PM +0100, Bartosz Golaszewski wrote:
> pt., 7 lut 2020 o 11:30 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> > On Fri, Feb 07, 2020 at 11:13:43AM +0100, Bartosz Golaszewski wrote:
> > > czw., 6 lut 2020 o 19:14 Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> napisał(a):

...

> > > thanks for this - it makes perfect sense. One nit though: could you
> > > keep the includes ordered alphabetically?
> >
> > Probably not. The user space relies a lot on header ordering. And limits.h
> > sounds like one needed to be included first in many cases. That's why I moved
> > it to the top. I can do it if you insist, but I consider it wrong approach for
> > the record.
> 
> Nah, if anything headers may rely on some preprocessor defines coming
> before them, but the ordering should be of no importance.

Okay, in any case, if you think it's better to be sorted, can you change it
when applying? (I don't think we need another version simple for that)

> > > Also: it would be great if
> > > you could add a test case for this to tests/tests-chip.c.
> >
> > I will look at it if I can do quickly something.

> If not, don't worry - I can add it later myself.

I briefly looked at this, but it seems not feasible to me in reasonable time,
sorry.

The problems I encountered are, but not limited to:
- creating a symlink in a test case folder
- understanding how to handle interrupt of the test case (we have to remove
  link ourselves or framework does it for us?)
- where to put the symbolic link creation: I think it might be a (boolean)
  parameter to gpio-mockup testing API when we "make a chip" (when device node
  should appear) to enable symlink with a predefined name (like
  $testpath/gpiochipX-link)
- last time I did something (simple!) with GLib was several years ago

-- 
With Best Regards,
Andy Shevchenko


