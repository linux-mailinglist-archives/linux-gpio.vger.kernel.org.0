Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC097C5EFC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 23:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbjJKVUX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 17:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbjJKVUW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 17:20:22 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435ECA9;
        Wed, 11 Oct 2023 14:20:17 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-49d6bd3610cso91837e0c.1;
        Wed, 11 Oct 2023 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697059216; x=1697664016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhywIaYgyHV+8Wb5qCLR80dSpBUwcZQjWfKFyAdOsWk=;
        b=D/uYOCSk3o1jmPbAF3QxBmDIPiE/x1gGZmF4VSiEc2s3aVm5baEPWd5moJb4vrLa0i
         y0cDvghbyZ18EX+s4dWetBwkvepPZxDX68cHUgJ1g5iF3NEGy1qGJGdiFzuvT6uHT/rK
         wdCYPI+XSI7aq5VDdTKjFhgB0r6Y71lWZ/InuszicyO0hoixti9bbJOyYfxsK3UcAhZ9
         vWLojzy5cekhiwW1suRciUMPA258iFzKT/wLIHamQhNt7Vt2/kBCVP0CbDPcntZ6GOyp
         7ggCsd1mJXMzva2uvUXETdIK581lXRslM8umgeuVO5LUg5inZiwQbJchq0Jrg7t9q2BH
         mclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697059216; x=1697664016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhywIaYgyHV+8Wb5qCLR80dSpBUwcZQjWfKFyAdOsWk=;
        b=thAejaKR7CWNw8rO2TbHbX2ZmHRcEESqCu9aw4N5hVEbquX0LdE29vLTDkEDmPzAAl
         SL9Exo2oAcnHZB/LXiGN6/5ThpzG0xI324RTPG1HqoNFK+s/ZQrJsVEXHWdMoD6B9zmb
         RQbuE9xQC2k+mUrD9wkKFZDqSbe/3ARQmaf5yP+DX057o5/J4ov9/Bn95weLzNs10jba
         XTjfV+NS4I6vHdK/rMI4jKdDoeOXN64ti+m2FlwlpsL0Yn0wGoWBueoRKnUbxbWSF9Ha
         fmhWMxWybhLDyJpxQAv2mn+NS0/raBwGBcBoGQCumG5MP6r3af6v8jx1XWk4oOH/Ennb
         +HsQ==
X-Gm-Message-State: AOJu0YxtnjwTpTEJboasI/XILzzMeNREqxWzP2DkEw6mNDP05k8y2fzX
        apH8zyQx4etBhRjc16Rg0L0=
X-Google-Smtp-Source: AGHT+IGftkULkb6AubRC6ZgI5xrsnD8uhx3YRI2APpn3ekErSGeIKoj0bn8ygO/93y1FvayCBIo+jA==
X-Received: by 2002:a05:6102:34f6:b0:455:c426:1b22 with SMTP id bi22-20020a05610234f600b00455c4261b22mr21636570vsb.16.1697059216184;
        Wed, 11 Oct 2023 14:20:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l29-20020ab053dd000000b007b5ff005318sm886292uaa.17.2023.10.11.14.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:20:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Oct 2023 14:20:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
Message-ID: <36dd4a24-00a0-4901-b621-b50384b1020c@roeck-us.net>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-16-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-16-peter.griffin@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 07:48:18PM +0100, Peter Griffin wrote:
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

Sorry, I don't understand what the code is doing here.

It looks like it enables window mode unconditionally (?). If so,
what is the impact ? Does it mean that any code requesting multiple
keepalives in a row on the affected hardware will now cause an
immediate reset ? If so, what is the rationale ?

Alternatively, if it enables window mode and configures it such
that WTMINCNT is always equal or larger than WTCNT, what is the
point of enabling window mode in the first place ?

