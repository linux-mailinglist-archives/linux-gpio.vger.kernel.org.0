Return-Path: <linux-gpio+bounces-18512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33308A811BF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 18:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1B61BC6374
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3D222CBEF;
	Tue,  8 Apr 2025 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ctw0ZfxD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC109233D9D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128320; cv=none; b=Wy73plRanoEavhpnTY8h7p6vbsCBw0CgghZ4lFSi2PZ29PL2ZKdgW99s2NOQZ32CZKG72E55WA0SMdypo5z2VlnRg+IzA4TUWCYzEiprWDZfielWPjJJf4Xk7Keb29oyi/YTOc+kczY9RSD7O7LenQ5IRtUzUDI7IrIIJvViyU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128320; c=relaxed/simple;
	bh=g0KIROiA1Bt90+qNqjX0QDUP6577BKAizBUZOpaFpX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxwQyQ9BdzD+CMD8pqLJmCGB8QzpS9pRD5ERiEktu6+SpQkxmbzoXT5Q9rTXivJRcFeXwhL72vB7p47jd76hX2iOk09JAGMA9Cxze/5h35kdq7GGzV68iSvuz+lu18FoSFTFjyarnGGLHyunqMoez2e3QVz9/cKsPI4mZtC8WnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ctw0ZfxD; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d6d84923c8so17373775ab.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744128317; x=1744733117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asx87Qx3dDhJwSi+jaXzp4Fjsaj/1mX8qIAXGOc3zCg=;
        b=ctw0ZfxDG/iL0MF4pAQfVi1O5Uky9S+MMCMVqQD65gWwc1VtqrpTFt3z1eoktIDkic
         RrhKSiQ3oo1rxIgIH9u/v5EUswLbPNnqViV2dp/nFijqlXMOLqNa3/zSm16ks2tHb0VG
         sFx99dGDrnXyNe8vQDGjfaOFz+NXRXKv05ggswXzZw4Y+gK020UrTYDKFAmnAl2KiMqd
         kVb55KkVh0/yy7FDNf3MsHbLJehgVlwf+NKl7bN9als+8/snBkaraQxPrja/kFq9H3/H
         bbLjaJNOtpzm5UEamIu/4kV7xzm6GLVconyrzylSL9NBaKvcgkWn/nQN2KZV5xQvFaIx
         MgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128317; x=1744733117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asx87Qx3dDhJwSi+jaXzp4Fjsaj/1mX8qIAXGOc3zCg=;
        b=b0KHOMAGz7JEhqxoCRek83LnmYwn3vyCQ0sneKkOjK9S+BuxwBxbKBTTIvMmUMbWu2
         s/bRr9abO0tDPYBMt+TuZOdnyPwiLEKcjcbtBn5cVGsp5w2729+3BW8CT9wh0Z7k/uKn
         jkzf8jUbaZFMh4PZwOnb/e+Y3saFE6fDH1gXt9nAepaF+vdRrP8plceXsay/llaTjh77
         /OsWCrp5AvafjfxWBdKoBA6Yarb6UN4+gKnP2UvgtQkG1ApCTaQOgBsrTXVzBdrxM6Xr
         KQym1wWUctuOtcn/BHrmgRsT8b4fADqwOk0WpZnFvDbdrzqa75ChH9ipCdF4e6YQjMSA
         mA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdSJqo94kGbEqdxhQys3lJo6SqRdqlDYaEylcVU5rc+ReRRUvWP2TaCV+pefWSPkUulAsMkC+TSJEa@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVZx/5ip7qjmwMH6Btn2f+/gyCcRuCTgF7oIQ6bZDLz3f9vNF
	ohYXy/QfWI9Uvyp0D4b8+SX35J2eaAWM4+oO4uEQjmWDLe6sHSavKoUfwHNIveU=
X-Gm-Gg: ASbGncs5wCXD6bYSOi8sydAaeyXQkhRSgNdK51+/xqZ+YT6Fm2AcDn6aeENR44x24LE
	LP4LrZCeTu49o3sSJENRU6lJjEZLDsSPmCdZtL7Sblazp34mWc7b+y+KrMeQTOasTSGvTn8luMv
	/auXnimLPBLgH/HGYpsFyDdBLIx+aEjfKNkFbU6bxRZHH9uEU21MQAlPv3a7CT/vSVM10NwjPW2
	4N7z0X4P3saP8tyGjWG+yOks5sD60yfMT5ABHkD8f7EzYZEY+RCdu+Q3SqM6q0NGqHlRTnyYS8a
	zLN2P4EUwMcHUMmXSFV43vRr/1+Usqo/OnZGCZuFVO3f5KEcwvZwqcH4xhl5yIKvsiWRVKy0MBQ
	vKZfD5AZ6
