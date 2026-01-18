Return-Path: <linux-gpio+bounces-30692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354CD391DF
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 01:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF393010753
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 00:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF70A169AD2;
	Sun, 18 Jan 2026 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJwAZOfj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF533987
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 00:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768696061; cv=none; b=OE/SCEvr0BjQXCjYKzuVc3Ni0gbqmRNEajge0JMPrXREzxLiN9YAdD7XV1WEjEovSzT7N5ht77LMRz77OKJO7iMyXclRmpclOBDXeSaBR5Hquq2i4z+0NcXtL6h9s3wULYebuJElqzNJqDRHAT+DP//OZdAZkqOnR53YYf9Ttww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768696061; c=relaxed/simple;
	bh=UC18EEQnpo5KNQ1B8+0gPq/jSkfQsmAtHCiWzpfW+1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQpLywWi9jRg2V67lJeMuTfbLzuwcWU2VU842iy3BOiFzkP5zfQSMp55sc0hPQWC6K/2O52bGk+4u9UMGK6DBxaLVhCzFYe05Ffv54OVNnVU4T2NzU/BEWmAjAx58HW1mHMl1QHgk4L6iaYrDDaxYvMq5p6z5VhBeL+1WiOV9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJwAZOfj; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ae5af476e1so1571821eec.1
        for <linux-gpio@vger.kernel.org>; Sat, 17 Jan 2026 16:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768696059; x=1769300859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bfyXBIPR2trIB5PXoGw7goBrIzOi0pwZk7JsXji+6PM=;
        b=EJwAZOfjp8QoBsvbqulEdFR0WDRpazN1rLCJpQyeqn69QtcOqYu+M8RUcx7L0ZrIJW
         6Q1Z2FFzfrOJnc//p7QQMGCiYQPPGxMXzLL1GRzWUAZK8IsUOY4TubdaOExKFjSqS//t
         QPpT37vPOB4xqkoZRSc2j5hWsbXkLSs0S3GY+jQAUwcsZ/o7x32pOBzI6AIENt4hhVqH
         ypaIaPS9zVN/Ku5O48nZiMrSnSYrAQqH95CBr3byV1cjYzH40EEgMdNZInoEuo3jhrZt
         UxSiSt+YRIC63/u9CP9SF5TIiQFx0Xjt8SRJT04dOwYfZNLg7SfRVPxCasQiiK3k+Ggs
         eb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768696059; x=1769300859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfyXBIPR2trIB5PXoGw7goBrIzOi0pwZk7JsXji+6PM=;
        b=rr3IuMtc9Lgmqx42OVSE3G02CSJPfEo4pFJQ2afzSu4uXA7dUCoHuJ8IZotTogVnH5
         FMTOXUHrVRCC7iFs+jt+8AbLoWuDQ2TbjA+E4RUhNQAO3X4ysW2S0b3DUuuF/VD4jE4Y
         +aGBKnDeD4oQFbJ5rsmPVO702t063oznzf+05bYrXlghrkk6RwNyU9EcyOPfpsH0OeAp
         ykflNci2BXWTnzGXZicFNLiu+uHKjj/1MEXsHEPDL/OFkXZkEwo0imrZ2UYp0IQJgCQ/
         SVZI476V+PkwwlsupNmPO0HZdyRI7sCoIlCQffxRUuwfWJrKtKI8E06RXm7lTa87jBm5
         BWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVpSXBJ65SUpVkeEMovBWsOlRmKMUgaifdSnOBO30M9D5PR8AYXVw5kFH86N8KZ5ZhhhzSiVrnO9NZH@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRVL557/iFjUWZQM1ZWzqb4s7QaRZwldLfdUWmlXeHzfYAXaq
	ccDi/+7wAAdd9tjr2K/1hLSNv6uJODYrz2fyFGV3qCnuYPTnFsMrJmtl
X-Gm-Gg: AY/fxX7ZQj/NMP3tDdYrrGr2VX9EGIkcMXOMErK8QCsqfUNbGdHcVuTqQTZMVAyaqxk
	IjU5BCejDHl3xl056UvkDNhmIdjaLlgqf61pk03hNHAd3SeSuti9N/7Xyc1Hh1LomZ3/ngfnujM
	QtUpQ/MH2vOoavWGsKM4zUr9oL8YekCovBQWkxN+NLD/M53Izr62NsoVoVPEAwCQ6ZAR5DCIlXN
	asIHFyzIWYFQvA2FIxerhZ2sOkfxfF8zjLRO1UQyRCm1TOi3cxa8O+pe4W89seP/FjOZ0lpbJC6
	DS5nl4sQZvkLeKxwTDXf0moAbRdYGBapa85xAquls+zAms86Pl7jLEaA7d7hteD3AetIqh8p7jp
	5qe0uMCYyGjBNrZ7z8Bxb4lp/Y77ebIYMmzuATm55R14+/UZxZvuxl8p4fY/VxxagA9bGnih3qC
	OOuf9olu1+XlALifhZPdsw6HfOYHyl3o3r0sAVw/1CpqkEwO5vVCexQ1T1DrmV
