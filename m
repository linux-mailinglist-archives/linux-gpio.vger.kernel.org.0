Return-Path: <linux-gpio+bounces-3336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65900855DED
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 10:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCAC6B29268
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 09:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E38D13FE2;
	Thu, 15 Feb 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BFwvTy/u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72917585
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707988503; cv=none; b=nq5wEeB3jWlNU16/jvb9z/lGfW1ziwYViUIVl5Quzo212XuSw/0iJG+Gt2Wkq6NBaJsZE2gkOeZHpw6cB8eQjegnDS6xfYFvRkzz13pI5Pk7jfsJS6QTaiwdptZSorvMxkLzxJeTcaM7Q8Dnk9+uINwy19k4GhhXVSgzBjbBGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707988503; c=relaxed/simple;
	bh=p9x6ErywQr54S9YVSEnXCBh+8h1Ol5/3Fzwg7UmMHNc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cifnwq+6hUeuwTFo+kcmIOktUp3qhbsp+n/uwoc19IIJR/ceX0kiPsCP7mCpr1lEEzRQ0KbK+GdlhEcXvGVAS/PPeUHhn3qkVLxxRkATe51+QQrJVt+qltpR+xvndPVT0+WBldljttdi1+iWz8yUc0fkj5uvZQfcRQLw/hEROoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BFwvTy/u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4121a8635a2so2269955e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 01:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707988499; x=1708593299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVDQUeuEEPqm+MPqe84OMfwLiQomvJezewz9iRHqCtI=;
        b=BFwvTy/uWNrJS6s6eNJ0AASjSIJJrxh+je8reMm1wwN2xqg8t+ABG6K36nw3WzAZmE
         EhGhQAd1MJMZbNkaUPsKNWJDpQ7CQtNUy7yZONxD6j3ZEAXh6T2+hO04FWKutA0X9ash
         uT2WQg9W6yYi3PAFHJwuWOTfMU7LMeHyBhkrKGa4l9l6DOwOIBEgXcHmekhuDyxPrq7K
         mtGTdN5OEe+leRAa7BjtBp04TVP8skMZfKDKll+UbyTUWeAX3xpJGw/w4RMgjV/T+7eb
         CxjZsPThOQ78bb5k/9ktFV72zPOP3iZs+c5uUeg0Nl4/XYzgQvmnTeXFtSbgN5ue4Mq4
         CTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707988499; x=1708593299;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVDQUeuEEPqm+MPqe84OMfwLiQomvJezewz9iRHqCtI=;
        b=uitDuUmana1uZsgISq+Otp5uTKcgtNFrWtxXU+2FN3I1pGuwZabm1CTOyaHX3yBpuh
         5kNg/Z4zoUWRiHVloXQ4snIVID7QnEPFttJrNwOP7L8ohVAuFGd7D0X3hH64JnjIkm0m
         4KLVzFN6jLTkHyRENPSPubIEk1xVoRTHsVKhkIM9nc/ARrLVQ5QeX3kYafezhEH6XwRX
         qatV54mIDg5Y3HZPhQR/S5S9mgfiWtSv4jj/Zi/LBBDjLMRnwCIwdosgT2S0rLeAwP37
         IDnZMEGEOtaW+AW2pOv+h8v4UrYujz4scqGg+yMOqvQ+rbUQzY/lOPCKV83/l1lVBy3e
         xdKg==
X-Forwarded-Encrypted: i=1; AJvYcCUtc2nF4dClwkgrD9KIFkU2klgL+96tiuI/e0imxfoYaXASd1sLGMGOygfr+TgeSIDni/NFOO7Wrz6SlIJ/XjNwnE0ioDegjg2hAA==
X-Gm-Message-State: AOJu0YzoqjBPJS9PVzdEuzybaFWoaq37fwQk6reOZ1rBVIcJlDyqPVO8
	G3wK9Fnq/PMH1XwusHkQNhiH5uo6XGBGFPE1JY2CD8BuU3mxDx+jT4VMl7Df7p0=
X-Google-Smtp-Source: AGHT+IH5kDGi+JeLLvcx0xO+qadHYuqKkPGUajPd72T/1qP3hgDhWZYq9EoKQFHEfXFZ9r31a2kcFw==
X-Received: by 2002:a05:600c:1f89:b0:410:656c:d6d with SMTP id je9-20020a05600c1f8900b00410656c0d6dmr799456wmb.18.1707988499149;
        Thu, 15 Feb 2024 01:14:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm4371249wma.26.2024.02.15.01.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 01:14:58 -0800 (PST)
Message-ID: <cdaffd20-1df4-4f73-ba96-9625e0749269@tuxon.dev>
Date: Thu, 15 Feb 2024 11:14:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: renesas: rzg2l: Add suspend/resume support
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208135629.2840932-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUG595o8u1kgqW6DxfvBuzKuOPv7XkJhg_GQmnbRui8Tw@mail.gmail.com>
 <2dab40a5-1e9b-4396-ad97-b2a810ff703d@tuxon.dev>
In-Reply-To: <2dab40a5-1e9b-4396-ad97-b2a810ff703d@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 12.02.2024 17:35, claudiu beznea wrote:
>>>  static const u16 available_ps[] = { 1800, 2500, 3300 };
>>> @@ -1880,6 +1938,19 @@ static void rzg2l_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
>>>         seq_printf(p, dev_name(gc->parent));
>>>  }
>>>
>>> +static int rzg2l_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
>>> +{
>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>>> +       struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
>>> +
>> I think you also have to call irq_set_irq_wake(pctrl->hwirq[...]) here.
>> Cfr. drivers/gpio/gpio-rcar.c (which is simpler, as it has a single interrupt
>> parent, instead of a parent irq_domain with multiple interrupts).
> I had it in my initial implementation (done long time ago) but I don't
> remember why I removed it. I'll re-add it anyway.

I did some investigation on this. It seems adding irq_set_irq_wake() is not
necessary as the pinctrl has no virq requested on behalf of itself.

With this irqchip hierarchy (pinctrl-rzg2l -> irq-renesas-rzg2l -> gic) if
an IRQ consumer, e.g., the gpio-keys, request an interrupt then it may call
irq_set_irq_wake(virq) (gpio-keys does that).

irq_set_irq_wake(virq) is forwarded to pinctrl as follows:

irq_set_irq_wake(virq, on) ->
    set_irq_wake_real(virq, ono) ->
        rzg2l_gpio_irq_set_wake(irq, on)

As the irq_set_irq_wake() gets a virq as argument and as we have no virq
requested by pinctrl driver there is no need to call irq_set_irq_wake(), as
of my investigation. Calling it with hwirq will return with -22 and calling
it with virq received as argument leads to deadlock (as it's the same virq
that consumer already is configuring with irq_set_irq_wake()) due the
following line from irq_set_irq_wake():

struct irq_desc *desc = irq_get_desc_buslock(irq, &flags,
IRQ_GET_DESC_CHECK_GLOBAL);

What we can do is to forward irq_set_wake() to the parent IRQ chip
(irq-renesas-rzg2l) with irq_chip_set_wake_parent() to let him set its
wakeup_path, if any. But, at the moment the irq-renesas-rzg2l has
IRQCHIP_SKIP_SET_WAKE thus the irq_chip_set_wake_parent() does nothing (but
it can be updated for that). Now I remember that irq_chip_set_wake_parent()
is what I've called in my initial implementation and removed it due to
IRQCHIP_SKIP_SET_WAKE.

Please let me know if you are OK to add irq_chip_set_wake_parent() and
update the irq-renesas-rzg2l driver.

Thank you,
Claudiu Beznea

