Return-Path: <linux-gpio+bounces-15110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C5A236BF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895953A4AC5
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 21:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D44F1F12EF;
	Thu, 30 Jan 2025 21:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HnIFT9rp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1F14A099
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272932; cv=none; b=YtLbngp8R98lo60ChhhdoBWQJDkbaeErkLW2O1uD/feppUqj7zBFtn4rAJVrGe42WqO4WL851e3XM4o1IHZhJg3zk2EOaAoo4Mt4cGABEUdU5va44NTcVYIiTl8l/WgWelTnIWlvHBjaoGloVuBwJ9qmB94Nku+hEmq0axkvwv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272932; c=relaxed/simple;
	bh=fSxW72jfrCCxTWVBKvzhAYcfn3xvggBMkJzBbNrrWM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoeLUx/7Jy/zIDOMp4GoV4OmWzxdT3bkjqwmvTGWlO2yY/HcDfBqhsIuyny2snOy5qRERyySICSD6igoEX3TlZmfZkckkX3Xpw/N0u+4GpRlKPDNSCv2lTjXSnwyP19ACEbIxabYR9AxT9Vage6zJyFyGM8kc/4cEwD60j+eI3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HnIFT9rp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2156e078563so19238685ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 13:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738272930; x=1738877730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUeKYYRlvfp/QEjhY98ACZrQRlhIrgPVr3AUc340o60=;
        b=HnIFT9rpBvHNpp9yPQOo5wNylRvbqFCr/L0+2yQtf4/+sllHKTtBDEoa2FqvaYF1nG
         qXht/HnheAltwxpky/Ky+t7OaWdMf/qxyVsvTlC8NLtq0Zv/xetI0WWEOObH91Y6W0Xb
         lPMmN+tYqF1cF5Muo3OmWmA0PkXzwHUhXhtcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738272930; x=1738877730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUeKYYRlvfp/QEjhY98ACZrQRlhIrgPVr3AUc340o60=;
        b=WlkpGu5zSDIv3bUGgQIR0cTKe3LL8x68j9P9UgutHuOJA9hII+C526oW6NRzR3xFzO
         jNeCZJgTnSi+c+rwm63K05Sw9Fl7XJyFcbazqg4QZnIk/F7QP/EMSPVyfisKy56I2CV7
         cFkiXdnEWO8XF68Zqd+6k/TUKT0qpxo+0PJU14H8iCaI2owwOaW9DV0jL5HGkD/QyKrh
         0IGzhjocHWKH0W5PmOc8CkX9zdAebko2WxOSBEka7n1kv0V1Sl/YoqOmBVOfQVFNtnIt
         x7bRanB5Hea20wNtTVaPLTMm03t+B4cO/OM2p/OvN8+ugV30PkVt6inTHQb7Pg6CT0bH
         gooA==
X-Gm-Message-State: AOJu0YwnGWhdnjjdhgyH7xa1cnOxST0bW09hvTXVYzBPol6y0WVcP3Tg
	K6RB5qxODJYXCAMDmWw1IOV3K8oGsrSbgOOx0WWM4yH6P7BEeTG3aPzYVLdbWg==
X-Gm-Gg: ASbGncu94l9qk6eo040S9QJhMrQHwgs5yTe17Gblyx3EwBa7t4UdJwY3//7I2E8b6xb
	1adN4O/MU47hDfYG2RpadBoPcY7Q2QVb+QPsVZLZ5Deqj4xJQXuUW/sbS3F2W/wfRb8kUXjtrfp
	Y8Cu+Yv9xq45PkT0R2WB6h+AIJWJYHi5YYqMfjaPxwmPI8LP2SNgLVk18Ox+e8NtDDxzlOTp0z9
	5gsNDPaIObtiLUMfaSE3VOtnp5LBm9osvxdDgofYNHSnoU4/SUU+uRw4FwNEVZMfiUrq6cU+Bzr
	A1i51RbwsO+Dx1j5EWuRrrKzW+8x1J06d6i6G8sulKjFxKOXIvHwPWg=
X-Google-Smtp-Source: AGHT+IHZo95XO7VEqhqz08Ydw0N2/AnTL2Fl9RNuTQklmgIIobhEvEa5u910+4ndvagFCofr8i5P0g==
X-Received: by 2002:a05:6a21:e92:b0:1db:edc5:c960 with SMTP id adf61e73a8af0-1ed7a5f72b2mr13694120637.12.1738272930506;
        Thu, 30 Jan 2025 13:35:30 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796d6sm1829904a12.55.2025.01.30.13.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 13:35:29 -0800 (PST)
