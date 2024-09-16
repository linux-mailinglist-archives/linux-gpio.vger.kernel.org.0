Return-Path: <linux-gpio+bounces-10191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00E97A401
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 16:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4086E283ED8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 14:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9925515687D;
	Mon, 16 Sep 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7cBKiuJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3271DFE4;
	Mon, 16 Sep 2024 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496346; cv=none; b=B/kIoq1bUDg15l9x8iDEA/FSqFsOJQb4oxlOfPbraBoAxRrtBEDZS6Uo4zXiv5pZ3GPRKtyM/16jtxjo9QGFBvsk4UwcgSa59StSi2L8MdgbeGPSDqX/135gCOKymeEEhnjhhyIywLJwKXrIT03XK93vojr48uLz1ZHBpvuZdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496346; c=relaxed/simple;
	bh=0L1pVDw9+g6yiinnfF22f0ZnHbFiPNaVmi747h3ys84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGVg6ckyGSvOTAb9kREZml736LzaUnNnpPdLF270Ykipw1aOCNKNTsyhq3EvO6YL8IN31jyK8yiKKPylNV5T+ksMAgZS0mxKDgvcFF401vmpWVR0IZ9jm+iHHzqoM7a5d0d7f1S580J79NNewVJXdgt+Qwrc3apa91S/E7MmUOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7cBKiuJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-719270b7c94so2113071b3a.3;
        Mon, 16 Sep 2024 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726496343; x=1727101143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1UmXOgsWH3fdiCHw5DCGNn13IW8Bhm9lnRCetGbtc8=;
        b=R7cBKiuJobvNNK1WkDH7LSl4OkFp4Mo5nxmqkNzYfkhv6xTf0AkBB6EgxeOUcQizRZ
         882JVYDgJkH26xegtjkISlC1WtVCzJrXsDi3zOha/w9pubaB/qog7vUpITe//xu1aCvu
         fJgv7ALSV6LKCBaVKN28cqYVq7IqY6RNCF8kZ+jg7kpa3ZKOue1sv0YsBCRzajGI3ew2
         iEMndukIY0oH1eUUWZFZUIT3EYbhauTxorVA72WI7QYZgGE0N+wyzz431lfrgf/+9BD8
         C33zfejpcSDPZEb68BB9I7oyWuIF+V/2+FVM3UepRjBwEKzj5bF0ltkbSZr+GWibhoJQ
         TCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726496343; x=1727101143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1UmXOgsWH3fdiCHw5DCGNn13IW8Bhm9lnRCetGbtc8=;
        b=bHBvdpqBZfsWM9xSWqbq/mVGQISxLheq7jplJQbVHOYQ1qpDo7tWRjxo2kJfyEArqM
         f7+BrFsOTFoc6a9bMjIzB+ty7TWFB4FaE0wHrq71dr+qYXbHXXhhfSgkFrynvEpZ1MwV
         5L7+0Lj6D7/x4k4ssn53q2UhdG6moOjZE6Q2FDv9MZ8bKda7t6B0yrBYhaimARBSUntu
         gWqy1ADVCoG8ojrjQtt+iipx+NedK/HYfsATU6Fkx7WWXWu2qMlhwl9Re1pZRZq9nyDp
         tqT+LXGbXG4lt5M10mUyVO7VJEWB2WdCSVCe8Q+wP2sISLCJCDHaX2Tpx6/63h0qZSLa
         UrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2SxXkPG23PNfMnaaHGDpMwjvmUbZzokrZ2FfkTZeSoyMEK32R1CETc8sjrqrbL/4phzVPM3xgFW9F@vger.kernel.org, AJvYcCVmcBPIPkN322lRIHPmHll9P3cuD5NA1MTCwzrnA1/kXN9ayft3Q6Xo3zbwnuYEpJDNKSh6/XyDfFb46g==@vger.kernel.org, AJvYcCWIpPEE9DkZn9PaL6Oo7wal9RpQ8VEKlHJMVI5WFcJPee1Rg8whiRB6xebc53faQPb/Xip+08UnKhhlmSyf@vger.kernel.org
