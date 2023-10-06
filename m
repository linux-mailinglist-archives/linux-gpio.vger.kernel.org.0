Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7597BB190
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 08:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjJFGdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 02:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjJFGdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 02:33:18 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFB0E4
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 23:33:14 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b29186e20aso306311266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 23:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696573992; x=1697178792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8RMbkoBZtKLh6/moqLHyxfRLIqAHbaRWfawzyYGFmg=;
        b=CpVaTP7W4WtLq96fmg2QRwzReypsBWrNu31UV5tEv72CY+nlwRi+tYw+kSWjsIgvyh
         fmNYQXxiAqTEsYM8zum4upO8YYhOgnMpPoXJcQ6pnQLQPi5mwiEieNBo+EVOJgh5AECS
         5DzTVHh4BCFVSWUPcux7KxUZwVFWI4OqGDICNfjyu8zTif27J3vUF9+ybcNDroaKePTj
         IU0Obs0SHOX066ASgvGt/OnsCcr/klX88Q6l8nezUuZddS/habp9SR8fwmjo8RopbEvT
         MCW3kMye9WQ4ENB4UXkjD3Licl+kD0KhQrgjps9qlz/kCZNOHtcy1irP+lfVTwlnwbxa
         HB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696573992; x=1697178792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8RMbkoBZtKLh6/moqLHyxfRLIqAHbaRWfawzyYGFmg=;
        b=atuGkjGrP4BvUukbMsDLpXJq9wYwYueHLVBbDBtpTO4X2itsC1AcjlItsr0AwVRpvm
         He6AoVYmLxIe1iW9WykJAajLrrT5EW2pB+SOZvpL8lhow0i7f17Ga556J/9AzSAxYNvB
         jaR4IhG5qS8tSVto+ddIEmNxQoUFa+ntKTqslB2GtE5/pWfbvTiDjA/Xt8WSyKXphbsy
         1WbDAPXHRs2Ay4KCwEAXer4rhz+YHNsU7JM49bdskOSFcHaCVMrdQIgEBfGQOHMnOEz8
         LySzwgBEJD3k/KNf0pNlNGjcPLu4DL8Op0OJhAgLGgHt6merXN0wP/spemnD7VKX0fBV
         kXwQ==
X-Gm-Message-State: AOJu0YwqVKViSFzcZemoovyECi54W8MmxAa0a1kDdbTTDQXPR+/kVlnO
        Vked2hzq3+X4vc0aD0JuCk7Z5w==
X-Google-Smtp-Source: AGHT+IErhfO8sLtXvJF1eMX1qKHFz4gjc/fNYuWgLcW4VMIGWoVS3J8uUs5PAZ+4rcKj5MnbjDqs8g==
X-Received: by 2002:a17:907:762f:b0:9ae:5898:e278 with SMTP id jy15-20020a170907762f00b009ae5898e278mr6684692ejc.59.1696573992118;
        Thu, 05 Oct 2023 23:33:12 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id w19-20020a170906481300b009b9720a85e5sm2323170ejq.38.2023.10.05.23.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 23:33:11 -0700 (PDT)
Message-ID: <0e09665b-9595-49f7-ba21-0cf360c650cb@linaro.org>
Date:   Fri, 6 Oct 2023 08:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] pinctrl: samsung: Add gs101 SoC pinctrl
 configuration
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
 <20231005155618.700312-17-peter.griffin@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231005155618.700312-17-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/10/2023 17:56, Peter Griffin wrote:
