Return-Path: <linux-gpio+bounces-23164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0942FB01FE1
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 16:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7744A7BDE18
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A4E2EA156;
	Fri, 11 Jul 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHPx9yp1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEEA2882B6;
	Fri, 11 Jul 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245618; cv=none; b=rVf6ZZ41BBI/Cornsu0QHal7Iw5bYs/gs908rEItWTWqvzLbcb1BaPIz8JOSMpChrvSkbkSse/KiGfYEvV9ydzrrmyTKBmNB9olm44hJD3iwyhoM5lASPv3IAfsnJfTE5GVqfa2TqUsfEILqp50I9YCtP7mVRhx7F9mlwegms4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245618; c=relaxed/simple;
	bh=weYy8uKtYjjSrnR0IGkSOGT5Ua4h72m7odDZ6fUsjXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc8/PL3Luzm3nvWS2mZM2fwokP0A+M+Gd+07cMT6vViNrhQS2pVJpPttttfET2WdP425XTMlt2SqPkEe/qg1sfJTKHsp8htIBi9InMDc6yYUJr4T5ZaM8LdYy+WQh+ISJpz32puzLlryApIyDRueWANK2qNfNMKYDq8Sx/1Qe4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHPx9yp1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752245616; x=1783781616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=weYy8uKtYjjSrnR0IGkSOGT5Ua4h72m7odDZ6fUsjXM=;
  b=MHPx9yp1kH3oeEibAg4MMF1IBQZOJaksae2Kd2TOmaSeI6UG+LwYH+dB
   MQ/lC9wk3KcMsaCFil7s4JIQK+PyZyyfJxkT92GeEig4tXuawcovCcjTZ
   Yij2l/lmX28X76/55TvB8N09obpJPM0QbGyl6eqB9nJGCKdIzM9Covqfi
   kbZ+KiQaY0fyub+PIaURjmts7vhxscq0kZriSTRddOBaGntnd6CWNdIbu
   vDIsl7frhGHDHU1/oH7pa5CKj7qVQ4RTJmbEJWRCyaQcLtEU7IXaJXh+S
   7/Lkr/NLlcOfDEDFLTonFrDel6xMGirBL6h6G+txICwP5loXD78O/asmG
   w==;
X-CSE-ConnectionGUID: EWQ++hM3Q8iv+eri8AiCkA==
X-CSE-MsgGUID: wqyNr1a5SEiKFJOtxPydEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64804955"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="64804955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 07:53:36 -0700
X-CSE-ConnectionGUID: AKfFohTdSTKZSPY+kxprLA==
X-CSE-MsgGUID: yZScKH8uS/mBibH52YlAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="160936132"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 07:53:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uaF7y-0000000EYdm-3FQP;
	Fri, 11 Jul 2025 17:53:30 +0300
Date: Fri, 11 Jul 2025 17:53:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: William Breathitt Gray <wbg@kernel.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Message-ID: <aHElavFTptu0q4Kj@smile.fi.intel.com>
References: <20250709091542.968968-1-marcos@orca.pet>
 <aHD40TD8MLug0C6b@black.fi.intel.com>
 <99b67e0f-783a-4ac0-971f-07cf1544a651@orca.pet>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99b67e0f-783a-4ac0-971f-07cf1544a651@orca.pet>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 11, 2025 at 03:52:39PM +0200, Marcos Del Sol Vives wrote:
> El 11/07/2025 a las 13:43, Andy Shevchenko escribió:

...

> >> + *  Based on the it87xx GPIO driver by Diego Elio Pettenò

> > Why that driver can't be reused?
> 
> The driver uses a completely different port address and operation. It is
> based in the sense I used it as an example of how a I/O mapped GPIO driver
> should work, but nothing else.

Yeah, I got it from reading the code.

...

> >> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > 
> > Why? The driver should use dev_*() macros which will uniquely define the device
> > for what the message is printed.
> 
> The error thrown if the module is attempted to load on a non-Vortex
> processor happens before the platform device is created.

This is a sign of a problematic design of the driver most likely.
And we know now that it's indeed the case.

...

