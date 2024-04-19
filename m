Return-Path: <linux-gpio+bounces-5672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D148AA80E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 07:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769D31C20AF3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 05:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59608BA31;
	Fri, 19 Apr 2024 05:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oT3ULVD9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4323D64
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713505718; cv=none; b=DKP1dn8mGvjGrrn7O01fy/qOGI7cS2hxm5cyNIY5MfPi71FMNDwsdoJoDlNkygXI7NjCMGXuL9cQhg3q9DnywOHn7O8k3PTShXvMbNf/gqyuMeNnSC54agU6fN6sMlxr3JIrdFpdRwIeYIjK05ae4P/JCWbo5oIJ5QB57Js1B5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713505718; c=relaxed/simple;
	bh=gMy6cw3DboCqmYxhdSgZUroOrhCMb6yIgY4xhy8AcRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQC8NS2DsPCHEBBbkIUBtZY9xLJugFt/hmTv6IY07Xjojj/rTMGtmtzMbjKluucdvq7phqgSGnOqCUPXWn11Ti8n6Zs2fbELXc+DyEPId6OaWMBxo/p+nax2DrARuEH/5YdCQXn4u5am063hHMw6Tnl/DiJ1IDdoS8k3VO6xq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oT3ULVD9; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so1920936e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 22:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713505713; x=1714110513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUWUrX+7Up17uccVitcI8TMuldwzT9oiXZZdOg/1/xo=;
        b=oT3ULVD9x5mC2+ZcPo14nswAR7JK8M7L7d98bRiF+zPA5+ReXUmVyS9rGdRxne6LaC
         PAi8pqrjNghCJtYSBEahF522k9Wc5yTQ1ODit2dLWx/phcjbOcPJwND4K9QWF9x5AJLp
         OsjZ3fxfJ3O0DxeSKteeK+fLsTW3w9bclykUvxJZrCLXhRl5HGuzv+hS+QTESSpnj1jt
         s8daAtFtrVeQFWCGvHu4VMQ3tfLDfRg6oI1kFRQ+hS5VmOKSo+tLA+zIbl9Ykyx1ujo4
         ISdGS7G2pFJWHmyOs77C+xmTVqvrwMLTKX4aWeiaSr3T9byh0Pq852C9KPMgCVAtvxFj
         WGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713505713; x=1714110513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUWUrX+7Up17uccVitcI8TMuldwzT9oiXZZdOg/1/xo=;
        b=lh0xMv07/5oRRafoOUsixbi8yMYTXucOgG2OkkMfuAl4WhUpLWugTkz1dQt8Hatm6C
         yZgJnV4iyBm9DKU9pALKFmtzmXV3tQmlpTrtEFqEct9blI63XJuih348hhhvgKDr7qgS
         BwqpPd70AUJiNMBS4ibimHLL4lOKEPZ2Cf4yAs52VxDTROFFWPacfZ0s1Yz7j19NzF0s
         rTqu2GiXeNzORK8EQVofLu2HwUhomCs3lDzW1iJEXI6Uu+fSz0pXml+syKbQCEYiLbkJ
         KO+M/NXF9NbkDamhgbpRbvrOZT1qgkBYwtOaA3zXmO8813CfKoQ+2n3xM+09p6PygCQk
         cRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWid1WCqHLYAFrX5rhf+T7Cz1i4VU2p+4VXUDOjwzYVD/EKBfr9JtfMr2VCEQWASQscKhibCRgd00pvViyqIzF4bELSLiiYG7wA0A==
X-Gm-Message-State: AOJu0YwHzg/4GWG9OhRLW3I+FE2Xy94o0gVotdXJxCouifQVn1w5/FwF
	V/B+75p8F9iAjg6QiMIo5w1r0HuOvXe1oP9efzRTT7hG9o+xk4JfgJxpZWcyMfc=
X-Google-Smtp-Source: AGHT+IGGFhdm24fRbZbASPVJ5Uk1/4VA+Pl0auWkqMpLjHkM4OYbghllVrdt80G8vUK8NW1HumU/Pg==
X-Received: by 2002:a19:4316:0:b0:516:d029:b51e with SMTP id q22-20020a194316000000b00516d029b51emr601805lfa.60.1713505713141;
        Thu, 18 Apr 2024 22:48:33 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id br20-20020a170906d15400b00a52241b823esm1749562ejb.109.2024.04.18.22.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 22:48:32 -0700 (PDT)
Message-ID: <7593a5ef-7235-4d3a-a52d-90a7b1aeae0f@tuxon.dev>
Date: Fri, 19 Apr 2024 08:48:30 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: renesas: rzg2l: Configure the interrupt
 type on resume
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, tglx@linutronix.de, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com>
 <20240320104230.446400-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXescaJ-V0iuXsxo=X-7RYTBR1W5+EXZCw_2VPHEFGzdA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXescaJ-V0iuXsxo=X-7RYTBR1W5+EXZCw_2VPHEFGzdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18.04.2024 17:07, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Mar 20, 2024 at 11:43 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Commit dce0919c83c3 ("irqchip/renesas-rzg2l: Do not set TIEN and TINT
>> source at the same time") removed the setup of TINT from
>> rzg2l_irqc_irq_enable(). To address the spourious interrupt issue the setup
>> of TINT has been moved in rzg2l_tint_set_edge() though
>> rzg2l_disable_tint_and_set_tint_source(). With this, the interrupts are
>> not properly re-configured after a suspend-to-RAM cycle. To address
>> this issue and avoid spurious interrupts while resumming set the
>> interrupt type before enabling it.
>>
>> Fixes: dce0919c83c3 ("irqchip/renesas-rzg2l: Do not set TIEN and TINT source at the same time")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -2045,7 +2045,9 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>
>>         for (unsigned int i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
>>                 struct irq_data *data;
>> +               unsigned long flags;
>>                 unsigned int virq;
>> +               int ret;
>>
>>                 if (!pctrl->hwirq[i])
>>                         continue;
>> @@ -2063,17 +2065,17 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>                         continue;
>>                 }
>>
>> -               if (!irqd_irq_disabled(data)) {
>> -                       unsigned long flags;
>> -
>> -                       /*
>> -                        * This has to be atomically executed to protect against a concurrent
>> -                        * interrupt.
>> -                        */
>> -                       raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
>> +               /*
>> +                * This has to be atomically executed to protect against a concurrent
>> +                * interrupt.
>> +                */
>> +               raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
>> +               ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
>> +               if (ret)
>> +                       dev_crit(pctrl->dev, "Failed to set IRQ type for virq=%u\n", virq);
>> +               else if (!irqd_irq_disabled(data))
>>                         rzg2l_gpio_irq_enable(data);
>> -                       raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
>> -               }
>> +               raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
>>         }
>>  }
> 
> LGTM, but I'd rather move the dev_crit() outside (i.e. after) the
> critical section.

I was in balance about having it as proposed. I'll send an update to move
it outside.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

