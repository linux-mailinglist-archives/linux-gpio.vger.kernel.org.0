Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4F97C5F7F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 23:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbjJKVwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 17:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbjJKVwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 17:52:14 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631AEDA
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 14:52:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c9b70b9671so27145ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061130; x=1697665930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PmcXQ0mdd2fjr08gUutFL5TrBrbl9n8zgazyjOunRA=;
        b=fcdI+qpSBR6pmaQCXolsXSkAWkNvmE45RhvX1ATtKm1xP6kt37soc1o+ahIHDNB8sC
         T9Tg41/zLQ0HhvtA829I34GaLpmA7l+kHVkpMcmN8t2BUMlPL24g1Mif1i4qgHhkCv+i
         iV+Qlbw9ZLWjvLRiu7K3jRMFpuejYhvPIhEs/C4vVf5xzHUd8CShpG0twxDZBAGD66SO
         OQuKHIK41pIe4x9lDPDn5/B0T6vujjQuVJHZbHqphFT2HWP/05+SqkVgLYEUYsENFfSH
         HbJXX368l5ci7t43Xuf2gLZq5A0Tx66eyxWZt5RDxniUuiG0ZtlYlg+YhW8cmkdKkA09
         B49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061130; x=1697665930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PmcXQ0mdd2fjr08gUutFL5TrBrbl9n8zgazyjOunRA=;
        b=ZZFvGvWcOHkClEZP6EQZnDtsmdf59dGUS0QCsubUE86iezqmksWMWgp8OTGoybpZMy
         2h9pNsQ79LPaAYHjc2RzkrLM66sImLqTuasafTgs7GZwda/Lww4LRG5Ex9Lruwzardkh
         +xcsqLVrgJd+AKEEv5BWGdQ3Mw/e2LWjE3O2fG6lVduIYwk6BnQNIGd8qGqt10mbELZs
         1o+0jYkR0U9z6kMUj829TLTEP8NP0xZLTEsFLIoWNSQOBsOcFZ2iy/JdQ2dIeBt0W4qs
         1VrU7UTz3Z0Nsbb9M4dNmotNAJ0xq+lW/qDaf1+IaiQ7z4Q+2ReoSqA1tFgcpc6nOE4p
         PYkA==
X-Gm-Message-State: AOJu0YyUPaPiv+FsF1IX4Lxc3K1jtAn9RtEANk81WvGCWay0FXjUow8B
        zFkD5HVHAWnEmzSdPS1tLK+yPA==
X-Google-Smtp-Source: AGHT+IGe013CnVnmhJmp+zhSawUy8VO5ZSj0A2/Kukg+lVArKQgWW9d0Gmq7bxgllBE09dqzGlmtOA==
X-Received: by 2002:a17:902:f9d0:b0:1bd:b75a:e95f with SMTP id kz16-20020a170902f9d000b001bdb75ae95fmr362993plb.0.1697061130035;
        Wed, 11 Oct 2023 14:52:10 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id c5-20020a6566c5000000b0058988954686sm263715pgw.90.2023.10.11.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:52:08 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:52:05 -0700
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
Subject: Re: [PATCH v3 14/20] pinctrl: samsung: Add gs101 SoC pinctrl
 configuration
