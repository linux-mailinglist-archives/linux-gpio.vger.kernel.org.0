Return-Path: <linux-gpio+bounces-16006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7BA35C81
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 12:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B884F7A5A17
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EC42627E5;
	Fri, 14 Feb 2025 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoKtpO4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B325A657
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532396; cv=none; b=NPTN8CQ4R0KptP+9MQGQNF/BPAjvmmu5a8RCwviykWDyQANlR9QWLAIqgabEDx2do2o9UYJkUBf5CU6xJMPQT9FjyTcZISDPr57n57cTsr3GNTzgjHX1sUCXjB34Qgn6Yya8U/XVJMkXN0JiiOIqqcIYiwiZzD4vzSGkYS4XDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532396; c=relaxed/simple;
	bh=ioKZ2MvhUw4Q0y9IwBXxm/cxgOWwwIiAjPD8x7s0DKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSneGixvwAuUPOgtFQFOnqTiiJqqlZqrmtsVrMolYRROA1VLP4yNfLbLicK2fwiazjRRc7a6SN68Bk8ignEGFc8Pg+MtCrkd/rGMnyrtwrBSpilw3aDDUfBSDWnGGhzExaWpvjoD5HA4jtOiNYunzlHS6SwEOsWWIsVTW5T8h2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoKtpO4r; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f9c6d147edso18199597b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532392; x=1740137192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0lFTwfZZcUWkq9fJmOvcld23qYjy5biwQLrQr9JB8A=;
        b=MoKtpO4rNvIBgN6jGqtGzj7n/zSy2m2444NFRZFxYQKpXDx/xxfRVNIaVHLFLKmB+6
         eEQ+U9k1Ol5/DcpidBPpSOAn8Thq9MKB+xgTEDNB+xOBLz3ovGjf9p+JA4IkE8XWhfhT
         Am9cR7N6YafEzsE7bdSdDgiWrPQZZJFMvgdvkek0SrNT8PXXf7KMsuPUJvjjjwn8yoc7
         WlL/6dfFiH406HOucQcd2MVPHLesXW8N3sKtkOUn4ZKec8FbK89qANOX4uXedYNEuLR3
         wGvdG8E9082DML2TCmjvskFemH3XxEp1wH1Ya8A10O592Ui/0T++tWl+LlHKn8EACZLs
         OMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532392; x=1740137192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0lFTwfZZcUWkq9fJmOvcld23qYjy5biwQLrQr9JB8A=;
        b=d2vf7ZWfNnSpVd2aUT/fzA/OLOnMrp2Pixs19MVnAFKii9JwNcNdKyiZaELNZxzx0U
         K4bJWIGEAjURk1m751yvXfFdzaG3thIMpQFUMZxa1MKpH0ZV+rS3pqX/MlJMMYj8xM2Y
         RrdgtKWUBELgLj+qBmob1scxOBBpz+b489TP8E91lgIoadWPZWTFFAtNlE1vPsBa9JyD
         SnyWdJEENOnHR5sgqiLpUBvrN+UoYDdkhaiA1DZVW+bFRQ0r/naEln+zfKeNrwf8b5pv
         OS7Nkhm8NFb39SCzyOUuVihB4tJB6rhxkeq3w1W+Po0lLO9pU3hTGw17EKRoz/xSHe3k
         mu1A==
X-Forwarded-Encrypted: i=1; AJvYcCX3SVtTmKqMjSI/kZGvc0SPv3wraD4E2YetCEzKlf04w/0TFcHwTTAgY9V2vKq8szpg6qrECWLHRsTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhU5bncXG8B508Q0fNhctayBod3JSeOorm5RZ7WGNVJEL/Klhr
	xFaWXoa06D5sZxZ3b7KYMETTYYHv3beOul5aAUj2N2SRx5bqXv3iKaT/voKHv2jnKKpamlUeAYC
	X2EGEOceas4fEzfdojMuhnJqs7PTC7OrfIPfeJA==
X-Gm-Gg: ASbGnctX0SjJAQfckecM63XLmg23DsydnGOV9rckrJRbZSp1s2+Y6MbKrOC04r1frUY
	jHKYQa8J8YMBdQoKUdyGG0KEvhSGu90M09YuMp6wvEB9+oICw5g999YMmPs1HV9xjKaPXNOcwdQ
	==
X-Google-Smtp-Source: AGHT+IHgAlZM0IOqZW2VzEw1FYIV10AUY+XwYeC5PGfb6gr8KMhdCaMYxrQJlkGON4FNOU8B5yXkDtD2hxcjbR8IEvM=
X-Received: by 2002:a05:6902:2b11:b0:e5b:18ff:8cf4 with SMTP id
 3f1490d57ef6-e5d9f0c85afmr10803625276.5.1739532391918; Fri, 14 Feb 2025
 03:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:25:55 +0100
