Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06007BA99C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 20:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjJES6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 14:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjJES6o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 14:58:44 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3599F;
        Thu,  5 Oct 2023 11:58:43 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-351365e47f6so4992075ab.1;
        Thu, 05 Oct 2023 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696532322; x=1697137122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDGfCRiOqj5Z3HHraurJSyCxNUD1/PMGQpNoTkQdn4g=;
        b=R4YzguL/WPWy6YUkcwJxq0uZhGuIwOFJzLWWRscxavrMQcAJohI1SFHmPtiTmlCCeT
         RUbAjxqER861ulWsDokxnprQtMu8XtI4Cv8uRn1+ZHPd0vSomm9MbrLo1JuePu6llGdY
         nuPqunTXw5BG/b5vUXnhgznk6/lyVSrmhdf0adPMNpdAAZrMr/PBfQq1oHi5CTvVt/Oc
         mwqGyff7udlPJaZMzLafGH/8bJm0CeB8W6mmfNeNaRjfl2VJAwIj/Q/ej1ry2QdS2ODx
         o6PDv2qiCUI3kr8zbpKzz7Rkd6JRPQmZocyKg6leZwLtrIBOB2mK2xwP8wzxITv0ezHJ
         aqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696532322; x=1697137122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDGfCRiOqj5Z3HHraurJSyCxNUD1/PMGQpNoTkQdn4g=;
        b=rcUSNF3lLTQZTFCcUJjQnDIXe2bP8YFgoyXD24J/gy/sIM9duq5a1CvbA9aSEShmAt
         p4lV3mI+TNXikrRYHJ0diqMsJR39mz7m1ytsvWpqV5E1tvFTbn+duJg6FSnlsQN2SbZt
         LCzNHMiV8KXxWKdZkuitLYVgP4snqPdVkaNWQHWVZf+meeYMMiNZ6nHtUV2UKbONjBV+
         68bM/yWxKYRvRFxKvySjPOpQfoGGyncbncoNMGURgMIxm7KeqlWOv9S818cCEEHyWcxO
         WlEtdclVoxIMKYB3pCvTGQjypCIk21A+wLKLnxphvCwV9WST6Mm0krB/WkOZi/7MgJTQ
         Skag==
X-Gm-Message-State: AOJu0YzRDz9wdymnvEKTN7VG9GB6NeFaEjgdgvG9ZLligPi1lnmexecL
        Ym4+GA4uIJv98tFKg7JZMNI=
X-Google-Smtp-Source: AGHT+IH518BnH3XJmrVAOFzUNXyM2b6plwyvIDQm/MiW25fxONr6jJ0igjF7adeyGEuevyATk1JMRQ==
X-Received: by 2002:a05:6e02:1a2e:b0:351:4f0c:b95d with SMTP id g14-20020a056e021a2e00b003514f0cb95dmr7192153ile.22.1696532322151;
        Thu, 05 Oct 2023 11:58:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14-20020a02ab8e000000b004290f6c15bfsm107409jan.145.2023.10.05.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 11:58:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 5 Oct 2023 11:58:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 17/21] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
