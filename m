Return-Path: <linux-gpio+bounces-21664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C158ADB2B9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 15:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE22A168CE1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBC82877E0;
	Mon, 16 Jun 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8ULzQPh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D9D2877C3;
	Mon, 16 Jun 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082260; cv=none; b=F1v1Cll742yvFFip+XH5C0iGMHCit0Ritlozu9y8MA8mBB/e3utJuFjsVXuDDL5Ph80PFb0vL81JIesVtApONqlgUru8L8Tmb0rIzb3xnLbxAXVcI3WfGbFBDqmykk5zJw8AVI0t/JyRx393IxMnTA2RCemeGZX3gvguPURhv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082260; c=relaxed/simple;
	bh=NyizBTDfDWXK6sw8uHD082UVWglR8ES2/VkYsuwaR4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sm4rxNXAhttsOerwuPaZ8lu5cwfImgC5dxr6MpwHpMbHeI1EOaOeVqKeLCSlMoNcRv/sjLoo9YJcYxyVK+1qkn0Stp9xIUipPdS0y78P5ghlcgHAt17pkQXUMo+7JtEb75R9JhOvN+BoKGU8D6C5Tsqq37+7RTgRnZGZTnfF6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8ULzQPh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30632C4CEF5;
	Mon, 16 Jun 2025 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750082260;
	bh=NyizBTDfDWXK6sw8uHD082UVWglR8ES2/VkYsuwaR4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8ULzQPh/xdtTiMfI3eihUsGI91soNyJ6AwSVhjKDO4IOJN3V4MbJf8Fy4Hjq/oPp
	 2Nz2B/U4yIFMJwmnbkUKrRHPQlmnGxkQzpjpiCeObGnKgdgWNzsVdGM/wnAIfKzp77
	 OsClgdjfqK9hC7ntKJziHbTNlOcBTkzZtkxBTl+MoNrw4Prth4u5dv8z+GPcY3x8+Z
	 U2k1ZLAOc0Hf27lZEchtd7fnehD5vtVw0ubzu82UT3OAUYvJ2sHBVW6ZPHM2SMa5/b
	 3BkA+Ysg02RQ/8M/W2p7dGMiij+LRkAAw0f9T5daEgcrGL2oTSRbJk3qI+xDTglt9P
	 Rxa8e8y8zLkiw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad89ee255easo836057666b.3;
        Mon, 16 Jun 2025 06:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSMzq7zjG0+pq767/j8rNRPoNC3p3dbsKCBBq5/iwKc36CQCJ4NftP82wnfaR5bzqXkHJA9VB5I4pr@vger.kernel.org, AJvYcCVuOgM4yom8JPJYbOg2SN3VRtAXK9gFJuZn7zUZr7nuPDf2DRJy9PoGNw6fHc92by+RUmWSYZeGi1QePTbn@vger.kernel.org, AJvYcCVwanjuhQLiqdYS85HR6yv3NYS26HDXK4/fieeR/FNdiF86OkhijwETWnHHizckFkgne70tT6udkF3EqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkxk/QZJsXJZRYXUDt1a4D99+DaGSxK6kva1x80WqFvt/st52U
	C8HlnQW2PJrUsnKqmJEiW+NSDabqMuZQwR5qPN3zdB5S0gEjCWgElbYkkIj3nCmqPKSqVfVyYi7
	85EWE2tbmZjl3nSfIl8Ds4zc5p7oMSQ==
X-Google-Smtp-Source: AGHT+IHpdF6x/V/pazyqhO2sJpaXwkib8ZBd2w1M4Ij3Nkk6Wn/WfgezoqePwqWHQsTrHmBU64Y1n8FFZazVHIrz33o=
X-Received: by 2002:a17:907:7241:b0:ad2:3f9a:649f with SMTP id
 a640c23a62f3a-adfad60d405mr821849566b.42.1750082258737; Mon, 16 Jun 2025
 06:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Jun 2025 08:57:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpb7wFw3DqX504LyS2PGbQxQfbBKh9VfCY8j7G9YKXiw@mail.gmail.com>