> >> +static DEFINE_SPINLOCK(gpio_lock);
> > 
> > Global lock? Why?
> 
> Becase at most there'll be one GPIO device of this kind loaded, so it didn't
> make sense to me to create a dynamically-allocated private structure of data
> for a single global lock.

Btw, gpio-regmap provides a lcok capability as well.

...

> > So, the above is pretty much simple, why doesn't it use gpio-regmap with the
> > respective configuration? Moreover, SX and DX variants are differ since the
> > latter one may provide an IRQ chip, for which gpio-regmap also can be used,
> > i.o.w. with that done, it will be quite easy to support both.
> 
> Again, I am not an expert on the Linux kernel, but I did not see any code
> or examples using neither gpio-mmio nor gpio-regmap for I/O-mapped registers.

$ git grep -lw '\.io_port[[:space:]]\+= true,'
drivers/counter/104-quad-8.c
drivers/gpio/gpio-104-dio-48e.c
drivers/gpio/gpio-104-idi-48.c
drivers/gpio/gpio-104-idio-16.c
drivers/gpio/gpio-exar.c
drivers/gpio/gpio-gpio-mm.c
drivers/gpio/gpio-pci-idio-16.c
drivers/gpio/gpio-pcie-idio-24.c
drivers/gpio/gpio-ws16c48.c
drivers/iio/addac/stx104.c
drivers/iio/dac/cio-dac.c

Take a look.

...

> IRQ is only available for the first two ports out of the five available.

Would  it be a problem to support them?

> As said in the comment, for shutting down the machine, port 3 is required
> so I'm gonna need to poll anyway.

Comment? Perhaps this all information should be provided in the commit message.

...

> >> +		labels_table[i] = &labels[i][0];
> > '&...[0]' is redundant.
> > Why this can't be made static once?
> 
> It absolutely can.

Better to do that way if even needed. Usually the labeling is part of the
firmware description and I'm quite skeptical about the idea to have it hard
coded. So, let's just drop it altogether.

...

> >> +		.owner = THIS_MODULE,
> > 
> > This field is not needed for ages (15+ years). Is this driver got dusted for this long?
> 
> I saw the field on the documentation as well as on the IT87 driver I was
> using as a reference, so I kept it.

No need, that driver is too old to be a good example for a modern code.

...

> >> +	DEFINE_RES_IO_NAMED(GPIO_DATA_BASE, GPIO_PORTS, KBUILD_MODNAME " data"),
> >> +	DEFINE_RES_IO_NAMED(GPIO_DIRECTION_BASE, GPIO_PORTS, KBUILD_MODNAME " dir"),
> > 
> > Named resources? Why?
> 
> So they appear with the proper name in /proc/iomem. That's the only reason:
> 
> 0000-0cf7 : PCI Bus 0000:00
>   0000-001f : dma1
>   0020-0021 : pic1
>   0040-0043 : timer0
>   0050-0053 : timer1
>   0060-0060 : keyboard
>   0061-0061 : PNP0800:00
>   0064-0064 : keyboard
>   0070-0071 : rtc0
>   0078-007c : gpio_vortex-data
>   0080-008f : dma page reg
>   0098-009c : gpio_vortex-dir
>   00a0-00a1 : pic2
>   00c0-00df : dma2
>   00f0-00ff : PNP0C04:00

Use of the proper device driver design this won't be needed.

...

> >> +static int __init vortex_gpio_init(void)
> >> +{
> >> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_VORTEX) {
> >> +		pr_err("Not a Vortex86 CPU, refusing to load\n");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	pdev = platform_create_bundle(&vortex_gpio_driver, vortex_gpio_probe,
> >> +			vortex_gpio_resources, ARRAY_SIZE(vortex_gpio_resources),
> >> +			NULL, 0);
> >> +	return PTR_ERR_OR_ZERO(pdev);
> >> +}
> > 
> > Oh my... Can you elaborate more on this ugly hack. Why do we need this at all?
> > What's wrong with the BIOS or other firmware that is provided?
> > (The documentation mentions BIOS, btw.)
> > 
> > Also, is this anyhow visible as a PCI device? Is it part of LPC (docs suggests
> > so for SX, but not so clear in DX diagram)?
> 
> The device is available at a hardcoded address for all Vortex86 devices, but
> it is not part of any device in particular, and I don't see any good way
> to enable it on all Vortex devices other than checking the CPU vendor.