Message-ID: <734eb901-84cc-4a47-a3f6-2313273f79b2@roeck-us.net>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-18-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-18-peter.griffin@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 05, 2023 at 04:56:14PM +0100, Peter Griffin wrote:
> This patch adds the compatibles and drvdata for the Google
> gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
> to Exynos850 it has two watchdog instances, one for each cluster
> and has some control bits in PMU registers.
> 
> The watchdog IP found in gs101 SoCs also supports a few
> additional bits/features in the WTCON register which we add
> support for and an additional register detailed below.
> 
> dbgack-mask - Enables masking WDT interrupt and reset request
> according to asserted DBGACK input
> 
> windowed-mode - Enabled Windowed watchdog mode
> 
> Windowed watchdog mode also has an additional register WTMINCNT.
> If windowed watchdog is enabled and you reload WTCNT when the
> value is greater than WTMINCNT, it prompts interrupt or reset
> request as if the watchdog time has expired.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 116 +++++++++++++++++++++++++++++----
>  1 file changed, 105 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0b4bd883ff28..4c23c7e6a3f1 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -31,12 +31,14 @@
>  #define S3C2410_WTDAT		0x04
>  #define S3C2410_WTCNT		0x08
>  #define S3C2410_WTCLRINT	0x0c
> -
> +#define S3C2410_WTMINCNT	0x10
>  #define S3C2410_WTCNT_MAXCNT	0xffff
>  
> -#define S3C2410_WTCON_RSTEN	(1 << 0)
> -#define S3C2410_WTCON_INTEN	(1 << 2)
> -#define S3C2410_WTCON_ENABLE	(1 << 5)
> +#define S3C2410_WTCON_RSTEN		(1 << 0)
> +#define S3C2410_WTCON_INTEN		(1 << 2)
> +#define S3C2410_WTCON_ENABLE		(1 << 5)
> +#define S3C2410_WTCON_DBGACK_MASK	(1 << 16)
> +#define S3C2410_WTCON_WINDOWED_WD	(1 << 20)
>  
>  #define S3C2410_WTCON_DIV16	(0 << 3)
>  #define S3C2410_WTCON_DIV32	(1 << 3)
> @@ -61,12 +63,16 @@
>  #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
>  #define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
>  #define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
> -
>  #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
>  #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
> -
> +#define GS_CLUSTER0_NONCPU_OUT			0x1220
> +#define GS_CLUSTER1_NONCPU_OUT			0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
> +#define GS_RST_STAT_REG_OFFSET			0x3B44
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -106,6 +112,8 @@
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
> +#define QUIRK_HAS_WTMINCNT_REG			(1 << 6)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -263,6 +271,54 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>  
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> +	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 0,
> +	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 8,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> +	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 1,
> +	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs201_cl0 = {
> +	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 0,
> +	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 8,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs201_cl1 = {
> +	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 1,
> +	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
> @@ -278,6 +334,10 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos850_cl0 },
>  	{ .compatible = "samsung,exynosautov9-wdt",
>  	  .data = &drv_data_exynosautov9_cl0 },
> +	{ .compatible = "google,gs101-wdt",
> +	  .data = &drv_data_gs101_cl0 },
> +	{ .compatible = "google,gs201-wdt",
> +	  .data = &drv_data_gs201_cl0 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -375,6 +435,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>  	return 0;
>  }
>  
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
> +{
> +	unsigned long wtcon;
> +
> +	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +		return;
> +
> +	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
> +	if (mask)
> +		wtcon |= S3C2410_WTCON_DBGACK_MASK;
> +	else
> +		wtcon &= ~S3C2410_WTCON_DBGACK_MASK;
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> @@ -585,9 +660,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>  	}
>  
>  #ifdef CONFIG_OF
> -	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
> +	/* Choose Exynos850/ExynosAutov9/gsx01 driver data w.r.t. cluster index */
>  	if (variant == &drv_data_exynos850_cl0 ||
> -	    variant == &drv_data_exynosautov9_cl0) {
> +	    variant == &drv_data_exynosautov9_cl0 ||
> +	    variant == &drv_data_gs101_cl0 ||
> +	    variant == &drv_data_gs201_cl0) {
>  		u32 index;
>  		int err;
>  
> @@ -600,9 +677,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>  		case 0:
>  			break;
>  		case 1:
> -			variant = (variant == &drv_data_exynos850_cl0) ?
> -				&drv_data_exynos850_cl1 :
> -				&drv_data_exynosautov9_cl1;
> +			if (variant == &drv_data_exynos850_cl0)
> +				variant = &drv_data_exynos850_cl1;
> +			else if (variant == &drv_data_exynosautov9_cl0)
> +				variant = &drv_data_exynosautov9_cl1;
> +			else if (variant == &drv_data_gs101_cl0)
> +				variant = &drv_data_gs101_cl1;
> +			else if (variant == &drv_data_gs201_cl0)
> +				variant = &drv_data_gs201_cl1;
>  			break;
>  		default:
>  			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
> @@ -700,6 +782,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	s3c2410wdt_mask_dbgack(wdt, true);
> +
>  	/*
>  	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>  	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> @@ -712,6 +796,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  		s3c2410wdt_start(&wdt->wdt_device);
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
>  	} else {
> +		dev_info(dev, "stopping watchdog timer\n");

I am not inclined to accept patches adding such noise.

>  		s3c2410wdt_stop(&wdt->wdt_device);
>  	}
>  
> @@ -738,6 +823,15 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  		 (wtcon & S3C2410_WTCON_RSTEN) ? "en" : "dis",
>  		 (wtcon & S3C2410_WTCON_INTEN) ? "en" : "dis");
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT)
> +		dev_info(dev, "DBGACK %sabled\n",
> +			 (wtcon & S3C2410_WTCON_DBGACK_MASK) ? "en" : "dis");
> +
> +	if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> +		dev_info(dev, "windowed watchdog %sabled, wtmincnt=%x\n",
> +			 (wtcon & S3C2410_WTCON_WINDOWED_WD) ? "en" : "dis",
> +			 readl(wdt->reg_base + S3C2410_WTMINCNT));

... and I really don't see its value.

> +
>  	return 0;
>  }
>  
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