Thanks,
Guenter

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 127 ++++++++++++++++++++++++++++++---
>  1 file changed, 116 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0b4bd883ff28..36c170047180 100644
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
> @@ -51,6 +53,7 @@
>  
>  #define S3C2410_WATCHDOG_ATBOOT		(0)
>  #define S3C2410_WATCHDOG_DEFAULT_TIME	(15)
> +#define S3C2410_WINDOW_MULTIPLIER	2
>  
>  #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
> @@ -67,6 +70,13 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
>  
> +#define GS_CLUSTER0_NONCPU_OUT			0x1220
> +#define GS_CLUSTER1_NONCPU_OUT			0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
> +#define GS_RST_STAT_REG_OFFSET			0x3B44
> +
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -106,6 +116,8 @@
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
> +#define QUIRK_HAS_WTMINCNT_REG			(1 << 6)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -263,6 +275,54 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
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
> @@ -278,6 +338,10 @@ static const struct of_device_id s3c2410_wdt_match[] = {
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
> @@ -375,6 +439,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
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
> @@ -410,7 +489,7 @@ static int s3c2410wdt_stop(struct watchdog_device *wdd)
>  
>  static int s3c2410wdt_start(struct watchdog_device *wdd)
>  {
> -	unsigned long wtcon;
> +	unsigned long wtcon, wtmincnt;
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
>  	unsigned long flags;
>  
> @@ -432,6 +511,12 @@ static int s3c2410wdt_start(struct watchdog_device *wdd)
>  	dev_dbg(wdt->dev, "Starting watchdog: count=0x%08x, wtcon=%08lx\n",
>  		wdt->count, wtcon);
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG) {
> +		wtcon |= S3C2410_WTCON_WINDOWED_WD;
> +		wtmincnt = wdt->count * S3C2410_WINDOW_MULTIPLIER;
> +		writel(wtmincnt, wdt->reg_base + S3C2410_WTMINCNT);
> +	}
> +
>  	writel(wdt->count, wdt->reg_base + S3C2410_WTDAT);
>  	writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
>  	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> @@ -447,7 +532,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	unsigned long freq = s3c2410wdt_get_freq(wdt);
>  	unsigned int count;
>  	unsigned int divisor = 1;
> -	unsigned long wtcon;
> +	unsigned long wtcon, wtmincnt;
>  
>  	if (timeout < 1)
>  		return -EINVAL;
> @@ -478,6 +563,11 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	count = DIV_ROUND_UP(count, divisor);
>  	wdt->count = count;
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG) {
> +		wtmincnt = count * S3C2410_WINDOW_MULTIPLIER;
> +		writel(wtmincnt, wdt->reg_base + S3C2410_WTMINCNT);
> +	}
> +
>  	/* update the pre-scaler */
>  	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
>  	wtcon &= ~S3C2410_WTCON_PRESCALE_MASK;
> @@ -496,14 +586,20 @@ static int s3c2410wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
>  	void __iomem *wdt_base = wdt->reg_base;
> +	unsigned long wtcon;
>  
>  	/* disable watchdog, to be safe  */
>  	writel(0, wdt_base + S3C2410_WTCON);
>  
>  	/* put initial values into count and data */
> +	if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> +		writel(0x100, wdt_base + S3C2410_WTMINCNT);
>  	writel(0x80, wdt_base + S3C2410_WTCNT);
>  	writel(0x80, wdt_base + S3C2410_WTDAT);
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> +		wtcon |= S3C2410_WTCON_WINDOWED_WD;
> +
>  	/* set the watchdog to go and reset... */
>  	writel(S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV16 |
>  		S3C2410_WTCON_RSTEN | S3C2410_WTCON_PRESCALE(0x20),
> @@ -585,9 +681,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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
> @@ -600,9 +698,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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
> @@ -700,6 +803,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	s3c2410wdt_mask_dbgack(wdt, true);
> +
>  	/*
>  	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>  	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> -- 
> 2.42.0.655.g421f12c284-goog
> 
