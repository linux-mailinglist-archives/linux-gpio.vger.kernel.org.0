Return-Path: <linux-gpio+bounces-14452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D022A00302
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 04:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8521883F13
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768894C62;
	Fri,  3 Jan 2025 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9EnfUs6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9E19DF8D;
	Fri,  3 Jan 2025 03:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873493; cv=none; b=tZPZUeG20XvgboL17AyxqIQrt2ESuN1Zo6jAghfo1J4fBqzQg5I98ROvLzdkIMDkmwinQKXjlvcFDfyRSdlExUv/UhYUd/dUcBXy03E6T7o0CctaAl+5rb4D15S0An1iOklUgByOTTCK5hyxy4etLUCmfHOwhPYXRzJm7qG7BwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873493; c=relaxed/simple;
	bh=+vNEw7mvSYyFlTEl0QZkqPobUVKS7HtwTQ1uD/sA2Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MncnhlMMLUlURbFyYCsE7QNxq3fdeoH58mNZip28tXHzvU+OGmLK+f5o0+ai1ofHMUbhyDS8CXU2/69FqkdBbC7+FmnN2aLibmpzqUcNnmYU59owZWk0B9jv6VlVOwQA2QUmhxGGVtKIyFaTokfXduiAJ666TvLVU4if1oXdy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9EnfUs6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21683192bf9so163415425ad.3;
        Thu, 02 Jan 2025 19:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735873491; x=1736478291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vNEw7mvSYyFlTEl0QZkqPobUVKS7HtwTQ1uD/sA2Sk=;
        b=V9EnfUs6iIQSxKquaUCGF9XT17MrGR4GUFmi7NMSlj1GDEOVCA+LdqKyZ5c+wqbFC6
         EzarG8i4YnMu+IjfHidzuFN1eYHB3Fj3NQQmx0mXyOnqNDJOKQYoJD+rdAewlg1Qvu44
         NGSXju58bZE5EF9fN556ORtKtJ9MlApikccK7DEduQhV1oEtTklJsMh6rC5PgAZdZpWl
         3cCsqQ3xx3Ju0mFc2KUwVhXWki6tMqVc2Y5NPIO1mxKU2nl1n3kVdqaDej9bNhq1/9E3
         0Sf8Do/EVjj2vhc54hS5fqemuA94BeMf3nxxXlrt5qw1N/BVH2U4He/FlWYMVPxDQ2pC
         Io3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735873491; x=1736478291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vNEw7mvSYyFlTEl0QZkqPobUVKS7HtwTQ1uD/sA2Sk=;
        b=XI5G61wvAdVKeYoXGdg8BbTDIbIm6Le/IHsn2ZLBB/Vs5EInKRU6f9WDBA0zpz2TSo
         DXRJX9GbyiIORJr7AiHHECaOk2AqP6wfkBEbecf90Xb8ntFsD2E9n8Lfdv4qDfZE0PUw
         NmfeOb3pbj1/dn7JWv6kqA4CNURCc1Wrx++1psJZtSkdm+1f7bvAIhxcJtgotIObVMFB
         g1z0h3/EgOI0AkMoMHjwhBF9BNFEFaXBI5NjyR2YVTtD2v2RaZhIrxsQ3lE6GVJMWc7W
         BqbDxkQUtndFGaJHRgNkYm6Bt+wiZYQrKCODqOOzN6OruEtVxWGvRMPMCzSUjqpwa3fC
         kdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4UkM6xRtCOAIOVnjTTlgKkEVvel/P7Nn8cr0P/Khr+voMwbvBVUEKmdDzSEzFD9kyO8itj+k/7cBNGsiU@vger.kernel.org, AJvYcCXwDO9mo01t4TAonTwPCipPTuZNk2G8Ghodfn0vL2cGAFgbZO8ram6jm8X7V/xzi1KFLXLOXZ9EpIy7@vger.kernel.org
X-Gm-Message-State: AOJu0YzRli0mGRuVaWRC/fwNFWra3UbwoLCT24aSuMZ+o+CuPUTuz8UQ
	0emuF6lIWOYqXYJchRR89GlleSDFNPhNEg0qeL9+axdpRcrJ6AL4
X-Gm-Gg: ASbGnct8exAUwtS78r0BCiIoj1UPzwDgwHMBRfnt16/dK/o9xZZtvUY8UCHTAghFVFW
	2HBTRBFTE8YgWFZitOivvHFi5aeIfda07wWDe8+BF7dzv+hUuKlOuql4KBQuQqX9kIGZjvzAMfH
	J8q2vRGoUI8ESYoLKakbhzYbHplqM70l8XRVYOc9JlGS4iKSAQEpcS1zDH9KW5TOnFJGgUa6+6E
	OfkoWX79c/oDhEtthvX8FAPvXFscXMVxdM5NF36r1EGhvGFt5BcV34B85HG9s8lbw==
X-Google-Smtp-Source: AGHT+IG6iwbmNaHrDA2zyIPrBwE+9CKkNPJxRSPmnAjwAohb603uVDpcQ1QzN64s1pcUDQbgobV7Ng==
X-Received: by 2002:a05:6a00:3910:b0:725:e37d:cd35 with SMTP id d2e1a72fcca58-72abe060d9fmr68044415b3a.18.1735873490666;
        Thu, 02 Jan 2025 19:04:50 -0800 (PST)
Received: from [192.168.8.112] ([207.34.150.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8309acsm25062991b3a.45.2025.01.02.19.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:04:50 -0800 (PST)
Message-ID: <07a21d3f-539e-4609-bc60-ff320935db8a@gmail.com>
Date: Thu, 2 Jan 2025 19:04:49 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
 <20241224103645.1709996-1-noltari@gmail.com>
 <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
Content-Language: en-US
From: Kyle Hendry <kylehendrydev@gmail.com>
In-Reply-To: <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-12-30 08:42, Jonas Gorski wrote:
> Hi,
>
> On Tue, Dec 24, 2024 at 11:41 AM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
>> From: Kyle Hendry <kylehendrydev@gmail.com>
>>
>> There is no guarantee that the bootloader will leave the pin configuration
>> in a known default state, so pinctrl needs to be explicitly set in some
>> cases. This patch adds a gpio function for drivers that need it, i.e.
>> gpio-leds.
>>
>> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>
> bcm63268-pinctrl implements pinmux_ops::gpio_request_enable(), which
> should automatically set any requested GPIO pin to the GPIO function,
> so explicitly requesting the gpio function for a pin should not be
> needed. Is this not enough?
>
> Best Regards,
> Jonas
>
>
I assumed that as well, but nothing I tried worked with gpio-leds.
gpiochip_generic_request() does call gpio_request_enable(), but gpio-leds
uses devm_fwnode_gpiod_get() which looks like a different code path. The
only place it seems to be configuring the gpio is in create_gpio_led()
where it needs a pinctl node in the device tree. That's just my reading
of the code, though. I haven't set up a ftrace to verify it.

Best Regards,
Kyle


