Return-Path: <linux-gpio+bounces-14844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A301BA1244B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 14:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E2F168E13
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 13:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA60241685;
	Wed, 15 Jan 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgRGiLgm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9AA23F294
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946020; cv=none; b=AJhvnro32Y9G0dWM80piyfLlYGhwGleRgsGIkbC/vvhJohdlW47BQIxV/qkrtWNEtPr6JfCFee5EIllIr5rOQ+zNXm6ko06wkvdvRAzIamyrd/Vl8oo8B8szX0705a+ZXUtDEfLTFjLMC6qRj7Meqe6PScViL9GRLCTN0oDqx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946020; c=relaxed/simple;
	bh=kzlfC1+cC7sNCeZW1PWc+gUgaGnEtxzXhYzYXBStw9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfZ24bwOGIkQuQ2QonEIyMTZQnX24KfM3IQgOl0zX9lE1jO1jZAF2LzVHCrt6kxGUgL0KW2s3SbvCxZLMyxc1bLROz2zLMcEnV8rSZuMMtgjOylIV7KkLCo5t/Nw9XV9rb8lyHGl2A3YBtH7RoAItsXJO60z3qDXMsgKuuIIHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgRGiLgm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso8519405e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 05:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736946017; x=1737550817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6SLQpzwmxyFpdnS0Qhwyf7oPOCOoHDHPhYDyk3jPItc=;
        b=KgRGiLgm7z9SGfNJJfW5TIKTHlTarTNB1JLOzkn78+2CbLy8Oa/My1d2LsWinDHTu6
         1WDg6DQeKydTbZqfQLDNfA+jhPazMpradUulnNSdHg8WsscQgsfdEaFdvK8nTHQG6IZi
         fxP0U32hznRq0bnA0HLCkAQv/6NnV0VXjg+OHgTMo1VNAl80DAFrggZDgo7sSEQWtzb1
         LUff8pg4Hl+8MSn80cZQCP7nvGUUFpqhAvvyVQtEKqBlEegvyTMkJAiFTW8RLvA8CSTT
         bRK2B0Q+61aVFxEAPhottMOL3GaZXExyrGsWELvpVPpb7Eks/dhsQgAxkimwEE5B98sJ
         jWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946017; x=1737550817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SLQpzwmxyFpdnS0Qhwyf7oPOCOoHDHPhYDyk3jPItc=;
        b=RR0FhICU188UOS+6U0EykB3zzlPZcCQOnN+fi7FXyKi8YtPJ8rD5hrr7pwxQaXL3YM
         uUqeK45/vRqj2k4W2JLXrcRd9mKwb3DcuJI1cxhaINRcqX9ROlJo9aBykgQdlVwgRzra
         ScjLU0LUfT1ZxR2QogBQ6z61pQi7DY/B2V7Mj6YmNCpkONeF0Mm8JTHWdlX4wKhx027D
         iNkkYxqvsYDw+dTTIH2B76E3WHZ2HmKl3EqOwXsIBovfIBW0AHP7iZPdu+Yy43BLMHr6
         KBTO7uYPfBfHsHu7ah+zoyHFCFC/snPe3r6DA9qgoKrI1Aqj13/SlmbetcyBh72jtaja
         jMMw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1RB9GAeEt25P6AQkQ6MUM2/+ZrcbQvUgMLa3Fhsl8LoRRM+P6SZVSbFw87YbdnPt8B6yv6WV+zw/@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUJcvdnkyloaGsIBoFTNinW5tcDUD6I58Osyu3NfeD5hhVgDk
	EDa09csw3v/H6vUzBJa6cCh54Cd4b17Mp6uBXrT6ha1h3ndrkk9gDt+yAirp6e8=
X-Gm-Gg: ASbGnctDAVBNO2QzaziJwvrHcYjIi575aGlqEYDwP9ZAzxK6qwzPmuxcFOVn98Ls4sm
	GxquCWPneEWRbyVJAENP0IO635v+MAACK6LtDcip0hsKcUVuTmhpaE/N0CTeejMs8ZHsdgoEz+G
	Nrkf0lInkH478NcHOQ7WBsRHwnTJVmjQx++oixgT4eefklBu1u2HnsNfHVyB3QLhlgEBogjd5YI
	AG5Yeg/Wkndh+N/MAaAg3zkL9MTUNJk7D3eX1K2Kj7jnEfPGOYb2CiAFjDaADIukXB4FGf0hWCI
X-Google-Smtp-Source: AGHT+IHGXsmacyZvTLB1+zaeUtblvRQoTtrVI7XUlTrmBMIq4H1j0GTh8m9KEp0KmLuowI3RDVUF4g==
X-Received: by 2002:a5d:648f:0:b0:385:fd31:ca24 with SMTP id ffacd0b85a97d-38a873105d7mr10755610f8f.12.1736946016850;
        Wed, 15 Jan 2025 05:00:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38d008sm18004245f8f.59.2025.01.15.05.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 05:00:16 -0800 (PST)
Message-ID: <110c9b58-9ac1-4a24-84da-4dfc722f1ea4@linaro.org>
Date: Wed, 15 Jan 2025 14:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Nandor Han <nandor.han@ge.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 12:51, Linus Walleij wrote:
> On Tue, Jan 14, 2025 at 8:14 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Replace ternary (condition ? "enable" : "disable") syntax with helpers
>> from string_choices.h because:
>> 1. Simple function call with one argument is easier to read.  Ternary
>>    operator has three arguments and with wrapping might lead to quite
>>    long code.
>> 2. Is slightly shorter thus also easier to read.
>> 3. It brings uniformity in the text - same string.
>> 4. Allows deduping by the linker, which results in a smaller binary
>>    file.
>>
>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> For a while I was critical about the string helpers but since both Andy
> and Krzysztof like them, I will consider myself convinced and start to
> like them instead.

It is pretty subjective, so I also find reasonable not to accept them to
your subsystem. To me they bring more benefits in complicated cases like:
	(data_in ^ in_pol) & msk  ? "hi" : "lo",

or from pinctr (note the line break):

			seq_puts(s, pin->output_value ?
				 "high" : "low");

Anyway, thanks for review!

Best regards,
Krzysztof

