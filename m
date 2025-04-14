Return-Path: <linux-gpio+bounces-18790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B977CA8844F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 16:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11BFE170F05
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 14:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0098224728D;
	Mon, 14 Apr 2025 13:40:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBAC23D2AA;
	Mon, 14 Apr 2025 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638054; cv=none; b=CqazVWiTynEuH7LcS8a1r7S6RTdDXUQFGAaKlR/zqursK1Hr98d0WnwYy8IKIfbSUQd4jp6EZTSug3Epr0c3b2hlglaUL4un0SM1onhUzcxjdNwNRQQ4xBSgB63fRUbSAF/MqWbRioQL7O9rCjX1JLB+v8XMCXJnik2otjdxbZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638054; c=relaxed/simple;
	bh=1eCbuWm8dVGaoYTLm0vad9ErxPZVwWfXk5roSAc9z6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyTN2PSYwLIevnYFDmNUOQfyaXdATC2//15sDwUhnaCDmdCS0FULuTKeyEOzxY5OWTj7vDU5L2nxyd1BAcASaX2r4p6i7uqSjt9ZIxIF3v4E/Jd8yYCNn605MpUYVDcs8i8BM/n+R/HWXA9SXEM3sFK3D7CtMr8uzvhYFpcR1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523fa0df55dso4895453e0c.1;
        Mon, 14 Apr 2025 06:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638050; x=1745242850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxFVREXOrkgNS43wycobvJ4oCa9KVGBm5xx9A69fAqQ=;
        b=rv8NOquA8LD6c3Oqyg94G1Ys6fK2eC9LO3qs+jouP9AIjmhjDrGeN/2nD5jnEAFC8G
         736zDTr/mwCzBcxBsaw7d0/ZRv7//wdcjVGBCwABuGEcPPxgUj0DwPNoW/oCkVFT63f1
         odz8CZC9n3M6lkHHDn86IuiT+qVD/On27c8rxKlu8DWD5PG2EfCdjaDiV00P5bFQ32XT
         KGFhra9O4U2HnV0k9jnLqGnxn9N3obAKqpXrk0c7nkQPMmZWXWK+TALWrMq9QiGMiTDN
         sVoUEXjtIoxQpL3YPT4+Uo9YRDN1tJiiEu9WEapMYrbV/bqLDglPPZOKKUlQwIN0BiIm
         tEYA==
X-Forwarded-Encrypted: i=1; AJvYcCUKjHTQRVQoOD4RN+OII/Cxs9jhIg29X96GS8e2p1XsRS5BMWFaHytUj/R+OfAeUwQkKouc2n1paiZ+OVZE@vger.kernel.org, AJvYcCUpLhgn2+l0Y38+4sl4l7iwo+Pwy0Tzxq+p/mMKsBPUIpw9a3VpXIdjfNit0XaBy9373k22r3R8i5ld@vger.kernel.org, AJvYcCVCmWfXqo/Aq5iQ3J4V57LgMc6RiDGfq3yQJdMeMQr9w6P0gR4+1t/LxC2KksCWBc2kcXkUAafClZhZ@vger.kernel.org, AJvYcCVl5/XYESOuKi1dqpwPFc2mRfPp5TnF9H8UfNmqU1i1VwDZWtTc1aqaeR7glXkHCAV/N4Kzsls6ZUBQ0dB6@vger.kernel.org, AJvYcCWY7gFFIsPL8s2armxZTjp7RJwZfQm+Qz0YWaZT4oyMfsNPOw47xenY64A0EfnOyP6+M70Gd7llBTX0XQ==@vger.kernel.org, AJvYcCWug5Y6fi0xbWpBkGrFmPNIxr9bu4h/Jhr0U7rMCQ66mT9JkDM+5NPFBrM01OYRINyilBUIvf5TxCnyseLbgI5mmVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wl2dCcETJIDrHXcNj/7T3Gl4J1eS2zG40v4T7EgovNfnQl8q
	3AW2oaAoRur4VuSjsSwlZB46M4nTZk4nc9AtPCcvzZyEXFyCSicFxXxAHcRD
X-Gm-Gg: ASbGncsTO24g4CX+8bGYcuEvFq5Z/fHfhqaXkQH8QivfyzaS3IEWlc2iZK/kz//gXaW
	zQCM2fI3D3SmPXFsr0ZeZDCpMRzfbJwvM/m92X7VkbI6Q3zBA27N28Nd+puw8U/wZNJqEQj4utj
	0IGdFVsEqTBixb9o++EF/WuCs8ukZxRyZmn3DPOuXsmfwOU/eCUZxK83Ubl3oAHrHmuG8YzmJz8
	WjigRKNVUyQhNUXz+ZH1TqorQv8yoJjnvO8IYpOdl5LUrrbPi9d1/tArVRv38WOSZHUhe30NLWI
	7cDrPfm9pyrk9hvMqi7xGTR4yg8BlBacRe6azWHY17lj+hZs5rdU8erT9IPoZ7U+G72diGZC7se
	b90ULyZM=
