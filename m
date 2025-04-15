Return-Path: <linux-gpio+bounces-18836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCBBA897F4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D021B3A9BD2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B3127F74A;
	Tue, 15 Apr 2025 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/KXfKir"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37839205AA3;
	Tue, 15 Apr 2025 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709322; cv=none; b=PSR3oJ7toq/Sd+H0YQBFFBkDNCn08AgxyL1E3l5Ji74tstsHV+JKBe0JhiugaAbWk/vUv3NM3qIKAdzjNfz0MjSM1NkUOg23v0SpI4c9eqigGcoxa+BuIygxDoj606K5WjitKyk9FKewMqk4WyXHvvwaldd6lT9n8Gd5QIAZOs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709322; c=relaxed/simple;
	bh=1h6lGzDQGCxsNKEF9zey7TCs2yGJWPFreLHmCD65QQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SdKRnYAyOANzkUzAiXZiPCSdniOZR+drdrG/Vamnf1Q0TlRooCTA2EezIR2xWuIm2akWfXMxm6wSUvtJMcEKJqdPdwj2CyBxKTSOlVJuMmyzDUapv5KYGoPpSsAc8R07IANWompN5Cr6K8gxAx7n6idrBNrcgSLH4DU4PEo3DDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/KXfKir; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso41539545e9.0;
        Tue, 15 Apr 2025 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744709318; x=1745314118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ydEHSC0AwYAy9R1jvtmBV2VFl/0Hbq9Dg03lKhyDtg=;
        b=P/KXfKirUsMydSvuo+LGyO7Iin3lohuloZ2zQxOiZNskFLGFbJo+WTmC6mVfIuo0f3
         rqYdBmR+WguONHc72g9dY4FABsTOMpd4Z5qD3QuZU3Hn9rxwzl4bQtWNXo7m8Vu8TGZq
         +Jleby+TRQG0H77ZRH7ymYniuLo3AXiDSyt+5EgOUOms83hvaKCVbLwYJlonlbzfqmXU
         67HN6A2F6vMtNipm+FeHfPQUVZAL15AJrMCw+nGlr0pfbl+wssx18p1e3Ws6Ll+iardo
         bz4pl6FwotR5cReSXJE/UtpfN7YBT2kQgaYlayE9lBsMK8jLgCOBakADFBxqxUclug4Z
         cOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709318; x=1745314118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ydEHSC0AwYAy9R1jvtmBV2VFl/0Hbq9Dg03lKhyDtg=;
        b=YZnmkpERPTeqg+gkvCbttGskXVGNQmdiIAK9CY4t3yEco/a1vE1Mj9/MknRa6wyrtI
         sbc6rP8i44p5/oILQ4BW+0KQop36UhdzVYBHSUn6rXY+LjTWg4FaGqWVtBzmtw0hZzYx
         oxOJ9tZQkuccnhIZHh/2FetkAXlwP83pb7OYNV3noBj7rzQm53WlkTiF9NFM4lBI+IQn
         TbE4xBw62I8S1FiS+yn/Gf4ohI5HUcOVorgPwf4hhBvUOAvaKztvRhKU/Vrk2804+WWJ
         KgEK/V3YQqmrTPVyiBhZLcYCw77stRCoiYiAOGGyKUTdI7siy8NH/sHIlAnTk7XYjZR6
         UVTw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Lb1cynKWllaJwyjTQBc7qzEepS+O2ptwWQWqaItK6SML/QtliTRG2a1iPGUt2GxuNwPV/Vq7ikJ8@vger.kernel.org, AJvYcCVoDmu2Jn9+l7ttCGVWfomimag9n/+nIBI9ouG+xkqc/y6ffW7Xc7qHL6/xhHcTnYZPZVQev1ltXVE2mMuQIh7T6SM=@vger.kernel.org, AJvYcCW813gISA8IjX4/ywg8hPNf8GbsZ4gSLsbmTfdON4gYrjEeO6+cFEAg3cn4QDnz111No6j6/iy3s/XS@vger.kernel.org, AJvYcCX1OpK3P1+p8D1iErrhj6dEK4v4cDG3bQ+/hAR8LXOZZ38FlAXyyVbQkhHiSY7f1Zk1qHysgJnJsPVcaJ4A@vger.kernel.org, AJvYcCXdocy2J2mw0RAjlh6dBZG4IXkcRn+uMogxT6mgGGUn9It9N7I1AaYlpmq+fe8foKXbBUmSFCqxCw/WelIV@vger.kernel.org, AJvYcCXrFysT6wYbNKo+6wLSKfRuIBdW/PqAbgTV5KEc/NTfnZz2iuqAxShkZlmJ2PR0IRrSLR8bYoJ9WzyfEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9F3MKC6MwM1Rf9tCc1VSnH8Sjsn9EddvXY7wRhAYYOf8AKu+
	l3bUOt/2Zy5q4A7a+4q1CNIWZEkA0RECZzGtdV95S7t6l+Hqf7Xcsen1of8YtzUGoTCLTRHUSHh
	Db8kzM3kf5s9bIY3rsjDfEjCpLkY=
