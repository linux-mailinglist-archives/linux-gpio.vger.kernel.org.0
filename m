Return-Path: <linux-gpio+bounces-12042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84B9AF7B7
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 04:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5217E1F22B8D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 02:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9A91531C4;
	Fri, 25 Oct 2024 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWh2hjDQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0147A3D97A;
	Fri, 25 Oct 2024 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824846; cv=none; b=m5Np69NbEu1xVN+SOyZ+W+vfU+UaQiVFVhBbbEUnlADB1z7KGwwg6/APkbSAG2kQvB3AnLcQix3Wh8wjM7/b6nih4h4ucBWQH54pdpctgf5A7ezoBRcTrpBXpM3aDGZv+F34bVeSbHv7h+bsFcQQU8KBveciuNLH15Ye1gqMgaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824846; c=relaxed/simple;
	bh=NWZg2E3tAPAKNZYQB+RGcMHGg2l5rvdMFzLniGkXNQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ9DCf6G/KELwgEB7RkDpjeMQb4tmRMWtQaV8K7AJUHdePeCnPFLnd2U0LxQYWhx8bNnW9cwdqZurKHRItpr/eNAsPUM3bVv03IrMe9KoNqIGzgk3C6p/Rbx7PNQmLlR6OU64ErddhBMvurJVn24VKsgAEbkRwx/32vaq6AvW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWh2hjDQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so1088787b3a.0;
        Thu, 24 Oct 2024 19:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729824843; x=1730429643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/iDoEcRLEifYJF4+8AHMpAqc96EixKFh8xtz5t7fpd4=;
        b=XWh2hjDQTK3YRmkHLHbF+aC5fsCT34ZKAOjyrh1eCpo8cAG+0Xepf4VPU0XAKM+0+U
         EoqqRBCbthsxy4URW9Aq853l+3Vj3x3yJLaFD1KmPrv5LJMNYXGH6QqPXRALESTXgfX5
         DU/AxvOFKh+Qx4EPsotz3dqIHcEqDaYwKLipZEh9VtjSMWf2UnkGtQiI6rqeOosfBnOc
         xaYFFdBK6lfXqmwh2vlyd/f2mozsXZhcCzF5Cp0AD/gXFW3b5BbNi4009nwPZfnd3hht
         UUOSP6lrUM42Zt8nmMvX2VInayiVmMVRDcr0ww7ROvzUkYD4SLwBgczgHeM2n6ONpV5N
         o6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729824843; x=1730429643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iDoEcRLEifYJF4+8AHMpAqc96EixKFh8xtz5t7fpd4=;
        b=F/O5bCcUKxszd9dLTeC6TEqMMsywftuyKHAtu8EBz1e5GUEYCP2P8JqiqJc6p37HLj
         wgTuUPC3Im8MtQfdQ/cPZWlvxJKa2wkMSGG3ScuhoU4syv2esGyOpZ5Czrv/F5Ct1mc2
         FVJF+cQSVZsXlk3RSZOIXbgo4vtmKpVlqs0Hmj05s0TN6OgtSorcGX15WYmLFABsPu+g
         aWwtvtXy8gvV8Y7eBx273O1w0j2wgnbFVeO5FPjSiLn662R/kvkDLAoggEwrc4vp34iV
         aZmP3X2gieRqxHnoQvOKNLNW6q8WT+2oNbK6KMOi+gjUNrjTmk7X2UHfUcAEWjn7DvvC
         BIPg==
X-Forwarded-Encrypted: i=1; AJvYcCVRJDyvPnkFqsyomu6c9E0qsiRKsyNTOGbgJoH98akPKq70lWk1yZV6AKf4prJBQMHMQUFlYZn33FnFil5X@vger.kernel.org, AJvYcCXAy2l2dMMe45qRKfcgwhYgUaTvojBuOHgUfkBcYSWj/tRVrl7ZvzVdwh58t7nIwcd72zDuYKfwas6b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvjy5j0E4AWcI0iS85VSNbEz9L8x1aaK6F6RoAUfH3CPuf7dJX
	sgkyVqjqb8o58hqsTYp4suqhIQgF40asPGPo/EtGNsyqu2q/nrc7RuGmlw==
X-Google-Smtp-Source: AGHT+IHEYChedZIFdwjXaIvTk/Y4lRBsE5Q0qaWBvVF9OM/qk2nuBsYiNJHUHfAcnl8uXMZERrLGOg==
X-Received: by 2002:a05:6a00:190b:b0:71e:77e6:ad89 with SMTP id d2e1a72fcca58-72045e758dcmr5819219b3a.13.1729824842930;
        Thu, 24 Oct 2024 19:54:02 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057950068sm137455b3a.89.2024.10.24.19.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 19:54:02 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:53:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/5] gpio: sysfs: use cleanup guards for gpiod_data::mutex
Message-ID: <20241025025358.GA47379@rigel>
References: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
 <20241024-gpio-notify-sysfs-v1-1-981f2773e785@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-gpio-notify-sysfs-v1-1-981f2773e785@linaro.org>

