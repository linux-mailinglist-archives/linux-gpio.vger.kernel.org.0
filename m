Return-Path: <linux-gpio+bounces-18778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C2A87EE0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 13:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF6BF171C28
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 11:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DA0283697;
	Mon, 14 Apr 2025 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec3pTnbu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB0025D8E0;
	Mon, 14 Apr 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629586; cv=none; b=nJ3K4YXaGKnfbYQasC7/4dFLdTB1ZftTgsfYr1Ced8cZDDbc6KvnuBvsz6ocNW8pQ3SFGMl97j9MUq3nCr9qYU/NgwTljTLJAFvThH2tpa8enDJHtyVhu+wLGCHRqC4Hs74/4Ufk44zvWlueRhhLb5b4vjj4rl3PFBNBJnkuDJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629586; c=relaxed/simple;
	bh=BKzGtY0m29Mf6TkuRUUflwug+d15q5+nqop+AkHVYkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqgjieHN15DanqzKtNM+AnlVSc2dOC97jAmUlrQJDy+GbzT/pxUciGINsSamQYm5X4mx+SJ14QJ8U+31SglGpzcjktGIswYZi0n4wALZ+PFHt0vW1Tyb/TaPvPpHq+J+PcvaI0nU32WJb4R2lHU4RTu/d+ycQQc6JbhRZomuO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec3pTnbu; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so1480674e0c.0;
        Mon, 14 Apr 2025 04:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744629583; x=1745234383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEqhZeC/SxQPEFxYDopllibBPq2tN/nqOZR4I+9eMe4=;
        b=ec3pTnbuSLPB7kJy/d8ZbIX9BwWvom36JE4F3maMqa1CDxCirSOeTTj1ha1R8wmKcs
         Nsd7fIbPybU10ZUXdMtZg/ZNmWTS/N1boPvr9VTACMMIaHw1C6Fw0EYjSyeWB7NJvClW
         /8Aqi8LuZnaSsQw4TWBEAD+246TYmAN6veYJPCxqtsTOcVWNvakyK9cfi7gArsHvDRs9
         L1+YK48aS+3rGeIePfk6qxbR4LFoX+wHvu0ru+fYo6EzYvrLhBrSpcCaogB3QQ/HGfJQ
         vv9yvcKf4UQDAwFyptbf1087eUUfgV5ApnBLVOm+vByl6TfkVGkyN2X/CsTyLCjPwWp1
         9kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744629583; x=1745234383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEqhZeC/SxQPEFxYDopllibBPq2tN/nqOZR4I+9eMe4=;
        b=hgymS6lMnCu1u4BSEMCQJDWqxUuVlEnWtN2SfBVK+oTHDvAthn0WaF78VAZ+wwKhOo
         BMYsXgdI0Ae1470B0+pNDjY3OZCF99Ai2sh4ezNYUGd71VvArmG5SP8a02hNTtLHXqON
         vgarPPMY4tyFJkCjMKVJoJur0fMWjtE5lb++88XFdxUHYe1z6c+8EiFRdJMxZoNgGZYW
         PZ7JPMWDWU9IGYD2n806PxGhraxgpQiR5NB/rSp3+QJOpFOYmJJixOfLni66Tuhptrlb
         Yoe84UADOVJScc2UjHMYoMEJ+v7goH8Q3222rIYkHMFGh7OLo4/FuA7CrbWZekfuiRL9
         KkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2JDKU+n3m5EFHTcjqO1MI5jYSPPiAA2TJPk+01jyHdHN13EMN8qcKbn+AvG6kVL8aFHzq0nPzbqnH@vger.kernel.org, AJvYcCVAic2+cW9OYt3H/I2+lxAcy/gdSOIPtQIep2f2kfuNMPHm3ViGA8yJpPRRfsut/7Nla+2HMsOGlRlfX+OhdqCpAPw=@vger.kernel.org, AJvYcCVSzTXRF/pI1ntmYNdSsPz2EOs2cmTWYpL5JBi9TSaBSNxZTdVkXWsU6Uzmz3W0g0hP5CDuhLLZwi4C3RBn@vger.kernel.org, AJvYcCVw0khGCl0N94Iq7CLJfYys7rhlLUcyHesDaP4EHVRRrgRbfw+rsEnoXafQnCD6ZWa4g1bIwsDGyjd+3lwe@vger.kernel.org, AJvYcCWbE3piOOMi2AcEb7Xytj1/FLox/T2Efn+23vpE+9sTzjZAyECfDgsn11cP0IDy3Fs8hpbCVFvXxDh2vA==@vger.kernel.org, AJvYcCWy8Hn5GLSXC3q4l5BdBWmozfYdtjg2Mm80FSsdxoBdUG9TKKyDbBL+8cfaMaAN+ue1qso21j/fdmX7@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNNNzsPmgqbj9IzsLa47CZaahd1iRCbybWYiBxLarzbiDUYw+
	9k5PsYgRGnsER9iNu4UYtZbUy4DDniu+/ilT6dc8VU3iqxOlDps8NoW0f5DGmc19Eq85hjyByXL
	RIHli8wZ+wCCGsNkgOUoqMCIq+P0=
