Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A520818BD72
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgCSRFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:05:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12307 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbgCSRFW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:05:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a61f0000>; Thu, 19 Mar 2020 10:04:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:05:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:05:21 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:05:19 +0000
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-2-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <dc7a3f0a-2206-1e5a-9255-d0c6a18d1c4c@nvidia.com>
Date:   Thu, 19 Mar 2020 22:35:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637471; bh=CBu9N1P1lLtJ2JKv+o3dSXWp8nGWMA/B8s/U54oVJ3M=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=iaLVU01BcqmL3Dg4HiA+8A6f4EzR4LEkBCY8fZUnSE9Z4Qn5mojuLtSZJ41ag1tiX
         xt+iOD4tid1RDRFMR6beRXrh91LklRNph5BAOsmi4jRPqodLux9/mHhgw9lpfIpieh
         4l6hYIbrFN8D0bFn884EW9bDAR2qk71ZSB/EmtJwHAChNmOKNmz7qXI8x8CZf7js4M
         bXUMulBenhzuB6QUo50O3JqoBZ5AAgHXA7bbu10PknwtK77HXMszR+mlx7TE9MOjpm
         KxssFX5fJjm08iwpY725EHc4D3X8SBA2bxmhffkx2KpXq9vI51Pq2aHbKO0tFxCZQj
         GK0ufpmIaZYQg==
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
> Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> GPIO controller had any pin-ranges assigned to it. This allows a driver
> to unconditionally use this helper if it supports multiple devices of
> which only a subset have pin-ranges assigned to them.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpio/gpiolib.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f31b1d46599e..12f3c339da78 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2792,7 +2792,10 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
>    */
>   int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
>   {
> -       return pinctrl_gpio_request(chip->gpiodev->base + offset);
> +       if (!list_empty(&chip->gpiodev->pin_ranges))
> +               return pinctrl_gpio_request(chip->gpiodev->base + offset);
> +
> +       return 0;
>   }
>   EXPORT_SYMBOL_GPL(gpiochip_generic_request);
> 
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
