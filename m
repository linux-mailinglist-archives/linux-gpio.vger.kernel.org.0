Return-Path: <linux-gpio+bounces-14384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB59FF2C2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 04:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76A543A2EEC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 03:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4294ABA33;
	Wed,  1 Jan 2025 03:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="qsSb0AGT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4ADDBE
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jan 2025 03:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735702579; cv=none; b=HCeRyoXHHtB+Zs8ezxQmX0UHsAgTjwYg03Dg+9fmH4NNumKWaY6Vh89abPlAV02WfFdT2+m1kzZY5qOQeTFIlQ6iBlj3iRYYXyLjS8yIGRY2gClnm6/kBt79Iw5tWEjDWjxLfhv/HwUyuxAQG7Ek9nIfJB9jiF2By3l90lLSphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735702579; c=relaxed/simple;
	bh=z8bs6Zyh8ZX/a2bwDxcFjoGA9+28e1hjjWzzpgid4bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWH54ky05q4HWrCDQnIuUQS/LiBIAZgO6/0gec7sezBv3vs7edhTG2iqpvtwIH6vNmIc7J49WXm5pRj53fsebC7s1ks8vWALU0rVDfPmmSrqnsJscL+F01zvBOe/cdQo/TrmehWvoFssg84isKcVCmSmnAendT0CtKNSAY5SB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=qsSb0AGT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21683192bf9so139373845ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2024 19:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1735702576; x=1736307376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFf3utSUNLdYOkpT5TwSA0Q386Xww8cPe30R0JPbuKk=;
        b=qsSb0AGTS1/y7hxRJFUMjo4lMjcN07pWOPZKbxGa1AUdMBic5mpjLN+JW9xYotg2GW
         ia4xI31hxiLjQWloiuYLaMq2xR15BylLEm+IWoNMklCgNIzqyWb+J7u8+/JFHnaH7J3u
         9UVYh4zu+Gmsm36UQQeBlZq6TbF9Af05maq2xnEOwPAZVx67DJ2q2NJvwzbMLDdBok1s
         TrmoBvHDsuXi5TJIPpsycfKdoRtMHP5B7GciV7IGQPHereRy6oapeIR5ma2tJaz/BSII
         yFApBo5QIAT2vDgVZiQ1ilz4LL+a2Hkz+bgKTznHY542LW6UBYwKx/+EwTWTChz260lL
         S5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735702576; x=1736307376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFf3utSUNLdYOkpT5TwSA0Q386Xww8cPe30R0JPbuKk=;
        b=vX9pdZEkEKjgDOILwBCd7WgbYdwmcRxVJDzNguuIjI9OIn5hbTiNz9gBqr6dsQaBlw
         +0JIHdKYYXK8fzwFc4i6bR9pbUddv867t/E5OkshKGc/S6BBK7kpetBd1/NLOuj73O8o
         xULXayTZaiOSMq8wnFLfIhT0mQ24WXswmW5sLxAEIa8XV/CpIUF4YK72gViAdgK2e2QJ
         bhteJyA1rKtPL4hhlngC5dCUqlcDC4FNRf2Z9ENVrJTRq6kwo40Wefm9NWJm5jIE/rN9
         /4IC64swTK5CLxQlSzxpLU63N/lk0UjJGzHNysPXRvEJ9sIxn8q0DPEtNP1idK0eWppk
         lNqQ==
X-Gm-Message-State: AOJu0YyNOat4T4eqM1Y/jyITVqbEigxxnp/P7XcHsLmV43+SStyg/ke6
	yw43isyJF4LhHHohbDD9XSq8jTEALjoUKyCOKZsuaBkd8bH7cN263CTiFkn9eXcWbnlGbvQntpp
	6
X-Gm-Gg: ASbGncvDyrrkAYzDW6PgaCde4R17G6oGe+IYXkA2ZiKkcyti7cS4jK80tPJdyGtbHvs
	yAljaA5f/Tk5TzWs2fkvavMH3cefrfA0LaGv0uzPhyyHloJ7AU6txmgaDl97J/Vq6IgjSJYqsMC
	R/+1AB2PF9bF2DMcH2HNboxsswEtxSdVG4aXdzYDYS5mkZxHdWrULiL1AUFQtGt/3Aj6zTCjo76
	+5LrBRsXPsdu0ArAKqKsFxIWbbqTcOGmNUzY4fqmPT1/OiY5t2Gc3w6DGhoCp2S0x63F9IHyzJX
	noSngU/FBrPn5GnqE+tVbc2oeYVg
X-Google-Smtp-Source: AGHT+IG1EKcnjAAeeY+gbiPwGeRF3nvDBQ8DM3QuZVVNltoCi/H7MsczsZRkhhzeOBCAdMOaJPiB4w==
X-Received: by 2002:a17:902:c951:b0:215:a039:738 with SMTP id d9443c01a7336-219e6e8928emr615026985ad.5.1735702575928;
        Tue, 31 Dec 2024 19:36:15 -0800 (PST)
