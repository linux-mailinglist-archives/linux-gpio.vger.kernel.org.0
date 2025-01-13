Return-Path: <linux-gpio+bounces-14700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8DA0B37B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 10:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95A81881600
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 09:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED771FDA75;
	Mon, 13 Jan 2025 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoxIckBa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF6235BEF;
	Mon, 13 Jan 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761603; cv=none; b=aqVr/MisORIc3cjxiYg+URtEbPhvpshE0nsoMldJ0fNju/pODhzWumSa2o8PaW5sKxArSMpu+T4SrD5OSPUdCIn3P0bD/5RGnJtXs3niZigtdZziUPOQWpuXWZV+5ZXBeF/mJe16p05JIqc++FX79lmFW4SA3hBRl+BGoRRs6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761603; c=relaxed/simple;
	bh=SaVhOgz4l86WMJzhR0gLOvaAZrh5zTIpU1lyFWvTS8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtpX7Z8A7eFQoomX48jEdaocbyyKOdkArSEBXtv3s+Wms5uFsj47qdimWhbP6I8IvZ49Nz+LFM+kOfuqhzghoY0C9hkQjp5TVACGy/Cu5xghtT+NBBOyTFjsUjdkzjFtc9KJkdZy4DkuWwaUdyf4PdrANJyDjRVWBYF1V0MVwCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoxIckBa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736761601; x=1768297601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SaVhOgz4l86WMJzhR0gLOvaAZrh5zTIpU1lyFWvTS8A=;
  b=IoxIckBa4VgnY0yqSp1qCIQhzSE6Iuf6+3NcqU7/Xlma2ZfJuGodYwmX
   ibgFZ0onGRsjdfxfEL1dQudzwBmByZcLP8XzrGYVHlOMAboijZKJ+LWun
   SyGUXXBL7YVHaLJXindI3/P6lpt2r5fgul+XFljdCL4je3jtg6/cUx54H
   meuNjBS71JUUB8F3//CKIsL3SJAeTHMdYS7aVkYJ3i0kv5S1BfVjZwrIZ
   KUx3wg24qhYNZsL0e6ehx87Vm6duznpCD460COT7whwSQ8GJoRJ+57bzO
   gmxhiVCPDVN9SxbaM7XcSTZH9hUihu3gsN7JmbUPDqTrJETHDU4MDGA0a
   w==;
X-CSE-ConnectionGUID: oNQ2DSFWSLW1D87GyFU1Bg==
X-CSE-MsgGUID: plUr1OAYTQa+k+PpHD0yQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54555900"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54555900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:46:40 -0800
X-CSE-ConnectionGUID: SkXU9miOQ1OESpcuBG28Kg==
X-CSE-MsgGUID: 4flXyqnIRhCbApGin4zQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109457880"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:46:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXH1m-00000000PVZ-1WoG;
	Mon, 13 Jan 2025 11:46:34 +0200
Date: Mon, 13 Jan 2025 11:46:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
 <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
 <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
 <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
 <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 03, 2025 at 11:28:30AM +0100, Thomas Richard wrote:
