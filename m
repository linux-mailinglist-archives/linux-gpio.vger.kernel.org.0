Return-Path: <linux-gpio+bounces-11094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B89961AD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 10:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9113E28740C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D5F188701;
	Wed,  9 Oct 2024 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZKg/iXor"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D081885A5
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460856; cv=none; b=ftJEpULXnRFafXZNe4DeD2447b5BDMC1m7PXgEoKzPBvlPjBPHioGQJVMqoouS3nmD+bj0caSxHgMXTtsoUvLZ1SGqTDYXYJOdmKoWN6j9L1BPzf93pQ+jdwV1qE2oYyo8+mit7LwGfPW/DxEkbB6x55M0ig9KAkeIoE+GlM8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460856; c=relaxed/simple;
	bh=4gcFM40WShofq1Teh8yk2jNYczXzVBi9aAezl0CszcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0CMgyvV05+XbqQrUf7zj9iBeSXs/9WLjMxq+oZJJZs5L8itVQ7mLQz4EcIGpAmfhhkelRb8DY3bwWRRMdyijWGa2qy+TEbmQ+fBdqezQ43UHxIM0wkfz3F4i9CCuhv441LFSsUUbNqKeH59X6towQ5cFdO94MublJamnTCgDG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZKg/iXor; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso8365580a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728460852; x=1729065652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xmWq6pJjZWLX7AnVwgxxTGUcjFm3sE+ZZuimxvGwVf4=;
        b=ZKg/iXortg5EkGKFOwruR/F/UI4kJy31+xBFd/diu0IkrZtpgZkHoK7Qy5YK8zoYRt
         FF32Pa3tYmMcUlYEhnxkiqh2z06CggpKj3f8qQZ5kCWxS/qukZhN6X1f7ES8/y2zC+RC
         LuEKkUBZlS3eMIRG5Kv/gE5898OI8Kyx/SqaZeOyLiYIALauZGvjK+MyFpdOc8Aa51xK
         beT7Plk9FQhE4FCBYlq2WmtE5HBpiwYepCLyltg1YfGv2WAd+TuS8g1zPqRiV8OIJrs2
         076xNmKkBtEFESf8DbNjB3kv5Yd7UCa2ZmXfbEVFF2Gtjlw4oFCPt9kbYE9yJ9s56j6G
         dvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460852; x=1729065652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmWq6pJjZWLX7AnVwgxxTGUcjFm3sE+ZZuimxvGwVf4=;
        b=Hk/OeqGNnPqhaHz8igFYKEFoGB+n6gSljUa4gAxOR+/JBnFZAqwlXOyM5kezEdp6RL
         0wmmd5TZvz20Xcyd3itaUJ19grBV/ANPvBRUrNAWK4ob94lxV0B0voOM4dgEu1bXL3rx
         u0WxiM7qA6z2sPUOpQEL/sa2CK69DqSRTPegQPHgyCoQj538UEHcYKhcN6vcZnOzTI+Q
         uW6Xgoi2dugSC2UGPvTAuLwrmnCtsQ5ixy3ZzYCHbSn/pECHsyD531/7wEd957XE5TiV
         L5ERry+AxxC/CoSk7p1a9R1vqMgNCS04eeuLSjEpICK952CffT5X1/9nCBVK4Y7HuE+U
         Dw9A==
X-Forwarded-Encrypted: i=1; AJvYcCWgsRS/8TtnbG69xcXQB9vOxsfjDy21tW8LapzY314wE6eeWpSxfErtuJ/BkcwWiZsNITEvi4k7QFUY@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJGw88NQaS2z4LwC1ck0ABI3p6HuO/VI7vRx/1g/e885vFxcV
	62DvLhnY3HmFMQdg4sZpAsQVqN9DjE2Yiikwi2P8YrwntZfgdl7ndX/weRz3TJY=
