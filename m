Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C45B918BD9F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgCSRIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:08:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13238 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgCSRIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:08:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a6b30000>; Thu, 19 Mar 2020 10:06:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:08:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:08:37 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:08:35 +0000
Subject: Re: [PATCH 8/9] pinctrl: tegra: Renumber the GG.0 and GG.1 pins
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-9-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <eb619976-96b9-5b7d-a8d8-9cb629b1ab81@nvidia.com>
Date:   Thu, 19 Mar 2020 22:38:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-9-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637620; bh=x2/WZOILM3mQuBE999O1TEf0hg3RUJvbcynoYMxS60U=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=R5ovmWm7QWmeauw7cUtHajZ89mE+pUPz2UiuSYUucPy184nW6BZfKDIxQVKnH1klg
         fqMVdeh2m/x7c+5ch2JPD3qDbovDcRbIpuzFS26mo9KEiuR3slJqyGVLZIwYL+Xcod
         T1UK6qsybYF3Hw3ZitZLmvsyLokgJb7dBUHrKbI1udus+WtDjLy/R3AsGX7gVe89lA
         90MJWYXp7hR9wBoyq6rPtVFzCeXP6w053X2PPACcGMsnqwtyetN9vMQcPlPeW0A0PA
         mG7ch37jpt3O83U7U/zgM7pCnvs+lQOarpeB9nvgu2Mnhd/0WMzgdWkr7ZRwabR2f1
         PKPNjLDVF39Yg==
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
> There is no need to define these at a specific offset since they are the
> only pins defined for this SoC generation. Begin numbering them at 0.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index 61fc7e680788..61afe5fe9dec 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -24,17 +24,14 @@
> 
>   /* Define unique ID for each pins */
>   enum pin_id {
> -       TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 = 256,
> -       TEGRA_PIN_PEX_L5_RST_N_PGG1 = 257,
> -       TEGRA_PIN_NUM_GPIOS = 258,
> +       TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> +       TEGRA_PIN_PEX_L5_RST_N_PGG1,
>   };
> 
>   /* Table for pin descriptor */
>   static const struct pinctrl_pin_desc tegra194_pins[] = {
> -       PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> -                   "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
> -       PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
> -                   "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
> +       PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0, "PEX_L5_CLKREQ_N_PGG0"),
> +       PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1, "PEX_L5_RST_N_PGG1"),
>   };
> 
>   static const unsigned int pex_l5_clkreq_n_pgg0_pins[] = {
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