Message-ID: <9965d0b3-f169-45c4-9345-8588865a2ca4@broadcom.com>
Date: Thu, 30 Jan 2025 13:35:28 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
To: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 09:10, Artur Weber wrote:
> The settings for all GPIOs are locked by default in bcm_kona_gpio_reset.
> The settings for a GPIO are unlocked when requesting it as a GPIO, but
> not when requesting it as an interrupt, causing the IRQ settings to not
> get applied.
> 
> Fix this by making sure to unlock the right bits when an IRQ is requested.
> To avoid a situation where an IRQ being released causes a lock despite
> the same GPIO being used by a GPIO request or vice versa, add an unlock
> counter and only lock if it reaches 0.
> 
> Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>   drivers/gpio/gpio-bcm-kona.c | 69 ++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 57 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 77bd4ec93a231472d7bc40db9d5db12d20bb1611..eeaa921df6f072129dbdf1c73d6da2bd7c1fe716 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -69,6 +69,22 @@ struct bcm_kona_gpio {
>   struct bcm_kona_gpio_bank {
>   	int id;
>   	int irq;
> +	/*
> +	 * Used to keep track of lock/unlock operations for each GPIO in the
> +	 * bank.
> +	 *
> +	 * All GPIOs are locked by default (see bcm_kona_gpio_reset), and the
> +	 * unlock count for all GPIOs is 0 by default. Each unlock increments
> +	 * the counter, and each lock decrements the counter.
> +	 *
> +	 * The lock function only locks the GPIO once its unlock counter is
> +	 * down to 0. This is necessary because the GPIO is unlocked in two
> +	 * places in this driver: once for requested GPIOs, and once for
> +	 * requested IRQs. Since it is possible for a GPIO to be requested
> +	 * as both a GPIO and an IRQ, we need to ensure that we don't lock it
> +	 * too early.
> +	 */
> +	u8 gpio_unlock_count[GPIO_PER_BANK];
>   	/* Used in the interrupt handler */
>   	struct bcm_kona_gpio *kona_gpio;
>   };
> @@ -87,14 +103,25 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
>   	unsigned long flags;
>   	int bank_id = GPIO_BANK(gpio);
>   	int bit = GPIO_BIT(gpio);
> +	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>   
> -	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +	if (bank->gpio_unlock_count[bit] == 0) {
> +		dev_err(kona_gpio->gpio_chip.parent,
> +			"Unbalanced locks for GPIO %u\n", gpio);
> +		return;

Don't you want to release &kona_gpio->lock here?

> +	}
>   
> -	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> -	val |= BIT(bit);
> -	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +	bank->gpio_unlock_count[bit] -= 1;
>   
> -	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	if (bank->gpio_unlock_count[bit] == 0) {
> +		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +
> +		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +		val |= BIT(bit);
> +		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +
> +		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	}
>   }
>   
>   static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
> @@ -104,14 +131,20 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>   	unsigned long flags;
>   	int bank_id = GPIO_BANK(gpio);
>   	int bit = GPIO_BIT(gpio);
> +	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>   
> -	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +	if (bank->gpio_unlock_count[bit] == 0) {
> +		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
> -	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> -	val &= ~BIT(bit);
> -	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +		val &= ~BIT(bit);
> +		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
>   
> -	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +
> +		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	}
> +
> +	bank->gpio_unlock_count[bit] += 1;
>   }
>   
>   static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
> @@ -362,6 +395,7 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
>   
>   	kona_gpio = irq_data_get_irq_chip_data(d);
>   	reg_base = kona_gpio->reg_base;
> +
>   	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
>   	val = readl(reg_base + GPIO_INT_MASK(bank_id));
> @@ -384,6 +418,7 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
>   
>   	kona_gpio = irq_data_get_irq_chip_data(d);
>   	reg_base = kona_gpio->reg_base;
> +
>   	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
>   	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
> @@ -479,15 +514,25 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
>   static int bcm_kona_gpio_irq_reqres(struct irq_data *d)
>   {
>   	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +	unsigned int gpio = d->hwirq;
>   
> -	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, d->hwirq);
> +	/*
> +	 * We need to unlock the GPIO before any other operations are performed
> +	 * on the relevant GPIO configuration registers
> +	 */
> +	bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
> +
> +	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, gpio);
>   }
>   
>   static void bcm_kona_gpio_irq_relres(struct irq_data *d)
>   {
>   	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +	unsigned int gpio = d->hwirq;
> +
> +	bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
>   
> -	gpiochip_relres_irq(&kona_gpio->gpio_chip, d->hwirq);
> +	gpiochip_relres_irq(&kona_gpio->gpio_chip, gpio);
>   }
>   
>   static struct irq_chip bcm_gpio_irq_chip = {
> 


-- 
Florian

