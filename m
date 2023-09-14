Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC8179FB49
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 07:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbjINFs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 01:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235001AbjINFsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 01:48:55 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958ECBD
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 22:48:50 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a645e54806so73475866b.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694670529; x=1695275329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRXT1XCEH3qRW4otbnhQc+gy/aCuBaX7SCns0Y4ZdTE=;
        b=bes/oP2T4geskceEbtNYfBc6zwMWSEyJsihRkDIH3hMw5fT442+2uoDU49sJpy0hU4
         Tc+ENaEwtGKsvxvepId0FLYNUnbi0kAOSxz5K4RuBHROsNX1dszDIUFQ4LoIgnggdwki
         x7szAcStEG5ZdNK7PNsjUM80wnUrS70kZ1O58IR4gB4Zmg3fOwy9EMDdfSaoBvle62EB
         AeDBfko//ZaIY7MXF8iAsUV/yxE2e9NZ8a4T8BewG7vc0CYVtz7nalzBbkdadALIeLlP
         xQ0cq83NVPCt59BpCyYUL0NffTVsdkg/TmAFHkiHnuYBiQhUUsmPL6qQpPZYgxiAGneH
         X0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694670529; x=1695275329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRXT1XCEH3qRW4otbnhQc+gy/aCuBaX7SCns0Y4ZdTE=;
        b=q50rBdG9AVFIMmcByvhHaD0NHNATPhSxznSrbfBc8XniOpvJlmww6fRhPQvOK2Yiji
         0tfioqSztk4ZBYasg1nXTa6maDykiN4/UmObKbbPTvzUpdf2BWZGXAZdij9wMW8LFIc5
         AfbylUU6OB9HtiRUEpj9+UGJJQ7YIyzMPJlc7bN8MGiSogQZeVASmpG+DH3FWq8PX50h
         jFpn/t5sz3tQFU8SuRbWuReiBX3n2X8xqHMd/Lqa8yV2Hamh2yeZO/XNeBRiRaud6njs
         vS/G5dampMDxElw1kV2993n9ishSy9PkB2f8W+RWIGigRtZlHPj4J9X+yoDRDd7yRCa+
         uwBA==
X-Gm-Message-State: AOJu0YzdrxPemezDjgtFKHWXe0jwcGshvHap7ewwreDkwt6dZNmKBjDd
        DApnc1EJtkRYVt7JnqBLBodVug==
X-Google-Smtp-Source: AGHT+IEEeJspwL1FrNoc7MBtXOWv5bEOrTccW1kY7tJvgLHmScM7sU/kV0KfmXgiMLCIzEx0tehzaQ==
X-Received: by 2002:a17:906:21b:b0:9a6:5696:3879 with SMTP id 27-20020a170906021b00b009a656963879mr3698036ejd.65.1694670528993;
        Wed, 13 Sep 2023 22:48:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id p27-20020a17090635db00b00982d0563b11sm470000ejb.197.2023.09.13.22.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 22:48:48 -0700 (PDT)
Message-ID: <b97ff9b6-97df-2c62-1946-06cd4ac79c95@linaro.org>
Date:   Thu, 14 Sep 2023 07:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/5] gpio: vf610: add i.MX8ULP of_device_id entry
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230914-vf610-gpio-v1-0-3ed418182a6a@nxp.com>
 <20230914-vf610-gpio-v1-3-3ed418182a6a@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230914-vf610-gpio-v1-3-3ed418182a6a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/09/2023 04:20, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8ULP supports two interrupts, while i.MX7ULP supports one interrupt.
> So from hardware perspective, they are not compatible.
> 
> So add entry for i.MX8ULP.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index dbc7ba0ee72c..88f7215cdf4b 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -67,6 +67,7 @@ static const struct fsl_gpio_soc_data imx_data = {
>  static const struct of_device_id vf610_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-gpio",	.data = NULL, },
>  	{ .compatible = "fsl,imx7ulp-gpio",	.data = &imx_data, },
> +	{ .compatible = "fsl,imx8ulp-gpio",	.data = &imx_data, },

Why? It is the same as imx7. No need.

Best regards,
Krzysztof

