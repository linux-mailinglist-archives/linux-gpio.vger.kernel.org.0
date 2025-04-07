Return-Path: <linux-gpio+bounces-18370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6DA7E023
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E953B38E1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BF01A3152;
	Mon,  7 Apr 2025 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CHn2fjav"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1EC18D649
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033779; cv=none; b=WJ3v0b2I5FetVU6ig+pfQ27+/w/R+yZ4lMZn3wymFsmjWvyw3VLodAPxPWsgsEn/xYDtdLWDOHvWt4r/t+9WI1cuhz/hd3zSbZS5PK8wrXkwNl4iGjnHOXS4b0oaKU5smUv3l/t5LJukImm/IobDvLhw216I/wrnHanT3eOU6DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033779; c=relaxed/simple;
	bh=WhV9u4IQQhmqgaWXSsNMfBXHEeR56D8mrLfD4YSL1jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xgz2jcxtPSP/aqXBYfYjWZqUE/xYUG9ZdPfXn3bSndZTIWgzmdzoQW7TjtwPvikcbb07tv+ev59ozAky2+JZHDNQdNcsxtWbVkC1oPp5MjFNUA7+vSEgVzddoI2gvzftAW0+Z9oWW9jZ0CKEUHlMqRay1UXOf0P5zivvzWyfbeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CHn2fjav; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-601ff283d70so1225246eaf.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744033776; x=1744638576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=CHn2fjavnRMMXFPMdiM8wCQdSQq7m3B5MrbyCeMlb+nwZ7atw1lcO8mtNCgnwTD+lK
         EJMF4/55xR5QufM9zMHLTwFrR1zJiM+F5khHEBC8wnqlC+nPw3ZBJ9gUWE3MArMF3AP3
         8jVCvfIIpyMCrvawBaJmK9sph1y89rNNgUwhC3eLAeM38KTLYPfhJxumz938I7Qv9IGz
         54XjksTUoNgbKTzxfHF5KmXwvEz29dQ3O3ytQW7zpVLM39m8KHGhALbfDcIasgDaJ5gJ
         zMgVrQ0a2L+UrkuHf5RA44p4IJEPmaiCA7K+KP0SAtI8dKbebAYyBNtOPADaR87TnBz9
         az8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033776; x=1744638576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=fT+C7s9AIxLcL1W7SdmtmsTiyYLRlNg/Yfo8/gMjB9TCLcQTe0War7vJnJ1OnFFbFF
         1sroeQzEFHY0D5xWDTsDXw2WVgnxYGc9wTv2624Bj3hgDKC4HSwAjAKtfFDU9BRE+nyd
         peKdHVjvTErk+x6Rnb5xLozj9y23TvJrWa01Y6Al0BaPp/xSukfiewC95S2c56Cuqqtu
         +3e5YlUTQOM98fgp5cjphRvKBWqLPAtCM1RyzzrkaJ7gui/IcSvGHUR3VLQjQgyBVd6/
         c8dDsAJP5xDrMNoyOxzrek6bSHqodk9/GfEG0dHKrVrtHHO1fSDWL7RMatJndnbyXjOM
         y/iA==
X-Forwarded-Encrypted: i=1; AJvYcCWpIIA2BMv2aIKtR9+iMPkmX3VRRMQbCt9Fe8Bi8oVvoHhWxU3mnPudWBiDqv7O8ovQ7eLlDcCJD2h3@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4MZNqcDx/zW0W1J+fqQKD4ec8rA6YJOpOt3DzoPNICNrUEXn
	HFN1v0V7w7qt3pynLM5jJIDwxWYEF0CI0JnFeKJg1mJ6bBKMaU1or8r4PXtNlaw=
X-Gm-Gg: ASbGncucDFuZ/jkOIuzQOkX+7V3bV8yP+/Y9fmhmHqtzE1vzwRJKXI1kzmUyj+ZJ2L5
	9dlzhfGOerkgDPqFs9/Kd2alOUTRUsPqF8+lobNHIh232qKbvplQx2GRGG7w5yPR7oXZayTbado
	FAKvNSe6SvrpaADbXOt1D5rEuAGj3HEOOVdwKHwQJi4kxj5NPvnmWe/VcGUnSnm2ekGNfun39g/
	EmE4ocallrlV2YIcDOPgVIufkrsAxVR9FOcjJe827a1gEVhdVo5hhGGxcMqp207E20sSnPvmZOc
	ue5+9UcZN2rb3beZXbnyzj8FS0r/34bgJ2iK9q1mPdfNgXy5s13yuYv+bNwM+JMEcRRbZdCkB0+
	l/bknXdCYOA==
X-Google-Smtp-Source: AGHT+IG/WeJOsYTJug2WwIegYoFPtqQ1kYLmD+mN7tixYlfHeBiAMs6zs8YlU4OTlrzTKkroXpuE/Q==
X-Received: by 2002:a05:6808:229e:b0:3fb:57ca:1ea7 with SMTP id 5614622812f47-4004668c4a6mr7559744b6e.36.1744033776048;
        Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40040099665sm1725950b6e.43.2025.04.07.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:49:35 -0700 (PDT)
Message-ID: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
Date: Mon, 7 Apr 2025 08:49:34 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here is the commit that enabled these:
   98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values

This looks good.  Thank you.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 16bcf7fc8158..f81c34160f72 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
>   	return 0;
>   }
>   
> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> -					u8 which, bool value_high)
> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> +				       u8 which, bool value_high)
>   {
>   	struct device *dev = &ggc->gbphy_dev->dev;
>   	struct gb_gpio_set_value_request request;
> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   	if (ggc->lines[which].direction == 1) {
>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>   			 which);
> -		return;
> +		return -EPERM;
>   	}
>   
>   	request.which = which;
> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   				&request, sizeof(request), NULL, 0);
>   	if (ret) {
>   		dev_err(dev, "failed to set value of gpio %u\n", which);
> -		return;
> +		return ret;
>   	}
>   
>   	ggc->lines[which].value = request.value;
> +
> +	return 0;
>   }
>   
>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   	return ggc->lines[which].value;
>   }
>   
> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>   {
>   	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
>   
> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>   }
>   
>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>   	gpio->direction_input = gb_gpio_direction_input;
>   	gpio->direction_output = gb_gpio_direction_output;
>   	gpio->get = gb_gpio_get;
> -	gpio->set = gb_gpio_set;
> +	gpio->set_rv = gb_gpio_set;
>   	gpio->set_config = gb_gpio_set_config;
>   	gpio->base = -1;		/* Allocate base dynamically */
>   	gpio->ngpio = ggc->line_max + 1;
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
> 
> Best regards,