X-Gm-Features: AX0GCFuQPys5Thxu-nqBA43dpX9szemYIEtdKd5xHzL7MleeMvIzogZHZdn5g7w
Message-ID: <CAL_JsqJpb7wFw3DqX504LyS2PGbQxQfbBKh9VfCY8j7G9YKXiw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
To: Harshit Shah <hshah@axiado.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 11:32=E2=80=AFPM Harshit Shah <hshah@axiado.com> wr=
ote:
>
> Add initial device tree support for the AX3000 SoC and its evaluation
> platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
> Secure Vault, AI Engine and Firewall.
>
> This commit adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
> controllers on the AX3000 evaluation board.
>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  arch/arm64/boot/dts/Makefile              |   1 +
>  arch/arm64/boot/dts/axiado/Makefile       |   2 +
>  arch/arm64/boot/dts/axiado/ax3000.dtsi    | 584 ++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/axiado/ax3000_evk.dts |  72 ++++
>  4 files changed, 659 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 79b73a21ddc22b17308554e502f8207392935b45..47dd8a1a7960d179ee28969a1=
d6750bfa0d73da1 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -9,6 +9,7 @@ subdir-y +=3D amlogic
>  subdir-y +=3D apm
>  subdir-y +=3D apple
>  subdir-y +=3D arm
> +subdir-y +=3D axiado
>  subdir-y +=3D bitmain
>  subdir-y +=3D blaize
>  subdir-y +=3D broadcom
> diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/ax=
iado/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb5e08ba0f39c32cdbfd586d9=
82849a80da30160
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_AXIADO) +=3D ax3000_evk.dtb
> diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts=
/axiado/ax3000.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d5d84986d18efe9dfbb446cee=
e42fc4e4dbf95d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
> @@ -0,0 +1,584 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rig=
hts reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/memreserve/ 0x3c0013a0 0x00000008;    /* cpu-release-addr */
> +/ {
> +       compatible =3D "axiado,ax3000";

Drop. As this is not valid and overridden anyways.

> +       interrupt-parent =3D <&gic500>;
> +
> +       aliases {
> +               i3c0 =3D &i3c0;
> +               i3c1 =3D &i3c1;
> +               i3c2 =3D &i3c2;
> +               i3c3 =3D &i3c3;
> +               i3c4 =3D &i3c4;
> +               i3c5 =3D &i3c5;
> +               i3c6 =3D &i3c6;
> +               i3c7 =3D &i3c7;
> +               i3c8 =3D &i3c8;
> +               i3c9 =3D &i3c9;
> +               i3c10 =3D &i3c10;
> +               i3c11 =3D &i3c11;
> +               i3c12 =3D &i3c12;
> +               i3c13 =3D &i3c13;
> +               i3c14 =3D &i3c14;
> +               i3c15 =3D &i3c15;
> +               i3c16 =3D &i3c16;
> +               serial0 =3D &uart0;
> +               serial1 =3D &uart1;
> +               serial2 =3D &uart2;
> +               serial3 =3D &uart3;
> +       };
> +
> +       cpus {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x0>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               cpu1: cpu@1 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x1>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               cpu2: cpu@2 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x2>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               cpu3: cpu@3 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x3>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               l2: l2-cache0 {
> +                       compatible =3D "cache";
> +                       cache-size =3D <0x100000>;
> +                       cache-unified;
> +                       cache-line-size =3D <64>;
> +                       cache-sets =3D <1024>;
> +                       cache-level =3D <2>;
> +               };
> +       };
> +
> +       timer:timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupt-parent =3D <&gic500>;
> +               interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +               arm,cpu-registers-not-fw-configured;

Drop. Not valid for arm64. And new platforms should fix the firmware anyway=
s.

Rob

