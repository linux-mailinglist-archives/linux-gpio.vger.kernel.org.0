Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB3A49D08
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 11:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfFRJWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 05:22:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34549 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfFRJWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 05:22:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so12374613ljg.1;
        Tue, 18 Jun 2019 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bj6yZxVmQ+jeN2n0zSwITVrYj5+/nLQG7SfalD3zogI=;
        b=eQ16AWCFu00sjtlslVWSkbveMw7s4F/0hn4j4mPekp9fz6UT3pAEK330aWKa7JkKlF
         1vWe9jReTzMWqUczxTV6rnY3rWuwkynAUjY6PyzG0fTU743FabBt7raOQ8aPjeZalrIf
         7mlv8A2AW4v4dkcuhfJ7dwneUleMx6zpwg51w+dJfxYWQNRwCn7FzsJXh3Pt32SVaxtv
         rrpXepIkEmnbdR/LeXOCKPwuWDeRBqMlxmLv0E2kTzL4dUwcSZMzO8Yd8CEraMM+iQ+m
         dM8Kk3Q7qYIwJtJ1zJcgJKi15BoK01/LAXd4k5kR7tHBhG6L3XVlunoKUUC1lu4Ylk4f
         Xzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bj6yZxVmQ+jeN2n0zSwITVrYj5+/nLQG7SfalD3zogI=;
        b=uX9gW6Z+EjhcHKD+k03DZB0NCWc0+9s2dr1Re8yBRhLw1jrYmOEocv5CbOcHO9fbQN
         uVEo+pTrorc2uw3J8WyMGtXISsdS4LhfT+zYmgwDxqhAtKmU0/iSTVIRKZP34ksQyr8W
         g5WEQFcMrZ8Utldc2DWJdwV03KQ5H34Dpk6QN9FTXOtCLc92/V2KQ8KmoU9N07qf14fX
         +OhkWaQ6qJit2rV8u1kVLjvw3LsQf7uHqWcSg3lW/QWMnLclRXGZzLkLjr/BfpFbnUfC
         8tI+J8MLtA2Rpl/SjRsDVgpCiFkpkLuDicAjMfDK1jDfzCQkTXSU6mAAGRoq0SLNlkfF
         WPkw==
X-Gm-Message-State: APjAAAUoeGug8QaohWKo9EEJxZT1nkFQNa1iiZrggUOKpyP4dcOUnfIO
        +6xciiiDR0PHMeWHbmyXUDCLRu45
X-Google-Smtp-Source: APXvYqyuQgVjHGgXRxyilZ9ujAqNx+jTifwG1ypIn5iXZ04yIJ6fo14f4/4mL+p4u1U0oWK9rsH6lQ==
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr15767210lji.231.1560849772601;
        Tue, 18 Jun 2019 02:22:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id l24sm2522704lji.78.2019.06.18.02.22.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 02:22:51 -0700 (PDT)
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
Date:   Tue, 18 Jun 2019 12:22:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

18.06.2019 10:46, Sowjanya Komatineni пишет:
> This patch adds suspend and resume support for Tegra pinctrl driver
> and registers them to syscore so the pinmux settings are restored
> before the devices resume.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
>  drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>  drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>  7 files changed, 84 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..ceced30d8bd1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -20,11 +20,16 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/slab.h>
> +#include <linux/syscore_ops.h>
>  
>  #include "../core.h"
>  #include "../pinctrl-utils.h"
>  #include "pinctrl-tegra.h"
>  
> +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
> +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
> +#define EMMC_DPD_PARKING			(0x1fff << 14)
> +
>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>  {
>  	return readl(pmx->regs[bank] + reg);
> @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>  		}
>  	}
> +
> +	if (pmx->soc->has_park_padcfg) {
> +		val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
> +		val &= ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
> +
> +		val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
> +		val &= ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
> +	}
> +}

Is there any reason why parked_bit can't be changed to parked_bitmask like I was
asking in a comment to v2?

I suppose that it's more preferable to keep pinctrl-tegra.c platform-agnostic for
consistency when possible, hence adding platform specifics here should be discouraged.
And then the parked_bitmask will also result in a proper hardware description in the code.
