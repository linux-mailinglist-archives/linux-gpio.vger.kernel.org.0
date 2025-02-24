Return-Path: <linux-gpio+bounces-16506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF85A42417
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85568162903
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C0619F489;
	Mon, 24 Feb 2025 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SKDifaLu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2012629F
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408186; cv=none; b=gHZ0l1zinWV0WdiDoY4MQRAMBNzvynS5+ab2eWiU4M/aRSv11HJsHkHPeGMI9KwZKk6B9CV04lGjrZcGy53+LExjS9LMCJMCamIU5b8oq0Uzr+BNzt9ZsJ3rtjjwnlL47K1fpsg8b8sVWiXob7QltOQZg5etaBTjGZd9+WMa+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408186; c=relaxed/simple;
	bh=ZONqviNPWCjRcUNPtOakpDCHBSkr5uWo/AXkP52EUss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y43ze8HzFdkuXBe2l6/o1+EQ3MYlylnULKx1sb2Wy/tega0EspHzzNi2B1XNGgCzw/L7HN0MZVKCf18drs8EcPrPnzRPGjBkHE8qETl0d9QNoNgKYpp85MDEIUknLY1OEzqdEVduUmdGtx1fOuoa3qlaCXJCcYCgFNzOdhQxw5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SKDifaLu; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e65baef2edso39665436d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740408184; x=1741012984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gvz7UH8jEtILveF4kKcrdOfSXkLJpa8INRRDchxBdFQ=;
        b=SKDifaLulAActRlN/0iWasi979GTTyf7er3WLwoUl+9cCiqmFc5y6MKxtdmRpyIega
         +xYu96F2z4a9+w6hXpGIBFFkd25us8NcdsOVRip8QfI1hSjdrjIftOphfQz+Vl/eu9IK
         r63iL9czUvj7FXQQSUvtjpSVQ5/3cYWLQ9YuTWUcFT1/ubLXciY+Irzg1mWCmOwMOziE
         9Vj5mWsLq8xQy0cv0vx8sR2aQl3d4RDFV0RK/UILikokFAoBZNWINL47ZhyRR2j0AelE
         DXDlQ7MJO8yZgvxvtKx58A0etmqstIwEaFISmVLSP3NVSAtzruJYWJd1gvYOOMxxYD5h
         ftMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740408184; x=1741012984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvz7UH8jEtILveF4kKcrdOfSXkLJpa8INRRDchxBdFQ=;
        b=dgxVvTTMgPNZ9ee3lJNLN/gcdOymOfOgEeMvDiTX1zDkBDCn6CikOSz6eNWgiqJ1uX
         bBp3XEQsoU+yDdlGJ76KGS5P6ct1Po9LGkNO3FHVk0ftwO1xeX7Od35RMhnftv8Fbm1z
         2okpK00+ifCK7TO3jL+l8xRo2BOMBY/wj2FRpAze8IVhtKkxMZ4Md8hJ6vKijFYT5v7n
         sus4E/6PL8zhQPPjXxW24pk/tXMJ+lV09WymzUNyR+bpVUsljZve20d/uXXf3TJZiK4w
         WByM40fCeg67+nAuC+ccfkJ5dkKNoaMFWKQwbbKy1YdcAuuALa2MlDMBGFGSEDHJeZf+
         VRUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqVYm+vXyce+JudnggsxUVYcpddmf1pUFEpEGi3u6b4alSblMp+Qkn8BTnEse/sh2+/SMv7U/FR7Np@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTO5pF9BvNo/feIz8glsF6hamHCa23pQY8mJLo5wMiW2wyTZn
	PLHdAVec4YVsna7+NZ71/ZRCmguDY4EVnzWw78FAF2HsHFyK7SVyDuVAzmvQxpDVDeDtVg5q7NK
	z
X-Gm-Gg: ASbGncsOAONaCTF1Z9hiVs0GDuVIpnYwi29BVNHNoc/8dahEMFXb0yCobmvTcXv278Y
	wewJo366UestI2CdPI3r/4cBXJWd1jZ//DrFDGkEqZ8FoNIgc4kkrlQ8/I3lNDzuYfo6On9gE+t
	V2ywjUxeEqIFjiQ4qfN1qRs95G70k69J4bFUAlRsLDbJ0L1MuWcW10r2CDmShKsLNVw/n1qojD/
	JwMkCQFj9kbSpgmKytvSsi/jcL+qieSNyuCd9qFtPmOUNoQwJgVXdJlaSQ7+ROiDzWjErxSIB0R
	WvE5ChxlIKVNJiRZt+DPr6ZAIhscWjAnQ2dQtI0kxdGhqyFag9nBHCyvtCt7vUycyw==