> Add support for the pin-controller found on the gs101
> SoC used in Pixel 6 phones.
> 
> The alive blocks on this SoC also have a filter selection
> register. Add support for this so the digital or delay filter
> can be selected. If the filter selection is not available
> then the default filter (digital) is applied.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |  68 +++++++-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  44 +++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   4 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |  24 +++
>  5 files changed, 302 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index cb965cf93705..ae681725db26 100644
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
> +static struct samsung_pin_bank_type bank_type_6  = {

Bank types are defined at the top. "type_6" is way too vague. Look how
the others are named.

> +	.fld_width = { 4, 1, 4, 4, 2, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> +};
> +
> +/*
> + * bank type for alive type
> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
> + */
> +static const struct samsung_pin_bank_type bank_type_7 = {

Same problem.

> +	.fld_width = { 4, 1, 4, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> +};
> +
> +/* pin banks of gs101 pin-controller (ALIVE) */
> +static const struct samsung_pin_bank_data gs101_pin_alive[] = {
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x0, "gpa0", 0x00, 0x00, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 7, 0x20, "gpa1", 0x04, 0x08, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 5, 0x40, "gpa2", 0x08, 0x10, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x60, "gpa3", 0x0c, 0x18, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x80, "gpa4", 0x10, 0x1c, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 7, 0xa0, "gpa5", 0x14, 0x20, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0xc0, "gpa9", 0x18, 0x28, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 2, 0xe0, "gpa10", 0x1c, 0x30, FLT_SELECTABLE),
> +};
> +
> +/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> +static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x0, "gpa6", 0x00, 0x00, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x20, "gpa7", 0x04, 0x08, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x40, "gpa8", 0x08, 0x0c, FLT_SELECTABLE),
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 2, 0x60, "gpa11", 0x0c, 0x14, FLT_SELECTABLE),
> +};
> +
> +/* pin banks of gs101 pin-controller (GSACORE) */
> +static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x0, "gps0", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x20, "gps1", 0x04, 0x04, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 3, 0x40, "gps2", 0x08, 0x0c, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (GSACTRL) */
> +static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
> +	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 6, 0x0, "gps3", 0x00, 0x00, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (PERIC0) */
> +static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 5, 0x0, "gpp0", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x20, "gpp1", 0x04, 0x08, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x40, "gpp2", 0x08, 0x0c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x60, "gpp3", 0x0c, 0x10, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x80, "gpp4", 0x10, 0x14, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0xa0, "gpp5", 0x14, 0x18, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xc0, "gpp6", 0x18, 0x1c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0xe0, "gpp7", 0x1c, 0x20, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x100, "gpp8", 0x20, 0x24, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x120, "gpp9", 0x24, 0x28, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x140, "gpp10", 0x28, 0x2c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x160, "gpp11", 0x2c, 0x30, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x180, "gpp12", 0x30, 0x34, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x1a0, "gpp13", 0x34, 0x38, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x1c0, "gpp14", 0x38, 0x3c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x1e0, "gpp15", 0x3c, 0x40, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x200, "gpp16", 0x40, 0x44, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x220, "gpp17", 0x44, 0x48, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x240, "gpp18", 0x48, 0x4c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x260, "gpp19", 0x4c, 0x50, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (PERIC1) */
> +static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x0, "gpp20", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x20, "gpp21", 0x04, 0x08, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x40, "gpp22", 0x08, 0x0c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x60, "gpp23", 0x0c, 0x10, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x80, "gpp24", 0x10, 0x18, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xa0, "gpp25", 0x14, 0x1c, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 5, 0xc0, "gpp26", 0x18, 0x20, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xe0, "gpp27", 0x1c, 0x28, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (HSI1) */
> +static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x0, "gph0", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 7, 0x20, "gph1", 0x04, 0x08, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (HSI2) */
> +static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x0, "gph2", 0x00, 0x00, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x20, "gph3", 0x04, 0x08, FLT_DEFAULT),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x40, "gph4", 0x08, 0x0c, FLT_DEFAULT),
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
> index a8212fc126bf..0c6c3312abb7 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -269,6 +269,50 @@ struct exynos_eint_gpio_save {
>  	u32 eint_mask;
>  };

Please split the patch into two: one of adding new filter code and
second for new Google SoC.

>  
> +static void exynos_eint_flt_config(int sel, int width,
> +				   struct samsung_pinctrl_drv_data *d,
> +				   struct samsung_pin_bank *bank)

Arguments: first drv_data, then bank, then width, then sel... and what
is sel actually?

Also, why do you need width if it is always 0? Will it be different in
next pinctrl controllers? So the filter is per entire bank?