X-Google-Smtp-Source: AGHT+IGmTYY7T/VcCziMPqVOTqADhj4JCoKKFv7vqIAcFy6bMnH/1xpzOaWZCQUfdpOfXaJpahrrrg==
X-Received: by 2002:a05:6402:278f:b0:5c3:1089:ff23 with SMTP id 4fb4d7f45d1cf-5c91d6a03femr1195309a12.35.1728460851772;
        Wed, 09 Oct 2024 01:00:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb7f0sm5164321a12.72.2024.10.09.01.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:00:50 -0700 (PDT)
Message-ID: <1c3c8c5c-8f84-47c7-a9d0-963f95cba147@tuxon.dev>
Date: Wed, 9 Oct 2024 11:00:48 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Remove
 RZG2L_TINT_IRQ_START_INDEX
Content-Language: en-US
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com>
 <20240930145244.356565-2-fabrizio.castro.jz@renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240930145244.356565-2-fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.09.2024 17:52, Fabrizio Castro wrote:
> The RZ/V2H(P) has 16 IRQ interrupts, while every other platforms
> has 8, and this affects the start index of TINT interrupts
> (1 + 16 = 17, rather than 1 + 8 = 9).
> Macro RZG2L_TINT_IRQ_START_INDEX cannot work anymore, replace
> it with a new member within struct rzg2l_hwcfg.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
> v1->v2:
> * No change
> 
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 5a403915fed2..0aba75dce229 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -168,7 +168,6 @@
>  #define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_PINS_PER_PORT)
>  
>  #define RZG2L_TINT_MAX_INTERRUPT	32
> -#define RZG2L_TINT_IRQ_START_INDEX	9
>  #define RZG2L_PACK_HWIRQ(t, i)		(((t) << 16) | (i))
>  
>  /* Custom pinconf parameters */
> @@ -251,6 +250,7 @@ enum rzg2l_iolh_index {
>   * @func_base: base number for port function (see register PFC)
>   * @oen_max_pin: the maximum pin number supporting output enable
>   * @oen_max_port: the maximum port number supporting output enable
> + * @tint_start_index: the start index for the TINT interrupts
>   */
>  struct rzg2l_hwcfg {
>  	const struct rzg2l_register_offsets regs;
> @@ -262,6 +262,7 @@ struct rzg2l_hwcfg {
>  	u8 func_base;
>  	u8 oen_max_pin;
>  	u8 oen_max_port;
> +	unsigned int tint_start_index;

Maybe you can use u16 (even u8 is enough at the moment) and add it a bit
above (if u16 or even if unsigned int) to avoid any padding, if any.


>  };
>  
>  struct rzg2l_dedicated_configs {
> @@ -2379,7 +2380,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>  
>  	rzg2l_gpio_irq_endisable(pctrl, child, true);
>  	pctrl->hwirq[irq] = child;
> -	irq += RZG2L_TINT_IRQ_START_INDEX;
> +	irq += pctrl->data->hwcfg->tint_start_index;
>  
>  	/* All these interrupts are level high in the CPU */
>  	*parent_type = IRQ_TYPE_LEVEL_HIGH;
> @@ -3035,6 +3036,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
>  	},
>  	.iolh_groupb_oi = { 100, 66, 50, 33, },
>  	.oen_max_pin = 0,
> +	.tint_start_index = 9,
>  };
>  
>  static const struct rzg2l_hwcfg rzg3s_hwcfg = {
> @@ -3067,12 +3069,14 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
>  	.func_base = 1,
>  	.oen_max_pin = 1, /* Pin 1 of P0 and P7 is the maximum OEN pin. */
>  	.oen_max_port = 7, /* P7_1 is the maximum OEN port. */
> +	.tint_start_index = 9,
>  };
>  
>  static const struct rzg2l_hwcfg rzv2h_hwcfg = {
>  	.regs = {
>  		.pwpr = 0x3c04,
>  	},
> +	.tint_start_index = 17,
>  };
>  
>  static struct rzg2l_pinctrl_data r9a07g043_data = {

