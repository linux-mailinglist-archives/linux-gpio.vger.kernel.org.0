Return-Path: <linux-gpio+bounces-6112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF08BBFBA
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 10:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947EF1F215D8
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 08:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A6563A5;
	Sun,  5 May 2024 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT2LpXCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA93C3FF1
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714897123; cv=none; b=kA82oeVpNGsOeEvnD5sy4et+kCk7E6shTS4DzSkH/TRwQG8yWEvPlcBQN1+VDiRFtqKtDnH/OkBu1rQIzqBOksO5n0vLfC6fD53wefVb02xB+T+jAeMHkjtzOu6x+VQJGa+PcRLclWZ8lJIENaIL2YuTajqMbjJgm2MZHPajhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714897123; c=relaxed/simple;
	bh=1FMFuBl0hrQz+H0k9+W8lNfqcytRvBs+C8vMJJ7rW+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvoGGFrC6gq95CKnsLNAhb0Mq20Xh8gXFQW7VIC2dhaNYSQV5X+jbLaeyBdPMhoDQLyPFgbnz7KzP/CdPQW2XtvKH21v0z9CjNU/IaNkXt25FfCqAMv7uhxiRbnbDAA5IR4kCYpKm7fT4guJKM+p9pZwCeOS4YFJMm16+1r/8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT2LpXCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE006C113CC;
	Sun,  5 May 2024 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714897122;
	bh=1FMFuBl0hrQz+H0k9+W8lNfqcytRvBs+C8vMJJ7rW+I=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=dT2LpXCxvHk1lwYEBoaoDOevchcrrw+mv7haY50ajhWjSRiX3vpdE2uj6xhHsE54t
	 DQDfCMD4/nb/fLGOYWLRxmcFXqmDKrTrD3PKdxn5lf4cX9IbbcxO+mkI0LtqemXHXN
	 odR3lGzvk/Eo/KcB9taqkNxghPPx3An93ZS65Kt50lRnAZkNH+blPtSZbsEPdi/Gl+
	 hzf1mnaRe3yNukWWJF7Biu6xPrYkMCqDheH+ahqq6ZVV3sD3xo3dML0B4/Pt7mr07j
	 M3PypSM8F9wdKKlICuqXad9bw9ihfTDS1KCC527Y2TM2Uc8Nyh+x1efetCrspmC7Fg
	 GRV+CtsY7sbmw==
Date: Sun, 5 May 2024 10:18:32 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240505081832.vf2267v37shu6fhe@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503082714.ow5qtqu2myi3z2ug@kandell>
 <ZjUyJSuGthKH0q4q@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjUyJSuGthKH0q4q@smile.fi.intel.com>

