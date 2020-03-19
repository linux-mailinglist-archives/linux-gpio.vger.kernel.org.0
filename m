Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCC418BD92
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgCSRHt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:07:49 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12407 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbgCSRHt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:07:49 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a6b30000>; Thu, 19 Mar 2020 10:06:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:07:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 19 Mar 2020 10:07:48 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:07:47 +0000
Subject: Re: [PATCH 6/9] pinctrl: tegra: Pass struct tegra_pmx for pin range
 check
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-7-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <316a2eb5-8fc5-1371-244b-ffcdbedc6c8e@nvidia.com>
Date:   Thu, 19 Mar 2020 22:37:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-7-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637619; bh=3ZhWjBQCIe39VNSCMSyqs/TRfqjw9ZkTNBT9LcM0JkU=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=diZRaJBlwIw+Qkc45yGOFOxq25sU9ML+bLNZhN3scN9XDouABYaKEYmt3OiF1JEge
         MZrU/r/ZMW7kCEMuRQtxAoqeH7+9B0Qp7UiUzauCtpUqheLoVlZeHwd3dPSuuouois
         Sa69sv3tX4iiBiNEM5igtO68cx6WLaV/M+QeCOAWmqe57hzGqh/1bzeD/sZJfBOj33
         CP8YG2BnP24cL1xy2YS1eCvriJdQikualKOR2fd+CdTZeBUdbYapyqRJCn9RkWGiGJ
         6GnqozKW9+GegCRuKAzhvwEn7NBpNeZWeHhtgR6fKH9p3lOLr1bGoOlzN2JwX6KK9+
         /zq1WG6hGXmsg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> Pass the struct tegra_pmx when checking for the pin range in device
> tree. This makes the call site a bit easier to read and will help keep
> that readability in a subsequent patch.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index cefbbb8d1a68..c8246cc2c4fd 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -689,12 +689,12 @@ const struct dev_pm_ops tegra_pinctrl_pm = {
>          .resume = &tegra_pinctrl_resume
>   };
> 
> -static bool gpio_node_has_range(const char *compatible)
> +static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
>   {
>          struct device_node *np;
>          bool has_prop = false;
> 
> -       np = of_find_compatible_node(NULL, NULL, compatible);
> +       np = of_find_compatible_node(NULL, NULL, pmx->soc->gpio_compatible);
>          if (!np)
>                  return has_prop;
> 
> @@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
> 
>          tegra_pinctrl_clear_parked_bits(pmx);
> 
> -       if (!gpio_node_has_range(pmx->soc->gpio_compatible))
> +       if (!tegra_pinctrl_gpio_node_has_range(pmx))
>                  pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
> 
>          platform_set_drvdata(pdev, pmx);
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