X-Received: by 2002:a05:7300:4347:b0:2a4:3593:ccad with SMTP id 5a478bee46e88-2b664300ff3mr9615863eec.10.1768696058870;
        Sat, 17 Jan 2026 16:27:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c65sm7335128eec.8.2026.01.17.16.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 16:27:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
Date: Sat, 17 Jan 2026 16:27:36 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nuno,

On 12/23/25 04:21, Nuno Sá via B4 Relay wrote:
> This is v3 for the LTC4283 how swap controller. Main change is that I'm
> now using the auxiliary bus for adding the GPIO device (done depending
> on FW properties).
> 
> Similar to the LTC4282 device, we're clearing some fault logs in the
> reset_history attributes.
> 
> Guenter, in [1] you can find some replies for some questions you had in
> v2 that likely you don't remember anymore. Regarding the regmap story I
> ended up adding a secong regmap for the 16 bit wide registers which
> seems like a clean solution (if I'm not missing nothing).
> 

Sorry for the long delay.

Actually I prefer the solution used in the lm75 driver: Map all registers
to 16-bit registers using a regmap bus. Would that be possible ?

Other than that, I ran the series through an AI review. This is what it told me:

   Identified Violations and Observations:

    * Alphabetical Order of Includes: In drivers/hwmon/ltc4283.c, the include files are not strictly in alphabetical order.
        * #include <linux/hwmon.h> is listed before #include <linux/hwmon-sysfs.h>.

-> Actually, linux/hwmon-sysfs.h> does not have to be included in the first place.

        * According to strict ASCII sorting (e.g., LC_ALL=C sort), hwmon-sysfs.h should come first because the hyphen - (ASCII 45) precedes the dot . (ASCII 46).
    * Documentation Discrepancy: The file Documentation/hwmon/ltc4283.rst includes a section for "Addresses scanned" listing I2C addresses 0x10-0x17 and 0x20-0x2E.
        * Inaccuracy: The driver does not implement a .detect function, meaning no I2C address scanning is actually performed.
        * Guideline Violation: The submitting-patches.rst guideline states that only specific I2C addresses (0x18-0x1f, 0x28-0x2f, etc.) shall be probed. The addresses listed in the documentation (specifically 0x10-0x17) are outside of this
          approved range. While the driver doesn't probe, the documentation misleadingly suggests it does so on non-approved addresses.

-> Please fix.

Thanks,
Guenter

> [1]: https://lore.kernel.org/linux-hwmon/0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com/
> [2]: https://lore.kernel.org/linux-iio/cover.1761588465.git.geert+renesas@glider.be/
> 
> ---
> Changes in v5:
> - Patch 2:
>    * Added a secong regmap for the 16bit wide registers;
>    * Add default value for rsense so that we can probe without FW
>      properties;
>    * Make sure to give the right file permissions to the reset_history
>      attrs.
> - Patch 3:
>    * Make sure to get the right regmap (given that the device now has 2);
>    * Add error handling for getting the regmap.
> - Link to v4: https://lore.kernel.org/r/20251204-ltc4283-support-v4-0-db0197fd7984@analog.com
> 
> ---
> Nuno Sá (3):
>        dt-bindings: hwmon: Document the LTC4283 Swap Controller
>        hwmon: ltc4283: Add support for the LTC4283 Swap Controller
>        gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
> 
>   .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
>   Documentation/hwmon/index.rst                      |    1 +
>   Documentation/hwmon/ltc4283.rst                    |  266 +++
>   MAINTAINERS                                        |    9 +
>   drivers/gpio/Kconfig                               |   15 +
>   drivers/gpio/Makefile                              |    1 +
>   drivers/gpio/gpio-ltc4283.c                        |  218 +++
>   drivers/hwmon/Kconfig                              |   12 +
>   drivers/hwmon/Makefile                             |    1 +
>   drivers/hwmon/ltc4283.c                            | 1766 ++++++++++++++++++++
>   10 files changed, 2561 insertions(+)
> ---
> base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
> change-id: 20250812-ltc4283-support-27c8c4e69c6b
> --
> 
> Thanks!
> - Nuno Sá
> 
> 
> 