On Fri, May 03, 2024 at 09:51:17PM +0300, Andy Shevchenko wrote:
> On Fri, May 03, 2024 at 10:28:17AM +0200, Marek Behún wrote:
> > On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:
> 
> ...
> 
> > > > +static const char * const omnia_mcu_gpio_templates[64] = {
> > > > +       /* GPIOs with value read from the 16-bit wide status */
> > > > +       [4]  = "gpio%u.MiniPCIe0 Card Detect",
> > > > +       [5]  = "gpio%u.MiniPCIe0 mSATA Indicator",
> > > > +       [6]  = "gpio%u.Front USB3 port over-current",
> > > > +       [7]  = "gpio%u.Rear USB3 port over-current",
> > > > +       [8]  = "gpio%u.Front USB3 port power",
> > > > +       [9]  = "gpio%u.Rear USB3 port power",
> > > > +       [12] = "gpio%u.Front Button",
> > > > +
> > > > +       /* GPIOs with value read from the 32-bit wide extended status */
> > > > +       [16] = "gpio%u.SFP nDET",
> > > > +       [28] = "gpio%u.MiniPCIe0 LED",
> > > > +       [29] = "gpio%u.MiniPCIe1 LED",
> > > > +       [30] = "gpio%u.MiniPCIe2 LED",
> > > > +       [31] = "gpio%u.MiniPCIe0 PAN LED",
> > > > +       [32] = "gpio%u.MiniPCIe1 PAN LED",
> > > > +       [33] = "gpio%u.MiniPCIe2 PAN LED",
> > > > +       [34] = "gpio%u.WAN PHY LED0",
> > > > +       [35] = "gpio%u.WAN PHY LED1",
> > > > +       [36] = "gpio%u.LAN switch p0 LED0",
> > > > +       [37] = "gpio%u.LAN switch p0 LED1",
> > > > +       [38] = "gpio%u.LAN switch p1 LED0",
> > > > +       [39] = "gpio%u.LAN switch p1 LED1",
> > > > +       [40] = "gpio%u.LAN switch p2 LED0",
> > > > +       [41] = "gpio%u.LAN switch p2 LED1",
> > > > +       [42] = "gpio%u.LAN switch p3 LED0",
> > > > +       [43] = "gpio%u.LAN switch p3 LED1",
> > > > +       [44] = "gpio%u.LAN switch p4 LED0",
> > > > +       [45] = "gpio%u.LAN switch p4 LED1",
> > > > +       [46] = "gpio%u.LAN switch p5 LED0",
> > > > +       [47] = "gpio%u.LAN switch p5 LED1",
> > > > +
> > > > +       /* GPIOs with value read from the 16-bit wide extended control status */
> > > > +       [48] = "gpio%u.eMMC nRESET",
> > > > +       [49] = "gpio%u.LAN switch nRESET",
> > > > +       [50] = "gpio%u.WAN PHY nRESET",
> > > > +       [51] = "gpio%u.MiniPCIe0 nPERST",
> > > > +       [52] = "gpio%u.MiniPCIe1 nPERST",
> > > > +       [53] = "gpio%u.MiniPCIe2 nPERST",
> > > > +       [54] = "gpio%u.WAN PHY SFP mux",
> > > > +};
> > > 
> > > You may reduce the memory footprint of these just by doing "gpio%u."
> > > part(s) outside. Here compiler won't compress this (as in the case of
> > > repetitive string literals),
> > 
> > Are you saying that I should dynamically create another array just to
> > pass it to the gpiochip's names pointer?
> 
> I have looked into this again and now I'm puzzled how you tested this.
> To me it seems that those gpio%u will go as a fixed string to the user space,
> there is no %u --> number substitution happens. Moreover, this data anyway
> is redundant. Userspace and debugfs all have line numbers being printed.
> 

It gets substituted in drivers/gpio/gpiolib-sysfs.c, function
gpiod_export():

  dev = device_create_with_groups(&gpio_class, &gdev->dev,
                                  MKDEV(0, 0), data, gpio_groups,
				  ioname ? ioname : "gpio%u",
				  desc_to_gpio(desc));

The ioname variable contains the string.

This is then visible in sysfs:

  $ cd /sys/class/gpio
  $ echo 560 >export
  $ ls
  ...
  gpio560.eMMC nRESET
  ...


> ...
> 
> > > > +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> > > > +               if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
> > > > +                       __assign_bit(i, bits, sts_bits & omnia_gpios[i].bit);
> > > > +               else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
> > > > +                       __assign_bit(i, bits, ext_sts_bits &
> > > > +                                             omnia_gpios[i].bit);
> > > 
> > > One line?
> > 
> > That would be 81 columns, which I would like to avoid.
> 
> 81?! It's fine! Even documentation allows that for the readability.

OK

> > I can remove the _bits suffix from these variables, though. What do you
> > think?
> 
> Make sense as well.
> 
> > > > +               else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
> > > > +                       __assign_bit(i, bits, ext_ctl_bits &
> > > > +                                             omnia_gpios[i].bit);
> > > 
> > > Ditto?
> > > 
> > > > +       }
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

