Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3AC5AC49
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 17:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfF2PqM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 11:46:12 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43379 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfF2PqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 11:46:12 -0400
Received: by mail-lf1-f68.google.com with SMTP id j29so5913296lfk.10;
        Sat, 29 Jun 2019 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n+gNnWdOpo6++IaBlEaAMij5pbe3mgcwedV0Vv4+onQ=;
        b=fRVlUvQXovrUlPYw7k2mzgm/PbfGIKtOwLbGID5Xz6XTSUrulJ0ZIzjDIEIMh4n0cY
         P3jZqaUuFvJlIP6NHtOMaWdhQaYXpBNJXZMwuwGUHshlQlkKTPVyeCV0x94tnsqO+vQs
         y6Bz0zLBuGqn726quhESW0fEXR7zh5Rv4krT6/CBv6udMy1QCoTUmH/gTfrlqN+TKPfU
         bDwu+5g8h58e8ppDQJc7shixnVoD38lb/99hHEQ6hmYZ0Jse5lIChpRrgdMAMG0EbAKm
         1s/VEGZ8Stpo+t8D9HXtNf+8W/7N2mXkTetW5G30o406eRbjbcl2GDHWKJ8n/5OE44ET
         hKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n+gNnWdOpo6++IaBlEaAMij5pbe3mgcwedV0Vv4+onQ=;
        b=hkDxSvmjy3aK9o377uBhFShrKjmlSoGrmVWqEH7naSCLmKXJJvYh/wJCyhjZgDRHbh
         T0S0/vOLsEatHcmhSc4BzOYvUIYY18JgnbfyY76WMj1Ues7Q+OcFADOlts3hgn70vKQx
         swkO/ITaSWE4BFod0kxhtjlhiU0Mj8d++dTOztE3oJehna9vyK4pM57TIzrJNopm74Mq
         kiuQYMLALaLk+KkXwokfs2e1fqxfcA5J6boP4vmORWDb7g3LR7tUH7ljTCHzgBG5QwS3
         QIGt8InyOLMphsMb/fzBmNJbdrx4KDC0zsr+7k5arbkE3j7EsHl0R8bNBkOFYdywNpks
         hHog==
X-Gm-Message-State: APjAAAWhLk3rYtE5RLAO47jURYmxO5EdcH2cfXeqd1tgiLUXDIDk8ieZ
        NzS2M00eO3oI3oOwfnZCTMjabPDR
X-Google-Smtp-Source: APXvYqy7YekYw8JmgtfA4nsL3wHd1utlE8sfnJfjNNLZPLqCWDAidNBFFDhibWWYp6ElEtz9reX8TQ==
X-Received: by 2002:a05:6512:51c:: with SMTP id o28mr8016798lfb.67.1561823169770;
        Sat, 29 Jun 2019 08:46:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id i2sm1790541ljc.96.2019.06.29.08.46.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:46:09 -0700 (PDT)
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
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
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
Date:   Sat, 29 Jun 2019 18:46:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch adds support for Tegra pinctrl driver suspend and resume.
> 
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..e7c0a1011cba 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +static int tegra_pinctrl_suspend(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ = readl(regs++);
> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +static int tegra_pinctrl_resume(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);
> +	}
> +
> +	return 0;
> +}
> +
> +const struct dev_pm_ops tegra_pinctrl_pm = {
> +	.suspend = &tegra_pinctrl_suspend,
> +	.resume = &tegra_pinctrl_resume
> +};

Hm, so this are the generic platform-driver suspend-resume OPS here, which is very
nice! But.. shouldn't pinctrl be resumed before the CLK driver (which is syscore_ops
in this version of the series)? .. Given that "clock" function may need to be
selected for some of the pins.
