Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49074FEA7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 03:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfFXBti (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 21:49:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41987 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfFXBti (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jun 2019 21:49:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so10901998lje.9;
        Sun, 23 Jun 2019 18:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Ev7chGwJ66N6SGM6sYIJrnfOjRtZkkHF4Wb2q7+Mmg=;
        b=KhYo0bbb10f7WH4V8DkD1LqdL1YzJ5Y8Ax2zSxwsqfR5cySjHpoMNlPstNsI2wJxW8
         dh1bjpze+No7sUniiQBgJVX9mN2QdjMFBTuahrDXsPOUB5PTO/xjGkzHQPzfzZGOeZ6W
         QrgWhBWQl7s65x9hdkCq9tQ6As1w3NaWIiR3jW6hW1TcM6tnUIJYMBcQFpAVSAsQ0l4Y
         6v739i70CRpB7h/bMVAx+Rnpi9YjngstsSbm9BxbPAHnmpFsfu4a0BB0aF8KDB0m5Ej7
         +kSrPiWOrBO5FqMZMEsSwXJh2rccRPp6/2XcjPkrGobRQTveD/RF8tu++IfCIKP7pVzZ
         TjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Ev7chGwJ66N6SGM6sYIJrnfOjRtZkkHF4Wb2q7+Mmg=;
        b=VT9BHh/FefFAyHhKOHq122/Zc/DNvfoIlEsJvPL8xw6S8EiBQmVZ+O5e43dE/rlQRy
         rHKXAHsLMz+mxyPXolkw5WcF9f/yHMGvwYj3nXwsamdcduI/sXGRqsah79BHN28jbdyz
         1P4HLcRfUd/T5hb+LZIQ5LzxoXOab8c4SLxYWhx0h8dWW+7JQiN/vAnHwn9Bky9Sr1ms
         wLQEYPF/33L0hlSpQrGKilZXogCPyVVmwc873z8u77OtPfKaeCZwt4wB3ymud/ynuI07
         qmX3PqmysXoC43/xohGNBaAmTmULeimSHrW59sdj9Ybp9sldMjg4ptIsVPZD+YYMfqJ/
         tALw==
X-Gm-Message-State: APjAAAWtLtlz2ntC7wVHyFNfBMpTOG/XDTnAxFCtFc5jqdzb2/vLrr1W
        8YxE3XmRwVyNCAscqYA8YWY+sLXN
X-Google-Smtp-Source: APXvYqw20zD3DekIFXVRJwEPAK+V7R2TF8NdJRkmCAiL2oKUC8HBi17BTm8Z5DkgmL36fUgnKMeCRQ==
X-Received: by 2002:a2e:6348:: with SMTP id x69mr69993103ljb.186.1561339222542;
        Sun, 23 Jun 2019 18:20:22 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id n131sm1340523lfd.70.2019.06.23.18.20.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 18:20:21 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] pinctrl: tegra: Set specific GPIO compatible
 string
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20190621151932.20662-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <12dae486-6e4a-c9e6-6879-6a2531435eba@gmail.com>
Date:   Mon, 24 Jun 2019 04:20:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621151932.20662-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.06.2019 18:19, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Rather than reuse the nvidia,tegra30-gpio compatible string to find the
> GPIO controller on Tegra30, Tegra114, Tegra124 and Tegra210, use the
> most specific compatible string for each SoC generation for consistency.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra114.c | 2 +-
>  drivers/pinctrl/tegra/pinctrl-tegra124.c | 2 +-
>  drivers/pinctrl/tegra/pinctrl-tegra210.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> index 762151f17a88..29821c03b471 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> @@ -1831,7 +1831,7 @@ static const struct tegra_pingroup tegra114_groups[] = {
>  
>  static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
>  	.ngpios = NUM_GPIOS,
> -	.gpio_compatible = "nvidia,tegra30-gpio",
> +	.gpio_compatible = "nvidia,tegra114-gpio",
>  	.pins = tegra114_pins,
>  	.npins = ARRAY_SIZE(tegra114_pins),
>  	.functions = tegra114_functions,
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> index 930c43758c92..3616d8b97c32 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> @@ -2043,7 +2043,7 @@ static const struct tegra_pingroup tegra124_groups[] = {
>  
>  static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
>  	.ngpios = NUM_GPIOS,
> -	.gpio_compatible = "nvidia,tegra30-gpio",
> +	.gpio_compatible = "nvidia,tegra124-gpio",
>  	.pins = tegra124_pins,
>  	.npins = ARRAY_SIZE(tegra124_pins),
>  	.functions = tegra124_functions,
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> index 0b56ad5c9c1c..1462023bba35 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1545,7 +1545,7 @@ static const struct tegra_pingroup tegra210_groups[] = {
>  
>  static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
>  	.ngpios = NUM_GPIOS,
> -	.gpio_compatible = "nvidia,tegra30-gpio",
> +	.gpio_compatible = "nvidia,tegra210-gpio",
>  	.pins = tegra210_pins,
>  	.npins = ARRAY_SIZE(tegra210_pins),
>  	.functions = tegra210_functions,
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