X-Gm-Gg: ASbGnct3OtpTM1tQqOwyUQ4EHVswA0NVEMLYqz8czk0zm3X5KR+d8H0T0SNSJvI3HxI
	qRAx5f+ZVHBKSO5Qe+CcjoLgdXzQ6gWydjUtn0yRiSGIJL3nsCA1u0hcA19l7gmpF5GonR9+BbM
	byOIz+hw77+pdFz29uJF+U9gZdSvyGLZ99nqWFrDL1pTXaOz0ajli/SQ==
X-Google-Smtp-Source: AGHT+IFG+fUPEngMYO3MgfRmjXhAKt8D7GZyaPURDVd3wp/sgNtuZ0IgjriVoFPeF0qbRTK2UdbZcD/1eJv8nHqPJoE=
X-Received: by 2002:a05:6000:18a5:b0:39c:2692:4259 with SMTP id
 ffacd0b85a97d-39ea51f5a85mr11986754f8f.21.1744709318100; Tue, 15 Apr 2025
 02:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8useBh5m+MqGXQwQJhuemehm=bPidL6XydR-FOmVN9QNQ@mail.gmail.com> <CAMuHMdU+U8D8iQdks72=Kki2HL+bo8tw9gA1S4D3c4hOphLTuA@mail.gmail.com>
In-Reply-To: <CAMuHMdU+U8D8iQdks72=Kki2HL+bo8tw9gA1S4D3c4hOphLTuA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 10:28:12 +0100
X-Gm-Features: ATxdqUGnCZezFZPsrc8goTpv1icFSVC02yaUa5urXIuUAs8z1znekIaVpOgJiI4
Message-ID: <CA+V-a8tH9BLjy5aG1qkRJnUFO_4VARu6rW4fQzHoSxvaMgo1Xg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Add support for Renesas RZ/V2N SoC and EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Mon, Apr 14, 2025 at 2:40=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 14 Apr 2025 at 13:19, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Apr 7, 2025 at 8:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > This patch series adds initial support for the Renesas RZ/V2N (R9A09G=
056)
> > > SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
> > > microprocessor (MPU) designed for power-efficient AI inference and
> > > real-time vision processing. It features Renesas' proprietary AI
> > > accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, makin=
g
> > > it ideal for applications such as Driver Monitoring Systems (DMS),
> > > industrial monitoring cameras, and mobile robots.
> > >
> > > Key features of the RZ/V2N SoC:
> > >   Processing Power:
> > >     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance comput=
ing
> > >     - Single Arm Cortex-M33 core at 200MHz for real-time processing
> > >     - 1.5MB on-chip SRAM for fast data access
> > >     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
> > >
> > >   AI and Vision Processing:
> > >     - DRP-AI3 accelerator for low-power, high-efficiency AI inference
> > >     - Arm Mali-C55 ISP (optional) for image signal processing
> > >     - Dual MIPI CSI-2 camera interfaces for multi-camera support
> > >
> > >   High-Speed Interfaces:
> > >     - PCIe Gen3 (2-lane) 1ch for external device expansion
> > >     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
> > >     - USB 2.0 (Host/Function) 1ch for legacy connectivity
> > >     - Gigabit Ethernet (2 channels) for network communication
> > >
> > >   Industrial and Automotive Features:
> > >     - 6x CAN FD channels for automotive and industrial networking
> > >     - 24-channel ADC for sensor data acquisition
> > >
> > > LINK: https://tinyurl.com/renesas-rz-v2n-soc
> > >
> > > The series introduces:
> > > - Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, =
pinctrl).
> > > - RZ/V2N SoC identification support.
> > > - Clock and pinctrl driver updates for RZ/V2N.
> > > - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
> > >
> > > These patches have been tested on the RZ/V2N EVK with v6.15-rc1 kerne=
l,
> > > logs can be found here:
> > > https://gist.github.com/prabhakarlad/aa3da7558d007aab8a288550005565d3
> > >
> > > @Geert, Ive rebased the patches on top of v6.15-rc1 + renesas-dts-for=
-v6.16
> > > + renesas-clk-for-v6.16 branches. Also these patches apply on top of =
the below
> > > series [1] and [2]. I had to sort the order in Makefile for patch [3]=
 to
