Return-Path: <linux-gpio+bounces-18853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D634AA89E3F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 14:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 185581901BC6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 12:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A972973BF;
	Tue, 15 Apr 2025 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB0/A0ED"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AE2951B7;
	Tue, 15 Apr 2025 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720516; cv=none; b=EF+mvGK7kEqaLLb3bEphYmvp0QsejZds3gq4hwhTqhar2moU4/7hukKw35KmI3/0ao8mVyw3rECVKIV/U169fqt21G4nHu8I8NGA9yFTgrasKbyas2QtJG12pHbo97NWPmMAnbTosWxssj1mAAP/w8T3gI7n6aK87agMD/MrLDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720516; c=relaxed/simple;
	bh=0tHLerMV6DlGI+35IBhWTxbPC+y2e6dojGFAg7wfhmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+0XYgW5WPDufHOjGf4xKmbWQc6Uaj8kGVkwupxyDzsZCS3wv3RvOL1EAMbewvfuXZMMwBOeAUVz3g9mO7PdV6LyPREMFzPql8rO5r4xqX8KVdGCrrM+sYUH+O8kc2TEFKk+Lx/+MzehUpkmXAqfk3MFw2zuB0C9kXLdujYoU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB0/A0ED; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3968509f8f.3;
        Tue, 15 Apr 2025 05:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720512; x=1745325312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWuV9uJoZ07PEkyHV2JlFFyyQd1zk6rcsz1/NLprY1g=;
        b=lB0/A0EDw9U/v2fLik6oOiREZzqQz1JaHD9M5mpxU/euJQQxJ/LhBvCqZ7GRgvQhRs
         v5ol3Xdajn4S3cD9/OKz+vfC3/WNRNWPbD5u1byNuEskY82DZJz9zPUmbsWG68ptW8l7
         v5UnY1l0MpiRRQ5vnz7bMKQFHXrAGVJjy69Fd7ZOSbhu7peMJrfoZrk7dRAOzNNVWyGv
         0PGF66+38cgeUQrjw9uALeVauXA2iPXeSUeVpHVSLrrzfTII77iwBz63FHEC2TuxTDis
         Dlk+eETdmUQu9SuXCwp9N2osZfWPdTjJb16wdWthrKX5cR+xb3YWkEVJ+A0b5k4gRPTv
         4l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720512; x=1745325312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWuV9uJoZ07PEkyHV2JlFFyyQd1zk6rcsz1/NLprY1g=;
        b=o3KxF3x1PIxxdJPzv4vPHJ8X1PazdW95GMygXCrotGDQ3jEcbKNUVNb3btvlVEEaFi
         8mJKkUGE7bhj+jeCmd+Q8xfdrp5VTtZiZAIE/FwoL9h87BAFurRL05uv0lyvdo9LkUBf
         6xQqTmwVBTVUqSJbK3/naBv2/AriVrNmGTuzMNzpweZw7Uzpq/URlNjCpa9aky1SABNy
         WPfz471+kDAc/S5ntOkd2Z4QfJyzKvWN0RksXpvFJwp616hsDHpl40DVWevKhd8/lZQD
         lx9Ubk0ZdUOMK6xtZM/4eCVZrbq2cMSX7SFISeFpasrVkcvQs8gNoL7UGobtH0pNPkEs
         dMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7tGJOXhlF8zkyNel4BVGGNft0gQqSU/ZpA22NJJ+r6LbiwhlmrlYknM8nQhXj0slFHFMDc81AnUKZnA8D@vger.kernel.org, AJvYcCUKMZuVTX9PLBGAqM8inR4qCZvIenECjGv8QGykfajUc7ukcdR3RsN20LpBIamBRirqusM//wG+JZsM@vger.kernel.org, AJvYcCVH/GplxnIl1J4ratEw2riMdBXdzYdYsndk1+n1vSI+t5T4tEK9LQgiLiQSZodTMYv28RGFXMFggCTR@vger.kernel.org, AJvYcCVHfg8w5voKecA8rIs3XmhhOLyx9FAfyu3uNqkxWNa6AoNTFcheG16E7au9iP0JDxtZ07XLC1EaiDJ0npaZCYRP9uc=@vger.kernel.org, AJvYcCVMEbk+Nc6FdN7x8bZVnHxvfT73Uh80GsDUetVSRhPZAXC6LhvB6fra4gIz0xO0aKc8/zZ0cTnotMAo/n8B@vger.kernel.org, AJvYcCWUdHxTiBiIly8uPAWhpEOGG2EIryzC9gBbpc79iWr9w21t4j+aucI/NPq8Ti0B5BMlz9atv+A+Uhr87A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybm8H1XB4l4wt14qYgUbl523cmi4sybtNOkfj+1k0ga+2EKcHh
	GZp1XmMVVpcVSJFoc6nIQZwz1dWMyTHpoG+3p5f1Rv1L6cMbA6HzJxWzuJoUUrtPmdIBCdK6cwl
	tq1MULv76hgTLM5bh8kRALiK6fgI=
