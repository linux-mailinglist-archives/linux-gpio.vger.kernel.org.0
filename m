Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D27118BD96
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgCSRIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:08:13 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13217 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbgCSRIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:08:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a69a0000>; Thu, 19 Mar 2020 10:06:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:08:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:08:12 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:08:10 +0000
Subject: Re: [PATCH 7/9] pinctrl: tegra: Do not add default pin range on
 Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-8-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <5c5b5a17-edd5-4c81-d587-2fdd2abab586@nvidia.com>
Date:   Thu, 19 Mar 2020 22:38:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-8-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637594; bh=DXwS9Jv6p7LxemPFrIpagbI8Rr3s7nF30bkx2NXnsGA=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=peY5Tbluplff2of2m93R5VluTXFwFGBnNdJCTJk19jO2vEnI/BXVL4pVcJ0ayZjnO
         M3JP9acuWm+xzputkDsu/x65yLPc9NKYHDlHe56CArRIWceYRmxJbaUYuj+8FKtIu2
         bXaNFqwCBzir8zgokxzYZbcEKbF0EilC567iFIMLqP3s+HzUv3lr1Jl+9kvt8JEGC+
         7rEM68GHMUdT+LNwmTVMQ/XW+YcRKvhx+FqoyfcZL25fwG6ZTddn1Yy2B3WK4NBNpy
         Eb+UjGN6EayCUEAy2f2zpw/UTWM073ad2rW+OVhfOPHtlyy5miDzQU/hhSlkZywsHU
         5F54q1KZAvxng==
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
> On Tegra194, almost all of the pin control programming happens in early
> boot firmware, so there is no use in having a pin range defined for all
> the pins.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 2 +-
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index c8246cc2c4fd..65511bf27d34 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
> 
>          tegra_pinctrl_clear_parked_bits(pmx);
> 
> -       if (!tegra_pinctrl_gpio_node_has_range(pmx))
> +       if (pmx->soc->ngpios > 0 && !tegra_pinctrl_gpio_node_has_range(pmx))
>                  pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
> 
>          platform_set_drvdata(pdev, pmx);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index d4e84530158c..61fc7e680788 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -134,7 +134,6 @@ static const struct tegra_pingroup tegra194_groups[] = {
>   };
> 
>   static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
> -       .ngpios = TEGRA_PIN_NUM_GPIOS,
>          .pins = tegra194_pins,
>          .npins = ARRAY_SIZE(tegra194_pins),
>          .functions = tegra194_functions,
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
