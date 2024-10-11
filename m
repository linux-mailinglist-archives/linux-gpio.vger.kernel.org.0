Return-Path: <linux-gpio+bounces-11208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB699AC69
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA3928CAF5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E90B1CF29E;
	Fri, 11 Oct 2024 19:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yV2MBPgW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DF1C2327;
	Fri, 11 Oct 2024 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728673667; cv=none; b=h1RcVHQ8l/Buum8suBAlQnVlk/PBEMvwGMudJUyit0h6cicQbc2z2u5MX2+NGJezZs6Soqw//6odyRgpRXjXr1Tm1fySCKBwupRKfgeSYCmK8YJDeYc3Xv3LsSqi8rwBvawLeP6C/N5KLwAhdIw+CNhdwY0jpCQx7PywdO9mY5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728673667; c=relaxed/simple;
	bh=6lopcaIMFstruqReiFA3lPrI7J4lGgrUuAUosBsYMIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rEdw302fcjm0o52q4jWNmitaRIGijsIzADPp5qEOo/vVGIytoLn1Gab/fYFB1KvC09FypiAEatIPG9cKx+xKScPgQ92QnB5Z/g7fHv6uhHSkrn0Ryu+4EiCJY8Tqy1ZQi/1Ppe34jHw6+tlLQ1boOvIcXajpCvb3I+5SW5B+Ksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yV2MBPgW; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BJ7eBj067885;
	Fri, 11 Oct 2024 14:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728673660;
	bh=Hoe7/yzhFlr+Uf0dW/a8MOUxJrhC7yC6/D1NGWEkREg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yV2MBPgWI59EluInqtfAgEVci2FtiYkN5PHV6vahaQF+KYYapWFOBS7KIwuxC3Uyc
	 SKm7753ZCDlrRLNAXcW6uMCrd5eHb2LdSH2zfxJtJNveInuFfTbqUQAU01BlAdXnyp
	 PRmnMOpTjPqQnWxE7ZT5tGcROkO9MeiaR0p9fxT4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BJ7eii034871;
	Fri, 11 Oct 2024 14:07:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 14:07:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 14:07:39 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BJ7dLe129223;
	Fri, 11 Oct 2024 14:07:39 -0500
Message-ID: <89091165-74d1-442a-ab34-8e70f1a2d65b@ti.com>
Date: Fri, 11 Oct 2024 14:07:39 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
To: Judith Mendez <jm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin
 Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        <linux-serial@vger.kernel.org>
References: <20241011173356.870883-1-jm@ti.com>
 <20241011173356.870883-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241011173356.870883-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/11/24 12:33 PM, Judith Mendez wrote:
> Add omap_gpio_disable_irq and omap_gpio_enable_irq
> calls in gpio-omap.
> 
> Currently, kernel cannot disable gpio interrupts in
> case of a irq storm, so add omap_gpio_disable_irq
> so that interrupts can be disabled/enabled.
> 
> Signed-off-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   drivers/gpio/gpio-omap.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 76d5d87e9681..913e6ece1238 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -711,6 +711,31 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
>   	raw_spin_unlock_irqrestore(&bank->lock, flags);
>   }
>   
> +static void omap_gpio_set_irq(struct irq_data *d, bool enable)
> +{
> +	struct gpio_bank *bank = omap_irq_data_get_bank(d);
> +	unsigned int offset = d->hwirq;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&bank->lock, flags);
> +	omap_set_gpio_irqenable(bank, offset, enable);
> +	raw_spin_unlock_irqrestore(&bank->lock, flags);
> +}
> +
> +static void omap_gpio_disable_irq(struct irq_data *d)
> +{
> +	bool enable = 1;
> +
> +	omap_gpio_set_irq(d, !enable);

Seems like an odd way to make "false", why not:

omap_gpio_set_irq(d, false);

Andrew

> +}
> +
> +static void omap_gpio_enable_irq(struct irq_data *d)
> +{
> +	bool enable = 1;
> +
> +	omap_gpio_set_irq(d, enable);
> +}
> +
>   static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
>   {
>   	struct gpio_bank *bank = omap_irq_data_get_bank(d);
> @@ -723,6 +748,8 @@ static const struct irq_chip omap_gpio_irq_chip = {
>   	.irq_shutdown = omap_gpio_irq_shutdown,
>   	.irq_mask = omap_gpio_mask_irq,
>   	.irq_unmask = omap_gpio_unmask_irq,
> +	.irq_disable = omap_gpio_disable_irq,
> +	.irq_enable = omap_gpio_enable_irq,
>   	.irq_set_type = omap_gpio_irq_type,
>   	.irq_set_wake = omap_gpio_wake_enable,
>   	.irq_bus_lock = omap_gpio_irq_bus_lock,
> @@ -737,6 +764,8 @@ static const struct irq_chip omap_gpio_irq_chip_nowake = {
>   	.irq_shutdown = omap_gpio_irq_shutdown,
>   	.irq_mask = omap_gpio_mask_irq,
>   	.irq_unmask = omap_gpio_unmask_irq,
> +	.irq_disable = omap_gpio_disable_irq,
> +	.irq_enable = omap_gpio_enable_irq,
>   	.irq_set_type = omap_gpio_irq_type,
>   	.irq_bus_lock = omap_gpio_irq_bus_lock,
>   	.irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,

