Return-Path: <linux-gpio+bounces-26092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B965B55B3C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 02:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B676FA07D29
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 00:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE83A51022;
	Sat, 13 Sep 2025 00:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="KhjvS34z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309E8BA34
	for <linux-gpio@vger.kernel.org>; Sat, 13 Sep 2025 00:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724376; cv=none; b=SlZidzB/gmyOFRPHkpKXGafSd8m5i+TSjrBGqZzaa8cO4ZfagqLHNgd/TNMiuXurjiaJkgVbpZq7h0Y9NztELGjE0G6Q/yZYs2xcJSkeyniKbXuYab0nqVByOyHL61852nKelZkqsP/adubS6kHFOvu207MG3JJgFj9LAA7FGVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724376; c=relaxed/simple;
	bh=akUfeAAylR4EGyDlpaAVA7KbTqLrX6ucdpKbIQvNUvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtWj4m0gtgvXIXoVcLGbSTc1tjikzBgkWwLwCeJSBXBdMKC989/iRqGt4R1xtHHquqeAcsloVN912pFxBsZgRJnHyf99OfPqWSJWJMh/lbka28vfZMBAb5L7GF+Y50h66Sc/Gj7hgPipgnZV+1HKr7YsuhJOcJRtMKJHrWipKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=KhjvS34z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b54abd46747so1391618a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 17:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1757724374; x=1758329174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1rAyo0wYKz4qhM+kpJJzKO3IkA7FwTREfOLXkFqC+k=;
        b=KhjvS34zI+GcCf64gWCiWFseNfwQXvcmSoc0EGu1w6jMug1/YOSgom7Ilmb5XsvCFe
         9UEv2KLhlLpiqdFJXtlx1uaAbfStSdJgsbjmO55F3jJhHf0GZOBXAelmymvZKDaOauVd
         DnicSisYcFeVlx2336UNEsJ1TAqU1FGBQksH9TqJh3W+ShEOLRjHXRmw0NOgJ9Mz8XkA
         psy+yCvrod50D71r5gm4welJtCD5kgenard8rcDNj4a2EMI43IZKv0GD8QFnzO3iA7NQ
         b08RQ8CjkURYGcyci+0If0Ww5xiDj9wTdgiUE0xyDamGJCGp0g9JoNuANnCUBBQdaBJ1
         aLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724374; x=1758329174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1rAyo0wYKz4qhM+kpJJzKO3IkA7FwTREfOLXkFqC+k=;
        b=xDVM7IcYuNEovNNB+Q/ZIHesV8CHBuba9r9nFkIOpFAzny3rpiUi/xuKNkiqyw8svb
         nx6xipG9Bf8kSHJhktadAthbnAe9CqchCka8ZU8+AAC+ghQCcD7whQknptB7GKHJOJRO
         mNNmBwWHeeImkPk8PDUTwBRbBTAf4SLZRy/pAgn5Yz2fCpEul3dfktoJpW8m97d5AOhx
         zmcTQRPxYipOQF1nOXHHGpJwYNlMdnz1rtGtvoXio422xrrWS80zv9ixFD0alEi6XkZS
         X2r+uBlJk08mIiC5GZx7YVig4LYlZsOThQ+d7EU1trpKAMEyE0VICceXl4w0R5QmA+I9
         tltA==
X-Forwarded-Encrypted: i=1; AJvYcCVAi8fmrtupe3qb+CvvVPS/1LWBAu4q+PjYtBpHfZ9I7uyJDyyEVtahxiLDk+TjPw4y0cYl5Y/uI2Fo@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBPTG1eSlL6SHOVZ+JuSawCBv42/5KttXoQ6zLOO7lWYfdCEE
	++D2cJLGnIiy6SJU/InMVUis9giV6L+heRgEMVAYb53Tm35XbqX/Xd/Mw85xn+ErTVk=