X-Gm-Gg: ASbGncvv4ZqqzuqtyHQ+8t42Ms8iI3qzU4WlKwQIv3MzQXJ29l75LrdzefFLsp/i8i8
	0WsOrDs3wY0HrS0ZanaBF7lneJhCgD3TRzGXFZLGWQH8i1wRkjylxRXBIKWHX0M7DN5UvDD6o+5
	eGwVcsQ2qBKfhbqmznjokju1JPY8+tztvX+TAiYyxjbN8wjeceqa/kJw==
X-Google-Smtp-Source: AGHT+IHBUB9kEPSKwgKd2txljGHU1ssO7E0I6WrF9zh7ERI+GYHfCd+4aTvgWTLxE4QVOPz363Sd+wVhzo036TDs7k0=
X-Received: by 2002:a05:6000:2483:b0:39c:11c0:eb95 with SMTP id
 ffacd0b85a97d-39ea52009dbmr11190787f8f.17.1744720512543; Tue, 15 Apr 2025
 05:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8useBh5m+MqGXQwQJhuemehm=bPidL6XydR-FOmVN9QNQ@mail.gmail.com>
 <CAMuHMdU+U8D8iQdks72=Kki2HL+bo8tw9gA1S4D3c4hOphLTuA@mail.gmail.com>
 <CA+V-a8tH9BLjy5aG1qkRJnUFO_4VARu6rW4fQzHoSxvaMgo1Xg@mail.gmail.com> <CAMuHMdVT0R_ypz7sLxLzYU+v-Cj94Pd4FaFJsdQq-c_Evx5neA@mail.gmail.com>
In-Reply-To: <CAMuHMdVT0R_ypz7sLxLzYU+v-Cj94Pd4FaFJsdQq-c_Evx5neA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 13:34:46 +0100
X-Gm-Features: ATxdqUEjCg3cMLO6JXC6UUfB1YApx1RelExOS_EQIX8JNeUH3Dj9IueCJgAeFmU
Message-ID: <CA+V-a8tPKb2zrXtRZcs5G=4-wBg6sr7hYxYxqV=W0+FmyyY=YQ@mail.gmail.com>
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

Hi Geert

On Tue, Apr 15, 2025 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 15 Apr 2025 at 11:28, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Apr 14, 2025 at 2:40=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 14 Apr 2025 at 13:19, Lad, Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > > > On Mon, Apr 7, 2025 at 8:16=E2=80=AFPM Prabhakar <prabhakar.csengg@=
gmail.com> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > This patch series adds initial support for the Renesas RZ/V2N (R9=
A09G056)
> > > > > SoC and its evaluation board (EVK). The Renesas RZ/V2N is a visio=
n AI
> > > > > microprocessor (MPU) designed for power-efficient AI inference an=
d
> > > > > real-time vision processing. It features Renesas' proprietary AI
> > > > > accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, m=
aking
> > > > > it ideal for applications such as Driver Monitoring Systems (DMS)=
,
> > > > > industrial monitoring cameras, and mobile robots.
> > > > >
> > > > > Key features of the RZ/V2N SoC:
> > > > >   Processing Power:
> > > > >     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance co=
mputing
> > > > >     - Single Arm Cortex-M33 core at 200MHz for real-time processi=
ng
> > > > >     - 1.5MB on-chip SRAM for fast data access
> > > > >     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
> > > > >
> > > > >   AI and Vision Processing:
> > > > >     - DRP-AI3 accelerator for low-power, high-efficiency AI infer=
ence
> > > > >     - Arm Mali-C55 ISP (optional) for image signal processing
> > > > >     - Dual MIPI CSI-2 camera interfaces for multi-camera support
> > > > >
> > > > >   High-Speed Interfaces:
> > > > >     - PCIe Gen3 (2-lane) 1ch for external device expansion
> > > > >     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
> > > > >     - USB 2.0 (Host/Function) 1ch for legacy connectivity
> > > > >     - Gigabit Ethernet (2 channels) for network communication
> > > > >
> > > > >   Industrial and Automotive Features:
> > > > >     - 6x CAN FD channels for automotive and industrial networking
> > > > >     - 24-channel ADC for sensor data acquisition
> > > > >
> > > > > LINK: https://tinyurl.com/renesas-rz-v2n-soc
> > > > >
> > > > > The series introduces:
> > > > > - Device tree bindings for various subsystems (SYS, SCIF, SDHI, C=
PG, pinctrl).
> > > > > - RZ/V2N SoC identification support.
> > > > > - Clock and pinctrl driver updates for RZ/V2N.
> > > > > - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
> > > > >
> > > > > These patches have been tested on the RZ/V2N EVK with v6.15-rc1 k=
ernel,
> > > > > logs can be found here:
> > > > > https://gist.github.com/prabhakarlad/aa3da7558d007aab8a2885500055=
65d3
> > > > >
> > > > > @Geert, Ive rebased the patches on top of v6.15-rc1 + renesas-dts=
-for-v6.16
> > > > > + renesas-clk-for-v6.16 branches. Also these patches apply on top=
 of the below
