Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A416F645
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfGUWD2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:03:28 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41235 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGUWD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:03:28 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so20293039lfa.8;
        Sun, 21 Jul 2019 15:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=312eS1rJivuShVgbJ4CKTuB7tv8Z9ln7R0MV1WeVrvU=;
        b=ZFG5dpMpsPKYNPnvmY1C5B5tNThy4grYcl6nDDWCbsa0l/ZJMcfDKZcnrXZhLnfMus
         83g35KQYwvOQJJhCSrqeAXsjnEgCnfMiG3UagrD/X2vRIWPlDsoBmaCW4et/rQkQsJXe
         1el2AueWiBMOT9suPeSbDsKzftOBET/ZGzTKz3Q7qxBYte5e90jhEK6qh6/nXDwaIcU0
         U6FZ8evjsfM1QB1GHnVNG0tfl1qsnxEr/yHOIjvSZqwUuYLOn31L83WYOlfo6kf/kElV
         AZWNUO1OmfOXibNrBBPVeoWFxgPxknHJ1c82TXjXvHNMuwwraIWFhOAzmQK9PbgnqCjG
         RyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=312eS1rJivuShVgbJ4CKTuB7tv8Z9ln7R0MV1WeVrvU=;
        b=OsY7+o26LzXnu+iuqf9S0xQBteoFgJLSLUSJHCncoyeBvTbFcckw28Hk5NMss3wW2L
         eca6Uk1rulM32NoDC6rhXyYIwjikspMIut+7+x+E5WjwNaFofh1p/qbXAQcO2di+obwK
         XTPtNoTu+G1JhMMhjog1c3ztyZIYmLKTAADx+zVG5qPpJZotZC/Pdn49vm2QdcLjwnaO
         Ul66aJfKXNvBUUeH5LcJKjpQXlraB4zkd7rty8zYWJS8j1YzvK875zReW05PSGHGJ/oN
         M53BDpGQLlcGJpdqpVID1+G4ePbDOJzr5gIdWRzbWaf5xhHkX/sPBXtEE46jYkOtf44Z
         3uYA==
X-Gm-Message-State: APjAAAXegbi7q1TMiQK7sdp6CELIbFdXVNOCbmV5uYIEENGJwr07aAcY
        IHCFBcGZa2sm1y3jIr+4cZTFPyh4
X-Google-Smtp-Source: APXvYqz5+/tLAltHDsTpKeKR0zhJzMkAniS99dhor0ZapUpQ1Je6qRP6NgGhWfwoqiZx6TFvNtFeXQ==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr28712428lfd.27.1563746604513;
        Sun, 21 Jul 2019 15:03:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id j7sm8006554lji.27.2019.07.21.15.03.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 15:03:23 -0700 (PDT)
Subject: Re: [PATCH V6 02/21] pinctrl: tegra: Add suspend and resume support
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
 <1563738060-30213-3-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d837e4e0-947b-2b90-c680-ab913e70e587@gmail.com>
Date:   Mon, 22 Jul 2019 01:03:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch adds support for Tegra pinctrl driver suspend and resume.
> 
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 59 +++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h |  3 ++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 186ef98e7b2b..e3a237534281 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -631,6 +631,58 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +static size_t tegra_pinctrl_get_bank_size(struct device *dev,
> +					  unsigned int bank_id)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, bank_id);
> +
> +	return resource_size(res) / 4;
> +}
> +
> +static int tegra_pinctrl_suspend(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	size_t bank_size;
> +	unsigned int i, k;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		bank_size = tegra_pinctrl_get_bank_size(dev, i);
> +		regs = pmx->regs[i];
> +		for (k = 0; k < bank_size; k++)
> +			*backup_regs++ = readl_relaxed(regs++);
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
> +	size_t bank_size;
> +	unsigned int i, k;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		bank_size = tegra_pinctrl_get_bank_size(dev, i);
> +		regs = pmx->regs[i];
> +		for (k = 0; k < bank_size; k++)
> +			writel_relaxed(*backup_regs++, regs++);
> +	}
> +
> +	return 0;
> +}
> +
> +const struct dev_pm_ops tegra_pinctrl_pm = {
> +	.suspend = &tegra_pinctrl_suspend,
> +	.resume = &tegra_pinctrl_resume
> +};
> +
>  static bool gpio_node_has_range(const char *compatible)
>  {
>  	struct device_node *np;
> @@ -655,6 +707,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	int i;
>  	const char **group_pins;
>  	int fn, gn, gfn;
> +	unsigned long backup_regs_size = 0;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx)
> @@ -707,6 +760,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		if (!res)
>  			break;
> +		backup_regs_size += resource_size(res);
>  	}
>  	pmx->nbanks = i;
>  
> @@ -715,6 +769,11 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	if (!pmx->regs)
>  		return -ENOMEM;
>  
> +	pmx->backup_regs = devm_kzalloc(&pdev->dev, backup_regs_size,
> +					GFP_KERNEL);
> +	if (!pmx->backup_regs)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < pmx->nbanks; i++) {
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 105309774079..0fc82eea9cf1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -17,6 +17,7 @@ struct tegra_pmx {
>  
>  	int nbanks;
>  	void __iomem **regs;
> +	u32 *backup_regs;
>  };
>  
>  enum tegra_pinconf_param {
> @@ -193,6 +194,8 @@ struct tegra_pinctrl_soc_data {
>  	bool drvtype_in_mux;
>  };
>  
> +extern const struct dev_pm_ops tegra_pinctrl_pm;
> +
>  int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data);
>  #endif
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
