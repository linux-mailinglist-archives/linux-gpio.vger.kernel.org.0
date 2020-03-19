Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F182718BDA1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgCSRJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:09:03 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13800 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgCSRJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:09:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a7210001>; Thu, 19 Mar 2020 10:08:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:09:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 19 Mar 2020 10:09:02 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:09:00 +0000
Subject: Re: [PATCH 9/9] pinctrl: tegra: Add SFIO/GPIO programming on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-10-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <66c5ab1d-e5c0-b4b1-08c6-da5db3d4d939@nvidia.com>
Date:   Thu, 19 Mar 2020 22:38:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-10-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637729; bh=gbh7MAWlGNWijtoH9aMdq50WPINyKOBntJiRDCJhQG4=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=B1RkmpuyVMwaTvFmEzljZLwAq8fYxhW6prUxIu1DslJtgDqt/cbGyQaDkXNQJtbVq
         QEPNad5d1rHt1zVOVBnWk32LU8amhYWpO3MnfQruqpbPbSePS78J6kkC+h6NHXDJ+h
         ir09xg7xt3i2x4VMOqzLToCq/vO+XxwUit9yWzEP5OE5T1oww6KiGzD2GEbbCoX05P
         KCQIKvm6x3b4Z5vQ3J0rY9Dy0kyTcE21EeGfAGTu0iPyJ2MNlLQCQnKPhBhJy1D5ty
         DRhwcTbIWvo5a8vppgBpEdV+/3NENXGldo6Z1N91sGfHU3RhFvmSg2+fESah2exYIQ
         Qw5sLvh6BB9+Q==
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
> Prior to Tegra186, the selection of SFIO vs. GPIO modes was done as part
> of the GPIO controller's register programming. Starting with Tegra186, a
> pin is configured as GPIO or SFIO with a bit in a configuration register
> of the pin controller.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 46 ++++++++++++++++++++++++
>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>   drivers/pinctrl/tegra/pinctrl-tegra194.c |  2 ++
>   3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 65511bf27d34..21661f6490d6 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -275,11 +275,57 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
>          return 0;
>   }
> 
> +static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                            struct pinctrl_gpio_range *range,
> +                                            unsigned int offset)
> +{
> +       struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
> +       const struct tegra_pingroup *group;
> +       u32 value;
> +
> +       if (!pmx->soc->sfsel_in_mux)
> +               return 0;
> +
> +       group = &pmx->soc->groups[offset];
> +
> +       if (group->mux_reg < 0 || group->sfsel_bit < 0)
> +               return -EINVAL;
> +
> +       value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
> +       value &= ~BIT(group->sfsel_bit);
> +       pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
> +
> +       return 0;
> +}
> +
> +static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
> +                                           struct pinctrl_gpio_range *range,
> +                                           unsigned int offset)
> +{
> +       struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
> +       const struct tegra_pingroup *group;
> +       u32 value;
> +
> +       if (!pmx->soc->sfsel_in_mux)
> +               return;
> +
> +       group = &pmx->soc->groups[offset];
> +
> +       if (group->mux_reg < 0 || group->sfsel_bit < 0)
> +               return;
> +
> +       value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
> +       value |= BIT(group->sfsel_bit);
> +       pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
> +}
> +
>   static const struct pinmux_ops tegra_pinmux_ops = {
>          .get_functions_count = tegra_pinctrl_get_funcs_count,
>          .get_function_name = tegra_pinctrl_get_func_name,
>          .get_function_groups = tegra_pinctrl_get_func_groups,
>          .set_mux = tegra_pinctrl_set_mux,
> +       .gpio_request_enable = tegra_pinctrl_gpio_request_enable,
> +       .gpio_disable_free = tegra_pinctrl_gpio_disable_free,
>   };
> 
>   static int tegra_pinconf_reg(struct tegra_pmx *pmx,
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 520865979d4a..fcad7f74c5a2 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -107,6 +107,7 @@ struct tegra_function {
>    *                     drvup, slwr, slwf, and drvtype parameters.
>    * @drv_bank:          Drive fields register bank.
>    * @hsm_bit:           High Speed Mode register bit.
> + * @sfsel_bit:         GPIO/SFIO selection register bit.
>    * @schmitt_bit:       Schmitt register bit.
>    * @lpmd_bit:          Low Power Mode register bit.
>    * @drvdn_bit:         Drive Down register bit.
> @@ -153,6 +154,7 @@ struct tegra_pingroup {
>          s32 ioreset_bit:6;
>          s32 rcv_sel_bit:6;
>          s32 hsm_bit:6;
> +       s32 sfsel_bit:6;
>          s32 schmitt_bit:6;
>          s32 lpmd_bit:6;
>          s32 drvdn_bit:6;
> @@ -192,6 +194,7 @@ struct tegra_pinctrl_soc_data {
>          bool hsm_in_mux;
>          bool schmitt_in_mux;
>          bool drvtype_in_mux;
> +       bool sfsel_in_mux;
>   };
> 
>   extern const struct dev_pm_ops tegra_pinctrl_pm;
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index 61afe5fe9dec..2e0b5f7bb095 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -95,6 +95,7 @@ static struct tegra_function tegra194_functions[] = {
>                  .tri_bit = 4,                                   \
>                  .einput_bit = e_input,                          \
>                  .odrain_bit = e_od,                             \
> +               .sfsel_bit = 10,                                \
>                  .schmitt_bit = schmitt_b,                       \
>                  .drvtype_bit = 13,                              \
>                  .drv_reg = -1,                                  \
> @@ -140,6 +141,7 @@ static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
>          .hsm_in_mux = true,
>          .schmitt_in_mux = true,
>          .drvtype_in_mux = true,
> +       .sfsel_in_mux = true,
>   };
> 
>   static int tegra194_pinctrl_probe(struct platform_device *pdev)
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