X-Google-Smtp-Source: AGHT+IHYUfycAb1D6ob++UC+uXPgjcp9fEEnsdmzaco2ksSrRMK6BkV9YVek8HqOobEA+e4eRIUalA==
X-Received: by 2002:a05:6e02:160d:b0:3d3:dd32:73d5 with SMTP id e9e14a558f8ab-3d6e52f63c8mr180807355ab.4.1744128316639;
        Tue, 08 Apr 2025 09:05:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703b9970dsm5159065ab.43.2025.04.08.09.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 09:05:16 -0700 (PDT)
Message-ID: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
Date: Tue, 8 Apr 2025 11:05:15 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts
 scheme
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto
 <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 10:11 AM, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>    irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:
> 
>      gpios = <&gpio instance offset flags>;
> 
> It also result describing interrupts in three-cell as this in DT:
> 
>      node {
>              interrupt-parent = <&gpio>;
>              interrupts = <instance hwirq irqflag>;
>      }
> 
> This series try to extend describing interrupts with three-cell scheme.
> 
> The first patch will add capability for parsing irq number and flag
> from last two cells which eventually will support the three-cells
> interrupt, the second patch support finding irqdomain according to
> interrupt instance index.

Did you intend to send more than just one patch?	-Alex

> 
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
> ---
> Changes in v4:
> - rebase patch [2/2] to gpio's for-next branch, no changes
> - drop [1/2] of patch v3 which merged into irq tree
> - Link to v3: https://lore.kernel.org/r/20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org
> 
> Changes in v3:
> - explicitly introduce *_twothreecell() to support 3 cell interrupt
> - Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org
> 
> Changes in v2:
> - introduce generic irq_domain_translate_cells(), other inline cells function
> - hide the OF-specific things into gpiolib-of.c|h
> - Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
> ---
>   drivers/gpio/gpiolib-of.c |  8 ++++++++
>   drivers/gpio/gpiolib-of.h |  6 ++++++
>   drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index f29143c71e9db61a6ad6d45d64e88a3f3f2d4fa7..3651c4178b81a1346809ec43b91a532e9f48af2b 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1285,3 +1285,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>   {
>   	of_node_put(dev_of_node(&chip->gpiodev->dev));
>   }
> +
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)
> +{
> +	if (gc->of_node_instance_match)
> +		return gc->of_node_instance_match(gc, index);
> +
> +	return false;
> +}
> diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
> index 16d6ac8cb156c02232ea868b755bbdc46c78e3c7..3eebfac290c571e3b90e4437295db8eaacb021a3 100644
> --- a/drivers/gpio/gpiolib-of.h
> +++ b/drivers/gpio/gpiolib-of.h
> @@ -22,6 +22,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np,
>   			       unsigned long *lookupflags);
>   int of_gpiochip_add(struct gpio_chip *gc);
>   void of_gpiochip_remove(struct gpio_chip *gc);
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
>   int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
>   #else
>   static inline struct gpio_desc *of_find_gpio(struct device_node *np,
> @@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
>   }
>   static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
>   static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
> +static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
> +					      unsigned int index)
> +{
> +	return false;
> +}
>   static inline int of_gpio_count(const struct fwnode_handle *fwnode,
>   				const char *con_id)
>   {
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8252a671d7208105a315bdc914acb092d5f95e79..ed8397a88dea1d92c3d4cb3cc9a6b30be29d31f6 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1507,9 +1507,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
>   						   unsigned int *type)
>   {
>   	/* We support standard DT translation */
> -	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> -		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> -	}
> +	if (is_of_node(fwspec->fwnode))
> +		return irq_domain_translate_twothreecell(d, fwspec, hwirq, type);
>   
>   	/* This is for board files and others not using DT */
>   	if (is_fwnode_irqchip(fwspec->fwnode)) {
> @@ -1811,11 +1810,26 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
>   	irq_set_chip_data(irq, NULL);
>   }
>   
> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> +			       enum irq_domain_bus_token bus_token)
> +{
> +	struct fwnode_handle *fwnode = fwspec->fwnode;
> +	struct gpio_chip *gc = d->host_data;
> +	unsigned int index = fwspec->param[0];
> +
> +	if (fwspec->param_count == 3 && is_of_node(fwnode))
> +		return of_gpiochip_instance_match(gc, index);
> +
> +	/* Fallback for twocells */
> +	return (fwnode && (d->fwnode == fwnode) && (d->bus_token == bus_token));
> +}
> +
>   static const struct irq_domain_ops gpiochip_domain_ops = {
>   	.map	= gpiochip_irq_map,
>   	.unmap	= gpiochip_irq_unmap,
> +	.select	= gpiochip_irq_select,
>   	/* Virtually all GPIO irqchips are twocell:ed */
> -	.xlate	= irq_domain_xlate_twocell,
> +	.xlate	= irq_domain_xlate_twothreecell,
>   };
>   
>   static struct irq_domain *gpiochip_simple_create_domain(struct gpio_chip *gc)
> 
> ---
> base-commit: 9ed74dfa0822ba58eacaec61fb16bd4feb34a5a6
> change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
> 
> Best regards,


