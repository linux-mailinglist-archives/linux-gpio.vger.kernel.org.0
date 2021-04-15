Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AC436167C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Apr 2021 01:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbhDOXri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Apr 2021 19:47:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50832 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbhDOXri (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Apr 2021 19:47:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FNkmVn094110;
        Thu, 15 Apr 2021 18:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1618530408;
        bh=pRGwMWSaYtoWit9R9wj4c7Ey55QnmxemqiqcLIeD8cg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=v+TIx+cZcpwUJXb+X6zX7V3wZlEluoZZ/lAB9kfxTkwW6EY9CJOVcIE2JvE5IzCTo
         QbAgfprfuOyub4EgMU0YdU6bSBIm0Anp/1CZDlitGl6NtcH2uiaR7Yr0MDQ27Fk/I1
         cnzXa9AxJm5uZ9FESDRlA6+pGVvpBzBd2IW9w6nk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FNkm2h043902
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Apr 2021 18:46:48 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 18:46:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 18:46:48 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FNkkaK109112;
        Thu, 15 Apr 2021 18:46:46 -0500
Subject: Re: [PATCH] gpio: omap: Save and restore sysconfig
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
References: <20210415085305.56413-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <67113b0b-5e5f-b2f4-1b1c-b58a1055f0ed@ti.com>
Date:   Fri, 16 Apr 2021 02:46:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210415085305.56413-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 15/04/2021 11:53, Tony Lindgren wrote:
> As we are using cpu_pm to save and restore context, we must also save and
> restore the timer sysconfig register TIOCP_CFG. This is needed because
> we are not calling PM runtime functions at all with cpu_pm.

Smth. is wrong with description.

> 
> We need to save the sysconfig on idle as it's value can get reconfigured by
> PM runtime and can be different from the init time value. Device specific
> flags like "ti,no-idle-on-init" can affect the init value.
> 
> Fixes: b764a5863fd8 ("gpio: omap: Remove custom PM calls and use cpu_pm instead")
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/gpio/gpio-omap.c                | 9 +++++++++
>   include/linux/platform_data/gpio-omap.h | 3 +++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -29,6 +29,7 @@
>   #define OMAP4_GPIO_DEBOUNCINGTIME_MASK 0xFF
>   
>   struct gpio_regs {
> +	u32 sysconfig;
>   	u32 irqenable1;
>   	u32 irqenable2;
>   	u32 wake_en;
> @@ -1069,6 +1070,7 @@ static void omap_gpio_init_context(struct gpio_bank *p)
>   	const struct omap_gpio_reg_offs *regs = p->regs;
>   	void __iomem *base = p->base;
>   
> +	p->context.sysconfig	= readl_relaxed(base + regs->sysconfig);
>   	p->context.ctrl		= readl_relaxed(base + regs->ctrl);
>   	p->context.oe		= readl_relaxed(base + regs->direction);
>   	p->context.wake_en	= readl_relaxed(base + regs->wkup_en);
> @@ -1088,6 +1090,7 @@ static void omap_gpio_restore_context(struct gpio_bank *bank)
>   	const struct omap_gpio_reg_offs *regs = bank->regs;
>   	void __iomem *base = bank->base;
>   
> +	writel_relaxed(bank->context.sysconfig, base + regs->sysconfig);
>   	writel_relaxed(bank->context.wake_en, base + regs->wkup_en);
>   	writel_relaxed(bank->context.ctrl, base + regs->ctrl);
>   	writel_relaxed(bank->context.leveldetect0, base + regs->leveldetect0);
> @@ -1115,6 +1118,10 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
>   
>   	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
>   
> +	/* Save syconfig, it's runtime value can be different from init value */
> +	if (bank->loses_context)
> +		bank->context.sysconfig = readl_relaxed(base + bank->regs->sysconfig);
> +
>   	if (!bank->enabled_non_wakeup_gpios)
>   		goto update_gpio_context_count;
>   
> @@ -1279,6 +1286,7 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
>   
>   static const struct omap_gpio_reg_offs omap2_gpio_regs = {
>   	.revision =		OMAP24XX_GPIO_REVISION,
> +	.sysconfig =		OMAP24XX_GPIO_SYSCONFIG,
>   	.direction =		OMAP24XX_GPIO_OE,
>   	.datain =		OMAP24XX_GPIO_DATAIN,
>   	.dataout =		OMAP24XX_GPIO_DATAOUT,
> @@ -1302,6 +1310,7 @@ static const struct omap_gpio_reg_offs omap2_gpio_regs = {
>   
>   static const struct omap_gpio_reg_offs omap4_gpio_regs = {
>   	.revision =		OMAP4_GPIO_REVISION,
> +	.sysconfig =		OMAP4_GPIO_SYSCONFIG,
>   	.direction =		OMAP4_GPIO_OE,
>   	.datain =		OMAP4_GPIO_DATAIN,
>   	.dataout =		OMAP4_GPIO_DATAOUT,
> diff --git a/include/linux/platform_data/gpio-omap.h b/include/linux/platform_data/gpio-omap.h
> --- a/include/linux/platform_data/gpio-omap.h
> +++ b/include/linux/platform_data/gpio-omap.h
> @@ -85,6 +85,7 @@
>    * omap2+ specific GPIO registers
>    */
>   #define OMAP24XX_GPIO_REVISION		0x0000
> +#define OMAP24XX_GPIO_SYSCONFIG		0x0010
>   #define OMAP24XX_GPIO_IRQSTATUS1	0x0018
>   #define OMAP24XX_GPIO_IRQSTATUS2	0x0028
>   #define OMAP24XX_GPIO_IRQENABLE2	0x002c
> @@ -108,6 +109,7 @@
>   #define OMAP24XX_GPIO_SETDATAOUT	0x0094
>   
>   #define OMAP4_GPIO_REVISION		0x0000
> +#define OMAP4_GPIO_SYSCONFIG		0x0010
>   #define OMAP4_GPIO_EOI			0x0020
>   #define OMAP4_GPIO_IRQSTATUSRAW0	0x0024
>   #define OMAP4_GPIO_IRQSTATUSRAW1	0x0028
> @@ -148,6 +150,7 @@
>   #ifndef __ASSEMBLER__
>   struct omap_gpio_reg_offs {
>   	u16 revision;
> +	u16 sysconfig;
>   	u16 direction;
>   	u16 datain;
>   	u16 dataout;
> 

-- 
Best regards,
grygorii
