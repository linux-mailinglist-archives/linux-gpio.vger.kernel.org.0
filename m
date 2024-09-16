Return-Path: <linux-gpio+bounces-10204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C585B97A9BD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 01:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702661F28D3A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 23:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF98F1534E9;
	Mon, 16 Sep 2024 23:47:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1FB5258;
	Mon, 16 Sep 2024 23:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726530454; cv=none; b=Xc+5xG/yB0ZbwLV/9eSMpQAfy5QGpWb8f6YWFUOzj6C3IX9+/KXP5gUrjW0H6T4y4uZKHTPTci4c5j5sK+/PjyUbe32LGk15MZRkRwUUUG4YxKRsCFRHn7kashU0hYfXZD5b1Z5hu+/lIlIw87/Hdg9AizvPBttjA96EqK8Bn0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726530454; c=relaxed/simple;
	bh=/I7qqZEcoU6y0kdp1g0RfS946oqSqX1ygCuHRLuwISw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfuf/vtpptNVguzsVlrBnfQBgWwiqiKBjba7n+S+oe/1/SAPzz9oWnxAMJTT3VUdmd+ANekNf1Pv+Fjf6fBRv80GtIsqA5MX/DwHLZY5oFi8n/EiHcopebPWMNHgSWBwqYJWhDjgic2jCOHUdqr0nfoJiLQy/RiWKgHT+692W5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Mon, 16 Sep 2024 23:47:25 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jesse T <mr.bossman075@gmail.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to
 uart0 in BPI-F3
Message-ID: <20240916234725-GYA2069032@gentoo>
References: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com>
 <20240916024536-GYA2058951@gentoo>
 <CAJFTR8QEwoJDANTgGOyMxX4d539ZjHUU2nzf-sB=Gu5bsHBfyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJFTR8QEwoJDANTgGOyMxX4d539ZjHUU2nzf-sB=Gu5bsHBfyQ@mail.gmail.com>

Hi Jesse:

On 10:18 Mon 16 Sep     , Jesse T wrote:
> On Sun, Sep 15, 2024 at 10:45 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Jesse
> >
> > On 10:45 Sun 15 Sep     , Jesse Taube wrote:
> > >
> > > Before pinctrl driver implemented, the uart0 controller reply on
> > > bootloader for setting correct pin mux and configurations.
> > >
> > > Now, let's add pinctrl property to uart0 of Bananapi-F3 board.
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
> > >   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
> > >   arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
> > >   3 files changed, 28 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > index 023274189b492..bc88d4de25a62 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > @@ -4,6 +4,7 @@
> > >    */
> > >
> > >   #include "k1.dtsi"
> > > +#include "k1-pinctrl.dtsi"
> > >
> > >   / {
> > >       model = "Banana Pi BPI-F3";
> > > @@ -15,5 +16,7 @@ chosen {
> > >   };
> > >
> > >   &uart0 {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&uart0_2_cfg>;
> > >       status = "okay";
> > >   };
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > new file mode 100644
> > > index 0000000000000..a8eac5517f857
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > @@ -0,0 +1,20 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > > + */
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> > >
> > > It would be nice to have a pinfunc header like
> > > arch/arm/boot/dts/nxp/imx/imx7ulp-pinfunc.h.
> > > It would reference and encode the data of "3.2 Pin Multiplex" in
> > > https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned
> > > , the document you attached in the summary.
> > Not sure if it's worth the effort..
> 
> I can send a future patch for this.
> 
Ok, thanks, no objection from my side
but, that gonna be a lot work as you need to list ALL the functions..

> >
> > I gave up of introducing another macro, as it's exactly one to one mapping to
> > GPIO ID, which mean pin(x) -> GPIO_x
> >
> > maybe I could put a comment at K1_PADCONF() to document this?
> 
> I'm weary the Manual may not exist on the site in the future or
> will change formats. But it would be nice otherwise.
> 
> >
> > /* pin is same to the GPIO id according to 3.2 Pin Multiplex of User Manual */
> > #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> >
> > does this sound good to you?
> 
> Sure, add it.
> 
> Also sorry for messing up the reply-to thing thunderbird is confusing.
> 
> Thanks,
> Jesse Taube
> 
> >
> > >
> > > Otherwise,
> > > Acked-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > >
> > thanks
> >
> > > +
> > > +&pinctrl {
> > > +     uart0_2_cfg: uart0-2-cfg {
> > > +             uart0-2-pins {
> > > +                     pinmux = <K1_PADCONF(68, 2)>,
> > > +                              <K1_PADCONF(69, 2)>;
> > > +
> > > +                     bias-pull-up = <0>;
> > > +                     drive-strength = <32>;
> > > +             };
> > > +     };
> > > +};
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > index 0777bf9e01183..a2d5f7d4a942a 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > @@ -416,6 +416,11 @@ uart9: serial@d4017800 {
> > >                       status = "disabled";
> > >               };
> > >
> > > +             pinctrl: pinctrl@d401e000 {
> > > +                     compatible = "spacemit,k1-pinctrl";
> > > +                     reg = <0x0 0xd401e000 0x0 0x400>;
> > > +             };
> > > +
> > >               plic: interrupt-controller@e0000000 {
> > >                       compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
> > >                       reg = <0x0 0xe0000000 0x0 0x4000000>;
> > >
> > > --
> > > 2.45.2
> >
> > --
> > Yixun Lan (dlan)
> > Gentoo Linux Developer
> > GPG Key ID AABEFD55

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

