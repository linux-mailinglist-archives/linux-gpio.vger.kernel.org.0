Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B9A10EB55
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 15:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfLBOIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 09:08:06 -0500
Received: from mga02.intel.com ([134.134.136.20]:14019 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727501AbfLBOIG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Dec 2019 09:08:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Dec 2019 06:08:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; 
   d="scan'208";a="200623094"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 02 Dec 2019 06:08:04 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ibmMu-0003RH-4i; Mon, 02 Dec 2019 16:08:04 +0200
Date:   Mon, 2 Dec 2019 16:08:04 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     "Stanimir, Vasile-Laurentiu" 
        <Vasile-Laurentiu.Stanimir@windriver.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based on pullup and polarity
Message-ID: <20191202140804.GK32742@smile.fi.intel.com>
References: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>
 <20191202130553.GG32742@smile.fi.intel.com>
 <D4218E93E3D74741B4028993B2A8DBE0534BF86E@ALA-MBD.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D4218E93E3D74741B4028993B2A8DBE0534BF86E@ALA-MBD.corp.ad.wrs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 02, 2019 at 01:44:04PM +0000, Stanimir, Vasile-Laurentiu wrote:
> ________________________________________
> From: andriy.shevchenko@linux.intel.com [andriy.shevchenko@linux.intel.com]
> Sent: Monday, December 02, 2019 3:05 PM
> To: Stanimir, Vasile-Laurentiu
> Cc: linux-gpio@vger.kernel.org; linus.walleij@linaro.org; mika.westerberg@linux.intel.com
> Subject: Re: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based on pullup and polarity
> 
> On Mon, Dec 02, 2019 at 12:36:47PM +0000, Stanimir, Vasile-Laurentiu wrote:
> > From f8093f2c73c636b75fcf4dee4178af0e24c2f878 Mon Sep 17 00:00:00 2001
> > From: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
> > Date: Mon, 2 Dec 2019 14:20:11 +0200
> > Subject: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based
> >  on pullup and polarity
> >
> > ACPI GPIO resources don't contain an initial value for the
> > GPIO. Therefore instead of deducting its value based on pullup field
> > we should deduce that value from the polarity and the pull field.
> > Typical scenario is when ACPI is defined in acpi-table and its polarity
> > is defined as ACTIVE-LOW in the following call:
> >
> > acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
> >   acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
> >
> > it will return GPIOD_OUT_HIGH if pull_up is set no matter if
> > polarity is GPIO_ACTIVE_LOW, so it will return the current level instead
> > of the logical level.
> 
> Thank you for the patch.
> 
> I have question in general. If we have Active Low polarity and Pull Down,
> isn't it simple a bad ACPI table and rather quirk is needed here?
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
> Hi, 
> 
> It may be, also it may be a bad hardware design but it is also a possible situation.
> 
> In our case here we have an FPGA whose pcie link is held in reset by BIOS during 
> boot, the reset pin is active low, and its configuration is specified in the Acpi DSDT 
> table. When Linux starts, our userspace driver shall load the FPGA, and the first 
> step is to request all GPIO's needed to configure the pcie phy on the FPGA side; 
> the pcie link reset should be held active while this configuration (loading of the 
> Altera fpp image) is ongoing.
> Now all active low pins have their initial value inverted by the kernel. This means 
> that the pcie link reset is briefly released, which generates a pcie hot unplug event, 
> which in turn delays start of a successful loading sequence, and so SW has to make 
> a second reload attempt which will delay too much the normal boot sequence.
> 
> Sorry for giving you too much details which probability are not important but I only
> wanted to emphasise that it may be a real situation whether or not it is a good
> design.

No need to sorry, the details are useful as well as knowing your use case.

Q1: who is providing DSDT?
Q2: why it can't be fixed?
Q3: how the GPIO lines are being requested?
Q4: how are they described, btw, in DSDT?

Side note, if it will be no other choice left, the above code still can be
added as a quirk (see code related to ACPI_GPIO_QUIRK_NO_IO_RESTRICTION
and ACPI_GPIO_QUIRK_ONLY_GPIOIO).

-- 
With Best Regards,
Andy Shevchenko


