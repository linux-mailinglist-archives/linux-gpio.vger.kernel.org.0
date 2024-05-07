Return-Path: <linux-gpio+bounces-6192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C399E8BE5BB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 16:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 397781F24ED8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D15415FA63;
	Tue,  7 May 2024 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgLGmaUA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8588815FD19
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091555; cv=none; b=rlavxr9eEiw6fKQ6tgq1O7ohFO1JdMPxbTIOpw2VKy+O7pf2v/HnN8P2kLCDIj/Q+WP/LAXrEifT1C///7aWuzsRZ5aLGI2NpMUgwgBvMUa7IeN8V8CFwe6dGzriazDA6tCAeXhZRU8ZwHQih5U4TuMui33072PWCYbhEtXmjwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091555; c=relaxed/simple;
	bh=SrWV3lA7XZV3ok9IEOD7BsKymDLrsRzAizPNR5uZd54=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rqryhR9jMLsKPdshuSfOED6mqR1Zc0STZo727sDbHEONkgQ87aPvQSvfwtRi3c2/6tbhQuQ6akx81KrcBo7nCvGlcmSXfhKd4kPvqoFJcsJRfdhq8zAzcJRGJmbeL/jeXjkO7JqJCVqxkuBwFz5yO7xtqHaSr1KiwZgfs7+NMSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgLGmaUA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41b79451153so26223775e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715091552; x=1715696352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vPANJGtsF09EF/ofF75g4RAILfJhPKsyCQmhmZbuT0=;
        b=xgLGmaUAkg177LwdvRmEOaWuOY4mPvu45YWzWODl5dnmd0nSt6i5Z+bFIwH5evWwt7
         z4ipXQQvPi4HrI4k1YZQ36w5aaAY5E5pjPuh+D8XUTF/f2M4mgegEgZkWXcE2V1kOGNR
         SyDnGmCkKVPlqlC1al8SCMx1WoCWM5haN1PHrAA+pgiW6umpGPksAXnsXxSq1MYUoRBK
         Y4Z5EOgWAudzq1TPFlw/e/E+JE4j5imlfJJjG7gbO12SSaotjQ6DvBouHCMXPKkYZTg+
         I8VGxu1wUlclvbJvq+dAYc81wt96yABZ+VgDd+Vtb+TWPH+bXuOB3ksHjF5TjLXnzWZH
         10Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091552; x=1715696352;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8vPANJGtsF09EF/ofF75g4RAILfJhPKsyCQmhmZbuT0=;
        b=XCCHx9UPg1ab5/nU3K2NYkssGEyydgAXtbMZKFs4tYLuaHvmohPu2hnFlYMqo4SwXG
         5kYyrVxh8tfZpQwpwnsJm9kUsSaJCnXfVg9MX1k1evaFxRP79GgjgF536VL39iRdfZxv
         Qmc2jFvAjXDKgDdCzhsUUbehtMyIY8nKUPFLnjv+uf/mfMG4viSAji6p+Dbd77FPfGog
         wX3B85G/685zsOkBt6vGiq+CCxSsCacbpAb6jKwgnV3MSw47CbI/ryDuy9dKdcO6RaA9
         d9BCynhTNkVl03jat4BqcAXFEI2tzpWKI9MQs+RowKWGI6BHavV0xWtpTPmW3QKOMryN
         3hdg==
X-Gm-Message-State: AOJu0YyafNFAS6qSXK4U4ANnIutrRqaa5vWpa8z26/8ZcTeVmccs7ZNP
	iGyBdCf3I21+1vDyLjbEVpxPVTFKmXaKy9fweXEBvLZmK7yvy3raQvILxvPGrEU=
