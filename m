Return-Path: <linux-gpio+bounces-18852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CFFA89D1C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 14:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8946A3A987A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D952951A5;
	Tue, 15 Apr 2025 12:04:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055C28DF08;
	Tue, 15 Apr 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718645; cv=none; b=HUBqgtNtTVwzRK354B4lql1CRgPihLz7dDXRrwFyhOqBxwkcn+9Pdvg/p5QT6yRYPnJrJO28MPtBt7EOXPKn7jv7+yFdLazJNz7AeW0eiV/WfAvn5H57VSc8V37z5IuQEpv6pFv2yNjkXZa8LOV3e3+HRv867eUAcAAG5uwEmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718645; c=relaxed/simple;
	bh=loUPvVMNGiwJlE21jeP0tvM4KuSweofRWQ237qVAJkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxCjV5mIz0kDXNfgKiG9roKYtRfg0PQbgtFZKpZZdogybSxlj+3gUKxURZuKzg1Wh8pm5x2H9Nco9xavMy7+rpUuBzJLJfV3DkKnZrSlJfHtzJC2C/YeEajzMHenmLcaAdncAyxat3ECo8kFrVBxOV+BNppTpmLnQqAF3tDUK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4768f90bf36so49362731cf.0;
        Tue, 15 Apr 2025 05:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718641; x=1745323441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44jbS69cKT35Gp4Aiz2OWrUPbtiSlX2R3KlB9msotSY=;
        b=UmgrR8KowXoDl3bM/NysVfSPenzAL0XCEdhiszKSYMMD4gVQkhoV9iAHjCATf+t3c+
         zaWa1MX6BJl6XZWkXY1Oe7hfQnj0Yy4P1V5sWHLkjiVKGA0E5KBHx1AYYM4FeAdkjytV
         4xTEqibcgtcCECA7b524A7/eybVC/ankmZwSdd8rxUNtyLlq6QYQvhoUtlT95LUrJUuS
         IZtQdWD/XcimRmZ73iks3gjvkxhcjtLYPqkrWoXEYa9a86iQuLnsZm1Usow007vvhROl
         JEBaHvY2b1CHw73LZ1jQZozGU98Wf43FLFE9J+68PEV+T9JnmHR5soCgU3TaqtCd5/Lq
         C4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUYHy9XtE68IQjy50+ijE1epAy9vCRmx6E8fq6K4jJaYZJeEbTVR5ins7Y13BAzWGY9YSaXiAtaltvfUQ==@vger.kernel.org, AJvYcCVGlOGWQ199GwviH/Aw0OJQYOGm1rT4fCstLC8zXt48WVhw0NnWiyP/eGxxOjnAMYT9p6QlwCdyotdzLDeDygf3VxM=@vger.kernel.org, AJvYcCVQChwfLwrN8kJWaWuU7UbDS2jlMOc3yYP9AwyX0ATf/gRBH11XXRGp1RxBKZWVi2nqiFqVVTbaP9Mq@vger.kernel.org, AJvYcCW9GY+xYp1/D9zsRg8P08OQGTpaes0nspbM7cCd/WiXj00SUm1qJY/77gqntCRSOhO8ARfFKtp2PF3n@vger.kernel.org, AJvYcCX3F3Q5MyDNmUz+OZ8Cv4ojeaXd9EoeDyAAYf5S752NBGrw5CBxYp5Iqj/CflK1yBlDIpoiJKsdCqmRmpzo@vger.kernel.org, AJvYcCXGrm0BK5xB/cc/jO7laL2Jc+oFSuWfdK6BT/9GyvpQkQSOYvYcdHk1eMEaOpd2klmnibn4KLI2M+hMys8d@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvWd0BP6FFDGqgc4ud0xoM/Et6dliRCUCbC7UgzBmmDBtxLlG
	5vGxNCaFn82kjvDHLcv7WCDw7YrbLJOn1RRKMZPImBma2pDVB3X2Yf+pw037
X-Gm-Gg: ASbGncvBUQCEdzk2I2ZXHNq1stwWJBxJbjpIqfNmgbM0CP3oeipCML1N1hKzp8GzzFo
	8zMY0Bmewptao7WmmAR8FxFrlEN0eT20RMRgR26z47trPgBrs9lLV9utChS2oqYXvqpX1f/+8OY
	0iOyZxo8i+XcFoA+QcL4ykqBmzp8lo2dlhj+whSo+ZTelDuicx3qvH2D5zxUcqfYKnuiWTwSkhi
	PREUTbsaljyzSoVbY7iz6Nr8F+tlZTVVqsyhrUwVGRs/l5MFOvgaTP2Z8tpIvAjD96owTOUEOTr
	2++XeaxAEdkl7NGhCrt/uNGHi5ntqJ8cQ0ulXzUgDDOBV3BftewuzU8Gexxxf9t8TH+njxKsWUh
	AXCF+Tb8=
