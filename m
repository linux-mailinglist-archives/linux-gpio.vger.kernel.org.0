Return-Path: <linux-gpio+bounces-28226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A9C3D35D
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 20:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7163C4E68D0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF81434DB54;
	Thu,  6 Nov 2025 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvdvfjGi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA083341AC8
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456422; cv=none; b=OeSTcKHuiQ99BBKIRyWQxpcgmU1Ck9Fds0DY02IwM1ZJp5nKGzIJb8QFkm+c3Oh8woVZeGVxH0kcKvp+BhuYht3LLZZGLLq8uPJPRLa/wpGhQgVpYH7mTUBOyZjuoJRpqlzSRee7NXA2Gc31nP/3dbHPadHEfJhaUAStzatRzv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456422; c=relaxed/simple;
	bh=jSDmX26nePY3w8eDoNViNIlVz0DRTIZrQhmMhbmMeAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjL0dk1KrwXmEZhuwNtsjaaP4Z16IhZ/+xL9X9oMyhEri2ZndT2Tb+MHSTXVIocumkHd868k7HURaDgvFzqZcXkGy7j1hW6qiFbYFdpKcpfxys8UWUFRhzo2x5cAS6nSRIQdjWJyF+84n4YmaW2anX1sxbFsdWsPwYBwQfmN2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvdvfjGi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b725c6be585so20017366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 11:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456419; x=1763061219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs3IJsZszZbg8RTJIDmhoqjNZ28bmmKOdR37EWAGl0U=;
        b=CvdvfjGipxIoFjjumpSGQZeMWaJsEQZBYwozozlRPK40SGR8g8EzsYoxk1sX4LFT7B
         kuZlC8z/8dGWZagSNGaqTPKclWOJ64pRlTlly/hyZBOQjrHI/iA82PEn/7bveC2C1L3k
         /zkDTEdS4I3Q6O35xqmy97huMepuofYxexVOObeC3PmegDSnw/c1GXsS/1b1Wp/rAVaR
         M/XOyL3cYc49mDXvn76FAg9avQYUiNtZrASuPCiQoQ84HAtTs46RDJtV4NPeTrADYIiO
         GoHV80GGzfRBMw+S/SGIcn+UbeQx0IIP2eI5QgQF+O8sGcnmCLRnPMj6eoQLjCfZwoo/
         L9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456419; x=1763061219;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs3IJsZszZbg8RTJIDmhoqjNZ28bmmKOdR37EWAGl0U=;
        b=Pecur7UYX1nfzM6xYBnyEAza5XXeY/hXCSh6FWl3z79l0oAet32YygkE9FiTSzhKTo
         ufE5vCHpzS34C81a6JifCAyVfRMRwZIq0UrhKsvwFPGzjNKmb1CbFHJRWNjtPtc9zJqz
         gijD9k5VM+gD0jYFWCDEirBOCzbhTb0qCM6yly0J/0rUoQIMKUsnNrx8eWk49kCL6V6a
         3QaUFQrJGL3lE+XTbRCfhI58uOF147KzIaGcrh9zrO0+2NW9ICg6IwM4aEC6AcRfLneH
         UY2cfYdlThHPudR+TzvgG/z1oRr6y4LhjtKXnObXYGoB15INGtcOH2I5DqpUzpR1OsCP
         lF0A==
X-Forwarded-Encrypted: i=1; AJvYcCWEFC7d+kfxX5L3F0Ssm82vFpdreiUcWLQvH4+YWkrVai8CIgEU9sdw1ulW8bCFa8dAP/LySkWy735G@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcf8sEVxlq8ADBGJ91hnYxd+WAQAElBJVN03QBrQhlC+AOnXFc
	ObaagR3FXWsePmleyIHjCG4sE15W2mlVe9B5MU5pJfpC7uB9N2JEOxwLq0VOApxKOrg=
X-Gm-Gg: ASbGncvUqspz/+rFcuRF0dtUAklkoPZs1ofkfVL5jAtd831Ee+lvxhPjcq02DINUkUl
	fwTmmd9ap8vPki7QwdYb8soYrliLjvwEC+80vWFfhLl+5yfoWBDNutjaNnyn95gh4AosPr6ZXSC
	T+TL7HUBibTEuFXMzuVFCXcNguKDMbSq4CNuPGZUJ55NIwQhFu4Pm7Uk32pab5zBvcqCNEbQnn8
	/NnD/Dao8peQisuvNOFquoYT61T3YN5wMXpGddRxRFEAYj3cZieDEPu1UjgysM1f82kLaJjfSTs
	fZ+nRToSaakiOEpHjjT1A/EC3VonJzI0LxJW6KWw6nW9Ybjt73MVbT7mS/2lilvr0thZIPeS2xY
	EjIz+4Gn6i4yT42NQu8ueiCx+rELQuMcMmb6le7P3Vr6f/wJOhFkgu6LZnJu4tvSveuLcP0o2Xc
	dBE2VmLGkjS4VkmEbUOart
X-Google-Smtp-Source: AGHT+IHph4UVtkfqqcOCpm0MSxBkSn+jtLUIbiXMRaQcHydRVPc0JgGsJTlozwoQzK/2CK5O3tSVNg==
X-Received: by 2002:a17:907:7f29:b0:b46:6718:3f1f with SMTP id a640c23a62f3a-b72c0b02375mr20083266b.7.1762456419105;
        Thu, 06 Nov 2025 11:13:39 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97ea95sm27718966b.44.2025.11.06.11.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 11:13:38 -0800 (PST)
Message-ID: <cf23070f-8a3c-4c13-a46c-dc95f044c936@linaro.org>
Date: Thu, 6 Nov 2025 20:13:37 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gpio: aspeed: Simplify with
 of_device_get_match_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
 <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
 <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2025 17:23, Bartosz Golaszewski wrote:
> On Thu, Nov 6, 2025 at 5:16 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Driver's probe function matches against driver's of_device_id table,
>> where each entry has non-NULL match data, so of_match_node() can be
>> simplified with of_device_get_match_data().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpio/gpio-aspeed.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
>> index 2e0ae953dd99..3d675b63936c 100644
>> --- a/drivers/gpio/gpio-aspeed.c
>> +++ b/drivers/gpio/gpio-aspeed.c
>> @@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
>>
>>  static int aspeed_gpio_probe(struct platform_device *pdev)
>>  {
>> -       const struct of_device_id *gpio_id;
>>         struct gpio_irq_chip *girq;
>>         struct aspeed_gpio *gpio;
>>         int rc, irq, i, banks, err;
>> @@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
>>
>>         raw_spin_lock_init(&gpio->lock);
>>
>> -       gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
>> -       if (!gpio_id)
>> +       gpio->config = of_device_get_match_data(&pdev->dev);
> 
> If you're already doing it, just use device_get_match_data() here and
> elsewhere in the series.

That's not exactly equivalent, but I guess it does not matter if driver
probes only via OF. Sure, I'll change it.


Best regards,
Krzysztof

