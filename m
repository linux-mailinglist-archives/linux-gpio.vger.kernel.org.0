Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193938D4FA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 15:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbfHNNi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 09:38:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:25387 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727956AbfHNNi4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 09:38:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 06:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,385,1559545200"; 
   d="scan'208";a="167427132"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga007.jf.intel.com with ESMTP; 14 Aug 2019 06:38:52 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxtUI-0004EE-NS; Wed, 14 Aug 2019 16:38:50 +0300
Date:   Wed, 14 Aug 2019 16:38:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stefan Roese <sr@denx.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
Message-ID: <20190814133850.GU30120@smile.fi.intel.com>
References: <20190808132543.26274-1-sr@denx.de>
 <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
 <CAMuHMdXP8K+yvUHrjnegnNuViG3YsCAD=PxTsDHJcTLRRjJguQ@mail.gmail.com>
 <CACRpkdZqFGyZETZBoo6xSE9FSMpsbinLquX=4M=2FghdLMxWKw@mail.gmail.com>
 <2f78c3f4-08a4-480e-ff70-8526d0a671ba@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f78c3f4-08a4-480e-ff70-8526d0a671ba@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 03:17:44PM +0200, Stefan Roese wrote:
> On 14.08.19 10:48, Linus Walleij wrote:
> > On Mon, Aug 12, 2019 at 1:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sat, Aug 10, 2019 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
> > > > > Add a helper macro to enable the interation over all supported GPIO
> > > > > suffixes (currently "gpios" & "gpio"). This will be used by the serial
> > > > > mctrl code to check, if a GPIO property exists before requesting it.
> > > > > 
> > > > > Signed-off-by: Stefan Roese <sr@denx.de>
> > > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > Cc: Pavel Machek <pavel@denx.de>
> > > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > 
> > > > I really like this patch, it makes things so much more readable.
> > > 
> > > Do we really need to spread this *-gpio" legacy support all over the kernel?
> > 
> > Not really :/
> > 
> > Isn't it possible to use something like gpiod_count(dev, "foo") to
> > check for any GPIOs instead?
> 
> Good idea. I can rework my patch to use gpiod_count() to check if the
> GPIO exists before requesting it. This way, we're not spreading the
> legacy "-gpio" support any more.
> 
> But I'm unsure, if I should change the string malloc (kasprintf) to the
> fixed length string on the stack as I've done in this patch version.

You don't need suffix for gpiod_count(). Will you need that at all?

-- 
With Best Regards,
Andy Shevchenko


