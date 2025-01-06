Return-Path: <linux-gpio+bounces-14544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 271B7A03049
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 20:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580581882AA3
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 19:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E598D1DED58;
	Mon,  6 Jan 2025 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="r4pmh3hx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF2145A03;
	Mon,  6 Jan 2025 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190842; cv=none; b=r0m82A9SMXPvDCV/Ge4jGb+G7NDPkSzUMINg14uI6n40fA4YkukA4fMAvbSEhMc+pLTSS1iLcBAArDSHJu/CL93WDsznaXIXsakxRFGAU71rEWtpPfM0Q1DBb/129geWF/4B+GyJv4xj3sBPDR38V+rFoEZEBSz2yBwHH6OhQBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190842; c=relaxed/simple;
	bh=HzPaooE2aKnEbw/Go9mV5zu/5/WMZRgc1StApFpZv+o=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=vAsqqAQQsrgONug62kuNYvvSOj0S7AQeMxIo7yFHt73PA1gkapp1K9VHkZjz5tFgxkPTaw+5KTSIxXvsTC8Mwls2uwgmmLWZ0cFTWWFQ9PYS432YbUzwqj79iqi/0kNfC9YBh21iOzZwpTzV+Ppdv6Q5PM8oq2TH/LkKzEPPams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=r4pmh3hx; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
	bh=wj5tZG7Np2ka3R5MzhJPJa0pjGDTN8gpGTXh9bLqjco=;
	b=r4pmh3hx4BZK2+hTwLE26umEKEMZ54+UFuz9NzOgG8V8mRs53gVi+3NMTKB5vdnyGQ6rx0COCBmwIx3rsNc3JYkc9IkxBrLieKufioLmBZ0yW19qNk9oXAiANWI+BOzbaElSdKKU2pzs2GXDnwClpBCaLQl9MCV/eufIEBoHolw=
Received: from webmail.netcube.li (WIN-IJ7TS3MJ5LT [127.0.0.1])
	by mail.netcube.li with ESMTPA
	; Mon, 6 Jan 2025 20:13:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 20:13:43 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Linus
 Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 4/4] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat
In-Reply-To: <431fdf8c83178155cd731800be03b8ef@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-5-lukas.schmid@netcube.li>
 <20250103235723.6a893773@minigeek.lan>
 <bed2886fa15d4f72cf34e468e8bfd2153cb1494c.camel@aosc.io>
 <083add26c987bfbfedcda3ddbe5b9880@netcube.li>
 <aa2612f39a81332f4eabe7314210fde480c000da.camel@aosc.io>
 <9191d32ae352f311ad2c2751bca23a7d@netcube.li>
 <20250106004705.10a8c616@minigeek.lan>
 <431fdf8c83178155cd731800be03b8ef@netcube.li>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <aab46bf50c7a284744319e8a62ff9ba0@netcube.li>
