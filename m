Return-Path: <linux-gpio+bounces-18029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960FA71F03
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 20:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7E43AFEA5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 19:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68141253355;
	Wed, 26 Mar 2025 19:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPtQBPVy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D1415990C;
	Wed, 26 Mar 2025 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743016894; cv=none; b=hm0CXlK3m7ePFvcjyvPbPx3PLZRn6Juz9UGuewMeaMrLBLNC8qi0FW0BL6SSfWDveTmX/FIO0hsriQkLO3e/9ywRt8soDCtFKpwufZ02rSVBy8ntkXEjFxjwjt6+6rqhoano0xyCbVbb3+gQUHf3WSpUkvOHBkut2LO9LTkg4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743016894; c=relaxed/simple;
	bh=9SujrNYMLA/XAMHXQB+2rCkk6Yg1jBiNU3xCW6K3B9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDmAEKU5pQsps3V28PieeooHO+Njbmfiz63OPRc/3b4lk4RXO4Bsv2lI9txXnqAgHkhKkl5w8+qHvWx6YXWKg9bkkyEyuWyPm8BM/AiCW7WzOTUfpap9V629D6xZxTOD3KcVB3ZWCiI1dwruGfuYDdU0nyavcC883K50ekWyUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPtQBPVy; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5240b014f47so100640e0c.1;
        Wed, 26 Mar 2025 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743016891; x=1743621691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64vjjGgKkyej47wZkg9Q8gzWkXdomxA9oEZPcwE0Oo0=;
        b=ZPtQBPVyyDWXoYnU9uFhHV+QqhPn8GIaTVlFnZrw0Gkjfs1uEwK3V4y8JJo1LKZrJw
         zSWqdauIyJTTivBFnVsKLYc1LDpO/VJYSPhpbpBW3f0MeY0vIl+rzCi90w1DTsWkrel0
         WK5BARvBjzGEHU+ZbP4/GpFVWgM8OWDE+2X6T7NEVorBIicJAK+ebpKbPv8EPM7lzX2D
         a9QChfoaTa7mYCLJnd7PbpUc+lddhCw6DErbqR1LSwoslQ1kQXpAbDC9RlPVyRzrGCc0
         GHMfdaKqPLlPpNYYbnGFs7Va0fKTmu+NVIrka/BsPe5gF8HfzgQiiidL8BWi6buMmrmD
         mDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743016891; x=1743621691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64vjjGgKkyej47wZkg9Q8gzWkXdomxA9oEZPcwE0Oo0=;
        b=WiqJKThFJczmooXs2SU/emJf+mtDhuQoN6LHz3WqK/1vBFfHMrlUe7Nww378RYH5rt
         iDxHItyYVcTMBXXAQAi9QNt2EvKf2WuDwdE0Ltmbjw4LyMIo2miuVqD3ZQfTTi/vwLdR
         HSDlLGveoe7r5S7SElX/ol5bVO1dl+iZQ+3PMiBngRUup2IFY8YBSC5haV6IvZCul2dg
         y9bgKYHAO5W3fAxksCqkOppZtXZyAeuWyxYpEQY3dAegLvZlWIzWW2WLpclsVBzVgoBv
         tL5a8lfQoyKDTO1BwsotNoxFfz9n7uCGAvWLP5JbcFKqgW/AKuzjAz02gAg0nkG7VM2q
         517g==
X-Forwarded-Encrypted: i=1; AJvYcCUNFBGKlBuG7YBWYKUhsYnP0yfhUSUF3HfccUNXdeu9L6DRfM1w+cJi9D+3B0k4XHfcacHL8+0AXWpnew==@vger.kernel.org, AJvYcCUy4tlNwHhRH1ska91YonaTkEwYdUoA8V9oHU0bmYWA3/SR5/KunjS7e48eHKYVq7+vXs0rQhW9T2PWfFGF68sHwMQ=@vger.kernel.org, AJvYcCWZmden09U1k3WzZaKVOaSvjizRI6bDghfZdbfJ/fOQnpVX+fvORy//yqORbT7GQ9/yLnnTSY53ThxH+cJN@vger.kernel.org, AJvYcCWg7OR5AwjEWOsJpUkwoeCIq7euOMade+KnT2ingrICZgAZ/qS6CPApL6r0YkemkP2AyK6Nehl8mTJyNaJo@vger.kernel.org, AJvYcCX1J9ziV9C49Bw4jZGmWnkgBHCK6QnvMh0L+pOc9T2qjzPqwhyNgEt+dJ9Qdg5XQNPCUUYYAPg/oOPt@vger.kernel.org, AJvYcCXaqQlayKgOr6A7+EDvjZX0t38KvvJYmw1rHuJP+qSkubFKxXGjB4DP1KH5aSATEfUBntffhNhHK8pI@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4yK/Te9qwyNXsD1x1Y6S7yJyCrdEf8eN1CrMfPkTU/jBl63i
	ImRjpiv2jLwgkSwlEmQrJSHzMxHyuJ7ydk0//tHCzVhFLALUoH1LjT3C8YTuHhTcvWttNKD6mom
	rnYxEIDtLMsCqu/+sfuI6cn/yacc=
X-Gm-Gg: ASbGncsXAFiucXKdHzOnjugnL7DW/HEZtcvAv17PF/UIzbS8igZBPlsmARuOogOuKsK
	FnWmhxEi44gB7zDMDYbF6zreWGMq7HCb2y4BX7fSnGUZATXR73BFE9l3Scrg6zzaDHcqw4DXANc
	73Dw9BzDU7HboJGzATBz1YsrnaW/Luv8ql41oelv0=