On Thu, Oct 24, 2024 at 01:32:44PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Shrink the code and drop some goto labels by using lock guards around
> gpiod_data::mutex.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 57 +++++++++++++-------------------------------
>  1 file changed, 17 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 0c713baa7784..3ccb41a93ea7 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -77,12 +77,10 @@ static ssize_t direction_show(struct device *dev,
>  	struct gpio_desc *desc = data->desc;
>  	int value;
>
> -	mutex_lock(&data->mutex);
> -
> -	gpiod_get_direction(desc);
> -	value = !!test_bit(FLAG_IS_OUT, &desc->flags);
> -
> -	mutex_unlock(&data->mutex);
> +	scoped_guard(mutex, &data->mutex) {
> +		gpiod_get_direction(desc);
> +		value = !!test_bit(FLAG_IS_OUT, &desc->flags);
> +	}
>
>  	return sysfs_emit(buf, "%s\n", value ? "out" : "in");
>  }
> @@ -94,7 +92,7 @@ static ssize_t direction_store(struct device *dev,
>  	struct gpio_desc *desc = data->desc;
>  	ssize_t			status;
>
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>
>  	if (sysfs_streq(buf, "high"))
>  		status = gpiod_direction_output_raw(desc, 1);
> @@ -105,8 +103,6 @@ static ssize_t direction_store(struct device *dev,
>  	else
>  		status = -EINVAL;
>
> -	mutex_unlock(&data->mutex);
> -
>  	return status ? : size;
>  }
>  static DEVICE_ATTR_RW(direction);
> @@ -118,11 +114,8 @@ static ssize_t value_show(struct device *dev,
>  	struct gpio_desc *desc = data->desc;
>  	ssize_t			status;
>
> -	mutex_lock(&data->mutex);
> -
> -	status = gpiod_get_value_cansleep(desc);
> -
> -	mutex_unlock(&data->mutex);
> +	scoped_guard(mutex, &data->mutex)
> +		status = gpiod_get_value_cansleep(desc);
>
>  	if (status < 0)
>  		return status;
> @@ -140,7 +133,7 @@ static ssize_t value_store(struct device *dev,
>
>  	status = kstrtol(buf, 0, &value);
>
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>
>  	if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
>  		status = -EPERM;
> @@ -149,8 +142,6 @@ static ssize_t value_store(struct device *dev,
>  		status = size;
>  	}
>
> -	mutex_unlock(&data->mutex);
> -
>  	return status;
>  }


With the guard, this can be further simplified by returning immediately
and collapsing the if-else chain:

@@ -135,14 +135,14 @@ static ssize_t value_store(struct device *dev,

        guard(mutex)(&data->mutex);

-       if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
-               status = -EPERM;
-       } else if (status == 0) {
-               gpiod_set_value_cansleep(desc, value);
-               status = size;
-       }
+       if (!test_bit(FLAG_IS_OUT, &desc->flags))
+               return -EPERM;

-       return status;
+       if (status)
+               return status;
+
+       gpiod_set_value_cansleep(desc, value);
+       return size;
 }

That also removes the overloading of status, previously containing a status
OR a size, which is no longer necessary.

>  static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show, value_store);
> @@ -253,11 +244,8 @@ static ssize_t edge_show(struct device *dev,
>  	struct gpiod_data *data = dev_get_drvdata(dev);
>  	int flags;
>
> -	mutex_lock(&data->mutex);
> -
> -	flags = data->irq_flags;
> -
> -	mutex_unlock(&data->mutex);
> +	scoped_guard(mutex, &data->mutex)
> +		flags = data->irq_flags;
>
>  	if (flags >= ARRAY_SIZE(trigger_names))
>  		return 0;
> @@ -276,12 +264,10 @@ static ssize_t edge_store(struct device *dev,
>  	if (flags < 0)
>  		return flags;
>
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>
> -	if (flags == data->irq_flags) {
> -		status = size;
> -		goto out_unlock;
> -	}
> +	if (flags == data->irq_flags)
> +		return size;
>
>  	if (data->irq_flags)
>  		gpio_sysfs_free_irq(dev);
> @@ -292,9 +278,6 @@ static ssize_t edge_store(struct device *dev,
>  			status = size;
>  	}
>
> -out_unlock:
> -	mutex_unlock(&data->mutex);
> -
>  	return status;
>  }


Similarly drop the overloading of status:

@@ -257,7 +257,7 @@ static ssize_t edge_store(struct device *dev,
                struct device_attribute *attr, const char *buf, size_t size)
 {
        struct gpiod_data *data = dev_get_drvdata(dev);
-       ssize_t status = size;
+       ssize_t status;
        int flags;

        flags = sysfs_match_string(trigger_names, buf);
@@ -274,11 +274,11 @@ static ssize_t edge_store(struct device *dev,

        if (flags) {
                status = gpio_sysfs_request_irq(dev, flags);
-               if (!status)
-                       status = size;
+               if (status)
+                       return status;
        }

-       return status;
+       return size;
 }

>  static DEVICE_ATTR_RW(edge);
> @@ -330,11 +313,8 @@ static ssize_t active_low_show(struct device *dev,
>  	struct gpio_desc *desc = data->desc;
>  	int value;
>
> -	mutex_lock(&data->mutex);
> -
> -	value = !!test_bit(FLAG_ACTIVE_LOW, &desc->flags);
> -
> -	mutex_unlock(&data->mutex);
> +	scoped_guard(mutex, &data->mutex)
> +		value = !!test_bit(FLAG_ACTIVE_LOW, &desc->flags);
>
>  	return sysfs_emit(buf, "%d\n", value);
>  }
> @@ -350,11 +330,8 @@ static ssize_t active_low_store(struct device *dev,
>  	if (status)
>  		return status;
>
> -	mutex_lock(&data->mutex);
> -
> -	status = gpio_sysfs_set_active_low(dev, value);
> -
> -	mutex_unlock(&data->mutex);
> +	scoped_guard(mutex, &data->mutex)
> +		status = gpio_sysfs_set_active_low(dev, value);
>
>  	return status ? : size;
>  }
>

Doesn't need to be scoped:

-       scoped_guard(mutex, &data->mutex)
-               status = gpio_sysfs_set_active_low(dev, value);
+       guard(mutex, &data->mutex);
+
+       status = gpio_sysfs_set_active_low(dev, value);

        return status ? : size;
 }


No issues with the other patches.

Cheers,
Kent.

