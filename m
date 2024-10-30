Return-Path: <linux-gpio+bounces-12325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A4A9B709B
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 00:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F831C20A68
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 23:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECAC217644;
	Wed, 30 Oct 2024 23:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Qgg/Bc8R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81C2141CA;
	Wed, 30 Oct 2024 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730331702; cv=none; b=HnjFE1Zg2ROEZn8otOslmundojKVULSXkdo8YVLZ//1uCfTMoOObjnM+BxiLThCkyOUzh6KlOhE6mgsU+OTCPOZsRd5JrQiwNzef1y1AmMSl8WZmdIXqVUyQsnwO7GI/MnhAgMk+YttYhJ6pnMJpiHrF2iacP7NnlERBlygbJag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730331702; c=relaxed/simple;
	bh=M0DDN+40heMq1MUyTEiggbwfVdfQi32sS1lu41JVgR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aReKudVo+0aUjP0y7U16poXCYjzJ+OGouSwnY87kL/sWhL29JWBkwP+UYErYRf/ifQf6gXwH6aeAULhcjgGY3CyTG4w85NgwVzsgacgmUr47MHF8JSlmA5MYH2NM5vm2WNUIffMLAnKFS1pT0J9k/UJTGueICt/tIPoQp9uU+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qgg/Bc8R; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49UNfNc8107073;
	Wed, 30 Oct 2024 18:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730331683;
	bh=56mwxKqWIevGkZXhU/haryWJFMgZit1fhV8XrDFsqio=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Qgg/Bc8R5KjC8BWc1AZrdWzdx1M4rGmY8IZzuAS/fh0zC3R/Cr1reOwdMzklwTYYN
	 kK4mv4EQHBOse+u0+m4CnKhM6Rm7tLQx3Ba/oshhO4WwI0a7Ly4gkkeMrcPyz+bDL0
	 EPVmFlXbK/BNHPUGaiMsEdzCnnMd53Iws7CM6wTw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UNfNKW107369;
	Wed, 30 Oct 2024 18:41:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Oct 2024 18:41:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Oct 2024 18:41:23 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UNfMbj096597;
	Wed, 30 Oct 2024 18:41:22 -0500
Message-ID: <b0f15446-2e31-4776-84ec-99d96f65ef48@ti.com>
Date: Wed, 30 Oct 2024 18:41:22 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: omap: Add omap_gpio_disable/enable_irq calls
To: Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bin Liu <b-liu@ti.com>
References: <20241030225900.59844-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20241030225900.59844-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi all,

Please ignore this patch, will resend this patch
with fixed recipients in the "to" list.

Apologies for the noise.

~ Judith


On 10/30/24 5:59 PM, Judith Mendez wrote:
> Add omap_gpio_disable_irq and omap_gpio_enable_irq
> calls in gpio-omap.
> 
> Currently, kernel cannot disable gpio interrupts in
> case of a irq storm, so add omap_gpio_disable/enable_irq
> so that interrupts can be disabled/enabled.
> 
> Signed-off-by: Bin Liu <b-liu@ti.com>
> [Judith: Add commit message]
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1 RESEND:
> - split patch from series [0]
> - Add disable/enable calls without wrapper functions
> [0] https://lore.kernel.org/linux-omap/20241011173356.870883-1-jm@ti.com/
> 
> Tested on am335x BeagleBone Black
> ---
>   drivers/gpio/gpio-omap.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 76d5d87e9681e..137aabada26f9 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -711,6 +711,28 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
>   	raw_spin_unlock_irqrestore(&bank->lock, flags);
>   }
>   
> +static void omap_gpio_disable_irq(struct irq_data *d)
> +{
> +	struct gpio_bank *bank = omap_irq_data_get_bank(d);
> +	unsigned int offset = d->hwirq;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&bank->lock, flags);
> +	omap_set_gpio_irqenable(bank, offset, 0);
> +	raw_spin_unlock_irqrestore(&bank->lock, flags);
> +}
> +
> +static void omap_gpio_enable_irq(struct irq_data *d)
> +{
> +	struct gpio_bank *bank = omap_irq_data_get_bank(d);
> +	unsigned int offset = d->hwirq;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&bank->lock, flags);
> +	omap_set_gpio_irqenable(bank, offset, 1);
> +	raw_spin_unlock_irqrestore(&bank->lock, flags);
> +}
> +
>   static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
>   {
>   	struct gpio_bank *bank = omap_irq_data_get_bank(d);
> @@ -723,6 +745,8 @@ static const struct irq_chip omap_gpio_irq_chip = {
>   	.irq_shutdown = omap_gpio_irq_shutdown,
>   	.irq_mask = omap_gpio_mask_irq,
>   	.irq_unmask = omap_gpio_unmask_irq,
> +	.irq_disable = omap_gpio_disable_irq,
> +	.irq_enable = omap_gpio_enable_irq,
>   	.irq_set_type = omap_gpio_irq_type,
>   	.irq_set_wake = omap_gpio_wake_enable,
>   	.irq_bus_lock = omap_gpio_irq_bus_lock,
> @@ -737,6 +761,8 @@ static const struct irq_chip omap_gpio_irq_chip_nowake = {
>   	.irq_shutdown = omap_gpio_irq_shutdown,
>   	.irq_mask = omap_gpio_mask_irq,
>   	.irq_unmask = omap_gpio_unmask_irq,
> +	.irq_disable = omap_gpio_disable_irq,
> +	.irq_enable = omap_gpio_enable_irq,
>   	.irq_set_type = omap_gpio_irq_type,
>   	.irq_bus_lock = omap_gpio_irq_bus_lock,
>   	.irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,


