Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7FD7C5F75
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 23:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbjJKVvv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 17:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjJKVvu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 17:51:50 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3170FB8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 14:51:47 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c9c496c114so62055ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061106; x=1697665906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngLrXwvzasmdchuZORLCcP38eeKpKp2Fz7K6CP3sPLY=;
        b=blEByIQHL8zd2tAtJLbQAzfcSCPus2kMvYzr7EwkM6eEURE1Yjq0ZiuY/ITJQ6WMxi
         o6/c2t0ILADSmmD9AZE/cwnENPCecdLM0GkMmRQC3SIr4byFAKDyFz6SUQjAxaqDSHs5
         ydqm4ShvrKpe8mPcKrkRSe9ycQeAXEUssAuPdDEis3fJW0fsz7z71eL+lVo0N/vle8De
         Ya+7HPKtZ2LI7Uk6Lbg0LccdiIWu1YjR0LF5yY5k5Xq3RI9xzZAYKmfevgv2ooVZxNXR
         UrVn3Av75t13MgBtE9Ppoqq6hNvIB/zWSQnNoN+ZdFJ+QEruXyiyQdDXfWg+cKUvBBg5
         MPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061106; x=1697665906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngLrXwvzasmdchuZORLCcP38eeKpKp2Fz7K6CP3sPLY=;
        b=lnvcRGt1BgMn9FsYHOZTGvygTT9KyzV84pRyEZZNX0SXFHTz2m2i18scMSl+AFuzGh
         ANM33qw259Ntuzsr8mkLRK6x9SmPGflsOxqGGo44Kf7GQg4M+Ah57gJ4soZHNcndRost
         d5lF1tHCg33R46ZrwMtBnHTM1QyMPO7p9fUjaogyzHeyF7Rx+Eh718Ss+KnVKvj543gh
         1YNu4DxTraOK0lbrDO3ZKJaslwv/Jm1surfJ/8b436rcZVHBijci0WWlSbZlLTqx0h0K
         5moFo+YSogL9Val5Mwno8QmlhQeK7iah7eJog8pLslmf7Kr7S8G7o2ZH7y2HdyUOn4rs
         Z4zQ==
X-Gm-Message-State: AOJu0YwtFYzegi1GjlI6G5SwE0eJffCBnUCuDnErlBj+3sp5d/s0UpN9
        i4I7aJdHzU8J3Wplqp9IXudr6A==
X-Google-Smtp-Source: AGHT+IFyLe0GaSxVbPktGGGZC98+u29zCMvEK0th1YfbJntP3v3UqwrWwQTMmt1hDnxPWIA3Rn2Z5w==
X-Received: by 2002:a17:903:32c2:b0:1b9:d96c:bca7 with SMTP id i2-20020a17090332c200b001b9d96cbca7mr307804plr.25.1697061106407;
        Wed, 11 Oct 2023 14:51:46 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b00692b6fe1c7asm10854495pfm.179.2023.10.11.14.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:51:45 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:51:42 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 13/20] pinctrl: samsung: Add filter selection support
 for alive banks