> > > avoid conflicts.
> > > [1] https://lore.kernel.org/all/20250401090133.68146-1-prabhakar.maha=
dev-lad.rj@bp.renesas.com/
> > > [2] https://lore.kernel.org/all/20250403212919.1137670-1-thierry.bult=
el.yh@bp.renesas.com/#t
> > > [3] https://lore.kernel.org/all/20250403212919.1137670-13-thierry.bul=
tel.yh@bp.renesas.com/
> > >
> > > Note, dtbs_check will generate the below warnings this is due to miss=
ing
> > > ICU support as part of initial series. I will be sending a follow-up =
patch
> > > series to add ICU support which will fix these warnings.
> > > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410=
000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required prope=
rty
> > >         from schema $id: http://devicetree.org/schemas/pinctrl/renesa=
s,rzg2l-pinctrl.yaml#
> > > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410=
000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
> > >         from schema $id: http://devicetree.org/schemas/pinctrl/renesa=
s,rzg2l-pinctrl.yaml#
> > >
> > > v1->v2:
> > > - Added acks from Rob.
> > > - Squashed the RZ/V2N EVK and SoC variant documentation into a single
> > >   commit.
> > > - Updated the commit messages.
> > > - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
> > >   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
> > >   in pictrl driver hence to keep the consistency with the
> > >   RZ/V2H(P) SoC these macros are added.
> > > - Dropped `renesas,r9a09g056-pinctrl.h` header file.
> > > - Followed DTS coding style guidelines
> > > - Dropped defconfig changes from the series.
> > > - Dropped SDHI dt-binding patch as its already applied to mmc -next t=
ree.
> > >
> > > Cheers,
> > > Prabhakar
> > >
> > > Lad Prabhakar (12):
> > >   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and
> > >     EVK
> > >   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
> > >   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
> > >   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
> > >   dt-bindings: serial: renesas: Document RZ/V2N SCIF
> > >   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
> > >   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part num=
ber
> > >   clk: renesas: rzv2h: Add support for RZ/V2N SoC
> > >   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
> > >   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
> > >   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
> > >   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
> > >
> > Would it be OK if I send version 3 containing only patches 4/12 and 10/=
12?
>
> For patch 4/12: yes, that is fine. Thx!
> For patch 10/12: I have already applied it.
>
For patch 10/12 ("pinctrl: renesas: rzg2l: Add support for RZ/V2N
SoC") will that be part of renesas-pinctrl-for-v6.16 branch (which is
yet to be pushed)?

Cheers,
Prabhakar

