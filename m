Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F453DBC1E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 17:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239690AbhG3PWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 11:22:55 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35420
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239617AbhG3PWy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 11:22:54 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E45723F24D
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627658568;
        bh=ZB8kRJjvGWoqH+/4j72g+qbwLJfHVt3xG+HcUqPQc2Y=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=mnWbfkfggnMvoFDHXoll0N44QKswcBawsn0tGSvUUSWvTXB1MrX36tsSwFV73dD5E
         hxINNJdFMwBrX+sTxefmZ+7HLRexQDOcwqWFBhgi15OlWCdUqni25Yg3qPbKylgCGB
         K+ZAXXHZllxwZRQjtvryiVUhK32fQGikH7LZy9V6jvd6qfsWA7OZi9c/XRjCttLUP5
         Njlkv2XFDk+31EK6g8NpxgDPfMvR+c4iRzCYog6GHSgLJz3S6vo0n7AmNH8QOa20h5
         TqBMsHyIe9JIaDIbNHT/2yIPptYFi4qrHrD8duW/eOBKXD9iKPKUHBBBt6/R/+6W28
         k8R9cpPTef4Zg==
Received: by mail-ed1-f72.google.com with SMTP id s8-20020a0564020148b02903948b71f25cso4771224edu.4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 08:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZB8kRJjvGWoqH+/4j72g+qbwLJfHVt3xG+HcUqPQc2Y=;
        b=APOZC1oULiFjKSrpOoipJ8KZpr+xZ0CM94FQ7q1/tM+NXfoPoCkfFl9kfPvLehe4hP
         Rz4ZSEP96mO1ALg1UjC0yrwTsJSSNAgl9YbxSlPm1l1I3t4Lp3KfQi7j/eaxQL39OqDN
         triU2tLg04cTc067k46/aFWI2MZR30ovafUq8qDkbtMxACL5Bt5Y/YtBf3kylJbbTmrz
         pfcBLdAwQe58hjX+b2kEReKSDAS0ePNOat/PO1A54rDjTfwk21A/LidWjQWr8sTPwT86
         UgawlDGo0JTzWBGlhGATR3b4Mhle0OXnPjBIpxzC7dd7ZHJGyLdf6bUIlkrQb20ulsWP
         YOGg==
X-Gm-Message-State: AOAM531ZByp8VfgaBqXMRkt1N0CPgNK9B/Y8c/xPu/3NH5IBIwfSwGSX
        H3z/ZuyiEdIaFjF9gtZOaui+j8TdAuI3E3lgxdVltLffCSNH/ByhP9SBKv0+VqITuSpnSWb9dI3
        HSzXv2gYMaWyEZHg0yYiyAn28xXBRx8yQWIr6rMA=
X-Received: by 2002:a17:907:216d:: with SMTP id rl13mr3086320ejb.190.1627658568585;
        Fri, 30 Jul 2021 08:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJmE2LbHYPFXopTp4l0M6WlVDaj/oAMIqaQivR3KofKuI0KNALJNNHvO7iO6MY00bQnFdV9w==
X-Received: by 2002:a17:907:216d:: with SMTP id rl13mr3086285ejb.190.1627658568399;
        Fri, 30 Jul 2021 08:22:48 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id k21sm816287edo.41.2021.07.30.08.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 08:22:47 -0700 (PDT)
Subject: Re: [PATCH 02/12] pinctrl: samsung: Add Exynos850 SoC specific data
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a2b6b868-e984-440c-75b1-599680537cc9@canonical.com>
Date:   Fri, 30 Jul 2021 17:22:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> Add Samsung Exynos850 SoC specific data to enable pinctrl support for
> all platforms based on Exynos850.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 129 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 ++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  4 files changed, 161 insertions(+)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index b6e56422a700..9c71ff84ba7e 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -40,6 +40,24 @@ static const struct samsung_pin_bank_type exynos5433_bank_type_alive = {
>  	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
>  };
>  
> +/*
> + * Bank type for non-alive type. Bit fields:
> + * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
> + */
> +static struct samsung_pin_bank_type exynos850_bank_type_off  = {
> +	.fld_width = { 4, 1, 4, 4, 2, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> +};
> +
> +/*
> + * Bank type for alive type. Bit fields:
> + * CON: 4, DAT: 1, PUD: 4, DRV: 4
> + */
> +static struct samsung_pin_bank_type exynos850_bank_type_alive = {
> +	.fld_width = { 4, 1, 4, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> +};
> +
>  /* Pad retention control code for accessing PMU regmap */
>  static atomic_t exynos_shared_retention_refcnt;
>  
> @@ -422,3 +440,114 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
>  	.ctrl		= exynos7_pin_ctrl,
>  	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
>  };
> +
> +/* pin banks of exynos850 pin-controller 0 (ALIVE) */
> +static struct samsung_pin_bank_data exynos850_pin_banks0[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),

Why EXYNOS9 not EXYNOS850? Is it really shared with 96xx, 98xx and 9x0
series?

> +	EXYNOS9_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> +	EXYNOS9_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
> +	EXYNOS9_PIN_BANK_EINTN(3, 0x0A0, "gpq0"),
> +};
> +
> +/* pin banks of exynos850 pin-controller 1 (CMGP) */
> +static struct samsung_pin_bank_data exynos850_pin_banks1[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
> +};
> +
> +/* pin banks of exynos850 pin-controller 2 (AUD) */
> +static struct samsung_pin_bank_data exynos850_pin_banks2[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
> +};
> +
> +/* pin banks of exynos850 pin-controller 3 (HSI) */
> +static struct samsung_pin_bank_data exynos850_pin_banks3[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
> +};
> +
> +/* pin banks of exynos850 pin-controller 4 (CORE) */
> +static struct samsung_pin_bank_data exynos850_pin_banks4[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
> +};
> +
> +/* pin banks of exynos850 pin-controller 5 (PERI) */
> +static struct samsung_pin_bank_data exynos850_pin_banks5[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
> +	EXYNOS9_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
> +	EXYNOS9_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0C),
> +	EXYNOS9_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
> +	EXYNOS9_PIN_BANK_EINTG(8, 0x0A0, "gpg2", 0x14),
> +	EXYNOS9_PIN_BANK_EINTG(1, 0x0C0, "gpg3", 0x18),
> +	EXYNOS9_PIN_BANK_EINTG(3, 0x0E0, "gpc0", 0x1C),
> +	EXYNOS9_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
> +};
> +
> +static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks	= exynos850_pin_banks0,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks0),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.suspend	= exynos_pinctrl_suspend,
> +		.resume		= exynos_pinctrl_resume,

I guess retention registers will follow sometime later.

Best regards,
Krzysztof