Message-ID: <ZScY7skr3XParYJL@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-14-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-14-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> Newer Exynos SoCs have a filter selection register on alive bank pins.
> This allows the selection of a digital or delay filter for each pin. If
> the filter selection register is not available then the default filter
> (digital) is applied.
> 
> On suspend we apply the analog filter to all pins in the bank, and on
> resume the digital filter is reapplied to all pins in the bank.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c  | 82 ++++++++++++++++++++++-
>  drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
>  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h | 23 +++++++
>  4 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index a8212fc126bf..800831aa8357 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -269,6 +269,68 @@ struct exynos_eint_gpio_save {
>  	u32 eint_mask;
>  };
>  
> +static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
> +				   struct samsung_pin_bank *bank, int filter)
> +{
> +	unsigned int flt_reg, flt_con = 0;
> +	unsigned int val, shift;
> +	int i;
> +	int loop_cnt;
> +
> +	/*
> +	 * This function sets the desired filter (digital or delay) to
> +	 * every pin in the bank. Note the filter selection bitfield is
> +	 * only found on alive banks. The FLTCON register has the
> +	 * following layout
> +	 *
> +	 * BitfieldName[PinNum][Bit:Bit]
> +	 *
> +	 * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> +	 * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> +	 * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> +	 * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> +	 */
> +
> +	flt_con |= EXYNOS9_FLTCON_EN;
> +
> +	if (filter)
> +		flt_con |= EXYNOS9_FLTCON_SEL_DIGITAL;
> +
> +	flt_reg = EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> +
> +	if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
> +		/*
> +		 * if nr_pins > 4, we should set FLTCON0 register fully.
> +		 * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> +		 */
> +		loop_cnt = EXYNOS9_FLTCON_NR_PIN;
> +	else
> +		loop_cnt = bank->nr_pins;
> +
> +	val = readl(d->virt_base + flt_reg);
> +
> +	for (i = 0; i < loop_cnt; i++) {
> +		shift = i * EXYNOS9_FLTCON_LEN;
> +		val &= ~(EXYNOS9_FLTCON_MASK << shift);
> +		val |= (flt_con << shift);
> +	}
> +
> +	writel(val, d->virt_base + flt_reg);
> +
> +	/* loop for FLTCON1 pin 4 ~ 7 */
> +	if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
> +		val = readl(d->virt_base + flt_reg + 0x4);
> +		loop_cnt = (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
> +
> +		for (i = 0; i < loop_cnt; i++) {
> +			shift = i * EXYNOS9_FLTCON_LEN;
> +			val &= ~(EXYNOS9_FLTCON_MASK << shift);
> +			val |= (flt_con << shift);
> +		}
> +		writel(val, d->virt_base + flt_reg + 0x4);
> +	}
> +}
> +
>  /*
>   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
>   * @d: driver data of samsung pinctrl driver.
> @@ -321,6 +383,9 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
>  			goto err_domains;
>  		}
>  
> +		/* Set Delay Analog Filter */
> +		if (bank->fltcon_type != FLT_DEFAULT)
> +			exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_SEL_DELAY);
>  	}
>  
>  	return 0;
> @@ -555,6 +620,10 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  		if (bank->eint_type != EINT_TYPE_WKUP)
>  			continue;
>  
> +		/* Set Digital Filter */
> +		if (bank->fltcon_type != FLT_DEFAULT)
> +			exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_SEL_DIGITAL);
> +
>  		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
>  					      GFP_KERNEL);
>  		if (!bank->irq_chip) {
> @@ -658,6 +727,7 @@ static void exynos_pinctrl_suspend_bank(
>  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  {
>  	struct samsung_pin_bank *bank = drvdata->pin_banks;
> +	struct samsung_pinctrl_drv_data *d = bank->drvdata;
>  	struct exynos_irq_chip *irq_chip = NULL;
>  	int i;
>  
> @@ -665,6 +735,9 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  		if (bank->eint_type == EINT_TYPE_GPIO)
>  			exynos_pinctrl_suspend_bank(drvdata, bank);
>  		else if (bank->eint_type == EINT_TYPE_WKUP) {
> +			/* Setting Delay (Analog) Filter */
> +			if (bank->fltcon_type != FLT_DEFAULT)
> +				exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_SEL_DELAY);
>  			if (!irq_chip) {
>  				irq_chip = bank->irq_chip;
>  				irq_chip->set_eint_wakeup_mask(drvdata,
> @@ -707,11 +780,18 @@ static void exynos_pinctrl_resume_bank(
>  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
>  {
>  	struct samsung_pin_bank *bank = drvdata->pin_banks;
> +	struct samsung_pinctrl_drv_data *d = bank->drvdata;
>  	int i;
>  
>  	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
> -		if (bank->eint_type == EINT_TYPE_GPIO)
> +		if (bank->eint_type == EINT_TYPE_GPIO) {
>  			exynos_pinctrl_resume_bank(drvdata, bank);
> +		} else if (bank->eint_type == EINT_TYPE_WKUP ||
> +			bank->eint_type == EINT_TYPE_WKUP_MUX) {
> +			/* Set Digital Filter */
> +			if (bank->fltcon_type != FLT_DEFAULT)
> +				exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_SEL_DIGITAL);
> +		}
>  }
>  
>  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> index 7bd6d82c9f36..63b2426ad5d6 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -50,6 +50,13 @@
>  
>  #define EXYNOS_EINT_MAX_PER_BANK	8
>  #define EXYNOS_EINT_NR_WKUP_EINT
> +/* EINT filter configuration */
> +#define EXYNOS9_FLTCON_EN		BIT(7)
> +#define EXYNOS9_FLTCON_SEL_DIGITAL	BIT(6)
> +#define EXYNOS9_FLTCON_SEL_DELAY	0
> +#define EXYNOS9_FLTCON_MASK		0xff
> +#define EXYNOS9_FLTCON_LEN		8
> +#define EXYNOS9_FLTCON_NR_PIN		4
>  
>  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
>  	{						\
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index e54847040b4a..449f8109d8b5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1104,6 +1104,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
>  		bank->eint_func = bdata->eint_func;
>  		bank->eint_type = bdata->eint_type;
>  		bank->eint_mask = bdata->eint_mask;
> +		bank->fltcon_type = bdata->fltcon_type;
> +		bank->fltcon_offset = bdata->fltcon_offset;
>  		bank->eint_offset = bdata->eint_offset;
>  		bank->name = bdata->name;
>  
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 9af93e3d8d9f..de2ca8e8b378 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -82,6 +82,21 @@ enum eint_type {
>  	EINT_TYPE_WKUP_MUX,
>  };
>  
> +/**
> + * enum fltcon_type - filter selection
> + * @FLT_DEFAULT: filter not selectable, default digital filter
> + * @FLT_SELECT: filter selectable (digital or delay)
> + *
> + * Some banks on some SoCs (gs101 and possibly others) have a selectable
> + * filter on alive banks of 'delay/analog' or 'digital'. If the filter
> + * selection is not available then the default filter is used (digital).
> + */
> +
> +enum fltcon_type {
> +	FLT_DEFAULT,
> +	FLT_SELECTABLE,
> +};
> +
>  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
>  #define PIN_NAME_LENGTH	10
>  
> @@ -122,6 +137,8 @@ struct samsung_pin_bank_type {
>   * @eint_type: type of the external interrupt supported by the bank.
>   * @eint_mask: bit mask of pins which support EINT function.
>   * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
> + * @fltcon_type: whether the filter (delay/digital) is selectable
> + * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
>   * @name: name to be prefixed for each pin in this pin bank.
>   */
>  struct samsung_pin_bank_data {
> @@ -133,6 +150,8 @@ struct samsung_pin_bank_data {
>  	enum eint_type	eint_type;
>  	u32		eint_mask;
>  	u32		eint_offset;
> +	enum fltcon_type fltcon_type;
> +	u32		fltcon_offset;
>  	const char	*name;
>  };
>  
> @@ -147,6 +166,8 @@ struct samsung_pin_bank_data {
>   * @eint_type: type of the external interrupt supported by the bank.
>   * @eint_mask: bit mask of pins which support EINT function.
>   * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
> + * @fltcon_type: whether the filter (delay/digital) is selectable
> + * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
>   * @name: name to be prefixed for each pin in this pin bank.
>   * @pin_base: starting pin number of the bank.
>   * @soc_priv: per-bank private data for SoC-specific code.
> @@ -169,6 +190,8 @@ struct samsung_pin_bank {
>  	enum eint_type	eint_type;
>  	u32		eint_mask;
>  	u32		eint_offset;
> +	enum fltcon_type fltcon_type;
> +	u32		fltcon_offset;
>  	const char	*name;
>  
>  	u32		pin_base;
> -- 
> 2.42.0.655.g421f12c284-goog
> 
