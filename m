Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E48318BD89
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgCSRHC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:07:02 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8998 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbgCSRHB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:07:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a6530000>; Thu, 19 Mar 2020 10:05:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:07:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:07:01 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:06:58 +0000
Subject: Re: [PATCH 4/9] pinctrl: tegra: Fix whitespace issues for improved
 readability
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-5-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <c354b94d-fb30-179f-c3c9-8004b73b6025@nvidia.com>
Date:   Thu, 19 Mar 2020 22:36:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-5-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637523; bh=qtG6lgPQGlttHvc5IrMeJS3L7ApxSqdRhUGOlAFoAJI=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ZtlUcXaPkTKZAMIjpn2cF5OYT7FzcCj2Mk5ZJNZ4jfD7RQeYExYvajONEG9G5y8Vd
         /MXVVFcTVmf73n4LYkAvgKAk9QAH6SAugYZ9mfFPxVsjstz6yxDRsYOtbrmIqVg4R5
         jEN5t2oyKRGIjkPsvFPT8I4gndH+ZYNUry8JDxswgqGyezbnmozxaocqjdvtOHzpy1
         q6apV9HK1bt8Mcq9uK2U/pkpGRX4+JHVV8ckKfnCu3EX1uAZwB7mzVDQEKH5VW0saC
         gZ3bzZNZY/ln0SxO//LSOVrYSeT5n6oOESdT8WaRAVoaWAysJRZ0CERfcrGJYGWdaW
         fwjNeMVSilYnQ==
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
> Fix a few whitespace inconsistencies to make the code easier to read.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 33 ++++++++++++------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index daf44cf240c9..d4e84530158c 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -59,6 +59,7 @@ enum tegra_mux_dt {
>          {                                       \
>                  .name = #lid,                   \
>          }
> +
>   static struct tegra_function tegra194_functions[] = {
>          TEGRA_PIN_FUNCTION(rsvd0),
>          TEGRA_PIN_FUNCTION(rsvd1),
> @@ -70,7 +71,7 @@ static struct tegra_function tegra194_functions[] = {
>   #define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,     \
>                               drvup_w, slwr_b, slwr_w, slwf_b,   \
>                               slwf_w, bank)                      \
> -               .drv_reg = ((r)),                       \
> +               .drv_reg = ((r)),                               \
>                  .drv_bank = bank,                               \
>                  .drvdn_bit = drvdn_b,                           \
>                  .drvdn_width = drvdn_w,                         \
> @@ -89,7 +90,7 @@ static struct tegra_function tegra194_functions[] = {
>                  .hsm_bit = -1,                                  \
>                  .mux_bank = bank,                               \
>                  .mux_bit = 0,                                   \
> -               .pupd_reg = ((r)),              \
> +               .pupd_reg = ((r)),                              \
>                  .pupd_bank = bank,                              \
>                  .pupd_bit = 2,                                  \
>                  .tri_reg = ((r)),                               \
> @@ -109,20 +110,20 @@ static struct tegra_function tegra194_functions[] = {
> 
>   #define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_lpbk,       \
>                   e_input, e_lpdr, e_od, schmitt_b, drvtype, io_rail)    \
> -       {                                                       \
> -               .name = #pg_name,                               \
> -               .pins = pg_name##_pins,                         \
> -               .npins = ARRAY_SIZE(pg_name##_pins),            \
> -                       .funcs = {                              \
> -                               TEGRA_MUX_##f0,                 \
> -                               TEGRA_MUX_##f1,                 \
> -                               TEGRA_MUX_##f2,                 \
> -                               TEGRA_MUX_##f3,                 \
> -                       },                                      \
> -               PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,     \
> -                                    e_input, e_od,             \
> -                                    schmitt_b, drvtype),       \
> -               drive_##pg_name,                                \
> +       {                                                               \
> +               .name = #pg_name,                                       \
> +               .pins = pg_name##_pins,                                 \
> +               .npins = ARRAY_SIZE(pg_name##_pins),                    \
> +                       .funcs = {                                      \
> +                               TEGRA_MUX_##f0,                         \
> +                               TEGRA_MUX_##f1,                         \
> +                               TEGRA_MUX_##f2,                         \
> +                               TEGRA_MUX_##f3,                         \
> +                       },                                              \
> +               PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,             \
> +                                    e_input, e_od,                     \
> +                                    schmitt_b, drvtype),               \
> +               drive_##pg_name,                                        \
>          }
> 
>   static const struct tegra_pingroup tegra194_groups[] = {
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