X-Google-Smtp-Source: AGHT+IEMDUu/kTsNu1CbItYSDxUZeO1gxYDQkWcrekLYRRg2eqkHhtGCeqXHHIbGy6v6eIHaPx/Rv/onzgSKYSV/BuA=
X-Received: by 2002:a05:6122:660c:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-52600a8ada4mr1173468e0c.9.1743016890983; Wed, 26 Mar 2025
 12:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <174301523991.2716417.14351851624098585706.robh@kernel.org>
In-Reply-To: <174301523991.2716417.14351851624098585706.robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Mar 2025 19:21:03 +0000
X-Gm-Features: AQ5f1Jp6yjmSyKSnpYoXWKYVnLBzGIWh9gTSXr8OSv020P_GOH986D8KqbvLGlA
Message-ID: <CA+V-a8tBGdAFoUW1Dt2wZTeQBcVts-CGc9DgC24uvtFSfoUFeA@mail.gmail.com>
Subject: Re: [PATCH 00/15] Add support for Renesas RZ/V2N SoC and EVK
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Jiri Slaby <jirislaby@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Mar 26, 2025 at 7:11=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 26 Mar 2025 14:39:30 +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch series adds initial support for the Renesas RZ/V2N (R9A09G05=
6)
> > SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
> > microprocessor (MPU) designed for power-efficient AI inference and
> > real-time vision processing. It features Renesas' proprietary AI
> > accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, making
> > it ideal for applications such as Driver Monitoring Systems (DMS),
> > industrial monitoring cameras, and mobile robots.
> >
> > Key features of the RZ/V2N SoC:
> >   Processing Power:
> >     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance computin=
g
> >     - Single Arm Cortex-M33 core at 200MHz for real-time processing
> >     - 1.5MB on-chip SRAM for fast data access
> >     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
> >
> >   AI and Vision Processing:
> >     - DRP-AI3 accelerator for low-power, high-efficiency AI inference
> >     - Arm Mali-C55 ISP (optional) for image signal processing
> >     - Dual MIPI CSI-2 camera interfaces for multi-camera support
> >
> >   High-Speed Interfaces:
> >     - PCIe Gen3 (2-lane) 1ch for external device expansion
> >     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
> >     - USB 2.0 (Host/Function) 1ch for legacy connectivity
> >     - Gigabit Ethernet (2 channels) for network communication
> >
> >   Industrial and Automotive Features:
> >     - 6x CAN FD channels for automotive and industrial networking
> >     - 24-channel ADC for sensor data acquisition
> >
> > LINK: https://tinyurl.com/renesas-rz-v2n-soc
> >
> > The series introduces:
> > - Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, pi=
nctrl).
> > - RZ/V2N SoC identification support.
> > - Clock and pinctrl driver updates for RZ/V2N.
> > - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
> > - Enabling RZ/V2N SoC support in `arm64 defconfig`.
> >
> > These patches have been tested on the RZ/V2N EVK with v6.14,
> > logs can be found here https://pastebin.com/8i3jgVby
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (15):
> >   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
> >   dt-bindings: soc: renesas: Document RZ/V2N EVK board
> >   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
> >   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
> >   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
> >   dt-bindings: serial: renesas: Document RZ/V2N SCIF
> >   dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
> >   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
> >   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part numbe=
r
> >   clk: renesas: rzv2h: Add support for RZ/V2N SoC
> >   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
> >   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
> >   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
> >   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
> >   arm64: defconfig: Enable Renesas RZ/V2N SoC
> >
> >  .../bindings/clock/renesas,rzv2h-cpg.yaml     |   5 +-
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml |   4 +-
> >  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
> >  .../bindings/serial/renesas,scif.yaml         |   1 +
> >  .../soc/renesas/renesas,r9a09g057-sys.yaml    |   1 +
> >  .../bindings/soc/renesas/renesas.yaml         |  15 +
> >  arch/arm64/boot/dts/renesas/Makefile          |   2 +
> >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 264 ++++++++++++++++++
> >  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++
> >  arch/arm64/configs/defconfig                  |   1 +
> >  drivers/clk/renesas/Kconfig                   |   5 +
> >  drivers/clk/renesas/Makefile                  |   1 +
> >  drivers/clk/renesas/r9a09g056-cpg.c           | 152 ++++++++++
> >  drivers/clk/renesas/rzv2h-cpg.c               |  18 +-
> >  drivers/clk/renesas/rzv2h-cpg.h               |   1 +
> >  drivers/pinctrl/renesas/Kconfig               |   1 +
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  36 ++-
> >  drivers/soc/renesas/Kconfig                   |  10 +
> >  drivers/soc/renesas/Makefile                  |   1 +
> >  drivers/soc/renesas/r9a09g056-sys.c           | 107 +++++++
> >  drivers/soc/renesas/rz-sysc.c                 |   3 +
> >  drivers/soc/renesas/rz-sysc.h                 |   1 +
> >  .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  24 ++
> >  .../pinctrl/renesas,r9a09g056-pinctrl.h       |  30 ++
> >  24 files changed, 790 insertions(+), 10 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> >  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.=
dts
> >  create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
> >  create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
> >  create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
> >  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinct=
rl.h
> >
> > --
> > 2.49.0
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20250326 (best guess, 15/18 blobs matched)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/renesas=
/' for 20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com:
>
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000:=
 'interrupt-controller' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000:=
 '#interrupt-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
>
>
As mentioned in patch 13/15 [0] the above warnings are expected this
is because as part of the initial support, the ICU has not been added
yet. The interrupt-related properties will be added to the pinctrl
node along with ICU support.

[0] https://lore.kernel.org/all/20250326143945.82142-14-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

