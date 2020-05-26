Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D961E0EF0
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 15:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388757AbgEYNBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 09:01:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:28350 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388738AbgEYNBO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 09:01:14 -0400
IronPort-SDR: LUnll1JtQp+9Odb/tW4kkzpZwJv2Y9BYyuugcfJxxJCaOYe0AL/g3SuP4h++M4WKbcCWcNz5eK
 DoxtepvkWbsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 06:01:07 -0700
IronPort-SDR: Ecns98lws9973rXmSwrc2HHxbtylbcXs3q7mWX7d+jNJUBKJkH3rmzeNuzoZ+aqjfciXiuj9zZ
 Ixbs1EviShQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="256219220"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 25 May 2020 06:01:05 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdCj6-008mz8-SY; Mon, 25 May 2020 16:01:08 +0300
Date:   Mon, 25 May 2020 16:01:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 5/5] gpio: pca953x: Override GpioInt() pin for Intel
 Galileo Gen 2
Message-ID: <20200525130108.GU1634618@smile.fi.intel.com>
References: <20200520211916.25727-1-andriy.shevchenko@linux.intel.com>
 <20200520211916.25727-5-andriy.shevchenko@linux.intel.com>
 <20200525092028.GQ247495@lahna.fi.intel.com>
 <20200525093150.GL1634618@smile.fi.intel.com>
 <20200525094553.GR247495@lahna.fi.intel.com>
 <20200525101335.GN1634618@smile.fi.intel.com>
 <20200525110556.GT247495@lahna.fi.intel.com>
 <20200525113551.GR1634618@smile.fi.intel.com>
 <20200525122136.GV247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525122136.GV247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 03:21:36PM +0300, Mika Westerberg wrote:
> On Mon, May 25, 2020 at 02:35:51PM +0300, Andy Shevchenko wrote:
> > On Mon, May 25, 2020 at 02:05:56PM +0300, Mika Westerberg wrote:
> > > On Mon, May 25, 2020 at 01:13:35PM +0300, Andy Shevchenko wrote:
> > > > Due to parsing of ACPI tables. I don't want to copy'n'paste 25% of
> > > > gpiolib-acpi.c in here. I think provided solution is cleaner and (more)
> > > > flexible in terms of maintenance.
> > > 
> > > Hmm, you seem to pass a hard-coded pin number (1) to the core that then
> > > passes it back to the driver. Why you can't simple use that number here
> > > directly? You don't need to parse anything. What I'm missing? :-)
> > 
> > Okay, so, AFAIU you are proposing something like this:
> > 
> > 1) find a GPIO controller by the ACPI path (somehow, I guess by finding a
> >    handle followed by physical device behind it); 2) somehow to request a
> >    pin from that device by number;
> > 3) convert to IRQ and use.
> > 
> > Is it correct?
> 
> Well, no. In the first patch you do this:
> 
>   pin = lookup->info.quirks_data;
> 
> and this essentially becomes 1 so you know the pin number upfront in the
> driver. Why not simply get GPIO number 1 in the driver and use it as an
> interrupt? You know already that this particular board with the matching
> DMI identifier always uses the this number anyway.

But GPIO (relative!) number is not enough. We need to understand more, i.e.:
1) from which GPIO controller it comes from (okay, for this particular platform I know it);
2) which expander does have this resource (they all have same ACPI HID).

So, second one means to count GpioInt() resources (I don't remember if we have
helper for that, probably we can add one). For the first we need to get a GPIO
controller something (gpiochip?) And this first one I have no idea how we can
perform without talking to the core.

Basically, it may be done by reimplementing acpi_dev_gpio_irq_get(), followed
by acpi_get_gpiod_by_index(), followed by acpi_gpio_resource_lookup(), followed
by acpi_populate_gpio_lookup(), where at last this quirk should be applied.

It seems for me like an over duplicated solution.

I really don't understand how we can shortcut all these. What am I missing?

-- 
With Best Regards,
Andy Shevchenko