As the driver for 0x6030 shows, you need a South Bridge driver that will do all
this. We do like this on many x86 devices (see lpc_ich.c as an example).

So, this hack is not needed at all. Just use normal PCI ID (either 0x6023 in
your case or 0x1031, depending on what `lspci -nk` shows in terms of driver in
use without this driver being enabled.

> These are the PCI devices on my DX3:
> 
> 00:00.0 Host bridge [0600]: RDC Semiconductor, Inc. R6023 Host Bridge [17f3:6023] (rev 02)
> 00:01.0 PCI bridge [0604]: RDC Semiconductor, Inc. PCI/PCI-X to PCI-E Bridge [17f3:1031] (rev 01)
> 00:02.0 PCI bridge [0604]: RDC Semiconductor, Inc. PCI/PCI-X to PCI-E Bridge [17f3:1031] (rev 01)
> 00:07.0 ISA bridge [0601]: RDC Semiconductor, Inc. R6035 ISA Bridge [17f3:6035] (rev 01)
> 00:07.1 ISA bridge [0601]: RDC Semiconductor, Inc. R6035 ISA Bridge [17f3:6035] (rev 01)
> 00:0a.0 USB controller [0c03]: RDC Semiconductor, Inc. R6060 USB 1.1 Controller [17f3:6060] (rev 14)
> 00:0a.1 USB controller [0c03]: RDC Semiconductor, Inc. R6061 USB 2.0 Controller [17f3:6061] (rev 08)
> 00:0c.0 IDE interface [0101]: RDC Semiconductor, Inc. R1012 IDE Controller [17f3:1012] (rev 02)
> 00:0d.0 VGA compatible controller [0300]: RDC Semiconductor, Inc. RDC M2015 VGA-compatible graphics adapter [17f3:2015]
> 00:0e.0 Audio device [0403]: RDC Semiconductor, Inc. R3010 HD Audio Controller [17f3:3010] (rev 01)
> 01:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 07)
> 
> There's no multipurpose device that actually claims ownership of these I/O
> ports according to the PCI's configuration section.

Can you share (via some sharing resource) the following (as root user!):
1) `dmesg` to the boot to shell when kernel command line has 'ignore_loglevel'
2) `lspci -nk -vv`
3) `acpidump -o vortex-dx3.dat` (the *.dat file)
4) `grep -H 15 /sys/bus/acpi/devices/*/status`
5) `cat /proc/interrupts`
6) `cat /proc/iomem`
7) `cat /proc/ioport`

?

> In fact the Vortex86MX-based EBOX-3350MX mini PC has a different host bridge
> (R6021) and different ISA bridges (R6031), but has the very same GPIO.

Right, so they need to re-use the platform device driver that is a child of the
PCI driver that enumerates everything which is not enumerable. But let's first
see the above mentioned data (output) to understand which of them is the most
plausible to use.

> And in "dmidecode" I just see a lot of lies (this device certainly does NOT
> have fans or a parallel port) plus "To Be Filled By O.E.M." fields. Also
> matching on BIOS does not seem a good idea since there are other industrial
> machines that may not be using or reporting the same BIOS versions.

Yeah, DMI often is not much helpful on the mass-marked devices.

> > On top of that the GPIO3 is marked as one with the pin muxing. Where is the driver
> > for it? Or what are the plans about it?
> > 
> > GPIO4 seems muxed with UART, so also subject to pin muxing.
> 
> The documentation does not cover how to use those UARTs and the pins default
> to I/O, so I would say they're not a problem for now.

Is that the only datasheet you have?

> Ultimately, as mentioned, the goal is implementing a correct power off
> sequence for ICOP EBOX machines and DM&P evaluation boards, which require
> manually polling for the power off button, then setting an output pin
> low to shut off power to the machine.

While fully understanding the goal, the upstreaming process may require to
follow the common Linux device model, which tries to replicate HW topology in
the SW as much as possible (taking into account firmwares and PCB level
solutions). That's why we don't usually support shortcuts. It's better to
implement a set of very basic drivers according to the model, than hack
everything up in one driver somewhere. That simply does not scale.

-- 
With Best Regards,
Andy Shevchenko



