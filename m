Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC11F5AB58
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 15:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbfF2NLV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 09:11:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45883 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfF2NLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 09:11:21 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so8594258lje.12;
        Sat, 29 Jun 2019 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ey4fssShrmgBVUvSl2bjQ9L0RX+BAadKcybzi3Wg/Uc=;
        b=HQpmTSbTGU4uiQtnuIHrmIqmvssPH0Q4hkFl4GFBMYkGkKLHls+NCDkmlXvXoa+iYp
         NV0+8bSNy+CN92cBlm+qiE6fnSGwPekuGGWnT9sLFOnRHOidfUBEBwx2coTc5rYFBhAS
         q1d7ES+hCc8WwNAhsBnY84tO7Yl0+DRZCArWsMQiRHGMEEhfxKvq7cD7EDAncspL4ZDh
         R0S8Ahhoec/0EXtugVbBJuo60ewEhrV/8Twyulu0yuIBPpH6BNVnSdv5fbWq1J+vyX+2
         QC1vTe0J3NjgQNhMhQttG8WecQBOcq/MDOJ5mN6H9E5W+F8Tu05m12KXAEQarZ0OUmOJ
         GKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ey4fssShrmgBVUvSl2bjQ9L0RX+BAadKcybzi3Wg/Uc=;
        b=X4+lvmoVDqr0TL3V60ySZTtLHGiyXxi9qdFVSMdqIkGEPALWn2kCt1KKJgSsMjZdJm
         D3RS1j2wm7muZkOBq2Gw4JuwJY0CTF86YBj7oOg4fO/uLclcr+B6gBGTxCqNdYlrtha8
         JQoqA/nSKolA+OzIRt6ol4By3Q422vJWKQGCCoenVdN39wTAutERY3gp5detSnfkSekC
         QTKGKdUHM3eBlngy98CM1uQMDBHBV/VbqD14/MN8EfAwj91ZOwgK9rwe3Rxxp7ONJiPw
         RpErXxMuRnJwVq7xVBm9qSff9cB8dAhzLvu25qPkJCTrjDguaDLvJe2cJ4DhU5MTx9dy
         TpJg==
X-Gm-Message-State: APjAAAUE9Kvf2ZjeeDLgXHfqsaR+LK9nX6X4N6dL+M38UzleA+dUm2C+
        125SpP1krIuzv0+zWmYrwmhV1kvz
X-Google-Smtp-Source: APXvYqyhhd7hVeDz2SUbjG+T1c2dXa3sbG6atp+D3LsNofQVLMrNRJ5TQPFLmfbvTJVv1XqW2ZWrAg==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr9176522lji.75.1561813878932;
        Sat, 29 Jun 2019 06:11:18 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id z12sm1330016lfg.67.2019.06.29.06.11.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:11:18 -0700 (PDT)
Subject: Re: [PATCH V5 13/18] soc/tegra: pmc: Add pmc wake support for
 tegra210
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
 <1561687972-19319-14-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e5367fd-81c0-c20b-5566-a11816d8458d@gmail.com>
Date:   Sat, 29 Jun 2019 16:11:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-14-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used RTC alarm wake event.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 91c84d0e66ae..194100d77243 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,12 @@
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> +
> +#define PMC_WAKE_MASK			0x0c
> +#define PMC_WAKE_LEVEL			0x10
> +#define PMC_WAKE_STATUS			0x14
> +#define PMC_SW_WAKE_STATUS		0x18
>  
>  #define DPD_SAMPLE			0x020
>  #define  DPD_SAMPLE_ENABLE		BIT(0)
> @@ -87,6 +93,11 @@
>  
>  #define PMC_SCRATCH41			0x140
>  
> +#define PMC_WAKE2_MASK			0x160
> +#define PMC_WAKE2_LEVEL			0x164
> +#define PMC_WAKE2_STATUS		0x168
> +#define PMC_SW_WAKE2_STATUS		0x16c
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>  	.alloc = tegra_pmc_irq_alloc,
>  };
>  
> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
> +{
> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 value;
> +
> +	if (data->hwirq == ULONG_MAX)
> +		return 0;
> +
> +	offset = data->hwirq / 32;
> +	bit = data->hwirq % 32;
> +
> +	/*
> +	 * latch wakeups to SW_WAKE_STATUS register to capture events
> +	 * that would not make it into wakeup event register during LP0 exit.
> +	 */

Minor nit: start multi-line comments with a capital letter.