> On 12/22/24 00:43, Linus Walleij wrote:
> > Hi Thomas,
> > 
> > thanks for your detailed reply!
> > 
> > On Fri, Dec 20, 2024 at 2:50 PM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> > 
> >> Yes my cover letter was a bit short, and maybe some context was missing.
> > 
> > The text and graphics below explain it very well, so please include them
> > into the commit message so we have it there!
> > 
> >> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> >> header, and also makes a kind of switch/mux.
> > 
> > Since it's Intel we need to notify Andy to help out with this so that
> > it gets done in a way that works with how he think consumers
> > should interact with Intel pin control and GPIO.
> > 
> >> +---------+         +--------------+             +---+
> >>           |         |              |             | H |
> >>           |---------|              |-------------| E |
> >>           |         |              |             | A |
> >> Intel Soc |---------|    FPGA      |-------------| D |
> >>           |         |              |             | E |
> >>           |---------|              |-------------| R |
> >>           |         |              |             |   |
> >> ----------+         +--------------+             +---+
> >>
> >>
> >> For most of the pins, the FPGA opens/closes a switch to enable/disable
> >> the access to the SoC pin from a pin header.
> >> Each "switch", has a direction flag that shall be set in tandem with the
> >> status of the SoC pin.
> >> For example, if the SoC pin is in PWM mode, the "switch" shall be
> >> configured in output direction.
> >> If the SoC pin is set in GPIO mode, the direction of the "switch" shall
> >> corresponds to the GPIO direction.
> >>
> >> +---------+              +--------------+             +---+
> >>           |              |              |             | H |
> >>           |              |      \       |             | E |
> >>           |   PWM1       |       \      |             | A |
> >> Intel Soc |--------------|-----   \-----|-------------| D |
> >>           |              |              |             | E |
> >>           |              |              |             | R |
> >>           |              |    FPGA      |             |   |
> >> ----------+              +--------------+             +---+
> >>
> >> (PWM1 pin from Intel SoC can be used as PWM, and also in GPIO mode,
> >> thanks to the Intel pinctrl driver).
> >>
> >>
> >> Few pins (PINMUX_* pins) work differently. The FPGA acts as a mux and
> >> routes for example the I2C0_SDA pin or GPIOX (of the SoC) to the pin header.
> >>
> >> +---------+           +--------------+             +---+
> >>           | I2C0_SDA  |              |             | H |
> >>           |-----------|----- \       |             | E |
> >>           |           |       \      |             | A |
> >> Intel Soc |           |        \-----|-------------| D |
> >>           | GPIOX     |              |             | E |
> >>           |-----------|-----         |             | R |
> >>           |           |    FPGA      |             |   |
> >> ----------+           +--------------+             +---+
> >>
> >> The pin header looks like this:
> >> +--------------------+--------------------+
> >> |      3.3V          |       5V           |
> >> | GPIO2 / I2C1_SDA   |       5V           |
> >> | GPIO3 / I2C1_SCL   |       GND          |
> >> | GPIO4 / ADC0       | GPIO14 / UART1_TX  |
> >> |      GND           | GPIO15 / UART1_RX  |
> >> | GPIO17 / UART1_RTS | GPIO18 / I2S_CLK   |
> >> |     GPIO27         |       GND          |
> >> |     GPIO22         |      GPIO23        |
> >> |      3.3V          |      GPIO24        |
> >> | GPIO10 / SPI_MOSI  |       GND          |
> >> | GPIO9 / SPI_MISO   |      GPIO25        |
> >> | GPIO11 / SPI_CLK   | GPIO8 / SPI_CS0    |
> >> |      GND           | GPIO7 / SPI_CS1    |
> >> | GPIO0 / I2C0_SDA   | GPIO1 / I2C0_SCL   |
> >> |     GPIO5          |       GND          |
> >> |     GPIO6          | GPIO12 / PWM0      |
> >> | GPIO13 / PWM1      |       GND          |
> >> | GPIO19 / I2S_FRM   | GPIO16 / UART1_CTS |
> >> |     GPIO26         | GPIO20 / I2S_DIN   |
> >> |      GND           | GPIO21 / I2S_DOUT  |
> >> +--------------------+--------------------+
> >>
> >> The GPIOs in the pin header corresponds to the gpiochip I declare in
> >> this driver.
> >> So when I want to use a pin in GPIO mode, the upboard pinctrl driver
> >> requests the corresponding SoC GPIO to the Intel pinctrl driver.
> >> The SoC pins connected to the FPGA, are identified with "external" id.
> >>
> >> The hardware and the FPGA were designed in tandem, so you know for
> >> example that for the GPIOX you need to request the Nth "external" GPIO.
> >>
> >> When you drive your GPIO, the upboard gpiochip manages in the same time
> >> the direction of the "switch" and the value/direction of the
> >> corresponding SoC pin.
> >>
> >> +------------------+         +--------------+             +---+
> >>                    |---------|              |-------------| H |
> >>                    |---------|   GPIOCHIP   |-------------| E |
> >>    Intel gpiochip  |---------|              |-------------| A |
> >>  provided by Intel |---------|    FPGA      |-------------| D |
> >>   pinctrl driver   |---------|              |-------------| E |
> >>                    |---------|              |-------------| R |
> >>                    |---------|              |-------------|   |
> >> +------------------+         +--------------+             +---+
> >>
> >>
> >> About gpiochip_add_pinlist_range(), I added it because the FPGA pins
> >> used by the gpiochip are not consecutive.
> >>
> >> Please let me know if it is not clear.
> >> And sorry I'm not very good to make ascii art.
> > 
> > I get it! We have a similar driver in the kernel already, look into:
> > drivers/gpio/gpio-aggregator.c
> > 
> > The aggregator abstraction is however just software. What you
> > need here is a gpio-aggregator that adds some hardware
> > control on top. But it has a very nice design using a bitmap
> > to keep track of the GPIOs etc, and it supports operations
> > on multiple GPIOs (many man-hours of hard coding and
> > design went into that driver, ask Geert and Andy...)
> > 
> > So I would proceed like this:
> > 
> > - The pin control part of the driver looks sound, except
> >   for the way you add ranges.
> > 
> > - The gpiochip part needs to be refactored using the
> >   ideas from gpio-aggregator.c.
> > 
> > - Look closely at aggregator and see what you can do
> >   based on that code, if you can mimic how it picks up
> >   and forwards all GPIO functions. Maybe part of it
> >   needs to be made into a library?
> >  <linux/gpio/gpio-aggregator.h>?
> >   For example if you start to feel like "I would really like
> >   to just call gpio_fwd_get_multiple() then this is what
> >   you want to do. The library can probably still be
> >   inside gpio-aggregator.c the way we do it in
> >   e.g. gpio-mmio.c, just export and keep library functions
> >   separately.
> 
> Hi Linus,
> 
> Ok I think I understand what you expect.
> I started to look at the gpio-aggregator code, play a bit with it, and
> refactor it to use it from my driver.
> 
> My main issue is about the request of the SoC GPIOs done by the aggregator.
> If from my driver I call the aggregator library to create a gpiochip,
> the SoC pins will be requested. So the SoC pins will be set in GPIO
> mode, and the pins will never be in function mode.
> There is no way to set the pins back to function mode (even if the GPIO
> is free).
> 
> I tried to add a feature in the aggregator to defer the request of the gpio.
> So at the beginning of each ops the gpio_desc is checked. If it is
> valid, the gpio can be used. Otherwise, the gpio is requested.
> For example:
> 
> gpio_fwd_get() {
> 	if (!gpio_desc_is_valid(desc))
> 		desc = request_gpio()
> 
> 	return gpiod_get_value(desc)
> }
> 
> But when a gpiochip is registered, the core calls get_direction() or
> direction_input(), so all GPIOs are requested and it does not solve my
> problem.
> 
> I expect to register a gpiochip without setting all pins in GPIO mode at
> probe time (like all pinctrl driver do).
> But I did not find a solution.

Basically what you need is a pinctrl-aggregattor (an analogue for the pin
muxing and configuration).

-- 
With Best Regards,
Andy Shevchenko



