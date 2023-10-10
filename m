Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF187C45B9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 01:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344207AbjJJX4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 19:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjJJX4Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 19:56:16 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC5B8F;
        Tue, 10 Oct 2023 16:56:14 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49dd647a477so2257687e0c.3;
        Tue, 10 Oct 2023 16:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696982174; x=1697586974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81q6JGyTrQkoGOoIsyVbwevzEO/VUyof31ZjWP977mU=;
        b=Fk4NUQe7bpnBvb9wO5Kp0SVXIBxYSWD+uBc6PV+oRiz5pQNIoCKAr1CC1qeQAnzlSu
         KWL6tgxbRZYikjtObicvYRWaqXfL5ppLXLxXCgDLx8EJAuijLaCdpytVG+jgFzN69umY
         8+S2ZqCy2cubyEA5gY0E3AneTVtCkOBUjiS4QOOuOEszi14zMm9aFzQs+9TtnRB3yACg
         iqAvLNHAGKB0zLTwiSWBVbqcfGKWWG0/MDSfeIJpAV8MWQkcDRCN1Tb92XkkYiH9loKm
         ukYFHTiaIsS1wF+7igQjR6lCA0UzQdfqFgu2R9y9ju27U25gvd8cKBF+PFHtBANZ+FhX
         MYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982174; x=1697586974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81q6JGyTrQkoGOoIsyVbwevzEO/VUyof31ZjWP977mU=;
        b=t2C1qmsrlnVbWM5uBpSZF/nVXOMxsbb6MnZD9cIV4zhmdU5hjTylZPJfHYNbOlbHMC
         Wu6rFqLTjHYbJ28Niz7LA7cxfe0QPTBLnvJW898aT+ZcJOKmLUGF808YGTIM2yWZhJQH
         dCkl1N0WL8CCgSB2Ad+qfBJ6FD/TM+I/QIoS+JtF81B6Nr4KPPiuVCMRZFETOgFGsD59
         uZ/BoQTTg5x0d2mT1Kwr3lpij6Iu241O5iQyVdyx3S8R/GrFiauzqdKHurr2adkruvnS
         dceqZ/Xuy+dWmCMyOhDNtMTnl7Vr8QxZ1URBfEsyQ+NbJBPXOpE1W8Aog6Yxj/wraRCU
         73eg==
X-Gm-Message-State: AOJu0YxAOWnlU4Lz5wlq2AF1fitlNCmFo4ztaiBJZ85Idf2M89siTAIL
        ae4J6WZo5Ldc1/Mcy+TA3Yc=
X-Google-Smtp-Source: AGHT+IFxOSIstbwDUhScD3UnbX41CGxXoQr7rYjO1d7eEYKArjvWODITwh3Sfy4A8h03bKu8fyHOiQ==
X-Received: by 2002:a1f:ca83:0:b0:49d:d91:8b27 with SMTP id a125-20020a1fca83000000b0049d0d918b27mr15458605vkg.2.1696982173711;
        Tue, 10 Oct 2023 16:56:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 10-20020ac5ce8a000000b0049a5b8d475csm2305003vke.34.2023.10.10.16.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:56:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Oct 2023 16:56:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
Message-ID: <e2320e90-5e3b-4b50-8af9-56dee639d022@roeck-us.net>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-16-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-16-peter.griffin@linaro.org>
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

On Tue, Oct 10, 2023 at 11:49:23PM +0100, Peter Griffin wrote:
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

I am a bit lost with this one. The patch adds QUIRK_HAS_WTMINCNT_REG
but doesn't use it. It also adds S3C2410_WTMINCNT but does not use it
either.

What is the point of doing that ? It is just confusing.

Guenter

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 104 ++++++++++++++++++++++++++++++---
>  1 file changed, 95 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0b4bd883ff28..08a775c01c57 100644
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
> @@ -67,6 +69,12 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
>  
> +#define GS_CLUSTER0_NONCPU_OUT			0x1220
> +#define GS_CLUSTER1_NONCPU_OUT			0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
> +#define GS_RST_STAT_REG_OFFSET			0x3B44
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -106,6 +114,8 @@
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
> +#define QUIRK_HAS_WTMINCNT_REG			(1 << 6)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -263,6 +273,54 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
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
> @@ -278,6 +336,10 @@ static const struct of_device_id s3c2410_wdt_match[] = {
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
> @@ -375,6 +437,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
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
> @@ -585,9 +662,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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
> @@ -600,9 +679,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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
> @@ -700,6 +784,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	s3c2410wdt_mask_dbgack(wdt, true);
> +
>  	/*
>  	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>  	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> -- 
> 2.42.0.609.gbb76f46606-goog
> 