X-Gm-Message-State: AOJu0YxF08GOLa8umOJcRbI8OD2EHaTFXl77AOkAuejZaKC83Sy5GtAI
	J08pwiB/m3b7A7aEPA4vXVceLcL34oeehQBT2ABliJTES1QWqtuIbFuqeyRkBesB/eaYjBjjEBB
	WO6FkPVr4UllxdrGxRvmTQSbm4LM=
X-Google-Smtp-Source: AGHT+IFYCVh4ja8kmnu32Sq8veW94hYo66DZbsZuYwwlDt/F+10yGHRXvBJzhVGd0HcyK1y8/b8Pz+qY2eHEL8EuSBg=
X-Received: by 2002:a05:6a20:d806:b0:1cf:440a:d449 with SMTP id
 adf61e73a8af0-1d112ead762mr15155093637.42.1726496343265; Mon, 16 Sep 2024
 07:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com> <20240916024536-GYA2058951@gentoo>
In-Reply-To: <20240916024536-GYA2058951@gentoo>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 16 Sep 2024 10:18:27 -0400
Message-ID: <CAJFTR8QEwoJDANTgGOyMxX4d539ZjHUU2nzf-sB=Gu5bsHBfyQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to
 uart0 in BPI-F3
To: Yixun Lan <dlan@gentoo.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@spacemit.com>, Meng Zhang <kevin.z.m@hotmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 10:45=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Jesse
>
> On 10:45 Sun 15 Sep     , Jesse Taube wrote:
> >
> > Before pinctrl driver implemented, the uart0 controller reply on
> > bootloader for setting correct pin mux and configurations.
> >
> > Now, let's add pinctrl property to uart0 of Bananapi-F3 board.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
> >   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++=
++++
> >   arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
> >   3 files changed, 28 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 023274189b492..bc88d4de25a62 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -4,6 +4,7 @@
> >    */
> >
> >   #include "k1.dtsi"
> > +#include "k1-pinctrl.dtsi"
> >
> >   / {
> >       model =3D "Banana Pi BPI-F3";
> > @@ -15,5 +16,7 @@ chosen {
> >   };
> >
> >   &uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_2_cfg>;
> >       status =3D "okay";
> >   };
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..a8eac5517f857
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> >
> > It would be nice to have a pinfunc header like
> > arch/arm/boot/dts/nxp/imx/imx7ulp-pinfunc.h.
> > It would reference and encode the data of "3.2 Pin Multiplex" in
> > https://developer.spacemit.com/documentation?token=3DAn1vwTwKaigaXRkYfw=
mcznTXned
> > , the document you attached in the summary.
> Not sure if it's worth the effort..

I can send a future patch for this.

>
> I gave up of introducing another macro, as it's exactly one to one mappin=
g to
> GPIO ID, which mean pin(x) -> GPIO_x
>
> maybe I could put a comment at K1_PADCONF() to document this?

I'm weary the Manual may not exist on the site in the future or
will change formats. But it would be nice otherwise.

>
> /* pin is same to the GPIO id according to 3.2 Pin Multiplex of User Manu=
al */
> #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
>
> does this sound good to you?

Sure, add it.

Also sorry for messing up the reply-to thing thunderbird is confusing.

Thanks,
Jesse Taube

>
> >
> > Otherwise,
> > Acked-by: Jesse Taube <Mr.Bossman075@gmail.com>
> >
> thanks
>
> > +
> > +&pinctrl {
> > +     uart0_2_cfg: uart0-2-cfg {
> > +             uart0-2-pins {
> > +                     pinmux =3D <K1_PADCONF(68, 2)>,
> > +                              <K1_PADCONF(69, 2)>;
> > +
> > +                     bias-pull-up =3D <0>;
> > +                     drive-strength =3D <32>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 0777bf9e01183..a2d5f7d4a942a 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -416,6 +416,11 @@ uart9: serial@d4017800 {
> >                       status =3D "disabled";
> >               };
> >
> > +             pinctrl: pinctrl@d401e000 {
> > +                     compatible =3D "spacemit,k1-pinctrl";
> > +                     reg =3D <0x0 0xd401e000 0x0 0x400>;
> > +             };
> > +
> >               plic: interrupt-controller@e0000000 {
> >                       compatible =3D "spacemit,k1-plic", "sifive,plic-1=
.0.0";
> >                       reg =3D <0x0 0xe0000000 0x0 0x4000000>;
> >
> > --
> > 2.45.2
>
> --
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

