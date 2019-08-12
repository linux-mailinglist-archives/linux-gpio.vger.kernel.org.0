Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C9E89BFA
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 12:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfHLKxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 06:53:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:29582 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbfHLKxL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 06:53:11 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 03:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
   d="scan'208";a="183521892"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2019 03:53:09 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hx7wp-0005aM-Bp; Mon, 12 Aug 2019 13:53:07 +0300
Date:   Mon, 12 Aug 2019 13:53:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190812105307.GA30120@smile.fi.intel.com>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
 <20190808134859.GY30120@smile.fi.intel.com>
 <c4d14b64-6c2f-7e87-ea45-aa780dca85b8@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d14b64-6c2f-7e87-ea45-aa780dca85b8@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 03:59:36PM +0200, Stefan Roese wrote:
> On 08.08.19 15:48, Andy Shevchenko wrote:
> > On Thu, Aug 08, 2019 at 03:25:43PM +0200, Stefan Roese wrote:
> > > This patch fixes a backward compatibility issue, when boards use the
> > > old style GPIO suffix "-gpio" instead of the new "-gpios". This
> > > potential problem has been introduced by commit d99482673f95 ("serial:
> > > mctrl_gpio: Check if GPIO property exisits before requesting it").
> > > 
> > > This patch now fixes this issue by iterating over all supported GPIO
> > > suffixes by using the newly introduced for_each_gpio_suffix() helper.
> > > 
> > > Also, the string buffer is now allocated on the stack to avoid the
> > > problem of allocation in a loop and its potential failure.
> > 
> > >   	for (i = 0; i < UART_GPIO_MAX; i++) {
> > >   		enum gpiod_flags flags;
> > > -		char *gpio_str;
> > > +		const char *suffix;
> > > +		char gpio_str[32];	/* 32 is max size of property name */
> > 
> > Hmm... don't we have some define for the maximum length of property?
> 
> I've come up with this assumption from this code (identical comment):
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib-of.c#L293
> 
> (and other places in drivers/gpio/*)

I tried hard to find an evidence of this in Linux kernel, I assume that comes
from DT compiler or something, but fail. Linux kernel OF properties handling is
written in the assumption of arbitrary length of the property name.

It might be that my hard was not hard at all and I missed something.

> > Or maybe we can still continue using kasprintf() approach?
> 
> Frankly, I was feeling a bit uncomfortable with this memory allocation
> in a loop. And Pavel also commented on this:
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2066286.html

If memory allocator fails, it's a big issue, and what will happen next probably
much less important.

> So I would really prefer to move this buffer to the stack instead.

-- 
With Best Regards,
Andy Shevchenko


