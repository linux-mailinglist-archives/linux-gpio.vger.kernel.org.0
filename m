Return-Path: <linux-gpio+bounces-2072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8128285B0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 13:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABBEA1F26A28
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 12:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9763E381B4;
	Tue,  9 Jan 2024 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="bd+ciOEX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E534C381AB
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jan 2024 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 73E1D3F5AB
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jan 2024 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704801723;
	bh=L1elb+jQDH8Ds4j0H9TwFb8qhYJOMk8842XOLWCtnwk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bd+ciOEX3IPwfxFJXjKV2I/Wv0gx06Q0MgSrKjmYirIHn77p623UrjLpSVLPXRE1I
	 rANAJOicubM2wq/Qq2+rrQ0uiCxQHE0eDP56OECPD45MJb5s+i2kH66rCt5Ec4sSqV
	 ehvzHdqPp2eVtdTuTYk/k1QO5RDH87k75qnI69VXIEplLzxMDQs9Zr0TNhWfsdzLNt
	 mawJEVix2+AfIJsnEK4Kkm0K76nBCZaYK3SWFrR4oreI1EbPgIHS4CIADuQqDYGjdV
	 5uIz15/gX6M4Ez7DTP00UO2XN8hV9VK21vEn+0D+82QFu2itT3qkI6/sr9BQ4kOiU5
	 6/LiI2KwYqA5A==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429a8494838so3971121cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jan 2024 04:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704801722; x=1705406522;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1elb+jQDH8Ds4j0H9TwFb8qhYJOMk8842XOLWCtnwk=;
        b=rjZ70rW+/tpdddPOWf9FV6QesM/6aId3c9jCiJHgtWQTUJ9TmdGxd4SYbD5hCcWTcN
         U9Pa6m2J56q0iD8riCFi1MB7tFkAYaTPR2Idy168Dr3VBv6SAhtaKopPnsVbzAE4XSJZ
         HudR/qTOu2205+ZXazXgFChR6fXYiYD6465oOj+YFYXU8yiAdPl7wDbYhlKe+8LZFnHR
         jvbEaXHNT4Jt3DlDdcLv1LKreC6UV6Fv1dpRPI8pMQzvGUiEfpTB8/zynHWVXRdeifeD
         QZYN8KcsKXqWUa7ghRla6UPEeJqdAVZHv8GDnIA50STbB8m3nkMad8HHPaUewMsmSsOr
         X1lw==
X-Gm-Message-State: AOJu0YybY1QiU/noXupiLKFyDbeJMh9I6YHCFOCaddb/I0WB1ESfAET7
	EHlSlSjvsVr94Z4eU10vkFNITOHpw9p3UTtu621x17aSaKY91NZwtha9F8tbUB9e0V0XHBsykif
	fjRuWcft3XoDcOtMMQi8iaT+17O5Sd+GPNRSN2hYX7c5LWArCT16ypJshubl6yQ==
X-Received: by 2002:a05:622a:296:b0:429:8c55:4a47 with SMTP id z22-20020a05622a029600b004298c554a47mr3134591qtw.49.1704801722320;
        Tue, 09 Jan 2024 04:02:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMPXlm4YerbG4iFFrjePx491jhh9/Le2ba+OtVW+O9m5xRSQ0+oOgEThByi2GFboNj49o1lT5y0Tt5RnHjosQ=
X-Received: by 2002:a05:622a:296:b0:429:8c55:4a47 with SMTP id
 z22-20020a05622a029600b004298c554a47mr3134568qtw.49.1704801722008; Tue, 09
 Jan 2024 04:02:02 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jan 2024 04:02:01 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240108-majorette-overtly-4ec65d0a15e9@spud>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com> <20240108-majorette-overtly-4ec65d0a15e9@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 9 Jan 2024 04:02:01 -0800
Message-ID: <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
To: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Conor Dooley wrote:
> On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrote:
> > Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
> >  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
> >  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
> >  3 files changed, 32 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > index 70e8042c8304..6c56318a8705 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > @@ -44,6 +44,10 @@ &osc_32k {
> >  	clock-frequency = <32768>;
> >  };
> >
> > +&aonsys_clk {
> > +	clock-frequency = <73728000>;
> > +};
> > +
> >  &apb_clk {
> >  	clock-frequency = <62500000>;
> >  };
> > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > index a802ab110429..9865925be372 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > @@ -25,6 +25,10 @@ &osc_32k {
> >  	clock-frequency = <32768>;
> >  };
> >
> > +&aonsys_clk {
> > +	clock-frequency = <73728000>;
> > +};
> > +
> >  &apb_clk {
> >  	clock-frequency = <62500000>;
> >  };
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index ba4d2c673ac8..e65a306ff575 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
> >  		#clock-cells = <0>;
> >  	};
> >
> > +	aonsys_clk: aonsys-clk {
> > +		compatible = "fixed-clock";
> > +		clock-output-names = "aonsys_clk";
> > +		#clock-cells = <0>;
> > +	};
>
> Did this stuff sneak into this commit accidentally?

Not really by accident no. It turns out the clock tree has gates for the bus
clock of each pinctrl block and I think it's better to add this clock
dependency to the bindings and driver up front.

Since there is not yet any clock driver the initial device tree for the TH1520
included the dummy apb_clk that two of the pinctrl blocks derive their clock
from, but not the "aonsys" clock needed by the "always-on" pinctrl. I thought
it was better to add this dummy clock with the only (so far) user of it, but if
you have a better idea, let me know.

/Emil

