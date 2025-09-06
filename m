Return-Path: <linux-gpio+bounces-25695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F4B46786
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 02:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3696A5C48CE
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 00:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBC3145B16;
	Sat,  6 Sep 2025 00:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZih08Mi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390517E4;
	Sat,  6 Sep 2025 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757118442; cv=none; b=d+ns5G8Wzq4/8/OIHVeQ7sKifxqjTSZEkUy2zPAyoNWMqeXEiHxRlRcajBp0c7THmTeqNOtox5OU6LpXQ30qYBmQRiR/rmoviTap/QN4Uu06F8quGgjg+NJdhlNDSivTQ15hmBvi3LNltL+2aM5sq5B1nz9JzzrqhBRKf9b2ZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757118442; c=relaxed/simple;
	bh=bgAaODRJaaXL55cTVTD4Jc8f3pi5mNBqrRSo/rUn/SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Da1lY7kerbZjVQphWyT/+JFaMSCFbznCh9UHQO50a0T1Mq216V7i0nemI15Rl9T7AKlNlhhS6r4nXR+x3CpuYFIaAGlmwHgYWhLRc6OKsgwPUyLxSj//nOiAuV50ldFkfaMMCEOsO1WtOey5/ZoEfVjGmCGK15b5GeWdx4d/mcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZih08Mi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2518cf2fa90so607275ad.0;
        Fri, 05 Sep 2025 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757118440; x=1757723240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=flbI5AyyYDq8+HOWMfiIyMCtsOE/imNqv1g0RSYJbFA=;
        b=WZih08MiiwD9y8Owz+7AE4+fJsT8Iq9hAnETEjsCMQIVdCUH6zy+vB2hyIDrnOucgC
         aPK5SzfLIylyjmxWdjjF+cVHmTtRbmyskjTzrVaqoDrUfQjhIa6Mq+hfN69FASIGpZRU
         2B5DgbhGAWiFsWY7jZZEGP9QYcxJsBsPtyYSHgL/tvoiFH8cvsh4S98lv5f+wKAvIaWO
         E81sQPFGjibnruFGO/77m8zUTq3Nj5l2kxuHdGkShsW6M8pMcfYcRFZQU8t74KM1IxLI
         glKoegCNyNmzmmvMK+wPJlGiRmENjn9mSwaDvYcHtPTRNZ0YPJqPaLoLPkNtTry4i62V
         R2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757118440; x=1757723240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flbI5AyyYDq8+HOWMfiIyMCtsOE/imNqv1g0RSYJbFA=;
        b=uO7HueAezzPBqkS43MT5bAjYZcYq7Hy8kfhfTun1vd9vc7z5QulC+SY6U0I8sLjR2F
         J5grs9k+GM14PKGrtsrA/wnEb4wJWg0oGhI95zyS1kTJ8Vo9mhvcWKDGi/Kp4sv2iSCh
         TRS04pcxHpIk4MAT3g8QFKVPPetYCYlgaztUh6CWgnF2zwIhsngLxXv9ROvW7Bx1lqcr
         fEVBzrGOrk1lsAz4JX/MRChFdVMdkaQniuEiturg1VmgowRwtSVtbu3fopNXe5u0IQ2B
         eFcHtz9WI0hTu0iYYlqrGuYlCkv12zd4s2GM22k0/xSSbkxvZppSguHUbWZVbwjPy6KQ
         mnUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/b5E6Fex2M1N4jFgwdju9/dB/0zt2j/s/D0ZwlkLBJIjNkdBLCHhA8WIA+Y2yg3afc/UJJMAE9vMgl70=@vger.kernel.org, AJvYcCUOvzsQZaXuv8HuAqcjPpuI3LVhYJLzJNb4upYTSq32f4NRg4PMhRHTq74HosFgJZWCyPCzwgBmnnQp@vger.kernel.org, AJvYcCXJiTl9P2BszFWdxCCy+7bUOvmkecSGu//rHTZbp85PPUHTsau78gskyooB01342/341B3JYXsSoUciqA==@vger.kernel.org, AJvYcCXrYbUWkCbegzjXuO5SPL2ei4/q2of7QdIb92IVuPLoIZyL/dLxMtEaVzoV5TJjLxYugYTJ6aPrZnj3@vger.kernel.org
X-Gm-Message-State: AOJu0YzkS6+pc3XjS2b04biPJ1rKO1o6S/eAt0xzPoUYAl3El2OBLZTG
	6r1AYBRVs/BWbXIAwHa5ZAZZHGMLrF53RwdRmvYQGyBvJMH3xqhxvHLN
X-Gm-Gg: ASbGnctNtlZW3j14AHGuGndi9pWQDcwQBjjwZ+1BP5uQq8HenJw+bQ4yLOK21N0+T5H
	VJmDEgR9cR1mLWlXqZbMvfzNXmy09OHxsPXYwD+elo9yZs79mR3RrH8XBhJQHrRZgrL1u95RF3/
	LhdZp0mRp6q3uBahXhXixZMhcD6SEImKoCbVWZPf3ZuXjyO40Yqjh5sGM7S9sfobwBoqD7FE0qT
	Yms61UdlDgA7oW1eo5QOg5n051ElQi4j7Mlpu4qDM7v/1zuV7nO+7lQBsNavUxBbrxSRIq6SMcD
	1yfIkuzQPT3wIxB6cD3Yz3WDkrtbL2uYon5AgDv776epMCRT33Ineb3n4kZae0/HJTEwvFXoSX6
	HYRcW8YlS2sddxFpjjXmwDSs143+jeAMTJ3zltY7U4cRDAhCSgCfwTquMSEGDD9A5w6tRTu/8sS
	7cVJRjLA==
X-Google-Smtp-Source: AGHT+IF60LsDgF5p3wdFbbdHualqSeKDgxKiGX27Si/RTh45rxYyY9jMYurFIZjhVu+qI2aZy9EDsw==
X-Received: by 2002:a17:903:4b50:b0:24a:ab0f:e87e with SMTP id d9443c01a7336-2517301ce3cmr5668105ad.55.1757118440149;
        Fri, 05 Sep 2025 17:27:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9304b790sm81095345ad.67.2025.09.05.17.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 17:27:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ef30521a-0b0b-4339-a7c5-dd4ee11ae30a@roeck-us.net>
Date: Fri, 5 Sep 2025 17:27:18 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-binbings: hwmon: Document the LTC4283 Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-1-6bce091510bf@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250903-ltc4283-support-v2-1-6bce091510bf@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/25 03:04, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Special note for the "adi,vpower-drns-enable" property. It allows to choose
> between the attenuated MOSFET drain voltage or the attenuated input
> voltage at the RTNS pin (effectively choosing between input or output
> power). This is a system level decision not really intended to change at
> runtime and hence is being added as a Firmware property.
> 

In case no one mentioned/noticed it:

s/binbings/bindings/

in subject.