> +{
> +	unsigned int flt_reg, flt_con = 0;
> +	unsigned int val, shift;
> +	int i;
> +	int loop_cnt;
> +
> +	flt_con |= EXYNOS_FLTCON_EN;
> +
> +	if (sel)
> +		flt_con |= EXYNOS_FLTCON_SEL_DIGITAL;
> +
> +	flt_con |= EXYNOS_FLTCON_WIDTH(width);

This is always 0, what's the point?

> +
> +	flt_reg = EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> +
> +	if (bank->nr_pins > EXYNOS_FLTCON_NR_PIN)
> +		/*
> +		 * if nr_pins > 4, we should set FLTCON0 register fully.
> +		 * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> +		 */
> +		loop_cnt = 4;
> +	else
> +		loop_cnt = bank->nr_pins;

Please document the layout of the registers in exynos_eint_flt_config()
comment (not kerneldoc). Also document what do you want to achieve here
- set entire bank to one filter for the suspend/resume?

> +
> +	val = readl(d->virt_base + flt_reg);
> +
> +	for (i = 0; i < loop_cnt; i++) {
> +		shift = i * EXYNOS_FLTCON_LEN;
> +		val &= ~(EXYNOS_FLTCON_MASK << shift);
> +		val |= (flt_con << shift);
> +	}
> +
> +	writel(val, d->virt_base + flt_reg);
> +

Missing /*

> +	/* if nr_pins > 4, we should also set FLTCON1 register like FLTCON0.
> +	 * (pin4 ~ )
> +	 */
> +	if (bank->nr_pins > EXYNOS_FLTCON_NR_PIN)
> +		writel(val, d->virt_base + flt_reg + 0x4);
> +}
> +
>  /*
>   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
>   * @d: driver data of samsung pinctrl driver.
> @@ -321,6 +365,10 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
>  			goto err_domains;
>  		}
>  
> +		/* Set Delay Analog Filter */
> +		if (bank->fltcon_type != FLT_DEFAULT)
> +			exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DELAY,
> +					       0, d, bank);
>  	}
>  
>  	return 0;
> @@ -555,6 +603,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  		if (bank->eint_type != EINT_TYPE_WKUP)
>  			continue;
>  
> +		/* Set Digital Filter */
> +		if (bank->fltcon_type != FLT_DEFAULT)
> +			exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DIGITAL,
> +					       0, d, bank);
> +
>  		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
>  					      GFP_KERNEL);
>  		if (!bank->irq_chip) {
> @@ -658,6 +711,7 @@ static void exynos_pinctrl_suspend_bank(
>  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  {
>  	struct samsung_pin_bank *bank = drvdata->pin_banks;
> +	struct samsung_pinctrl_drv_data *d = bank->drvdata;
>  	struct exynos_irq_chip *irq_chip = NULL;
>  	int i;
>  
> @@ -665,6 +719,10 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  		if (bank->eint_type == EINT_TYPE_GPIO)
>  			exynos_pinctrl_suspend_bank(drvdata, bank);
>  		else if (bank->eint_type == EINT_TYPE_WKUP) {
> +			/* Setting Delay (Analog) Filter */
> +			if (bank->fltcon_type != FLT_DEFAULT)
> +				exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DELAY,
> +						       0, d, bank);
>  			if (!irq_chip) {
>  				irq_chip = bank->irq_chip;
>  				irq_chip->set_eint_wakeup_mask(drvdata,
> @@ -707,11 +765,19 @@ static void exynos_pinctrl_resume_bank(
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
> +				exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DIGITAL,
> +						       0, d, bank);
> +		}
>  }
>  
>  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> index 7bd6d82c9f36..aafd8f9f52f8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -16,6 +16,8 @@
>  #ifndef __PINCTRL_SAMSUNG_EXYNOS_H
>  #define __PINCTRL_SAMSUNG_EXYNOS_H
>  
> +#include <linux/bitfield.h>
> +

I don't think you use in this header anything from bitfield.

>  /* Values for the pin CON register */
>  #define EXYNOS_PIN_CON_FUNC_EINT	0xf
>  
> @@ -50,6 +52,14 @@
>  
>  #define EXYNOS_EINT_MAX_PER_BANK	8
>  #define EXYNOS_EINT_NR_WKUP_EINT
> +/* EINT filter configuration */
> +#define EXYNOS_FLTCON_EN		BIT(7)

EXYNOS9? Earlier variants did not have it, AFAIR.

> +#define EXYNOS_FLTCON_SEL_DIGITAL	BIT(6)
> +#define EXYNOS_FLTCON_SEL_DELAY		0
> +#define EXYNOS_FLTCON_WIDTH(x)		((x) & 0x3f)
> +#define EXYNOS_FLTCON_MASK		0xFF

Keep lowercase hex

> +#define EXYNOS_FLTCON_LEN		8
> +#define EXYNOS_FLTCON_NR_PIN		4
>  
>  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
>  	{						\
> @@ -140,6 +150,40 @@
>  		.name		= id				\
>  	}
Best regards,
Krzysztof

