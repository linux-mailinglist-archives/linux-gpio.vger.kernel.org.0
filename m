Return-Path: <linux-gpio+bounces-2091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B982880F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 15:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F1C1C242B7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C665B39AC1;
	Tue,  9 Jan 2024 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wYw0VBic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C939AC4
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jan 2024 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D9D23F62F
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jan 2024 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704810501;
	bh=H46EXvdjyBOKeFgyWr6G7nw/iea+GVPfzJMh//6f0l8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wYw0VBicWVEY80nMARto7s3zWLgiE7jqx06jsZhkwTo6yxLtRXA2u6waqR8CGnPfg
	 w3t4jM9BBDPOkJxZLg2phYbF4w2nqcGLrCqNF2B1CedBdto8FiKGpyYOzsc1e4Skta
	 +j/dtjDcM0H7A7om6jRJPtcVZYHx2nmWoc9QWkk5jUb1Ulu9hdThla72cj+htJDZya
	 xPM6SqgHe+BxKnhpNftvIkAAa6My7qvGkYvXGhKtI5dvsXfwU5kEpSEKec3T/2lQkz
	 4eUBcu1d0cTPUJlzZDvbJwW2PTeQpCXh0Vnawzxo3GPUHjvIMIqOURsabYDnWTd3WY
	 9b63TRat0GVPA==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dde701a6ccso486022a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jan 2024 06:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810500; x=1705415300;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H46EXvdjyBOKeFgyWr6G7nw/iea+GVPfzJMh//6f0l8=;
        b=OIc4yYcFxeoz0yZG4Tg3YR3ViTSwqORwXp6jNMhI2Nm5QVkGTLi0k2LhyH6/SP07L/
         +7WK+oyUM1kArPGYHJwSs/lEyUzZxyd6nI4ZnvE5N2RJiirGIc6I4csm4IHr5PE9JW+R
         ePUwcpX+hGb6w/sHvO9uFjK1a/EjoWcCjsU5+J415gqhBI8vHyzTKMh51nRDmVltmSsg
         4xCBxtQYouHoSzkeKpyn5b7DGPr6Zow0/lBfK7laOpSq3NsukTzn0RM2t8CHdOLpkiv5
         8H+ViBwr7hSu0gvCmS6Yv0NHj7c/mDwxhXewYQPMJkcFNnGBuA713f47q9lnl7mGfEL7
         hTxQ==
X-Gm-Message-State: AOJu0YxXFolmCLOrd6TNqwKaPzfvq0uc94FrLn49KvKnaaC8QXBKRn9z
	uI3uQi27AfJ7wrqfiv3kC0kp0a8kP2vUFVWgvROxxKhdBI0YgDDbKD9MmOKGCReLRfzPN2yEnvi
	aSdh2ctD8mAsF/jFEEXV5XlXUV7fSagwZ6rcIdITqigmfczwJjsWdpnPpUKPjMA==
X-Received: by 2002:a05:6358:418b:b0:174:ec56:4220 with SMTP id w11-20020a056358418b00b00174ec564220mr3565153rwc.21.1704810500015;
        Tue, 09 Jan 2024 06:28:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWXJDf3n8xAk97y9T0ad5uwG5IytT1BWqKuFjuM6xdYu3hwumma4StJ7ZRSYHehkU19Ir2VYgRlhfzGCyE8vA=
X-Received: by 2002:a05:6358:418b:b0:174:ec56:4220 with SMTP id
 w11-20020a056358418b00b00174ec564220mr3565129rwc.21.1704810499691; Tue, 09
 Jan 2024 06:28:19 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jan 2024 06:28:19 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240109-tiptoeing-twirl-ebb943e17a29@wendy>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com>
 <20240108-majorette-overtly-4ec65d0a15e9@spud> <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
 <20240109-tiptoeing-twirl-ebb943e17a29@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 9 Jan 2024 06:28:19 -0800
Message-ID: <CAJM55Z9Ka3hiNmgFuy01Yd0YyxL-SzS=A7S3k84=B1xABKbJhA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
To: Conor Dooley <conor.dooley@microchip.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Conor Dooley wrote:
> On Tue, Jan 09, 2024 at 04:02:01AM -0800, Emil Renner Berthing wrote:
> > Conor Dooley wrote:
> > > On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrote:
> > > > Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
> > > >
> > > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > ---
> > > >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
> > > >  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
> > > >  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
> > > >  3 files changed, 32 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > index 70e8042c8304..6c56318a8705 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > @@ -44,6 +44,10 @@ &osc_32k {
> > > >  	clock-frequency = <32768>;
> > > >  };
> > > >
> > > > +&aonsys_clk {
> > > > +	clock-frequency = <73728000>;
> > > > +};
> > > > +
> > > >  &apb_clk {
> > > >  	clock-frequency = <62500000>;
> > > >  };
> > > > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > index a802ab110429..9865925be372 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > @@ -25,6 +25,10 @@ &osc_32k {
> > > >  	clock-frequency = <32768>;
> > > >  };
> > > >
> > > > +&aonsys_clk {
> > > > +	clock-frequency = <73728000>;
> > > > +};
> > > > +
> > > >  &apb_clk {
> > > >  	clock-frequency = <62500000>;
> > > >  };
> > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > index ba4d2c673ac8..e65a306ff575 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
> > > >  		#clock-cells = <0>;
> > > >  	};
> > > >
> > > > +	aonsys_clk: aonsys-clk {
> > > > +		compatible = "fixed-clock";
> > > > +		clock-output-names = "aonsys_clk";
> > > > +		#clock-cells = <0>;
> > > > +	};
> > >
> > > Did this stuff sneak into this commit accidentally?
> >
> > Not really by accident no. It turns out the clock tree has gates for the bus
> > clock of each pinctrl block and I think it's better to add this clock
> > dependency to the bindings and driver up front.
>
> Maybe if I had looked a wee bit more deeply I would've noticed that it
> was used there, but it's always good to mention the rationale in the
> commit message so that it's more obvious why you're doin it.

You absolutely right. I forgot to update the commit message.

> > Since there is not yet any clock driver the initial device tree for the TH1520
> > included the dummy apb_clk that two of the pinctrl blocks derive their clock
> > from, but not the "aonsys" clock needed by the "always-on" pinctrl. I thought
> > it was better to add this dummy clock with the only (so far) user of it, but if
> > you have a better idea, let me know.
>
> No, that's fine. I was just wondering why there was an unmentioned set
> of clocks being added. If they're stubbed fixed clocks I dunno if it
> makes sense to add them to the board.dts/module.dtsi files though. Where
> do the initial values come from for the rates? Out of reset values or
> set by firmware that may vary from board to board?

The vendor u-boot sets the PLLs different from the reset values. For now I
think it's the same code for every board using the Lichee Pi 4A module (and
probably also for the BeagleV Ahead), but it might still make sense to move the
freqency to the board instead of the module device tree.

/Emil