X-Google-Smtp-Source: AGHT+IHbnNFhErMeCitSdRIlebCZxX80ku9KyGdw8IX+BHr63FNPH7iKSIo9eVUpYzl/vVT5lyTjjw==
X-Received: by 2002:a05:600c:3107:b0:41c:7bd:5a84 with SMTP id g7-20020a05600c310700b0041c07bd5a84mr10780775wmo.17.1715091551661;
        Tue, 07 May 2024 07:19:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cc5f:d864:2a53:b32f? ([2a01:e0a:982:cbb0:cc5f:d864:2a53:b32f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm17319345e9.0.2024.05.07.07.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 07:19:11 -0700 (PDT)
Message-ID: <340982fb-9e30-4111-a4e7-67d935ca8973@linaro.org>
Date: Tue, 7 May 2024 16:19:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with
 SRCU
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "Paul E . McKenney" <paulmck@kernel.org>
References: <20240507121346.16969-1-brgl@bgdev.pl>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240507121346.16969-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 14:13, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> caused a massive drop in performance of requesting GPIO lines due to the
> call to synchronize_srcu() on each label change. Rework the code to not
> wait until all read-only users are done with reading the label but
> instead atomically replace the label pointer and schedule its release
> after all read-only critical sections are done.
> 
> To that end wrap the descriptor label in a struct that also contains the
> rcu_head struct required for deferring tasks using call_srcu() and stop
> using kstrdup_const() as we're required to allocate memory anyway. Just
> allocate enough for the label string and rcu_head in one go.
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Closes: https://lore.kernel.org/linux-gpio/CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com/
> Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++-------
>   drivers/gpio/gpiolib.h |  7 ++++++-
>   2 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 94903fc1c145..2fa3756c9073 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -101,6 +101,7 @@ static bool gpiolib_initialized;
>   
>   const char *gpiod_get_label(struct gpio_desc *desc)
>   {
> +	struct gpio_desc_label *label;
>   	unsigned long flags;
>   
>   	flags = READ_ONCE(desc->flags);
> @@ -108,23 +109,36 @@ const char *gpiod_get_label(struct gpio_desc *desc)
>   	    !test_bit(FLAG_REQUESTED, &flags))
>   		return "interrupt";
>   
> -	return test_bit(FLAG_REQUESTED, &flags) ?
> -			srcu_dereference(desc->label, &desc->srcu) : NULL;
> +	if (!test_bit(FLAG_REQUESTED, &flags))
> +		return NULL;
> +
> +	label = srcu_dereference_check(desc->label, &desc->srcu,
> +				       srcu_read_lock_held(&desc->srcu));
> +
> +	return label->str;
> +}
> +
> +static void desc_free_label(struct rcu_head *rh)
> +{
> +	kfree(container_of(rh, struct gpio_desc_label, rh));
>   }
>   
>   static int desc_set_label(struct gpio_desc *desc, const char *label)
>   {
> -	const char *new = NULL, *old;
> +	struct gpio_desc_label *new = NULL, *old;
>   
>   	if (label) {
> -		new = kstrdup_const(label, GFP_KERNEL);
> +		new = kzalloc(struct_size(new, str, strlen(label) + 1),
> +			      GFP_KERNEL);
>   		if (!new)
>   			return -ENOMEM;
> +
> +		strcpy(new->str, label);
>   	}
>   
>   	old = rcu_replace_pointer(desc->label, new, 1);
> -	synchronize_srcu(&desc->srcu);
> -	kfree_const(old);
> +	if (old)
> +		call_srcu(&desc->srcu, &old->rh, desc_free_label);
>   
>   	return 0;
>   }
> @@ -697,8 +711,11 @@ static void gpiodev_release(struct device *dev)
>   	struct gpio_device *gdev = to_gpio_device(dev);
>   	unsigned int i;
>   
> -	for (i = 0; i < gdev->ngpio; i++)
> +	for (i = 0; i < gdev->ngpio; i++) {
> +		/* Free pending label. */
> +		synchronize_srcu(&gdev->descs[i].srcu);
>   		cleanup_srcu_struct(&gdev->descs[i].srcu);
> +	}
>   
>   	ida_free(&gpio_ida, gdev->id);
>   	kfree_const(gdev->label);
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index f67d5991ab1c..69a353c789f0 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -137,6 +137,11 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
>   
>   void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
>   
> +struct gpio_desc_label {
> +	struct rcu_head rh;
> +	char str[];
> +};
> +
>   /**
>    * struct gpio_desc - Opaque descriptor for a GPIO
>    *
> @@ -177,7 +182,7 @@ struct gpio_desc {
>   #define FLAG_EVENT_CLOCK_HTE		19 /* GPIO CDEV reports hardware timestamps in events */
>   
>   	/* Connection label */
> -	const char __rcu	*label;
> +	struct gpio_desc_label __rcu *label;
>   	/* Name of the GPIO */
>   	const char		*name;
>   #ifdef CONFIG_OF_DYNAMIC

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Reduces the penalty from 100x / 2985x to only ~2x

Thanks,
Neil