X-Gm-Gg: ASbGncsyxUt+n4+fgtXke43RISHKVlpdeST2O5uH0WEvXH/g2Y/jCYDRLaEr4nYy1n8
	+1tqZaMD6A3vxlkj1tCUqkshe0nmLqhPIjDVEXu9etXcZG0BSLbbBgN7qRPZAeCxAM1fUDQQucA
	EcX/1tQfWSH5STMePPv0/9RsRKMm36J6RkVLQF1MDpUOw5cx+UBLMvtlGGC6X17Kv/WAtplzWDZ
	kN7Pi+0/SoXWMXg1Y561aZ5bgVnkWzunujclf8oHfkU5A92vrBRj0YDMMsA3791wYHmVNOBtWiL
	Ti7PvsDAVD7InifhAX4agXMb18muwLHMYDSJcOsP0g46Gig2yZqEboy6d5ENakashSNR8WE1cof
	YRuzfH40yGoSi7ioKrW4hUsRz
X-Google-Smtp-Source: AGHT+IHMBcbueSicxR/8Vx8AuBr3VH7T7SswkJLlw1PiFiO49urRgXzVoKF+OSucjZhbIyJT/Kwvwg==
X-Received: by 2002:a05:6a20:1590:b0:246:3a6:3e5e with SMTP id adf61e73a8af0-2602cd19bc3mr6462974637.54.1757724374277;
        Fri, 12 Sep 2025 17:46:14 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793be6csm6786234b3a.14.2025.09.12.17.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:46:13 -0700 (PDT)
Date: Fri, 12 Sep 2025 17:46:11 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: initialize acpi_gpio_info struct
Message-ID: <aMS-09x_YTV75r0n@mozart.vkv.me>
References: <20250912-gpiolib-acpi-fix-v1-1-1a41acbffadf@armadeus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912-gpiolib-acpi-fix-v1-1-1a41acbffadf@armadeus.com>

On Friday 09/12 at 22:18 +0200, Sébastien Szymanski wrote:
> Since commit 7c010d463372 ("gpiolib: acpi: Make sure we fill struct
> acpi_gpio_info"), uninitialized acpi_gpio_info struct are passed to
> __acpi_find_gpio() and later in the call stack info->quirks is used in
> acpi_populate_gpio_lookup. This breaks the i2c_hid_cpi driver:
> 
> [   58.122916] i2c_hid_acpi i2c-UNIW0001:00: HID over i2c has not been provided an Int IRQ
> [   58.123097] i2c_hid_acpi i2c-UNIW0001:00: probe with driver i2c_hid_acpi failed with error -22
> 
> Fix this by initializing the acpi_gpio_info pass to __acpi_find_gpio()
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220388
> Fixes: 7c010d463372 ("gpiolib: acpi: Make sure we fill struct acpi_gpio_info")
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Thanks Sébastien. This fixes the touchpad on my XPS 9340.

If you want it:

Tested-By: Calvin Owens <calvin@wbinvd.org>

> ---
>  drivers/gpio/gpiolib-acpi-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index 12b24a717e43f17621c054bfc4e9c2e287236d8c..d11bcaf1ae88421e5e5a11a2ba94983f437c413a 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -942,7 +942,7 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
>  {
>  	struct acpi_device *adev = to_acpi_device_node(fwnode);
>  	bool can_fallback = acpi_can_fallback_to_crs(adev, con_id);
> -	struct acpi_gpio_info info;
> +	struct acpi_gpio_info info = {};
>  	struct gpio_desc *desc;
>  
>  	desc = __acpi_find_gpio(fwnode, con_id, idx, can_fallback, &info);
> @@ -992,7 +992,7 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *con_id,
>  	int ret;
>  
>  	for (i = 0, idx = 0; idx <= index; i++) {
> -		struct acpi_gpio_info info;
> +		struct acpi_gpio_info info = {};
>  		struct gpio_desc *desc;
>  
>  		/* Ignore -EPROBE_DEFER, it only matters if idx matches */
> 
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20250912-gpiolib-acpi-fix-7ee492ebd5e8
> 
> Best regards,
> -- 
> Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> 