X-Gm-Features: AWEUYZkzFAbsbuTJhoDDXcEDwXJNLijMk4rdL9iJXNhVee2PTovAo1vxRBOIWOQ
Message-ID: <CAPDyKFq72fqa9xOOw3m2z2ceTj18JFn42PaqxA4Ks+o9dd3FXg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Support for Allwinner V853 SoC
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 13:52, Andras Szemzo <szemzo.andras@gmail.com> wrote:
>
> V85x is a SoC from Allwinner with video encoding targeted for the field of
> IP Camera. It integrates the single CA7 core, and a T-Head E907 RISC-V mcu.
> The SoC has the usual Allwinner peripherals and a Vivante NPU.
> V853 is a BGA package without DRAM, V851s/V851s3 has the same die with
> co-packaged 64MB/128MB DRAM (in a QFN88 package).
>
> This patchset tries to add basical support for the V853 device family.

Patch5 and patch6 applied for next via my pmdomain tree, thanks!

Note, patch5 (the DT patch) is also available on the immutable dt
branch, if soc maintainers need to pull it.

Kind regards
Uffe



>
> Changelog - v2:
>  - rebased on 6.14-rc1
>  - add a needed gate with key support to sunxi clk
>  - rewrite the ccu-r driver
>  - fix license issues
>  - remove the pinctrl binding, as it has beed applied
>  - rework the pinctrl driver, use the new sunxi dt based mux support. This new pinctrl
>    driver depends on the new sunxi device-tree based mux support patch series [1].
>  - remove the new usb phy binding, as the v853's usb phy is very close to d1/a64
>  - add a board dts
>  - ccu: add module description
>  - ccu: fix PLL enable bits, and min multipliers
>  - ccu: change PLL flags to CLK_SET_RATE_GATE
>  - ccu: use SUNXI_CCU_M_HWS at peripheral PLLs
>  - ccu: convert the VIDEO and CSI PLLs from nm type to nkmp according to BSP
>  - ccu: cpu axi clk use pointer
>  - ccu: fix comments
>  - ccu: swap i2s1 and i2s0 bus clocks
>  - ccu: fix indentation
>  - ccu: fix RST_BUS_SPIF order
>  - ccu: convert RST_RISCV_CLK_GATING from reset to gate
>
> [1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/
>
> Andras Szemzo (10):
>   clk: sunxi-ng: allow key feature in ccu reset and gate
>   pinctrl: sunxi: add driver for Allwinner V853
>   dt-bindings: clock: sunxi-ng: add compatibles for V853
>   clk: sunxi-ng: add CCU drivers for V853
>   dt-bindings: power: add V853 ppu bindings
>   pmdomain: sunxi: add V853 ppu support
>   dt-bindings: phy: allwinner: add v853 usb phy
>   phy: allwinner: add v853 usb phy compatible
>   ARM: dts: sun8i: add DTSI file for V853
>   ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s
>
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |    3 +
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |    2 +
>  .../power/allwinner,sun20i-d1-ppu.yaml        |    1 +
>  arch/arm/boot/dts/allwinner/Makefile          |    1 +
>  .../boot/dts/allwinner/sun8i-v851s-lizard.dts |  196 +++
>  arch/arm/boot/dts/allwinner/sun8i-v853.dtsi   |  656 ++++++++++
>  drivers/clk/sunxi-ng/Kconfig                  |   10 +
>  drivers/clk/sunxi-ng/Makefile                 |    4 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c       |  120 ++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h       |   14 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.c         | 1145 +++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.h         |   14 +
>  drivers/clk/sunxi-ng/ccu_common.h             |    2 +
>  drivers/clk/sunxi-ng/ccu_gate.c               |    6 +
>  drivers/clk/sunxi-ng/ccu_gate.h               |   14 +
>  drivers/clk/sunxi-ng/ccu_mux.c                |    4 +-
>  drivers/clk/sunxi-ng/ccu_reset.c              |    7 +
>  drivers/clk/sunxi-ng/ccu_reset.h              |    2 +-
>  drivers/phy/allwinner/phy-sun4i-usb.c         |   10 +
>  drivers/pinctrl/sunxi/Kconfig                 |    5 +
>  drivers/pinctrl/sunxi/Makefile                |    1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c    |   53 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |   15 +
>  .../clock/allwinner,sun8i-v853-ccu.h          |  132 ++
>  .../clock/allwinner,sun8i-v853-r-ccu.h        |   16 +
>  .../power/allwinner,sun8i-v853-ppu.h          |   10 +
>  .../reset/allwinner,sun8i-v853-ccu.h          |   60 +
>  .../reset/allwinner,sun8i-v853-r-ccu.h        |   14 +
>  28 files changed, 2513 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
>
> --
> 2.39.5
>