Message-ID: <ZScZBbFmLUdhE1hD@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-15-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-15-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  5 files changed, 202 insertions(+)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index cb965cf93705..db47001d1b35 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -796,3 +796,166 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
>  	.ctrl		= fsd_pin_ctrl,
>  	.num_ctrl	= ARRAY_SIZE(fsd_pin_ctrl),
>  };
> +
> +/*
> + * bank type for non-alive type
> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
> + * (CONPDN bit field: 2, PUDPDN bit field: 4)
> + */
> +static struct samsung_pin_bank_type gs101_bank_type_off  = {
> +	.fld_width = { 4, 1, 4, 4, 2, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> +};
> +
> +/*
> + * bank type for alive type
> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
> + */
> +static const struct samsung_pin_bank_type gs101_bank_type_alive = {
> +	.fld_width = { 4, 1, 4, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> +};
> +
> +/* pin banks of gs101 pin-controller (ALIVE) */
> +static const struct samsung_pin_bank_data gs101_pin_alive[] = {
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa0", 0x00, 0x00, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0x20, "gpa1", 0x04, 0x08, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 5, 0x40, "gpa2", 0x08, 0x10, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x60, "gpa3", 0x0c, 0x18, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x80, "gpa4", 0x10, 0x1c, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0xa0, "gpa5", 0x14, 0x20, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0xc0, "gpa9", 0x18, 0x28, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0xe0, "gpa10", 0x1c, 0x30, FLT_SELECTABLE),
> +};
> +
> +/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> +static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa6", 0x00, 0x00, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x20, "gpa7", 0x04, 0x08, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x40, "gpa8", 0x08, 0x0c, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0x60, "gpa11", 0x0c, 0x14, FLT_SELECTABLE),
> +};
> +
> +/* pin banks of gs101 pin-controller (GSACORE) */
> +static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x0, "gps0", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x20, "gps1", 0x04, 0x04, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 3, 0x40, "gps2", 0x08, 0x0c, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (GSACTRL) */
> +static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
> +	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 6, 0x0, "gps3", 0x00, 0x00, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (PERIC0) */
> +static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0x0, "gpp0", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp1", 0x04, 0x08, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x40, "gpp2", 0x08, 0x0c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x60, "gpp3", 0x0c, 0x10, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp4", 0x10, 0x14, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xa0, "gpp5", 0x14, 0x18, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xc0, "gpp6", 0x18, 0x1c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xe0, "gpp7", 0x1c, 0x20, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x100, "gpp8", 0x20, 0x24, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x120, "gpp9", 0x24, 0x28, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x140, "gpp10", 0x28, 0x2c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x160, "gpp11", 0x2c, 0x30, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x180, "gpp12", 0x30, 0x34, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1a0, "gpp13", 0x34, 0x38, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x1c0, "gpp14", 0x38, 0x3c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1e0, "gpp15", 0x3c, 0x40, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x200, "gpp16", 0x40, 0x44, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x220, "gpp17", 0x44, 0x48, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x240, "gpp18", 0x48, 0x4c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x260, "gpp19", 0x4c, 0x50, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (PERIC1) */
> +static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x0, "gpp20", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp21", 0x04, 0x08, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x40, "gpp22", 0x08, 0x0c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x60, "gpp23", 0x0c, 0x10, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp24", 0x10, 0x18, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xa0, "gpp25", 0x14, 0x1c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0xc0, "gpp26", 0x18, 0x20, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xe0, "gpp27", 0x1c, 0x28, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (HSI1) */
> +static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph0", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 7, 0x20, "gph1", 0x04, 0x08, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (HSI2) */
> +static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph2", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x20, "gph3", 0x04, 0x08, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x40, "gph4", 0x08, 0x0c, FLT_DEFAULT),
> +};
> +
> +static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
> +	{
> +		/* pin banks of gs101 pin-controller (ALIVE) */
> +		.pin_banks	= gs101_pin_alive,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume		= exynos_pinctrl_resume,
> +	}, {
> +		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> +		.pin_banks	= gs101_pin_far_alive,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume		= exynos_pinctrl_resume,
> +	}, {
> +		/* pin banks of gs101 pin-controller (GSACORE) */
> +		.pin_banks	= gs101_pin_gsacore,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +	}, {
> +		/* pin banks of gs101 pin-controller (GSACTRL) */
> +		.pin_banks	= gs101_pin_gsactrl,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +	}, {
> +		/* pin banks of gs101 pin-controller (PERIC0) */
> +		.pin_banks	= gs101_pin_peric0,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume		= exynos_pinctrl_resume,
> +	}, {
> +		/* pin banks of gs101 pin-controller (PERIC1) */
> +		.pin_banks	= gs101_pin_peric1,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume	= exynos_pinctrl_resume,
> +	}, {
> +		/* pin banks of gs101 pin-controller (HSI1) */
> +		.pin_banks	= gs101_pin_hsi1,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume		= exynos_pinctrl_resume,
> +	}, {
> +		/* pin banks of gs101 pin-controller (HSI2) */
> +		.pin_banks	= gs101_pin_hsi2,
> +		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume		= exynos_pinctrl_resume,
> +	},
> +};
> +
> +const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
> +	.ctrl		= gs101_pin_ctrl,
> +	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
> +};
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 800831aa8357..014f0c37f97f 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -533,6 +533,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
>  			.data = &exynos7_wkup_irq_chip },
>  	{ .compatible = "samsung,exynosautov9-wakeup-eint",
>  			.data = &exynos7_wkup_irq_chip },
> +	{ .compatible = "google,gs101-wakeup-eint",
> +			.data = &exynos7_wkup_irq_chip },
>  	{ }
>  };
>  
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> index 63b2426ad5d6..0dd013654bd2 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -147,6 +147,40 @@
>  		.name		= id				\
>  	}
>  
> +#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)	\
> +	{						\
> +		.type		= &types,		\
> +		.pctl_offset	= reg,			\
> +		.nr_pins	= pins,			\
> +		.eint_type	= EINT_TYPE_NONE,	\
> +		.fltcon_type	= FLT_DEFAULT		\
> +		.name		= id			\
> +	}
> +
> +#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs, fltcontype) \
> +	{						\
> +		.type		= &types,		\
> +		.pctl_offset	= reg,			\
> +		.nr_pins	= pins,			\
> +		.eint_type	= EINT_TYPE_GPIO,	\
> +		.eint_offset	= offs,			\
> +		.fltcon_type    = fltcontype,		\
> +		.fltcon_offset	= fltcon_offs,		\
> +		.name		= id			\
> +	}
> +
> +#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs, fltcontype) \
> +	{						\
> +		.type		= &types,		\
> +		.pctl_offset	= reg,			\
> +		.nr_pins	= pins,			\
> +		.eint_type	= EINT_TYPE_WKUP,	\
> +		.eint_offset	= offs,			\
> +		.fltcon_type    = fltcontype,		\
> +		.fltcon_offset	= fltcon_offs,		\
> +		.name		= id			\
> +	}
> +
>  /**
>   * struct exynos_weint_data: irq specific data for all the wakeup interrupts
>   * generated by the external wakeup interrupt controller.
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 449f8109d8b5..12176f98440d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>  		.data = &exynosautov9_of_data },
>  	{ .compatible = "tesla,fsd-pinctrl",
>  		.data = &fsd_of_data },
> +	{ .compatible = "google,gs101-pinctrl",
> +		.data = &gs101_of_data },
>  #endif
>  #ifdef CONFIG_PINCTRL_S3C64XX
>  	{ .compatible = "samsung,s3c64xx-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index de2ca8e8b378..e62e909fb10d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -374,6 +374,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
>  extern const struct samsung_pinctrl_of_match_data fsd_of_data;
> +extern const struct samsung_pinctrl_of_match_data gs101_of_data;
>  extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
>  extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
>  extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
> -- 
> 2.42.0.655.g421f12c284-goog
> 
