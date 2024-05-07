Return-Path: <linux-gpio+bounces-6211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CBB8BEABA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1919285FB3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67E816C87B;
	Tue,  7 May 2024 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwRNvNX3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631A17BA1
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715103894; cv=none; b=MIOvl3W/wSTsuum58ouIbZrmYNBn4qMmbi3Iv0bFm5E1C03OLTfC2K6xwoC1wCbHiCi2u87uw42mzrnFiD0XSoHX0R1Cubk1XDNQKdgTA/COWqzB2gBaPq4ChVAsr+z4kfB1Crnuj8t3ZTjZXJEm122xQ5cUqElrunIKtUX0Wls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715103894; c=relaxed/simple;
	bh=afeJ7X9kQkRTOnq7LRYcJeb2wMqKcbRZeouJI2+0JdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7bXkh6IyOPAxGRaLk5njwX3yyiZvrhBoeh2GtPC1U+wC2ZVArzrVSn1Hk+pmJYWrMuithhQSgjOvvWKg0rrGPJ3rfRFU0oaDTPRqFED2eoAZ617u/NDobfRZVV0snJC12eJ5+2JWTkbypQyCkpBBcwsljXm27cRB4n6w9Hb13I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwRNvNX3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EADC2BBFC;
	Tue,  7 May 2024 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715103894;
	bh=afeJ7X9kQkRTOnq7LRYcJeb2wMqKcbRZeouJI2+0JdE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=hwRNvNX37RNh1vyzZyJiMzpxEMtX/l8WZr4bv9TjAFO2XeiFcAiYhWZPsv+Vq+8am
	 32YaXR3RYwRUGroxQXNxFiDHPKU74BX+iIPjwKVBdfEY3AT0AoQZHCVetcR6egwqHa
	 IH8u4PZ6r9r53Wfcb0Xb9Tn766aP6/H/uP4ZR0U1BvLk3DY4rfMiBn5GVNXfONbd6D
	 1aC5tLWxhy9N5F+G3KDLMTiip5dywq0Rz8ie7bWd8K7I5GJ8Tf//rpUPoB0Sres4Lf
	 LZxEFhEcycVydn5schwxfzhrFxTWJBQs3ZzL058sc57w9u7QrJPy3k4XhpvpfwX+rx
	 aXRgPmXt0kekg==
Date: Tue, 7 May 2024 19:44:41 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240507174441.uualqqy65es55gzf@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503082714.ow5qtqu2myi3z2ug@kandell>
 <ZjUyJSuGthKH0q4q@smile.fi.intel.com>
 <20240505081832.vf2267v37shu6fhe@kandell>
 <CAHp75VcDi5hbG3wzygBJ=iGteVrzJp08sKD0cJyS1vvkx8fo6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcDi5hbG3wzygBJ=iGteVrzJp08sKD0cJyS1vvkx8fo6Q@mail.gmail.com>