X-Google-Smtp-Source: AGHT+IGaWlcXVHtddiVmvhbwkdxS/y1KAEPPoBrfx8AnRt5614HjJGYRDpBMfS0w8c3LE2TvY1vdcg==
X-Received: by 2002:a05:622a:50d:b0:476:7ff5:cc27 with SMTP id d75a77b69052e-479775d637fmr201579011cf.51.1744718640802;
        Tue, 15 Apr 2025 05:04:00 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9cce7sm92073521cf.59.2025.04.15.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:04:00 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e39d1e0eso529805685a.1;
        Tue, 15 Apr 2025 05:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrUNgzJ3ZDmPbm+oCTmywK07fiIRP4ZjY8p9MAf/5FIoMpYsOqFBnxuf492qJKZLFgojijOybe6Nfoqy++@vger.kernel.org, AJvYcCVuZAsQTR0bZD5/4Qfv4NjEiEsVN8pRrcPGUiCRAT/o08VVOIVb2otGukl67bQfJ3CIxBKUbPIa9H6IAk/Uc4br8CM=@vger.kernel.org, AJvYcCWJiFrx0MSdIpPQSxyWQwixwUbhUIz2EZakrKzDbQQsiwIT4dEMT3QOJjnqkftpMv2Ak1Bq+lIvLDtbuqqs@vger.kernel.org, AJvYcCWuUmEdCnlpDyBU/2HbsjMQeYFweqQZT5ikT7GTctv+RXXYG2rAvaiHeIfA3dOZ7JGbVSKpsQQ396hqnQ==@vger.kernel.org, AJvYcCWzvUGXCVhLZR4J+YShUt0hakqSfFZkcbL7JwTVkyLcdJtrkhGvBAJXNMX9K2zU7WZZJPKd0EnZlZv+@vger.kernel.org, AJvYcCXzETkJOEdAYqj36Lg3ESSB6OXhGOR4kTf0kRl5rTe4TTCDf5QQZO0BDVQyk8JK0q+SmL+pFiXD8IC1@vger.kernel.org
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7c7af118d54mr2235481685a.11.1744718637820; Tue, 15 Apr 2025
 05:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8useBh5m+MqGXQwQJhuemehm=bPidL6XydR-FOmVN9QNQ@mail.gmail.com>
 <CAMuHMdU+U8D8iQdks72=Kki2HL+bo8tw9gA1S4D3c4hOphLTuA@mail.gmail.com> <CA+V-a8tH9BLjy5aG1qkRJnUFO_4VARu6rW4fQzHoSxvaMgo1Xg@mail.gmail.com>
