Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84BE16FD2D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 11:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbfGVJy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 05:54:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42193 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbfGVJy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 05:54:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so36969638lje.9;
        Mon, 22 Jul 2019 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0Bz0B3znRkzN1aaFEIYtkZkLNv7SC5uYBJx9GcgvIbo=;
        b=VyEAdJ9u8WWneLydpX8Bd+0pO+roYUg07OcNb8qu5Sg4AabJ+sNVtDsHffSGPA3OYD
         Gx95JME7Xf4Wx7Cz8UB1JwqqFAoPRdshuJwIAnHk/vFHgI3/1KYIJPRqRbHIffR4DlcO
         Vm+T4KP2K1ZRuR3RWltbC53T0WbdxvZB5po7/FJ7HnWJX0b8Bgskb8ew4NimOJRndFmD
         BrVygFj2+LSmBndycp1HRHUKjqyrhnnLLQnhG65IjxQE+vR5YnC5bNAql0iV6p/EnGNf
         5qA22Yi4T+YoYLTiWXwhQc2fdbIk5Ti7wqXr1LpnVOWzSaq92Eyy/L7f4/ScdkJ7BrS/
         T1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Bz0B3znRkzN1aaFEIYtkZkLNv7SC5uYBJx9GcgvIbo=;
        b=EljAupdm+n52dU8C6eIkdLs7ZEGZ38by46gfvYY6ArE3AqsbJc51AtYMYZdOWa38y5
         5gAuzUXwwk/IazWHgltzMGreORWeoZ+uXMshqWeucLs6eF9J7y9m53ddZbLGn8lQn0yH
         i37P4zqMBJI61uJv1IX4VkCElUim2m1oJy3cgBgtymWwuHi9XHgTwzRpn8sXW+CJVxjp
         dXG8uZ1oAkB7+hHLr1jMdia2iFRCcAPrbfF02YIyNoVxgrBqD6NION4KOvYBg8+vfgCM
         bVDlMVHeMYDawoBzC673Q2s1Ha6zfJyGyQq47XgakY4u99cfELzvoJbuiu6nP7JsYT0q
         5k+Q==
X-Gm-Message-State: APjAAAXbScJNNz6tsDcGp03rh4MoNO7I2jIuYg8aD+LQFn6S2jtnBFQA
        O2BL/HXlztv54lN47QO93m9iIzTp
X-Google-Smtp-Source: APXvYqxY/YvLFYLne+VP2QqRsaaLYHKAFFp28j2d6BRsG1OoG7yHU03akGcUAWdgtDmSUHqQXfPk3Q==
X-Received: by 2002:a2e:8007:: with SMTP id j7mr35985709ljg.191.1563789294111;
        Mon, 22 Jul 2019 02:54:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id c30sm5992003lfp.70.2019.07.22.02.54.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:54:53 -0700 (PDT)
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
Date:   Mon, 22 Jul 2019 12:54:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
> 
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
> 
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
> index e1f771c72fc4..851f88cef508 100644
> --- a/drivers/irqchip/irq-tegra.c
> +++ b/drivers/irqchip/irq-tegra.c
> @@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
>  
>  struct tegra_ictlr_soc {
>  	unsigned int num_ictlrs;
> +	bool supports_sc7;
>  };
>  
>  static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
> @@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
>  
>  static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
>  	.num_ictlrs = 6,
> +	.supports_sc7 = true,
>  };
>  
>  static const struct of_device_id ictlr_matches[] = {
> @@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] = {
>  
>  struct tegra_ictlr_info {
>  	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
> +	const struct tegra_ictlr_soc *soc;
>  #ifdef CONFIG_PM_SLEEP
>  	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
>  	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
> @@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
>  		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
>  		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
>  
> -		/* Disable COP interrupts */
> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> +		/*
> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
> +		 *
> +		 * Tegra210 system suspend flow uses sc7entry firmware which
> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
> +		 * system to go to SC7/LP0.
> +		 *
> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.
> +		 */
> +		if (!lic->soc->supports_sc7)
> +			/* Disable COP interrupts if SC7 is not supported */

All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
doesn't sound correct to me. Something like 'firmware_sc7' should suit
better here.

> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);

Secondly, I'm also not sure why COP interrupts need to be disabled for
pre-T210 at all, since COP is unused. This looks to me like it was
cut-n-pasted from downstream kernel without a good reason and could be
simply removed.

>  		/* Disable CPU interrupts */
>  		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
> @@ -339,6 +354,7 @@ static int __init tegra_ictlr_init(struct device_node *node,
>  		goto out_unmap;
>  	}
>  
> +	lic->soc = soc;
>  	tegra_ictlr_syscore_init();
>  
>  	pr_info("%pOF: %d interrupts forwarded to %pOF\n",
> 