On Sun, May 05, 2024 at 04:34:28PM +0300, Andy Shevchenko wrote:
> On Sun, May 5, 2024 at 11:18 AM Marek Behún <kabel@kernel.org> wrote:
> > On Fri, May 03, 2024 at 09:51:17PM +0300, Andy Shevchenko wrote:
> > > On Fri, May 03, 2024 at 10:28:17AM +0200, Marek Behún wrote:
> > > > On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:
> 
> ...
> 
> > > > > > +static const char * const omnia_mcu_gpio_templates[64] = {
> > > > > > +       /* GPIOs with value read from the 16-bit wide status */
> > > > > > +       [4]  = "gpio%u.MiniPCIe0 Card Detect",
> > > > > > +       [5]  = "gpio%u.MiniPCIe0 mSATA Indicator",
> > > > > > +       [6]  = "gpio%u.Front USB3 port over-current",
> > > > > > +       [7]  = "gpio%u.Rear USB3 port over-current",
> > > > > > +       [8]  = "gpio%u.Front USB3 port power",
> > > > > > +       [9]  = "gpio%u.Rear USB3 port power",
> > > > > > +       [12] = "gpio%u.Front Button",
> > > > > > +
> > > > > > +       /* GPIOs with value read from the 32-bit wide extended status */
> > > > > > +       [16] = "gpio%u.SFP nDET",
> > > > > > +       [28] = "gpio%u.MiniPCIe0 LED",
> > > > > > +       [29] = "gpio%u.MiniPCIe1 LED",
> > > > > > +       [30] = "gpio%u.MiniPCIe2 LED",
> > > > > > +       [31] = "gpio%u.MiniPCIe0 PAN LED",
> > > > > > +       [32] = "gpio%u.MiniPCIe1 PAN LED",
> > > > > > +       [33] = "gpio%u.MiniPCIe2 PAN LED",
> > > > > > +       [34] = "gpio%u.WAN PHY LED0",
> > > > > > +       [35] = "gpio%u.WAN PHY LED1",
> > > > > > +       [36] = "gpio%u.LAN switch p0 LED0",
> > > > > > +       [37] = "gpio%u.LAN switch p0 LED1",
> > > > > > +       [38] = "gpio%u.LAN switch p1 LED0",
> > > > > > +       [39] = "gpio%u.LAN switch p1 LED1",
> > > > > > +       [40] = "gpio%u.LAN switch p2 LED0",
> > > > > > +       [41] = "gpio%u.LAN switch p2 LED1",
> > > > > > +       [42] = "gpio%u.LAN switch p3 LED0",
> > > > > > +       [43] = "gpio%u.LAN switch p3 LED1",
> > > > > > +       [44] = "gpio%u.LAN switch p4 LED0",
> > > > > > +       [45] = "gpio%u.LAN switch p4 LED1",
> > > > > > +       [46] = "gpio%u.LAN switch p5 LED0",
> > > > > > +       [47] = "gpio%u.LAN switch p5 LED1",
> > > > > > +
> > > > > > +       /* GPIOs with value read from the 16-bit wide extended control status */
> > > > > > +       [48] = "gpio%u.eMMC nRESET",
> > > > > > +       [49] = "gpio%u.LAN switch nRESET",
> > > > > > +       [50] = "gpio%u.WAN PHY nRESET",
> > > > > > +       [51] = "gpio%u.MiniPCIe0 nPERST",
> > > > > > +       [52] = "gpio%u.MiniPCIe1 nPERST",
> > > > > > +       [53] = "gpio%u.MiniPCIe2 nPERST",
> > > > > > +       [54] = "gpio%u.WAN PHY SFP mux",
> > > > > > +};
> > > > >
> > > > > You may reduce the memory footprint of these just by doing "gpio%u."
> > > > > part(s) outside. Here compiler won't compress this (as in the case of
> > > > > repetitive string literals),
> > > >
> > > > Are you saying that I should dynamically create another array just to
> > > > pass it to the gpiochip's names pointer?
> > >
> > > I have looked into this again and now I'm puzzled how you tested this.
> > > To me it seems that those gpio%u will go as a fixed string to the user space,
> > > there is no %u --> number substitution happens. Moreover, this data anyway
> > > is redundant. Userspace and debugfs all have line numbers being printed.
> > >
> >
> > It gets substituted in drivers/gpio/gpiolib-sysfs.c, function
> > gpiod_export():
> >
> >   dev = device_create_with_groups(&gpio_class, &gdev->dev,
> >                                   MKDEV(0, 0), data, gpio_groups,
> >                                   ioname ? ioname : "gpio%u",
> >                                   desc_to_gpio(desc));
> >
> > The ioname variable contains the string.
> >
> > This is then visible in sysfs:
> >
> >   $ cd /sys/class/gpio
> >   $ echo 560 >export
> >   $ ls
> >   ...
> >   gpio560.eMMC nRESET
> >   ...
> 
> Interesting. But before giving my conclusion on this, what is the
> output of /sys/kernel/debug/gpio and `gpioinfo` (the latter from
> libgpiod)?

It prints %u, as you suspected and I see you already posted patch to
avoid this. I'm dropping the "gpio%u." prefixes from GPIO line names.

Marek

