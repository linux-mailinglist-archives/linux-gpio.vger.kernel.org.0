Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54AD87BA866
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 19:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjJERqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 13:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjJERp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 13:45:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92B59E
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 10:45:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a9f139cd94so217233266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696527922; x=1697132722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGUUS+KuIC/R/OpZVR0+PCbOqzTbMUm5ZvPC9hwTTM8=;
        b=fRQIVIUUkGiCySLyqSeMUKeH/XLhawcmGYISB3f/tOCbmSWxjP4pNrrbjn96L0PnZ7
         LDzsJ6KggvjTLMqtFKD/pb+CjYgmaLPHqpZe6RamSOkVykTgKgcYVK52382IrfIYxmQc
         sidYF718Lz3unAqd0kPzx3Ca8Xgsdi9Hfwg/zk6KgDNABkluc4441a683eyN6qfd15aa
         JQmvETthU5S//Ww0zfExyfCuLkZyhnE6rECVQeuC8pitebVO7+ZcEEgFb/H3tYsKVsYQ
         uxUCkZG/yAG5J+nU+doszcrRz7d6vAMJnlgDAngMT9j8xfQ3cH0EJGm2RggoVl/YPlXo
         e1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527922; x=1697132722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGUUS+KuIC/R/OpZVR0+PCbOqzTbMUm5ZvPC9hwTTM8=;
        b=btWdtMu7aPZ9KBK8cRCBQAobQPMg6oE4qQsdy4YUbn96g1BEGoVWO4dwWxk1nxTxsh
         K11em3Y+uxUr5+8A49n/xHtmWICMsQI9+pDrGSNtPYEHfqY9dgy6oFaFK86t68CjQu4i
         UbZTxGeIG8Dz46vn596TzytdZaC4V2y7JJj+dGzkIe/33NRTgzCzAcCef3e8ggU5/Sk2
         bNwHx2mE+k7CmFFQ6TwTVWjGYlGlvCwNp6oZNvA0DdS+pqmGzhzYOQEnQ3uuriNUn3f1
         IO5LT3hy3gcMs97+T+dC01rFqNBokA7V168GGZMKI3gfx1vIugoqdviqugV9sA5tfd/g
         0j1A==
X-Gm-Message-State: AOJu0YzYn16JQ1UZzzXoeShWaQErZTR31y+w2UoQnBXUWgclvFNuP42F
        YGTSDnpBKZpdl9rii+p3U/OPMA==
X-Google-Smtp-Source: AGHT+IHTP2r2FCskCMVq1LAM76doZetevDtu/KDcESulLmSZgnERHOgMWZQ28BM1DejOmc5Glp+E1A==
X-Received: by 2002:a17:907:2cef:b0:9ae:3d17:d5d0 with SMTP id hz15-20020a1709072cef00b009ae3d17d5d0mr4976166ejc.31.1696527922220;
        Thu, 05 Oct 2023 10:45:22 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906190600b009ad89697c86sm1523634eje.144.2023.10.05.10.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 10:45:21 -0700 (PDT)
Message-ID: <a690edeb-47fc-4525-aa63-1b1524462d91@linaro.org>
Date:   Thu, 5 Oct 2023 19:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-14-peter.griffin@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231005155618.700312-14-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/10/2023 17:56, Peter Griffin wrote:
> CMU_TOP is the top level clock management unit which contains PLLs, muxes
> and gates that feed the other clock management units.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/Kconfig     |    9 +
>  drivers/clk/samsung/Makefile    |    1 +
>  drivers/clk/samsung/clk-gs101.c | 1558 +++++++++++++++++++++++++++++++
>  3 files changed, 1568 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-gs101.c
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 76a494e95027..4c8f173c4dec 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
>  	select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
>  	select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
>  	select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> +	select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR

Let's put it before Tesla. There's not much order, but maybe one day we
will fix it.

>  
>  config S3C64XX_COMMON_CLK
>  	bool "Samsung S3C64xx clock controller support" if COMPILE_TEST
> @@ -102,3 +103,11 @@ config TESLA_FSD_COMMON_CLK
>  	help
>  	  Support for the clock controller present on the Tesla FSD SoC.
>  	  Choose Y here only if you build for this SoC.
> +
> +config GOOGLE_GS101_COMMON_CLK

Let's put it before Tesla.

> +	bool "Google gs101 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	depends on EXYNOS_ARM64_COMMON_CLK
> +	help
> +	  Support for the clock controller present on the Google gs101 SoC.
> +	  Choose Y here only if you build for this SoC.
> \ No newline at end of file

Missing newline

> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index ebbeacabe88f..1e69b8e14324 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -24,3 +24,4 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
>  obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
>  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
> +obj-$(CONFIG_GOOGLE_GS101_COMMON_CLK)	+= clk-gs101.o


Before S3C64xx

> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> new file mode 100644
> index 000000000000..4c58fcc899be
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -0,0 +1,1558 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Common Clock Framework support for GS101.
> + */
> +

...

> +	/* PERI1 */
> +	GATE(CLK_GOUT_PERIC1_BUS, "gout_cmu_peric1_bus", "mout_cmu_peric1_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_PERIC1_IP, "gout_cmu_peric1_ip", "mout_cmu_peric1_ip",
> +	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP, 21, 0, 0),
> +
> +	/* TPU */
> +	GATE(CLK_GOUT_TPU_TPU, "gout_cmu_tpu_tpu", "mout_cmu_tpu_tpu",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPU, 21, 0, 0),
> +	GATE(CLK_GOUT_TPU_TPUCTL, "gout_cmu_tpu_tpuctl", "mout_cmu_tpu_tpuctl",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL, 21, 0, 0),
> +	GATE(CLK_GOUT_TPU_BUS, "gout_cmu_tpu_bus", "mout_cmu_tpu_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_TPU_UART, "gout_cmu_tpu_uart", "mout_cmu_tpu_uart",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_UART, 21, 0, 0),
> +
> +	/* BO */
> +	GATE(CLK_GOUT_BO_BUS, "gout_cmu_bo_bus", "mout_cmu_bo_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_BO_BUS, 21, 0, 0),
> +

stray blank line

Best regards,
Krzysztof

