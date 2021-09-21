Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B799C412F5C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 09:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhIUH3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 03:29:14 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32908
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230129AbhIUH3N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 03:29:13 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1A44F3FE01
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632209265;
        bh=i7xVOY9cswgNsb9rWd2OfLK5tguMPWFz/JQqL1RwXvg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=AgJl9KCOrfjxEYR9IExFDwkbVGoeNochyMesGk5jn9AFZG/Csv10yzqGPTdCM++cY
         oLhM4xgd2tWQUMCC1JGbi5ZYogHufqt06DwFj2Ol5k256uaD9bur/tTI8g4q7LKZM2
         DTz+XlrQWfyBiHQmumW/PxLv7BSHm+JcvEeUgKGdhkoDnHYEJTrpLXw6mW+KUBPQcI
         qgTPPuZ3TQZYHmbb/iPdKj7bcZ8c9HUeveISmlZ+SQOCP7TU1INYfhfo2N+FAEgxHl
         1bbDV9RUWoQl9vkYBqNjfIOhjuAuUGErUM0QcZAz5UGjb0kYv8QngH4g7XJYEraZ8i
         FPnWPEKsf8i4A==
Received: by mail-wr1-f71.google.com with SMTP id m18-20020adfe952000000b0015b0aa32fd6so8047975wrn.12
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 00:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i7xVOY9cswgNsb9rWd2OfLK5tguMPWFz/JQqL1RwXvg=;
        b=3nVnkvCPMbc/gDO4/ZLtJD7dBVdytlnxBoCHZUwshbAc3NnJ5tqHeP0TnZscNHpr0B
         1vu9fu3j5tJ02A9Kw/qrEOLy0j0RUwmmBSPqhW+Ufbab4G+N/dOrkwhbt3E5guEZ7Zxu
         UWza9NBRIMh+Xn6AmB6TakiJ6TnVeS5y3fF8XeWqKL1+kSHYaCIZ3hQtwmGAp9/6Nbzh
         NFoKIpeULcZYKo2nutRu06lwRJkwEhfVfOfe1bReorfs7OzUyop4ez7lFH2izPg5iJk6
         4UDqijQDsZYQqQUCFA0g0qAEd2wzONz5Tt6gOUqcdUNpak3coLv8kLhqrPCnZv5dG/1j
         mEQg==
X-Gm-Message-State: AOAM530UTQR8kL4wLGQbLwp+ETDXXxlWITs7NCfmmA34sVYdPhc4CQJy
        AP1hGOtj1xnK/W+erBwwKeNeXx+OadfcFMmjnU1TSA12CVu8bS8k71hGesdwD0POUvUfKkYGN8Z
        WF5ikgscvC36btj5IQG5OtYcQobMtmxv8LTBEClk=
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr33312234wrr.371.1632209264349;
        Tue, 21 Sep 2021 00:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzil+vY8RVd7ISnKg7wzJr13+3UggzlkbmenwjowhYp7j04/Gvh/nntwfWnHjrLAQD5yVbfiQ==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr33312212wrr.371.1632209264162;
        Tue, 21 Sep 2021 00:27:44 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id c14sm12634040wrd.50.2021.09.21.00.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:27:43 -0700 (PDT)
Subject: Re: [PATCH v1 3/4] pinctrl: samsung: change PINCTRL_EXYNOS default
 config logic
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-4-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e178ae7b-6956-94f5-535b-067e1915c5fb@canonical.com>
Date:   Tue, 21 Sep 2021 09:27:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920190350.3860821-4-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/09/2021 21:03, Will McVicker wrote:
> Switching the default config logic of PINCTRL_EXYNOS to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select the config.
> This gives vendors the flexibility to disable the config or modularize
> it in the presence of a generic kernel.

Reasoning is incorrect. This is an essential driver which CANNOT be
disabled for any kernel having ARCH_EXYNOS or ARCH_S5PV210. You are
trying to prepare it for some out-of-tree code? Please, upstream your
code instead.

> 
> Verified this change doesn't effect the .config.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms    | 1 -
>  drivers/pinctrl/samsung/Kconfig | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6a006490c9b9..a884e5da8b0f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -93,7 +93,6 @@ config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
> -	select PINCTRL_EXYNOS
>  	select PM_GENERIC_DOMAINS if PM
>  	help
>  	  This enables support for ARMv8 based Samsung Exynos SoC family.
> diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
> index dfd805e76862..483acb8ac1f6 100644
> --- a/drivers/pinctrl/samsung/Kconfig
> +++ b/drivers/pinctrl/samsung/Kconfig
> @@ -12,6 +12,7 @@ config PINCTRL_EXYNOS
>  	bool "Pinctrl common driver part for Samsung Exynos SoCs"
>  	depends on OF_GPIO
>  	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
> +	default y if ARCH_EXYNOS

default ARCH_EXYNOS || ARCH_S5PV210
... and update all mach Kconfigs.

>  	select PINCTRL_SAMSUNG
>  	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
>  	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
> 


Best regards,
Krzysztof