X-Sender: lukas.schmid@netcube.li
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Am 2025-01-06 18:25, schrieb Lukas Schmid:
> Am 2025-01-06 01:47, schrieb Andre Przywara:
>> On Sun, 05 Jan 2025 12:25:26 +0100
>> Lukas Schmid <lukas.schmid@netcube.li> wrote:
>> 
>>> Am 2025-01-05 05:17, schrieb Icenowy Zheng:
>>> > 在 2025-01-04星期六的 14:03 +0100，Lukas Schmid写道：
>>> >> Am 2025-01-04 06:12, schrieb Icenowy Zheng:
>>> >> > 在 2025-01-03星期五的 23:57 +0000，Andre Przywara写道：
>>> >> > > On Fri,  3 Jan 2025 20:45:20 +0000
>>> >> > > Lukas Schmid <lukas.schmid@netcube.li> wrote:
>>> >> > >
>>> >> > > (CC:ing Icenowy for a question about the RTC below ...)
>>> >> > >
>>> >> > > > NetCube Systems Kumquat is a board based on the Allwinner V3s
>>> >> > > > SoC,
>>> >> > > > including:
>>> >> > > >
>>> >> > > > - 64MB DDR2 included in SoC
>>> >> > > > - 10/100 Mbps Ethernet
>>> >> > > > - USB-C DRD
>>> >> > > > - Audio Codec
>>> >> > > > - Isolated CAN-FD
>>> >> > > > - ESP32 over SDIO
>>> >> > > > - 8MB SPI-NOR Flash for bootloader
>>> >> > > > - I2C EEPROM for MAC addresses
>>> >> > > > - SDIO Connector for eMMC or SD-Card
>>> >> > > > - 8x 12/24V IOs, 4x normally open relays
>>> >> > > > - DS3232 RTC
>>> >> > > > - QWIIC connectors for external I2C devices
>>> >> > > >
>>> >> > > > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>> >> > > > ---
>>> >> > > >  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>>> >> > > >  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 290
>>> >> > > > ++++++++++++++++++
>>> >> > > >  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
>>> >> > > >  3 files changed, 298 insertions(+)
>>> >> > > >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-
>>> >> > > > netcube-
>>> >> > > > kumquat.dts
>>> >> > > >
>>> >> > > > diff --git a/arch/arm/boot/dts/allwinner/Makefile
>>> >> > > > b/arch/arm/boot/dts/allwinner/Makefile
>>> >> > > > index 48666f73e638..d799ad153b37 100644
>>> >> > > > --- a/arch/arm/boot/dts/allwinner/Makefile
>>> >> > > > +++ b/arch/arm/boot/dts/allwinner/Makefile
>>> >> > > > @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
>>> >> > > >  DTC_FLAGS_sun8i-h3-orangepi-pc := -@
>>> >> > > >  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
>>> >> > > >  DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
>>> >> > > > +DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
>>> >> > > >  dtb-$(CONFIG_MACH_SUN8I) += \
>>> >> > > >         sun8i-a23-evb.dtb \
>>> >> > > >         sun8i-a23-gt90h-v4.dtb \
>>> >> > > > @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>>> >> > > >         sun8i-v3s-anbernic-rg-nano.dtb \
>>> >> > > >         sun8i-v3s-licheepi-zero.dtb \
>>> >> > > >         sun8i-v3s-licheepi-zero-dock.dtb \
>>> >> > > > +       sun8i-v3s-netcube-kumquat.dtb \
>>> >> > > >         sun8i-v40-bananapi-m2-berry.dtb
>>> >> > > >  dtb-$(CONFIG_MACH_SUN9I) += \
>>> >> > > >         sun9i-a80-optimus.dtb \
>>> >> > > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-
>>> >> > > > kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-
>>> >> > > > kumquat.dts
>>> >> > > > new file mode 100644
>>> >> > > > index 000000000000..e5d2a716eb69
>>> >> > > > --- /dev/null
>>> >> > > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
>>> >> > > > @@ -0,0 +1,290 @@
>>> >> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> >> > > > +/*
>>> >> > > > + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
>>> >> > > > + */
>>> >> > > > +
>>> >> > > > +/dts-v1/;
>>> >> > > > +#include "sun8i-v3s.dtsi"
>>> >> > > > +
>>> >> > > > +#include <dt-bindings/input/input.h>
>>> >> > > > +#include <dt-bindings/leds/common.h>
>>> >> > > > +#include <dt-bindings/gpio/gpio.h>
>>> >> > > > +
>>> >> > > > +/{
>>> >> > > > +       model = "NetCube Systems Kumquat";
>>> >> > > > +       compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
>>> >> > > > +
>>> >> > > > +       aliases {
>>> >> > > > +               serial0 = &uart0;
>>> >> > > > +               ethernet0 = &emac;
>>> >> > > > +               rtc0 = &ds3232;
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       chosen {
>>> >> > > > +               stdout-path = "serial0:115200n8";
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       /* 40 MHz Crystal Oscillator on PCB */
>>> >> > > > +       clk_can0: clock-can0 {
>>> >> > > > +               compatible = "fixed-clock";
>>> >> > > > +               #clock-cells = <0>;
>>> >> > > > +               clock-frequency  = <40000000>;
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       gpio-keys {
>>> >> > > > +               compatible = "gpio-keys";
>>> >> > > > +               autorepeat;
>>> >> > > > +
>>> >> > > > +               key-user {
>>> >> > > > +                       label = "GPIO Key User";
>>> >> > > > +                       linux,code = <KEY_PROG1>;
>>> >> > > > +                       gpios = <&pio 1 2 (GPIO_ACTIVE_LOW |
>>> >> > > > GPIO_PULL_UP)>; /* PB2 */
>>> >> > > > +               };
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       leds {
>>> >> > > > +               compatible = "gpio-leds";
>>> >> > > > +
>>> >> > > > +               led-heartbeat {
>>> >> > > > +                       gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /*
>>> >> > > > PE4
>>> >> > > > */
>>> >> > > > +                       linux,default-trigger = "heartbeat";
>>> >> > > > +                       color = <LED_COLOR_ID_GREEN>;
>>> >> > > > +                       function = LED_FUNCTION_HEARTBEAT;
>>> >> > > > +               };
>>> >> > > > +
>>> >> > > > +               led-mmc0-act {
>>> >> > > > +                       gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /*
>>> >> > > > PF6
>>> >> > > > */
>>> >> > > > +                       linux,default-trigger = "mmc0";
>>> >> > > > +                       color = <LED_COLOR_ID_GREEN>;
>>> >> > > > +                       function = LED_FUNCTION_DISK;
>>> >> > > > +               };
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       /* XC6206-3.0 Linear Regualtor */
>>> >> > > > +       reg_vcc3v0: regulator-3v0 {
>>> >> > > > +               compatible = "regulator-fixed";
>>> >> > > > +               regulator-name = "vcc3v0";
>>> >> > > > +               regulator-min-microvolt = <3000000>;
>>> >> > > > +               regulator-max-microvolt = <3000000>;
>>> >> > > > +               vin-supply = <&reg_vcc3v3>;
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       /* EA3036C Switching 3 Channel Regulator - Channel 2 */
>>> >> > > > +       reg_vcc3v3: regulator-3v3 {
>>> >> > > > +               compatible = "regulator-fixed";
>>> >> > > > +               regulator-name = "vcc3v3";
>>> >> > > > +               regulator-min-microvolt = <3300000>;
>>> >> > > > +               regulator-max-microvolt = <3300000>;
>>> >> > > > +               vin-supply = <&reg_vcc5v0>;
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       /* K7805-1000R3 Switching Regulator supplied from main
>>> >> > > > 12/24V terminal block */
>>> >> > > > +       reg_vcc5v0: regulator-5v0 {
>>> >> > > > +               compatible = "regulator-fixed";
>>> >> > > > +               regulator-name = "vcc5v0";
>>> >> > > > +               regulator-min-microvolt = <5000000>;
>>> >> > > > +               regulator-max-microvolt = <5000000>;
>>> >> > > > +       };
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&mmc0 {
>>> >> > > > +       pinctrl-names = "default";
>>> >> > > > +       pinctrl-0 = <&mmc0_pins>;
>>> >> > > > +       vmmc-supply = <&reg_vcc3v3>;
>>> >> > > > +       bus-width = <4>;
>>> >> > > > +       broken-cd;
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&mmc1 {
>>> >> > >
>>> >> > > what's connected here? Are both MMC ports on headers/connectors,
>>> >> > > and
>>> >> > > it's up to the user to connect some SDIO device or an SD/eMMC
>>> >> > > card/slot? Or is this port connected to the ESP32?
>>> >> > >
>>> >> > > > +       pinctrl-names = "default";
>>> >> > > > +       pinctrl-0 = <&mmc1_pins>;
>>> >> > > > +       vmmc-supply = <&reg_vcc3v3>;
>>> >> > > > +       bus-width = <4>;
>>> >> > > > +       broken-cd;
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&usb_otg {
>>> >> > >
>>> >> > > I think traditionally referenced nodes in the board .dts files
>>> >> > > are
>>> >> > > ordered by label name, so usb_otg is but-last. Yes, this is in
>>> >> > > contrast
>>> >> > > to nodes in the SoC .dtsi file, which are ordered by MMIO
>>> >> > > addresses.
>>> >> > >
>>> >> > > > +       extcon = <&tusb320 0>;
>>> >> > > > +       dr_mode = "otg";
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&usbphy {
>>> >> > > > +       usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4
>>> >> > > > */
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&ehci {
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&ohci {
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&rtc {
>>> >> > > > +       status = "disabled";
>>> >> > >
>>> >> > > Please can you explain a bit more what's going on here? I saw you
>>> >> > > mentioning in the cover letter that you brought the "disabled"
>>> >> > > back,
>>> >> > > but I still don't see how this is working when the CCU and the
>>> >> > > pinctrl
>>> >> > > nodes reference the RTC clocks? So what is broken, exactly? Is
>>> >> > > this
>>> >> > > some bug in the SoC? Or don't you supply the SoC's VCC_RTC, so
>>> >> > > the
>>> >> > > calendar is not working when the board is not powered - in
>>> >> > > contrast
>>> >> > > to
>>> >> > > the external RTC?
>>> >> >
>>> >> > Maybe a lack of crystal? But I can understand nothing here, and a
>>> >> > detailed explaination is needed.
>>> >> >
>>> >>
>>> >> I have tried to enable the RTC, but I get a "RTC still busy" from the
>>> >> sunxi-rtc module. The RTC Power is connected, and the 32kHz Crystal
>>> >> is
>> 
>> That sounds actually like a bug somewhere, which should be 
>> investigated
>> and fixed. Disabling the RTC is a quick and dirty workaround, but
>> nothing for upstream.
>> There is a 50ms timeout, which sounds plenty, although you could
>> experiment whether it's too short here:
>> drivers/rtc/rtc-sun6i.c:sun6i_rtc_settime()
>> My hunch is that even longer timeouts won't change that, so we should
>> have a look what's going wrong here, why the RTC does not respond.
>> Don't you supply VCC_RTC to the SoC at all, maybe? Maybe we need
>> the 3.3V for the RTC to work, regardless of whether that is battery
>> backed or not?
>> 
>>> > Weird... Never heard such kind of things...
>>> >
>>> > How do modules in the main SoC that depend on LOSC (32768 Hz osc)
>>> > perform?
>>> >
>>> 
>>> I didn't notice anything running the board. I had one running for
>>> about a month on Kernel 6.8.7 without issues, with the rtc disabled
>>> 
>>> Do you have anything I should check in particular? From the
>>> Datasheet it seems to me that all peripherals in the SoC should
>>> be able to run from the hosc too.
>> 
>> That's a DT issue, you don't *need* the LOSC crystal for operation:
>> The clock controller and the GPIO device reference the RTC LOSC clock,
>> so the respective drivers go ahead and request them, which triggers
>> probing the RTC. If that now fails, because the RTC is disabled, that
>> clock cannot be used, and this has consequences:
>> - The (combinded) GPIO/pinctrl driver only needs the LOSC clock for 
>> the
>>   debouncing part. If that fails, the debouncing init routine will 
>> bail
>>   out (I guess it will not work), but the driver ignores that error 
>> and
>>   proceeds probing, so you are saved, but more by accident. I wonder 
>> if
>>   we should at least print a message here.
>> - The CCU clock driver only uses the LOSC as a potential parent for
>>   some muxes (CPU, AHB, APB2), and the kernel will probably never
>> change
>>   those muxes, and even if, not to the LOSC. So again saved here, by
>>   chance.
>> 
>> So this means your system continues working, but it's very sketchy, 
>> and
>> technically wrong. So disabling the RTC is not really an option for
>> mainline, I'd say.
> 
> Okay, I'll submit v4 with all changes now, and keep the rtc enabled.
> I will try to find out what causes the issue and hopefull create
> another patch.
> 
> I just checked, and the rtc does not throw the error in 6.8.7, so
> that's something to go by...
> 

So I do not know what the issue with the rtc was. I assume it's a
fault on my development-board. I tried it again with a production
pcb, and on it the rtc in the SoC works as intended. I have sent the
new patches with the rtc node removed, and another alias to force the
internal rtc to be rtc1, as the sun6i-rtc seems to get loaded before
the ds3232+.

>> 
>>> >> also
>>> >> on Board. If the RTC's driver wouldn't throw the error I have no
>>> >> issue
>>> >> with
>>> >> leaving the rtc enabled. It would however loose it's memory after
>>> >> power
>>> >> cycle as the Battery is only connected to the DS3232+, hence the
>>> >> alias
>>> >> to
>>> >> rtc0
>>> >>
>>> >> > >
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&pio {
>>> >> > > > +       vcc-pb-supply = <&reg_vcc3v3>;
>>> >> > > > +       vcc-pc-supply = <&reg_vcc3v3>;
>>> >> > > > +       vcc-pe-supply = <&reg_vcc3v3>;
>>> >> > > > +       vcc-pf-supply = <&reg_vcc3v3>;
>>> >> > > > +       vcc-pg-supply = <&reg_vcc3v3>;
>>> >> > > > +
>>> >> > > > +       gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96
>>> >> > > > 32>,
>>> >> > > > <153 7>, <167 25>, <198 26>;
>>> >> > >
>>> >> > > As mentioned in the reply to the previous patch, this doesn't
>>> >> > > look
>>> >> > > right here. Why do you need this, exactly?
>>> >> >
>>> >> > Ah? I don't think there's any tradition on Allwinner platforms to
>>> >> > reserve any GPIOs, except if you have another firmware running on
>>> >> > another processor (e.g. AR100) that needs some GPIO.
>>> >> >
>>> >> > My previous sight of such property is on Qualcomm smartphones,
>>> >> > where a
>>> >> > few GPIOs are reserved for "Trusted" thingy.
>>> >> >
>>> >>
>>> >> My intention here was to have the GPIOs which are not accessible on
>>> >> the
>>> >> SoC's
>>> >> package disabled so that stuff like libgpiod cannot try to access
>>> >> them.
>>> >> The
>>> >> gpiodetect tool did show me them as 'used' when I added the
>>> >> reserved-ranges,
>>> >> so I thought the driver does understand this tag.
>>> >
>>> > Interesting point... Maybe this kind of things should enter the per-
>>> > SoC(package) DTSI?
>> 
>> Our sunxi pinctrl driver does not use this information, we have the
>> number of pins per port and their availability hardcoded in that large
>> table in pinctrl-sun8i-v3s.c.
>> 
>> If there is more code in the kernel that uses this DT property to
>> filter the (userspace?) view of the GPIOs, that's a side effect. If we
>> want this filtering, this code should query the pinctrl driver for 
>> this
>> map, but that's a separate issue. The binding pretty clearly speaks of
>> some per-port GPIO drivers to use this map, ours it not one of them.
>> 
>>> > Although technically they are not "used" but "unavailable".
>>> >
>>> 
>>> Sure, I think I'll remove it from my Patchset for now
>> 
>> Yes, please, do that, I think it's wrong here.
>> 
>>> , but maybe will create another set in the future.
>> 
>> If that solves a problem for you, it should be investigated why, to me
>> it looks like it's a side effect, and that should be done properly
>> instead - for instance by using all those empty strings below as an
>> indicator for availability.
>> But I don't think insisting on that property is the right thing.
>> 
>> Cheers,
>> Andre
>> 
>>> >> > > > +       gpio-line-names = "", "", "", "", // PA
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "CAN_nCS", "CAN_nINT", "USER_SW",
>>> >> > > > "PB3",
>>> >> > > > // PB
>>> >> > > > +                         "USB_ID", "USBC_nINT", "I2C0_SCL",
>>> >> > > > "I2C0_SDA",
>>> >> > > > +                         "UART0_TX", "UART0_RX", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "SPI_MISO", "SPI_SCK", "FLASH_nCS",
>>> >> > > > "SPI_MOSI", // PC
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "", // PD
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "Q12", "Q11", "Q10", "Q9", // PE
>>> >> > > > +                         "LED_SYS0", "I1", "Q1", "Q2",
>>> >> > > > +                         "I2", "I3", "Q3", "Q4",
>>> >> > > > +                         "I4", "I5", "Q5", "Q6",
>>> >> > > > +                         "I6", "I7", "Q7", "Q8",
>>> >> > > > +                         "I8", "UART1_TXD", "UART1_RXD",
>>> >> > > > "ESP_nRST",
>>> >> > > > +                         "ESP_nBOOT", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "SD_D1", "SD_D0", "SD_CLK", "SD_CMD",
>>> >> > > > //
>>> >> > > > PF
>>> >> > > > +                         "SD_D3", "SD_D2", "LED_SYS1", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "ESP_CLK", "ESP_CMD", "ESP_D0",
>>> >> > > > "ESP_D1",
>>> >> > > > // PG
>>> >> > > > +                         "ESP_D2", "ESP_D3", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "",
>>> >> > > > +                         "", "", "", "";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&lradc {
>>> >> > > > +       vref-supply = <&reg_vcc3v0>;
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&codec {
>>> >> > > > +       allwinner,audio-routing =
>>> >> > > > +               "Headphone", "HP",
>>> >> > > > +               "Headphone", "HPCOM",
>>> >> > > > +               "MIC1", "Mic",
>>> >> > > > +               "Mic", "HBIAS";
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&uart0 {
>>> >> > > > +       pinctrl-0 = <&uart0_pb_pins>;
>>> >> > > > +       pinctrl-names = "default";
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&uart1 {
>>> >> > > > +       pinctrl-0 = <&uart1_pe_pins>;
>>> >> > > > +       pinctrl-names = "default";
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&i2c0 {
>>> >> > > > +       pinctrl-0 = <&i2c0_pins>;
>>> >> > > > +       pinctrl-names = "default";
>>> >> > > > +       status = "okay";
>>> >> > > > +
>>> >> > > > +       ds3232: rtc@68 {
>>> >> > > > +               compatible = "dallas,ds3232";
>>> >> > > > +               reg = <0x68>;
>>> >> > > > +       };
>>> >> >
>>> >> > If you're afraid of the non-running internal RTC superseding this
>>> >> > external RTC, you can use an alias rtc0 = &ds3232 to force the ext.
>>> >> > one
>>> >> > to be the first.
>>> >> >
>>> >>
>>> >> Yes exactly, I already have an alias to this rtc as rtc0
>>> >>
>>> >> > > > +
>>> >> > > > +       eeprom0: eeprom@50 {
>>> >> > > > +               compatible = "atmel,24c02";             /*
>>> >> > > > actually
>>> >> > > > it's a 24AA02E48 */
>>> >> > > > +               pagesize = <16>;
>>> >> > > > +               read-only;
>>> >> > > > +               reg = <0x50>;
>>> >> > > > +               vcc-supply = <&reg_vcc3v3>;
>>> >> > > > +
>>> >> > > > +               #address-cells = <1>;
>>> >> > > > +               #size-cells = <1>;
>>> >> > > > +
>>> >> > > > +               eth0_macaddress: macaddress@fa {
>>> >> > > > +                       reg = <0xfa 0x06>;
>>> >> > > > +               };
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       tusb320: typec@60 {
>>> >> > > > +               compatible = "ti,tusb320";
>>> >> > > > +               reg = <0x60>;
>>> >> > > > +               interrupt-parent = <&pio>;
>>> >> > > > +               interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
>>> >> > > > +       };
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&emac {
>>> >> > > > +       allwinner,leds-active-low;
>>> >> > > > +       nvmem-cells = <&eth0_macaddress>;               /*
>>> >> > > > custom
>>> >> > > > nvmem reference */
>>> >> > > > +       nvmem-cell-names = "mac-address";               /* see
>>> >> > > > ethernet-controller.yaml */
>>> >> > > > +       status = "okay";
>>> >> > > > +};
>>> >> > > > +
>>> >> > > > +&spi0 {
>>> >> > > > +       #address-cells = <1>;
>>> >> > > > +       #size-cells = <0>;
>>> >> > > > +       pinctrl-names = "default";
>>> >> > > > +       pinctrl-0 = <&spi0_pins>;
>>> >> > >
>>> >> > > Those two lines look redundant, as they are already specified in
>>> >> > > the
>>> >> > > .dtsi file.
>>> >> > >
>>> >> > > > +       cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
>>> >> > > > +       status = "okay";
>>> >> > > > +
>>> >> > > > +       flash@0 {
>>> >> > > > +               #address-cells = <1>;
>>> >> > > > +               #size-cells = <1>;
>>> >> > > > +               compatible = "jedec,spi-nor";
>>> >> > >
>>> >> > > I think traditionally we have the compatible first, and #a-c and
>>> >> > > #s-c
>>> >> > > last in the node.
>>> >> > > And do you have anything partitioned in there? If not, you
>>> >> > > wouldn't
>>> >> > > need the #a-c and #s-c properties, I think.
>>> >> > >
>>> >> > > > +               reg = <0>;
>>> >> > > > +               label = "firmware";
>>> >> > > > +               spi-max-frequency = <40000000>;
>>> >> > > > +       };
>>> >> > > > +
>>> >> > > > +       can@1 {
>>> >> > > > +               compatible = "microchip,mcp2518fd";
>>> >> > > > +               reg = <1>;
>>> >> > > > +               clocks = <&clk_can0>;
>>> >> > > > +               interrupt-parent = <&pio>;
>>> >> > > > +               interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1
>>> >> > > > */
>>> >> > > > +               spi-max-frequency = <20000000>;
>>> >> > > > +               vdd-supply = <&reg_vcc3v3>;
>>> >> > > > +               xceiver-supply = <&reg_vcc3v3>;
>>> >> > > > +       };
>>> >> > > > +};
>>> >> > > > \ No newline at end of file
>>> >> > >
>>> >> > > Please add a newline at the end.
>>> >> >
>>> >> > Well maybe this file is written with some non-Unix-traditional
>>> >> > editor,
>>> >> > well Linux is something Unix-traditional, and for these editors
>>> >> > manual
>>> >> > insertion of an empty line will be needed (on Unix-traditional
>>> >> > things
>>> >> > e.g. Vim, no empty lines should be presented at all.)
>>> >> >
>>> >> > >
>>> >> > > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
>>> >> > > > b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
>>> >> > >
>>> >> > > I don't know for sure if people want SoC .dtsi patches
>>> >> > > separately?
>>> >> > >
>>> >> > > Cheers,
>>> >> > > Andre
>>> >> > >
>>> >> > > > index 9e13c2aa8911..f909b1d4dbca 100644
>>> >> > > > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
>>> >> > > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
>>> >> > > > @@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
>>> >> > > >                                 function = "uart0";
>>> >> > > >                         };
>>> >> > > >  
>>> >> > > > +                       /omit-if-no-ref/
>>> >> > > > +                       uart1_pe_pins: uart1-pe-pins {
>>> >> > > > +                               pins = "PE21", "PE22";
>>> >> > > > +                               function = "uart1";
>>> >> > > > +                       };
>>> >> > > > +
>>> >> > > >                         uart2_pins: uart2-pins {
>>> >> > > >                                 pins = "PB0", "PB1";
>>> >> > > >                                 function = "uart2";
>>> >> > >
>>> >> > >
>>> >>
>>> >>
>>> 
>>> 