> > > > > series [1] and [2]. I had to sort the order in Makefile for patch=
 [3] to
> > > > > avoid conflicts.
> > > > > [1] https://lore.kernel.org/all/20250401090133.68146-1-prabhakar.=
mahadev-lad.rj@bp.renesas.com/
> > > > > [2] https://lore.kernel.org/all/20250403212919.1137670-1-thierry.=
bultel.yh@bp.renesas.com/#t
> > > > > [3] https://lore.kernel.org/all/20250403212919.1137670-13-thierry=
.bultel.yh@bp.renesas.com/
> > > > >
> > > > > Note, dtbs_check will generate the below warnings this is due to =
missing
> > > > > ICU support as part of initial series. I will be sending a follow=
-up patch
> > > > > series to add ICU support which will fix these warnings.
> > > > > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@1=
0410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required p=
roperty
> > > > >         from schema $id: http://devicetree.org/schemas/pinctrl/re=
nesas,rzg2l-pinctrl.yaml#
> > > > > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@1=
0410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required prope=
rty
> > > > >         from schema $id: http://devicetree.org/schemas/pinctrl/re=
nesas,rzg2l-pinctrl.yaml#
> > > > >
> > > > > v1->v2:
> > > > > - Added acks from Rob.
> > > > > - Squashed the RZ/V2N EVK and SoC variant documentation into a si=
ngle
> > > > >   commit.
> > > > > - Updated the commit messages.
> > > > > - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
> > > > >   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
> > > > >   in pictrl driver hence to keep the consistency with the
> > > > >   RZ/V2H(P) SoC these macros are added.
> > > > > - Dropped `renesas,r9a09g056-pinctrl.h` header file.
> > > > > - Followed DTS coding style guidelines
> > > > > - Dropped defconfig changes from the series.
> > > > > - Dropped SDHI dt-binding patch as its already applied to mmc -ne=
xt tree.
> > > > >
> > > > > Cheers,
> > > > > Prabhakar
> > > > >
> > > > > Lad Prabhakar (12):
> > > > >   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants=
 and
> > > > >     EVK
> > > > >   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
> > > > >   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
> > > > >   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
> > > > >   dt-bindings: serial: renesas: Document RZ/V2N SCIF
> > > > >   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
> > > > >   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part=
 number
> > > > >   clk: renesas: rzv2h: Add support for RZ/V2N SoC
> > > > >   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
> > > > >   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
> > > > >   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
> > > > >   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
> > > > >
> > > > Would it be OK if I send version 3 containing only patches 4/12 and=
 10/12?
> > >
> > > For patch 4/12: yes, that is fine. Thx!
> > > For patch 10/12: I have already applied it.
> > >
> > For patch 10/12 ("pinctrl: renesas: rzg2l: Add support for RZ/V2N
> > SoC") will that be part of renesas-pinctrl-for-v6.16 branch (which is
> > yet to be pushed)?
>
> Sorry, my bad; I misread the patch number. I have not applied 10/12 yet.
>
Thanks, I'll send out a v3 (for patch 10/12) addressing the review comments=
.

Cheers,
Prabhakar

