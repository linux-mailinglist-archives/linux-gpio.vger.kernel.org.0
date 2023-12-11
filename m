Return-Path: <linux-gpio+bounces-1250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3FD80D285
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755691F21892
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375E9487A8;
	Mon, 11 Dec 2023 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDgwPGeu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D692A6128;
	Mon, 11 Dec 2023 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB72C43395;
	Mon, 11 Dec 2023 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702312983;
	bh=O42VfB6B/NKT45YG7/w+tzHV+vFk/9ubv9SFczzG5L0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YDgwPGeue5DBU6BcGt8oAMWNp2wU0ujmkYoY5HoVVqcv0hphcrNSDbI1E48AbdsdX
	 FJchg2BAjmX8HT/GBLQOKBNLWUCChP0fxRtsmLNoqGpy4hKuo5beQ1TEBlr65CmiMX
	 R2HK47cTKoJEVFw6DSRm6en8DzIOqLJFrrPMsyejWaEqrOnkHxljf4/WBrrQPjpSu5
	 iz+Zp1LFVIS5X4AQliUoSx/0P8UIXSKDLdU1caNc8vlDAzllZ19so7ob4lTOIa5U+K
	 TOU/av5PLIxQsFcB23MnJefK1GdwqKeB1jkrJe+jKnSsOt7IJ3mvGV/0nKfkKkaxSx
	 PJjYPLIyTAZkA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so6129224e87.1;
        Mon, 11 Dec 2023 08:43:03 -0800 (PST)
X-Gm-Message-State: AOJu0Yyqj2jN4i60rkh+PLbJIyJveIfeF5x3tparC614v0ft25uqZ4Cg
	f8aNlG+8bpO+iWQXvB2o/9xrZlDN8B8tEqr9rQ==
X-Google-Smtp-Source: AGHT+IE+BuXwI7UD9Kku6Z+7AFIfpY5y8FXvZ7fPoyMcKoLOwdUc9Eno1NvK829t1ShWBDdZ9wMmEuPLOErAklj5W88=
X-Received: by 2002:a05:6512:ad5:b0:50d:1eb3:7bfd with SMTP id
 n21-20020a0565120ad500b0050d1eb37bfdmr1914116lfu.13.1702312981546; Mon, 11
 Dec 2023 08:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-9-peter.griffin@linaro.org>
In-Reply-To: <20231211162331.435900-9-peter.griffin@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Dec 2023 10:42:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ_NUajmQs8ZYiE2GpvNxBwtkLRE2jvWDU3hKtztt92Ug@mail.gmail.com>
Message-ID: <CAL_JsqJ_NUajmQs8ZYiE2GpvNxBwtkLRE2jvWDU3hKtztt92Ug@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: Peter Griffin <peter.griffin@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:24=E2=80=AFAM Peter Griffin <peter.griffin@linar=
o.org> wrote:
>
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/Makefile    |    1 +
>  drivers/clk/samsung/clk-gs101.c | 2512 +++++++++++++++++++++++++++++++
>  2 files changed, 2513 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-gs101.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index ebbeacabe88f..3056944a5a54 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) +=3D clk-exynos7.=
o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos7885.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos850.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynosautov9.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-gs101.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)       +=3D clk-s3c64xx.o
>  obj-$(CONFIG_S5PV210_COMMON_CLK)       +=3D clk-s5pv210.o clk-s5pv210-au=
dss.o
>  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)     +=3D clk-fsd.o
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> new file mode 100644
> index 000000000000..05361fce3c6f
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -0,0 +1,2512 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Common Clock Framework support for GS101.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

You probably don't need this header. Please check.

> +#include <linux/platform_device.h>

