Return-Path: <linux-gpio+bounces-2934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78ED8494B2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 08:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECF801C23E01
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 07:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44DB10A17;
	Mon,  5 Feb 2024 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezQUsg47"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8974107B6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707119070; cv=none; b=Enj3uQqaidHa/bh8UIy12HlQEho9c81uZa7t6Btd6o1/4/afxkGjiHcq8QY2ZF8Cnz2Q3WnNDQtZPtGENPowNOOnjQwBxME5V96inzfAVg+JNG/eMNN93JxLi9Hy+8r7INrLPKzNBfZg2TiWF4GK85TArAKBecHqL6DhIM+Kqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707119070; c=relaxed/simple;
	bh=lnssQR336wGAJzOMEuPdMhwOqaWRPSnm/w8CRDWcKXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNtEds/U1AKgxF2K7SOD34EFlEAKLBjMrfkW4+nJGNnLG2xplYjLVm8StmfzcTncPgpZxKEJnhm1WcyHgUPuY5cgRlzRUh9iQbUx0MAnSTHlATh45YZHZsC7riTnFPf3aw6A/8J7PQyYk62B9awzDeKVCRzFX0jD+P95ozOacjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezQUsg47; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28a6cef709so555007666b.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Feb 2024 23:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707119067; x=1707723867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXBwFZ5M7dZj96i3ewL0z0TxTvkGTRW0Te2D49TqtKI=;
        b=ezQUsg47dw+MFlJg1kck8/JsyPs8UdnyGRQZzOe11Uw13DU8lkEHqsHIy436BbjGZv
         Nig8fRB6OIEafrmcjNhiMJawr33T1gJfHmpqm/IAavy0erKnH945busctowSuh9DuXQ7
         rn7zRAZ2sunGos5fl3eaE+dOhQt/CgdltubCRjECj2+0Zh8LoYKS0Bz0J2zkaLOLJJPv
         uVe21YPq9AOCeEe981sqKBa1eQl+w4fySI8KGchq9JdIbiH6taxveU8TuLC/Ljtl4S1M
         pHqroA6PtKsDdbZFZGLa4rGZmYV1GC50o0WZlDLxyq7X3dgSxqMIktx+Csvvp4ghVI4E
         Dg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707119067; x=1707723867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXBwFZ5M7dZj96i3ewL0z0TxTvkGTRW0Te2D49TqtKI=;
        b=u4YAPQ5t5uSMZXzIjZ6L3srjbAX0LlYceBx7Mutet6Cq2pNjHru3qQHQk3Zi0oZxwh
         7m0nCLzob48VxyXKI/2Tl1XkAItWURCIlZfN3vwEGAkL4XADsaLXvN7x5YwSSCt1hA0U
         Cph4tzHbh2sbEUEh2gbsmGKdPh/YNPinRBYw/hFs9HU6CfFDmTOcMz++EGW1eB78vDX7
         1DWCc5PAeWepjF1WpWmLedTQp37gbr76gShai4wAyaOIO2DRH6nwEY6sXA8jsAf63Bwg
         EC3k1glHbKAhu0/LbQQ04xO4nEfnIBUhpBrdy8cwTVMUj6mEqh8MLSmH6iYsj9E0LN8v
         XhgA==
X-Gm-Message-State: AOJu0YzwbMwzLPMDTxMC42CLY9oRchdG0Y0ZwDstT0du8Xr1m5IqttwB
	LQPoivqqusYv8jX5u2DpBoTp/NTvb1NJKn7B7Hf4EYspPa+/W+abycXZJ8VLzqU=
X-Google-Smtp-Source: AGHT+IFDF1AL+dkNwymqoQ83iPsSQ0Dt7/tXyniTO0dioJyN4zEf5I6/s0hdyOW5JnLkx1pFaA7t9A==
X-Received: by 2002:a17:907:77d3:b0:a37:1906:1173 with SMTP id kz19-20020a17090777d300b00a3719061173mr5071290ejc.34.1707119067136;
        Sun, 04 Feb 2024 23:44:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWfqVrV1WxXbxPEzLDqr226uC60fayIQt9OAAqkcgfisV6V0ySbj6UOkrxj69brD/gV7KoZgKcNDGzKc2ukE+yh7DUAmtYb/SGsxjonzr/LT5miKcWIFxgs37pLZCBbhdDWaWOjA9Jq0NAzEcAy77zm3tfWG+eXomilENkXZl88x2kNJhswHzW6j2XQ6ciYiYG5H4kIGLxlWDuCIOpL3M0aNIrgBqHPSakLW41GdSSbirVWY3mzSnOD+AoXawKpCEjZjmliBaiGWXI3CY+mhbWU80uocx0zLkQ8m6z2qlzC6GyFUeZW/kkMX9qSi6RrUHjojM/azSrNRtbwAx9yZjrxdUxF4yu2axsKEoKRJb7IHuw0TxZPxM7LE+vw3wmv9z/ACmZ/gENE9haEgTQvZHDbCils3qEUG8nPHboTy+GaD6ogVTsxfkdYo/8BPmcTPC2cs5MuklMKRxcrfKaRLhhGMcE=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vo3-20020a170907a80300b00a36fee1350dsm3830152ejc.130.2024.02.04.23.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 23:44:25 -0800 (PST)
Message-ID: <c45447b4-1f3a-47a7-8111-97560838ff7c@linaro.org>
Date: Mon, 5 Feb 2024 08:44:23 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: pwm: Add pwm-gpio
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: andy.shevchenko@gmail.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <20240204220851.4783-1-wahrenst@gmx.net>
 <20240204220851.4783-2-wahrenst@gmx.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240204220851.4783-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2024 23:08, Stefan Wahren wrote:
> From: Nicola Di Lieto <nicola.dilieto@gmail.com>
> 
> Add bindings for PWM modulated by GPIO.
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Co-developed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