X-Google-Smtp-Source: AGHT+IGHsJ/pWE4kieATt0qBMCb0hUC3ZTS44b0GC+Hg6m+6UiYvf1SHyj6IvBkQV24UzYKItXbV2Q==
X-Received: by 2002:a05:6214:2482:b0:6e4:8774:3743 with SMTP id 6a1803df08f44-6e6ae9a8768mr141660436d6.41.1740408183711;
        Mon, 24 Feb 2025 06:43:03 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a40b2sm134040816d6.58.2025.02.24.06.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:43:03 -0800 (PST)
Message-ID: <3c0eb0e0-b620-4ea6-b812-6cd86b52721a@riscstar.com>
Date: Mon, 24 Feb 2025 08:43:02 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RTF 1/2] gpiolib: of: Use local variables
To: Linus Walleij <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org>
 <20250218-gpio-ranges-fourcell-v1-1-b1f3db6c8036@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250218-gpio-ranges-fourcell-v1-1-b1f3db6c8036@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/25 4:28 AM, Linus Walleij wrote:
> Instead of modifying the contents of the array of valued read

s/valued/values/

> in from a phandle, use local variables to store the values.
> This makes the code easier to read and the array immutable.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

In addition to preparing for the next patch, this is much more
readable.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/gpio/gpiolib-of.c | 39 +++++++++++++++++++++++----------------
>   1 file changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..86405218f4e2ddc951a1a9d168e886400652bf60 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1057,6 +1057,9 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>   	const char *name;
>   	static const char group_names_propname[] = "gpio-ranges-group-names";
>   	bool has_group_names;
> +	int offset; /* Offset of the first GPIO line on the chip */
> +	int pin; /* Pin base number in the range */
> +	int count; /* Number of pins/GPIO lines to map */
>   
>   	np = dev_of_node(&chip->gpiodev->dev);
>   	if (!np)
> @@ -1075,13 +1078,17 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>   		if (!pctldev)
>   			return -EPROBE_DEFER;
>   
> +		offset = pinspec.args[0];
> +		pin = pinspec.args[1];
> +		count = pinspec.args[2];
> +
>   		/* Ignore ranges outside of this GPIO chip */
> -		if (pinspec.args[0] >= (chip->offset + chip->ngpio))
> +		if (offset >= (chip->offset + chip->ngpio))
>   			continue;
> -		if (pinspec.args[0] + pinspec.args[2] <= chip->offset)
> +		if (offset + count <= chip->offset)
>   			continue;
>   
> -		if (pinspec.args[2]) {
> +		if (count) {
>   			/* npins != 0: linear range */
>   			if (has_group_names) {
>   				of_property_read_string_index(np,
> @@ -1095,27 +1102,27 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>   			}
>   
>   			/* Trim the range to fit this GPIO chip */
> -			if (chip->offset > pinspec.args[0]) {
> -				trim = chip->offset - pinspec.args[0];
> -				pinspec.args[2] -= trim;
> -				pinspec.args[1] += trim;
> -				pinspec.args[0] = 0;
> +			if (chip->offset > offset) {
> +				trim = chip->offset - offset;
> +				count -= trim;
> +				pin += trim;
> +				offset = 0;
>   			} else {
> -				pinspec.args[0] -= chip->offset;
> +				offset -= chip->offset;
>   			}
> -			if ((pinspec.args[0] + pinspec.args[2]) > chip->ngpio)
> -				pinspec.args[2] = chip->ngpio - pinspec.args[0];
> +			if ((offset + count) > chip->ngpio)
> +				count = chip->ngpio - offset;
>   
>   			ret = gpiochip_add_pin_range(chip,
>   					pinctrl_dev_get_devname(pctldev),
> -					pinspec.args[0],
> -					pinspec.args[1],
> -					pinspec.args[2]);
> +					offset,
> +					pin,
> +					count);
>   			if (ret)
>   				return ret;
>   		} else {
>   			/* npins == 0: special range */
> -			if (pinspec.args[1]) {
> +			if (pin) {
>   				pr_err("%pOF: Illegal gpio-range format.\n",
>   					np);
>   				break;
> @@ -1140,7 +1147,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>   			}
>   
>   			ret = gpiochip_add_pingroup_range(chip, pctldev,
> -						pinspec.args[0], name);
> +						offset, name);
>   			if (ret)
>   				return ret;
>   		}
> 