X-Gm-Gg: ASbGncs6yX+0kyQZDkILIGly0oKuDtHJ1e4L/g10KY8ZTSdTjFbDHdcGUt/qJYfb4eK
	YBSCqzXidGnpamOecHrZTXxSCl3S6CUErGz3UUk3wi+nVAIpLMS2bA2aBiCNwLciT8sWlT3s702
	hGfm5iMfU0NZ279PJnTSRv97ViKz3HmPSL5DlbT3W1L7LBeK1Dq6KLEA==
X-Google-Smtp-Source: AGHT+IHBThT2zEj4KJtUm3PS9DNJ79HJu09faPsTCT7kPgy8QzXrty9/2BnAr01/9b/AIEkrW8flUc10uUA4F5iz66s=
X-Received: by 2002:a05:6122:1d89:b0:518:a0ac:1f42 with SMTP id
 71dfb90a1353d-527c3464832mr5207743e0c.1.1744629582771; Mon, 14 Apr 2025
 04:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 12:19:16 +0100
X-Gm-Features: ATxdqUFod-By5skQwut9E6OLv-Y-Yr-c2MfufCYZft6F7eFLNq3WA8NWjWHZnLY
Message-ID: <CA+V-a8useBh5m+MqGXQwQJhuemehm=bPidL6XydR-FOmVN9QNQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Add support for Renesas RZ/V2N SoC and EVK
To: Geert Uytterhoeven <geert+renesas@glider.be>
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

Thank you for the review.

On Mon, Apr 7, 2025 at 8:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series adds initial support for the Renesas RZ/V2N (R9A09G056)
> SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
> microprocessor (MPU) designed for power-efficient AI inference and
> real-time vision processing. It features Renesas' proprietary AI
> accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, making
> it ideal for applications such as Driver Monitoring Systems (DMS),
> industrial monitoring cameras, and mobile robots.
>
> Key features of the RZ/V2N SoC:
>   Processing Power:
>     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance computing
>     - Single Arm Cortex-M33 core at 200MHz for real-time processing
>     - 1.5MB on-chip SRAM for fast data access
>     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
>
>   AI and Vision Processing:
>     - DRP-AI3 accelerator for low-power, high-efficiency AI inference
>     - Arm Mali-C55 ISP (optional) for image signal processing
>     - Dual MIPI CSI-2 camera interfaces for multi-camera support
>
>   High-Speed Interfaces:
>     - PCIe Gen3 (2-lane) 1ch for external device expansion
>     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
>     - USB 2.0 (Host/Function) 1ch for legacy connectivity
>     - Gigabit Ethernet (2 channels) for network communication
>
>   Industrial and Automotive Features:
>     - 6x CAN FD channels for automotive and industrial networking
>     - 24-channel ADC for sensor data acquisition
>
> LINK: https://tinyurl.com/renesas-rz-v2n-soc
>
> The series introduces:
> - Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, pinc=
trl).
> - RZ/V2N SoC identification support.
> - Clock and pinctrl driver updates for RZ/V2N.
> - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
>
> These patches have been tested on the RZ/V2N EVK with v6.15-rc1 kernel,
> logs can be found here:
> https://gist.github.com/prabhakarlad/aa3da7558d007aab8a288550005565d3
>
> @Geert, Ive rebased the patches on top of v6.15-rc1 + renesas-dts-for-v6.=
16
> + renesas-clk-for-v6.16 branches. Also these patches apply on top of the =
below
> series [1] and [2]. I had to sort the order in Makefile for patch [3] to
> avoid conflicts.
> [1] https://lore.kernel.org/all/20250401090133.68146-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
> [2] https://lore.kernel.org/all/20250403212919.1137670-1-thierry.bultel.y=
h@bp.renesas.com/#t
> [3] https://lore.kernel.org/all/20250403212919.1137670-13-thierry.bultel.=
yh@bp.renesas.com/
>
> Note, dtbs_check will generate the below warnings this is due to missing
> ICU support as part of initial series. I will be sending a follow-up patc=
h
> series to add ICU support which will fix these warnings.
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 =
(renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 =
(renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
>
> v1->v2:
> - Added acks from Rob.
> - Squashed the RZ/V2N EVK and SoC variant documentation into a single
>   commit.
> - Updated the commit messages.
> - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
>   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
>   in pictrl driver hence to keep the consistency with the
>   RZ/V2H(P) SoC these macros are added.
> - Dropped `renesas,r9a09g056-pinctrl.h` header file.
> - Followed DTS coding style guidelines
> - Dropped defconfig changes from the series.
> - Dropped SDHI dt-binding patch as its already applied to mmc -next tree.
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (12):
>   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and
>     EVK
>   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
>   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
>   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
>   dt-bindings: serial: renesas: Document RZ/V2N SCIF
>   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
>   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
>   clk: renesas: rzv2h: Add support for RZ/V2N SoC
>   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
>   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
>   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
>   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
>
Would it be OK if I send version 3 containing only patches 4/12 and 10/12?

Cheers,
Prabhakar