X-Google-Smtp-Source: AGHT+IEPgHG1D7Dy5FoauPMAno7o5t7gB+FO9wBlka1sEgE6+I+oz6cHGCZ1pQlWovGSNPESRVEIkw==
X-Received: by 2002:a05:6122:336:b0:523:6eef:af62 with SMTP id 71dfb90a1353d-527b5ea09eamr9485321e0c.4.1744638049960;
        Mon, 14 Apr 2025 06:40:49 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4cb93sm2193603e0c.1.2025.04.14.06.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:40:49 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523f721bc63so4954291e0c.0;
        Mon, 14 Apr 2025 06:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTnzrhLlPXbSQXpE+7ZRXqOiJp8eApSKqrZ3cWk2xl+MENSZL0HO1fs78uETM/wmFUeKUBgXxgns/7JZlk@vger.kernel.org, AJvYcCVH6RwGZRSpM0HibuxFpwzFQ7mY3kJf/KO6fJlcHbCS9QP4mbOdJWhFBvWi1ZdY4SfKBT5TwqO1/bJFKw==@vger.kernel.org, AJvYcCWBDi5DTZQ4fnAbszA2vj/2cPnji+nGH/lmsTefTgr4iK3cGDahXM3rsMZBzzi80EmYg2IkDmxdouC9@vger.kernel.org, AJvYcCWVK3CEpMf5mak7bEbBvmfk8+sFGv7JpyCY90G0BLpQlbF9unvMpc9Tj2sB6pob241e/xyWXw3cLb0h@vger.kernel.org, AJvYcCWgvp3fZm0iLvooENaowNr1dq6Bx199daEvc/remGgbeycz0d3W0dFn8tSgjf1ClaOi2ukkKHyZ9/BKKx2s@vger.kernel.org, AJvYcCXsMPA9a2+SczrcmEIn7q6H6LdLraPcJjt+sLok0OMaly5DXuhl346r+z1l5O5me1qzuXdQWcB2zT9vrK4qAq8pas0=@vger.kernel.org
X-Received: by 2002:a05:6122:336:b0:523:6eef:af62 with SMTP id
 71dfb90a1353d-527b5ea09eamr9485274e0c.4.1744638049070; Mon, 14 Apr 2025
 06:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8useBh5m+MqGXQwQJhuemehm=bPidL6XydR-FOmVN9QNQ@mail.gmail.com>
In-Reply-To: <CA+V-a8useBh5m+MqGXQwQJhuemehm=bPidL6XydR-FOmVN9QNQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 15:40:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+U8D8iQdks72=Kki2HL+bo8tw9gA1S4D3c4hOphLTuA@mail.gmail.com>
X-Gm-Features: ATxdqUFKkMO3BbQqjnr_4N17M_FpT_VBDPVT_ExrXL2YuenRJWHQK8qxSnAps2k
Message-ID: <CAMuHMdU+U8D8iQdks72=Kki2HL+bo8tw9gA1S4D3c4hOphLTuA@mail.gmail.com>
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

On Mon, 14 Apr 2025 at 13:19, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Apr 7, 2025 at 8:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
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
> >
> > These patches have been tested on the RZ/V2N EVK with v6.15-rc1 kernel,
> > logs can be found here:
> > https://gist.github.com/prabhakarlad/aa3da7558d007aab8a288550005565d3
> >
> > @Geert, Ive rebased the patches on top of v6.15-rc1 + renesas-dts-for-v=
6.16
> > + renesas-clk-for-v6.16 branches. Also these patches apply on top of th=
e below
> > series [1] and [2]. I had to sort the order in Makefile for patch [3] t=
o
> > avoid conflicts.
> > [1] https://lore.kernel.org/all/20250401090133.68146-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
> > [2] https://lore.kernel.org/all/20250403212919.1137670-1-thierry.bultel=
.yh@bp.renesas.com/#t
> > [3] https://lore.kernel.org/all/20250403212919.1137670-13-thierry.bulte=
l.yh@bp.renesas.com/
> >
> > Note, dtbs_check will generate the below warnings this is due to missin=
g
> > ICU support as part of initial series. I will be sending a follow-up pa=
tch
> > series to add ICU support which will fix these warnings.
> > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@1041000=
0 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required propert=
y
> >         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,=
rzg2l-pinctrl.yaml#
> > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@1041000=
0 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
> >         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,=
rzg2l-pinctrl.yaml#
> >
> > v1->v2:
> > - Added acks from Rob.
> > - Squashed the RZ/V2N EVK and SoC variant documentation into a single
> >   commit.
> > - Updated the commit messages.
> > - Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
> >   SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
> >   in pictrl driver hence to keep the consistency with the
> >   RZ/V2H(P) SoC these macros are added.
> > - Dropped `renesas,r9a09g056-pinctrl.h` header file.
> > - Followed DTS coding style guidelines
> > - Dropped defconfig changes from the series.
> > - Dropped SDHI dt-binding patch as its already applied to mmc -next tre=
e.
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (12):
> >   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and
> >     EVK
> >   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
> >   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
> >   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
> >   dt-bindings: serial: renesas: Document RZ/V2N SCIF
> >   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
> >   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part numbe=
r
> >   clk: renesas: rzv2h: Add support for RZ/V2N SoC
> >   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
> >   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
> >   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
> >   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
> >
> Would it be OK if I send version 3 containing only patches 4/12 and 10/12=
?

For patch 4/12: yes, that is fine. Thx!
For patch 10/12: I have already applied it.

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