In-Reply-To: <CA+V-a8tH9BLjy5aG1qkRJnUFO_4VARu6rW4fQzHoSxvaMgo1Xg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 14:03:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT0R_ypz7sLxLzYU+v-Cj94Pd4FaFJsdQq-c_Evx5neA@mail.gmail.com>
X-Gm-Features: ATxdqUHZOQ_kXb78-Adsku78g9ckdafL4-bL26h3gggOf0fLadQBp1hSbjMhNWk
Message-ID: <CAMuHMdVT0R_ypz7sLxLzYU+v-Cj94Pd4FaFJsdQq-c_Evx5neA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Add support for Renesas RZ/V2N SoC and EVK
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 15 Apr 2025 at 11:28, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Apr 14, 2025 at 2:40=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 14 Apr 2025 at 13:19, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Mon, Apr 7, 2025 at 8:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > This patch series adds initial support for the Renesas RZ/V2N (R9A0=
9G056)
> > > > SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision =
AI
> > > > microprocessor (MPU) designed for power-efficient AI inference and
> > > > real-time vision processing. It features Renesas' proprietary AI
> > > > accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, mak=
ing
> > > > it ideal for applications such as Driver Monitoring Systems (DMS),
> > > > industrial monitoring cameras, and mobile robots.
> > > >
> > > > Key features of the RZ/V2N SoC:
> > > >   Processing Power:
> > > >     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance comp=
uting
> > > >     - Single Arm Cortex-M33 core at 200MHz for real-time processing
> > > >     - 1.5MB on-chip SRAM for fast data access
> > > >     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
> > > >
> > > >   AI and Vision Processing:
> > > >     - DRP-AI3 accelerator for low-power, high-efficiency AI inferen=
ce
> > > >     - Arm Mali-C55 ISP (optional) for image signal processing
> > > >     - Dual MIPI CSI-2 camera interfaces for multi-camera support
> > > >
> > > >   High-Speed Interfaces:
> > > >     - PCIe Gen3 (2-lane) 1ch for external device expansion
> > > >     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
> > > >     - USB 2.0 (Host/Function) 1ch for legacy connectivity
> > > >     - Gigabit Ethernet (2 channels) for network communication
> > > >
> > > >   Industrial and Automotive Features:
> > > >     - 6x CAN FD channels for automotive and industrial networking
> > > >     - 24-channel ADC for sensor data acquisition
> > > >
> > > > LINK: https://tinyurl.com/renesas-rz-v2n-soc
> > > >
> > > > The series introduces:
> > > > - Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG=
, pinctrl).
> > > > - RZ/V2N SoC identification support.
> > > > - Clock and pinctrl driver updates for RZ/V2N.
> > > > - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
> > > >
> > > > These patches have been tested on the RZ/V2N EVK with v6.15-rc1 ker=
nel,
> > > > logs can be found here:
> > > > https://gist.github.com/prabhakarlad/aa3da7558d007aab8a288550005565=
d3
> > > >
> > > > @Geert, Ive rebased the patches on top of v6.15-rc1 + renesas-dts-f=
or-v6.16
> > > > + renesas-clk-for-v6.16 branches. Also these patches apply on top o=
f the below
> > > > series [1] and [2]. I had to sort the order in Makefile for patch [=
3] to
> > > > avoid conflicts.
> > > > [1] https://lore.kernel.org/all/20250401090133.68146-1-prabhakar.ma=
hadev-lad.rj@bp.renesas.com/
> > > > [2] https://lore.kernel.org/all/20250403212919.1137670-1-thierry.bu=
ltel.yh@bp.renesas.com/#t
> > > > [3] https://lore.kernel.org/all/20250403212919.1137670-13-thierry.b=
ultel.yh@bp.renesas.com/
> > > >
> > > > Note, dtbs_check will generate the below warnings this is due to mi=
ssing
> > > > ICU support as part of initial series. I will be sending a follow-u=
p patch
> > > > series to add ICU support which will fix these warnings.
> > > > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@104=
10000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required pro=
perty
> > > >         from schema $id: http://devicetree.org/schemas/pinctrl/rene=
sas,rzg2l-pinctrl.yaml#
> > > > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@104=
10000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required propert=
y
> > > >         from schema $id: http://devicetree.org/schemas/pinctrl/rene=
sas,rzg2l-pinctrl.yaml#
> > > >
> > > > v1->v2:
> > > > - Added acks from Rob.
> > > > - Squashed the RZ/V2N EVK and SoC variant documentation into a sing=
le
> > > >   commit.
> > > > - Updated the commit messages.
> > > > - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
> > > >   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
> > > >   in pictrl driver hence to keep the consistency with the
> > > >   RZ/V2H(P) SoC these macros are added.
> > > > - Dropped `renesas,r9a09g056-pinctrl.h` header file.
> > > > - Followed DTS coding style guidelines
> > > > - Dropped defconfig changes from the series.
> > > > - Dropped SDHI dt-binding patch as its already applied to mmc -next=
 tree.
> > > >
> > > > Cheers,
> > > > Prabhakar
> > > >
> > > > Lad Prabhakar (12):
> > > >   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants a=
nd
> > > >     EVK
> > > >   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
> > > >   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
> > > >   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
> > > >   dt-bindings: serial: renesas: Document RZ/V2N SCIF
> > > >   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
> > > >   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part n=
umber
> > > >   clk: renesas: rzv2h: Add support for RZ/V2N SoC
> > > >   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
> > > >   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
> > > >   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
> > > >   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
> > > >
> > > Would it be OK if I send version 3 containing only patches 4/12 and 1=
0/12?
> >
> > For patch 4/12: yes, that is fine. Thx!
> > For patch 10/12: I have already applied it.
> >
> For patch 10/12 ("pinctrl: renesas: rzg2l: Add support for RZ/V2N
> SoC") will that be part of renesas-pinctrl-for-v6.16 branch (which is
> yet to be pushed)?

Sorry, my bad; I misread the patch number. I have not applied 10/12 yet.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

