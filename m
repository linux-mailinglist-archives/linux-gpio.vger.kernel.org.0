Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3850B112D3E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 15:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfLDOIj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 09:08:39 -0500
Received: from mga12.intel.com ([192.55.52.136]:50429 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727828AbfLDOIj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 09:08:39 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 06:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; 
   d="scan'208";a="412596129"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2019 06:08:34 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1icVKU-0004bq-Bw; Wed, 04 Dec 2019 16:08:34 +0200
Date:   Wed, 4 Dec 2019 16:08:34 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     "Stanimir, Vasile-Laurentiu" 
        <Vasile-Laurentiu.Stanimir@windriver.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based on pullup and polarity
Message-ID: <20191204140834.GP32742@smile.fi.intel.com>
References: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>
 <20191202130553.GG32742@smile.fi.intel.com>
 <D4218E93E3D74741B4028993B2A8DBE0534BF86E@ALA-MBD.corp.ad.wrs.com>
 <20191202140804.GK32742@smile.fi.intel.com>
 <D4218E93E3D74741B4028993B2A8DBE0534C01E5@ALA-MBD.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D4218E93E3D74741B4028993B2A8DBE0534C01E5@ALA-MBD.corp.ad.wrs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 03, 2019 at 03:24:57PM +0000, Stanimir, Vasile-Laurentiu wrote:
> On Mon, Dec 02, 2019 at 01:44:04PM +0000, Stanimir, Vasile-Laurentiu wrote:
> > On Mon, Dec 02, 2019 at 12:36:47PM +0000, Stanimir, Vasile-Laurentiu wrote:

> > > ACPI GPIO resources don't contain an initial value for the
> > > GPIO. Therefore instead of deducting its value based on pullup field
> > > we should deduce that value from the polarity and the pull field.
> > > Typical scenario is when ACPI is defined in acpi-table and its polarity
> > > is defined as ACTIVE-LOW in the following call:
> > >
> > > acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
> > >   acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
> > >
> > > it will return GPIOD_OUT_HIGH if pull_up is set no matter if
> > > polarity is GPIO_ACTIVE_LOW, so it will return the current level instead
> > > of the logical level.
> >
> > Thank you for the patch.
> >
> > I have question in general. If we have Active Low polarity and Pull Down,
> > isn't it simple a bad ACPI table and rather quirk is needed here?

> > It may be, also it may be a bad hardware design but it is also a possible situation.
> >
> > In our case here we have an FPGA whose pcie link is held in reset by BIOS during
> > boot, the reset pin is active low, and its configuration is specified in the Acpi DSDT
> > table. When Linux starts, our userspace driver shall load the FPGA, and the first
> > step is to request all GPIO's needed to configure the pcie phy on the FPGA side;
> > the pcie link reset should be held active while this configuration (loading of the
> > Altera fpp image) is ongoing.
> > Now all active low pins have their initial value inverted by the kernel. This means
> > that the pcie link reset is briefly released, which generates a pcie hot unplug event,
> > which in turn delays start of a successful loading sequence, and so SW has to make
> > a second reload attempt which will delay too much the normal boot sequence.
> >
> > Sorry for giving you too much details which probability are not important but I only
> > wanted to emphasise that it may be a real situation whether or not it is a good
> > design.
> 
> No need to sorry, the details are useful as well as knowing your use case.
> 
> Q1: who is providing DSDT?
> Q2: why it can't be fixed?
> Q3: how the GPIO lines are being requested?
> Q4: how are they described, btw, in DSDT?
> 
> Side note, if it will be no other choice left, the above code still can be
> added as a quirk (see code related to ACPI_GPIO_QUIRK_NO_IO_RESTRICTION
> and ACPI_GPIO_QUIRK_ONLY_GPIOIO).
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> Hi, 
> 
> Unfortunately the DSDT is confidential,

OK, I assume that the devices with it are not in the wild (yet).

> also I'm not the one that did the DSDT table,

Then they should fix that, no?

>      	but I can say 
> that the GpioIo macro is used to define the pins, and a label is assigned. This label is used for the 
> lookup (gpiod_get(device, label, 0)). 
> The requester knows nothing about the specific configuration and polarity of each pin, this is only 
> available through DSDT, so it's not possible to supply flags in the gpiod_get-call.

Right.

> The pin itself is a reset pin that must (as defined by rfc2119) be asserted during Linux boot (it controls
>  the reset logic of a soc external device), the polarity is active low, which is why it's configured with a PullDown. 

And here is the issue AFAICS. The Active low should be configured with PullUp
and set to whatever BIOS wants.

Correct me if I'm wrong, but code does the following in
the properly configured DSDT:

0/ (not OS) firmware prepares ACPI DSDT with parameters (see 2/) and sets pin
   to active state - electrical low;
1/ we request GPIO via gpiod_get(..., GPIOD_ASIS);
2/ ACPI provides: IoOutput + Active Low + PullUp;
3/ above is translated to GPIO flags = GPIOD_OUT_HIGH and look up flags =
   GPIO_PULL_UP | GPIO_ACTIVE_LOW;
4/ ...which calls gpiod_direction_output() with value = 1 and being inverted
   to 0 due to Active Low in the descriptor flags;
5/ 0, i.e. electrically low signal, comes out from the SoC (compare
   with 0/ above).

If it's not, we need to fix a root cause of it.

> Also we discussed here about using IoRestrictionNone/IoRestrictionNonePreserve as a potential solution to 
> this problem, but this is a pure output pin, so that didn't seem right to us either.
> 
> In the end the main question, no matter the use case,  is how an active low pin, that's being 
> asserted from BIOS, should be configured in the DSDT to be correctly represented by the code.
> The patch was the result of not finding any solution to the problem above. Speaking strictly of the 
> patch it should solve the problem of this case of active-low pins. 

P.S. Before we are going further we need to see the dmesg when
CONFIG_DEBUG_GPIO is set along with GpioIo() macro and corresponding
_DSD() excerpts from DSDT.

-- 
With Best Regards,
Andy Shevchenko


