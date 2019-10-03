Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B74C9DE8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 13:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfJCL7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 07:59:40 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9753 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfJCL7k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 07:59:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d95e2ab0000>; Thu, 03 Oct 2019 04:59:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Oct 2019 04:59:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Oct 2019 04:59:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct
 2019 11:59:38 +0000
Received: from [10.19.66.63] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct 2019
 11:59:36 +0000
Subject: Re: [PATCH 1/2] gpio: tegra186: Implement system suspend/resume
 support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20191002144502.156393-1-thierry.reding@gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <30cf4ef7-f2d1-23f3-7018-5288b77e95c4@nvidia.com>
Date:   Thu, 3 Oct 2019 04:59:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002144502.156393-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570103979; bh=nqtCwdzQnXKEVOqZ/EAHpxphtPtwle73zrzE2XDDni0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BiC8As3pExfSPH9cQj7t3B7i/Cuv5D1oSZIUfT+InVj/waLHJ9+8wjie0CvJa87tG
         4+o6dog4gCQDHrif/qSAEM18mR8t5cVgApP7Zw3E6uO8n/HSTqUHTCO217optdTcpK
         rBqkNl8g0mKKoe3zGpkKSS1YY8mb3xyt1fjrdkB13H7pdQqDE6RUGsVtWdGHRU6shj
         SjVU91aIS/aU4eX2edd4KbLKGLsxW00sVyMynIOA5FkW2oDcs1T7FBhhe6166rF0TP
         lWmItls9337B2g3ygNFAUw9v81ZNKHQZ7eYFNOpauC2C50M99eKLYGfIe5C+Jr9JUX
         qSRMmovS/TZJQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/2/19 7:45 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Backup GPIO control registers on suspend and restore them on resume to
> ensure that the GPIOs' configuration remains the same across suspend and
> resume.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 51 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index a9058fda187e..3ded6ba2f997 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -64,6 +64,12 @@ struct tegra_gpio {
>   	const struct tegra_gpio_soc *soc;
>   
>   	void __iomem *base;
> +
> +	struct tegra_gpio_context {
> +		u32 value;
> +		u32 control;
> +		u32 config;
> +	} *context;
>   };
>   
>   static const struct tegra_gpio_port *
> @@ -455,6 +461,11 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	for (i = 0; i < gpio->soc->num_ports; i++)
>   		gpio->gpio.ngpio += gpio->soc->ports[i].pins;
>   
> +	gpio->context = devm_kmalloc_array(gpio->gpio.parent, gpio->gpio.ngpio,
> +					   sizeof(*gpio->context), GFP_KERNEL);
> +	if (!gpio->context)
> +		return -ENOMEM;
> +
>   	names = devm_kcalloc(gpio->gpio.parent, gpio->gpio.ngpio,
>   			     sizeof(*names), GFP_KERNEL);
>   	if (!names)
> @@ -526,6 +537,45 @@ static int tegra186_gpio_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int tegra186_gpio_suspend(struct device *dev)
> +{
> +	struct tegra_gpio *gpio = dev_get_drvdata(dev);
> +	unsigned int i;
> +
> +	for (i = 0; i < gpio->gpio.ngpio; i++) {
> +		struct tegra_gpio_context *context = &gpio->context[i];
> +		void __iomem *base = tegra186_gpio_get_base(gpio, i);
> +
> +		context->config = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +		context->control = readl(base + TEGRA186_GPIO_OUTPUT_CONTROL);
> +		context->value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra186_gpio_resume(struct device *dev)
> +{
> +	struct tegra_gpio *gpio = dev_get_drvdata(dev);
> +	unsigned int i;
> +
> +	for (i = 0; i < gpio->gpio.ngpio; i++) {
> +		struct tegra_gpio_context *context = &gpio->context[i];
> +		void __iomem *base = tegra186_gpio_get_base(gpio, i);
> +
> +		writel(context->value, base + TEGRA186_GPIO_OUTPUT_VALUE);
> +		writel(context->control, base + TEGRA186_GPIO_OUTPUT_CONTROL);
> +		writel(context->config, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops tegra186_gpio_pm = {
> +	.suspend_late = tegra186_gpio_suspend,
> +	.resume_early = tegra186_gpio_resume,
> +};
> +
>   #define TEGRA186_MAIN_GPIO_PORT(port, base, count, controller)	\
>   	[TEGRA186_MAIN_GPIO_PORT_##port] = {			\
>   		.name = #port,					\
> @@ -680,6 +730,7 @@ static struct platform_driver tegra186_gpio_driver = {
>   	.driver = {
>   		.name = "tegra186-gpio",
>   		.of_match_table = tegra186_gpio_of_match,
> +		.pm = &tegra186_gpio_pm,
>   	},
>   	.probe = tegra186_gpio_probe,
>   	.remove = tegra186_gpio_remove,
> 

I see jetson Xavier RTC wakeup test fail with this patch. It no longer 
reaches the UART shell after suspend exit. Jetson-TX2 works fine with 
this patch. There seems to be some hang on Xavier.


-regards,
  Bitan



