Return-Path: <linux-gpio+bounces-9572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A45A196874C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E891C238B2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9CC20010F;
	Mon,  2 Sep 2024 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjhtwRsS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DB19C577
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725279043; cv=none; b=daPJuQ5CBdtKvPyKP8rXa8UMlHbvq6kOWYeUhJ0rJUtj+C+hNeiqAzBr2zuCiwVnMcCwnuT6iroZOn1QDVnnaRB1L1fgCexB8dUxqZnx+gwdlpqDTwvzOoyRRYDH0bUPl4WdHwsDGILKzmoBbffLXKHDVjB5YWSjFEx+AbxfQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725279043; c=relaxed/simple;
	bh=WjoCEN/5UCQq8uJHn8k9mSBjz7UjzGxI81VkCBkECbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfpxOVwY1QTI7E8Ni7w6B+AHj4yE6QR9w7vCS8XNzwoZGxd4Zq9eNHKVLXWEqBVsS8FYT67XCm6Bir6D+nKXXbVTM8I28JsouG5lbusMCWSl2b4AP6cSk0wNMXdYWegv+MVzAdkrES9iShuqFOosIWelOCwDRe6ZS7a5Z/vz/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjhtwRsS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42c53379a3fso2797495e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725279040; x=1725883840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9hxy1+Py626iXNMz3RULqAkKDWsjstYo64hGWYiTvzE=;
        b=ZjhtwRsSewjFsGI0tb4BqZygS0zPhonYQTR7/RHu1DbawiTOFgqQeOJFfi0bcfB3KT
         A/TytDjlXK7oYE/0cj5ASz3BmH+pQ+lwJuhnkTJIjIWC6v6Q8gZPzHYFb2R0NyRz+9YP
         tTV5WNkc44PD3+7r1pYfp8UWUC8rJmfwpNaP2f+hn0xZrhIK+em/O4VwqcQ0+5qd+xQG
         TCy7P9l8w7sCbjELPf20IcT+Azap0Xoc5R9bumGPgTUC1XE9v+F3SVRgG3N1guQ1p6AC
         sl6GR9Ccw4kTTMUtrbbUz5Kk64aHEKX3LMDyJYnV4u/KWH68grrkQQ+6D0Eh+qmXCVi1
         fLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725279040; x=1725883840;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hxy1+Py626iXNMz3RULqAkKDWsjstYo64hGWYiTvzE=;
        b=A6CfH1D+v04ySpMcWv4frZqY0ylwPMjX0Zvlp+yiyI6SrV17c+3OcdqPBvJnFFn4U6
         atTfcBZzh+fajShIPGmHNB+DzSMt/H21QUoX0O6zf3zm14UVZgvxoIXi896YW/OUdKhc
         MwO6aCTXHBZCArsoMWQHIEs0jqGIXCYrKu5IxY7NNWKj8/58FJC3DJ43mphoU4wYZL+X
         cgOjhaFk6Ng1jzOD6x2cgvyJWjjI5w+9nxm5hXKkXgLbJRM2DujyLzVzzNidM4x4FC+l
         lUfGW8v/hES3+RVfKArvyr6cHc7jDuhXkJppUjeSGL7XeiXzGHYPnvj6/zAat9Ia7BVB
         +yNA==
X-Forwarded-Encrypted: i=1; AJvYcCXzRgNrlHjJV3in95JMZ0PUycCUL4mrHIFU7ozN9BWKTZ0UrsfFhHMAHKqN7hRjoZlFkyfBezm3V6qP@vger.kernel.org
X-Gm-Message-State: AOJu0YyekkuFwHRUiQHWIAxOg1JJzRWb4iQX0uGxMqe8rwlquwc4J0TZ
	9zETaFWnY+oiAnS13Vv82aciunmzhbNoRE3ZmmnM8IacI446ry62ufdLCw4OFXM=
X-Google-Smtp-Source: AGHT+IGTUVtt/3Eqd8xCpJ4jyi2Lr9nTAGjjxDUgERtpT+tE0vuAbbDDlCV9NGlJt7ulF4VOBjriog==
X-Received: by 2002:a5d:6da9:0:b0:374:cd01:8b81 with SMTP id ffacd0b85a97d-374cd018e86mr822355f8f.6.1725279039812;
        Mon, 02 Sep 2024 05:10:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm11261295f8f.62.2024.09.02.05.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 05:10:39 -0700 (PDT)
Message-ID: <b67efbc8-ff21-486b-9961-498eae0f85bf@linaro.org>
Date: Mon, 2 Sep 2024 14:10:37 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <CAMRc=McgbL5DCu2mr6oWERMQMFQU1Bm-1BkC+XR=-2fPXpOW4A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMRc=McgbL5DCu2mr6oWERMQMFQU1Bm-1BkC+XR=-2fPXpOW4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 14:03, Bartosz Golaszewski wrote:
> On Mon, Aug 26, 2024 at 6:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Drop kerneldoc descriptions of struct members which do not exist to fix
>> W=1 warnings:
>>
>>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' description in 'pch_gpio'
>>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'compatible' description in 'syscon_gpio_data'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> I have a different patch in my queue that addresses the syscon warning
> already. Can you resend just the pch part?

Heh, you just picked up something which was sent week after mine. :/

Best regards,
Krzysztof


