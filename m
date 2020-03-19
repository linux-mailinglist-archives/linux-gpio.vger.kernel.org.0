Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECE118BD7B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgCSRFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:05:52 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8936 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbgCSRFw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:05:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a60d0000>; Thu, 19 Mar 2020 10:04:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:05:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:05:51 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:05:49 +0000
Subject: Re: [PATCH 2/9] gpio: tegra186: Add support for pin ranges
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-3-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <f3e56f49-2105-6514-f5a5-c1137569d083@nvidia.com>
Date:   Thu, 19 Mar 2020 22:35:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-3-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637453; bh=BBlWTjefIPWp4Hj5PcP5RR8/EBLeoHNo7Ba1ifNnpXE=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WsBzkUOivj8y56EXG2K+Kjr8NvjaVY0QZ0qDcmtzGTkac+TRxcYdMV0LSD0TpGaX1
         ykGne/RPFd9adRIsC6ZRZwvOBUJeG+VPEuIGTV44y2jtYW0iDGDH4ob7KdiJshD/Vd
         fSKen/p+5AQ677EnRylH6oiA3uQPt/RdR3fVjy0rFlcu1Uwfc9Ew1tKz8lG3ARYuYn
         6TSgzOV1HsxqlE0SONn2IS98v/EYDQiRoGU4YdSBQK1KHcX1LLBZlotkjudni0qOu6
         l69L1VQ48RyprJyOIIxApglRCPCGmIf09Qyosbzl6mgPemkrzfvA2RjpGpqDF6qdlG
         X3oYNl8VKqj8Q==
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
> Add support for Tegra SoC generations to specify a list of pin ranges
> that map GPIOs to ranges of pins in the pin controller.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 56 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index de241263d4be..1086c1fcaf49 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -58,11 +58,20 @@ struct tegra_gpio_port {
>          unsigned int pins;
>   };
> 
> +struct tegra186_pin_range {
> +       unsigned int offset;
> +       const char *group;
> +};
> +
>   struct tegra_gpio_soc {
>          const struct tegra_gpio_port *ports;
>          unsigned int num_ports;
>          const char *name;
>          unsigned int instance;
> +
> +       const struct tegra186_pin_range *pin_ranges;
> +       unsigned int num_pin_ranges;
> +       const char *pinmux;
>   };
> 
>   struct tegra_gpio {
> @@ -254,6 +263,50 @@ static int tegra186_gpio_set_config(struct gpio_chip *chip,
>          return 0;
>   }
> 
> +static int tegra186_gpio_add_pin_ranges(struct gpio_chip *chip)
> +{
> +       struct tegra_gpio *gpio = gpiochip_get_data(chip);
> +       struct pinctrl_dev *pctldev;
> +       struct device_node *np;
> +       unsigned int i, j;
> +       int err;
> +
> +       if (!gpio->soc->pinmux || gpio->soc->num_pin_ranges == 0)
> +               return 0;
> +
> +       np = of_find_compatible_node(NULL, NULL, gpio->soc->pinmux);
> +       if (!np)
> +               return -ENODEV;
> +
> +       pctldev = of_pinctrl_get(np);
> +       of_node_put(np);
> +       if (!pctldev)
> +               return -EPROBE_DEFER;
> +
> +       for (i = 0; i < gpio->soc->num_pin_ranges; i++) {
> +               unsigned int pin = gpio->soc->pin_ranges[i].offset, port;
> +               const char *group = gpio->soc->pin_ranges[i].group;
> +
> +               port = pin / 8;
> +               pin = pin % 8;
> +
> +               if (port >= gpio->soc->num_ports) {
> +                       dev_warn(chip->parent, "invalid port %u for %s\n",
> +                                port, group);
> +                       continue;
> +               }
> +
> +               for (j = 0; j < port; j++)
> +                       pin += gpio->soc->ports[j].pins;
> +
> +               err = gpiochip_add_pingroup_range(chip, pctldev, pin, group);
> +               if (err < 0)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
>   static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
>                                    const struct of_phandle_args *spec,
>                                    u32 *flags)
> @@ -578,12 +631,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>          gpio->gpio.label = gpio->soc->name;
>          gpio->gpio.parent = &pdev->dev;
> 
> +       gpio->gpio.request = gpiochip_generic_request;
> +       gpio->gpio.free = gpiochip_generic_free;
>          gpio->gpio.get_direction = tegra186_gpio_get_direction;
>          gpio->gpio.direction_input = tegra186_gpio_direction_input;
>          gpio->gpio.direction_output = tegra186_gpio_direction_output;
>          gpio->gpio.get = tegra186_gpio_get,
>          gpio->gpio.set = tegra186_gpio_set;
>          gpio->gpio.set_config = tegra186_gpio_set_config;
> +       gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
> 
>          gpio->gpio.base = -1;
> 
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