Received: from [192.168.1.27] (h163-058-210-208.hikari.itscom.jp. [163.58.210.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d4474sm202878165ad.142.2024.12.31.19.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 19:36:15 -0800 (PST)
Message-ID: <be3a585d-70d9-45aa-9283-6ff43e692c2a@pf.is.s.u-tokyo.ac.jp>
Date: Wed, 1 Jan 2025 12:36:12 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: fix the error path of gpiochip_setup_dev()
To: linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org
References: <20241228034808.1831644-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20241228034808.1831644-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I realized that the resource cleanup is already handled in the error 
path, thus there is not memory leak. Please kindly disregard this patch. 
As the gdev->dev.release is always NULL, I will submit a patch removing 
this branch.

On 12/28/24 12:48, Joe Hattori wrote:
> gpiochip_setup_dev() calls gpio_device_put() on error when
> gdev->dev.release is set, but this field is always empty as the cleanup
> function moved to gpio_dev_type in commit aab5c6f20023 ("gpio: set
> device type for GPIO chips"), resulting in a memory leak. Call
> gpio_device_put() at the end of the gpiochip_setup_dev() to trigger the
> resource cleanup, and remove the GPIO device from gpio_devices. Because
> of this operation, gpiochip_setup_devs() may modify gpio_devices, so
> acquire a mutex instead of a read lock.
> 
> This bug was found by an experimental verification tool that I am
> developing. Tested the behavior with gpio-sim and confirmed basic
> operations on GPIO devices worked as intended without any error logs.
> 
> Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>   drivers/gpio/gpiolib.c | 42 ++++++++++++++++++++++++------------------
>   1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 679ed764cb14..1f612a54a475 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -784,7 +784,7 @@ static const struct device_type gpio_dev_type = {
>   #define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
>   #endif
>   
> -static int gpiochip_setup_dev(struct gpio_device *gdev)
> +static int gpiochip_setup_dev(struct gpio_device *gdev, bool locked)
>   {
>   	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>   	int ret;
> @@ -800,7 +800,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>   
>   	ret = gcdev_register(gdev, gpio_devt);
>   	if (ret)
> -		return ret;
> +		goto err_put_device;
>   
>   	ret = gpiochip_sysfs_register(gdev);
>   	if (ret)
> @@ -813,6 +813,14 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>   
>   err_remove_device:
>   	gcdev_unregister(gdev);
> +err_put_device:
> +	if (locked)
> +		list_del_rcu(&gdev->list);
> +	else
> +		scoped_guard(mutex, &gpio_devices_lock)
> +			list_del_rcu(&gdev->list);
> +	synchronize_srcu(&gpio_devices_srcu);
> +	gpio_device_put(gdev);
>   	return ret;
>   }
>   
> @@ -850,17 +858,15 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
>   
>   static void gpiochip_setup_devs(void)
>   {
> -	struct gpio_device *gdev;
> +	struct gpio_device *gdev, *tmp;
>   	int ret;
>   
> -	guard(srcu)(&gpio_devices_srcu);
> -
> -	list_for_each_entry_srcu(gdev, &gpio_devices, list,
> -				 srcu_read_lock_held(&gpio_devices_srcu)) {
> -		ret = gpiochip_setup_dev(gdev);
> -		if (ret)
> -			dev_err(&gdev->dev,
> -				"Failed to initialize gpio device (%d)\n", ret);
> +	scoped_guard(mutex, &gpio_devices_lock) {
> +		list_for_each_entry_safe(gdev, tmp, &gpio_devices, list) {
> +			ret = gpiochip_setup_dev(gdev, true);
> +			if (ret)
> +				pr_err("Failed to initialize gpio device (%d)\n", ret);
> +		}
>   	}
>   }
>   
> @@ -921,6 +927,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   			       struct lock_class_key *request_key)
>   {
>   	struct gpio_device *gdev;
> +	bool already_put = false;
>   	unsigned int desc_index;
>   	int base = 0;
>   	int ret = 0;
> @@ -1098,9 +1105,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   	 * Otherwise, defer until later.
>   	 */
>   	if (gpiolib_initialized) {
> -		ret = gpiochip_setup_dev(gdev);
> -		if (ret)
> +		ret = gpiochip_setup_dev(gdev, false);
> +		if (ret) {
> +			already_put = true;
>   			goto err_remove_irqchip;
> +		}
>   	}
>   	return 0;
>   
> @@ -1116,6 +1125,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   	of_gpiochip_remove(gc);
>   err_free_valid_mask:
>   	gpiochip_free_valid_mask(gc);
> +	if (already_put)
> +		goto err_print_message;
>   err_cleanup_desc_srcu:
>   	cleanup_srcu_struct(&gdev->desc_srcu);
>   err_cleanup_gdev_srcu:
> @@ -1124,11 +1135,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   	scoped_guard(mutex, &gpio_devices_lock)
>   		list_del_rcu(&gdev->list);
>   	synchronize_srcu(&gpio_devices_srcu);
> -	if (gdev->dev.release) {
> -		/* release() has been registered by gpiochip_setup_dev() */
> -		gpio_device_put(gdev);
> -		goto err_print_message;
> -	}
>   err_free_label:
>   	kfree_const(gdev->label);
>   err_free_descs:

