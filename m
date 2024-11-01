Return-Path: <linux-gpio+bounces-12411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066A9B87CC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 01:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A43F1C213F4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 00:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB81C15AF6;
	Fri,  1 Nov 2024 00:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2qeaTsn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F61B813;
	Fri,  1 Nov 2024 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422100; cv=none; b=COa1WGu5r96/ze3aIIeyZ9CltmBIFXrrl0nRWOQk/3zai67po8+o2ZodiVO83LJkmFLGtT9pgZY2a43/F4biLUqB0wVscHE4/o0IKciHmpAoKTZXh4wdXCPF7/ZmsL26cUtkNldDlpKwzcSNKBZvQMzDCWSqrSB6EHDvmB5+IWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422100; c=relaxed/simple;
	bh=8r2GJ2lt9PC4IzAjLV2nvkRGPSkQOCr/0+3MQuIHq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBszwLWSkSc5Pnc/E60e0PUiAINxSAkUcwulCCgBo1K4QWkBItN6qDL4dWleC6buokCx7dFj1YRKx0CdOqvqvY4cxWJWE38TLnnY8azlt8/1YbgKbWtjmbOuh7iv61xQj6J6XX8h0sIt0RgSABrQm++HARdKw4ilfbhLq0ygFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2qeaTsn; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso35417b3a.0;
        Thu, 31 Oct 2024 17:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730422094; x=1731026894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xO62p9JjUPdIXEaZ/OrFcLPy6DM8AFQJ00802xDY3n0=;
        b=V2qeaTsnw/HXim9S8AKfaMOCeYmR8NzC4l81CxokvlBZEGwhjbgAzt+ciNljoGE0nn
         3uFg/ngNG+fN6KAVRWHnOf2GUV1KUALWeb2Y6S/LxneGThe9zpFLgmzLmR57Q7muzLlV
         C4ZiZTImR/AVHN2NXePXLYpuitZObTGte13TTjGPYf8MokiM0hKCnUyc3W/RBdBzuxFK
         u9tKtc+UEFZpNy/ru1pKkAts88CM3qyaCD2gMALkzwOa2gIW0ct4OHoJeam5cr3HyXs1
         oHkJAl7YYKVeZrzskX4UswJRW72K5mfmphaTFQSRYUldFPw6EHLUytGMz9wwZwIurKVS
         6F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422094; x=1731026894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO62p9JjUPdIXEaZ/OrFcLPy6DM8AFQJ00802xDY3n0=;
        b=S1lc9+d4VeUdAIUjb9kV3KAA7PEpuFzurf6OcjcFtu5k0Avjr0VUQ0pw1Kq9B3/swP
         cnIk9pUJaXr+O44160/n3772/YHX10Gd0X1LgwKLXuDe65iw+/dSzw9hN4oOrNmmdfqI
         vCxnnjkyst0jqRpeWtX+Ehfi5tV9FPGcQn4mDYCwlILBuXikHRoTxdfBMabGjJtcGc9I
         ysiJ7SoNpa/ZAVZA71wa89WTr3FvQq+8Sfv+E/UhAGrplax1v3GWYmdYKIb3FmuWEWQE
         vf7UASNaJmXqk3RhYhGiWaU+pEK7wsVhEm3vloJk/ndGrTtwhyxUuf79MNgHyiAv34wS
         nqog==
X-Forwarded-Encrypted: i=1; AJvYcCVwZhVrgKfQqeltAPkszgJVSIIfn8KNUK6hYYaty183KxlZsDQMwE1hq5pb9oebw+4wMgLgyg8VrvHK@vger.kernel.org, AJvYcCWRVJ5nchdGUb+jY9yI7wipLUXAu3D/BW7q5uAbyvdJw2reY/9T25xoZsiyOc5YgDFIqyhIsV1IqU05OHEC@vger.kernel.org
X-Gm-Message-State: AOJu0YzWym18HywwKN5NsRFGAA59wXW2fH8zZQktGabwUas8tUWufUrF
	1ukWeUtMuagsR4NDLbf3RjE63N+nYqBzlYMhiP237mHJBb8QbmW1vX04MA==
X-Google-Smtp-Source: AGHT+IGbxJvcEwZ1vWn7X6t2Qwqk230AEbG5xxzxMm4gt7z2CKiSk9D5bRbgayh4yKbnUL5OWlZXYw==
X-Received: by 2002:a05:6a00:2e2a:b0:71e:51ae:d765 with SMTP id d2e1a72fcca58-720b9de6610mr6359928b3a.27.1730422094225;
        Thu, 31 Oct 2024 17:48:14 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2ecbfdsm1784005b3a.174.2024.10.31.17.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:48:13 -0700 (PDT)
Date: Fri, 1 Nov 2024 08:48:09 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: cdev: don't report GPIOs requested as interrupts
 as used
Message-ID: <20241101004809.GA10513@rigel>
References: <20241031200842.22712-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031200842.22712-1-brgl@bgdev.pl>

On Thu, Oct 31, 2024 at 09:08:41PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GPIOs used as shared irqs can still be requested by user-space (or
> kernel drivers for that matter) yet we report them as used over the
> chardev ABI. Drop the test for FLAG_USED_AS_IRQ from
> gpio_desc_to_lineinfo().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> ---
>  drivers/gpio/gpiolib-cdev.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 0ec162b0ea04..629e9372fd57 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2275,7 +2275,6 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  	 */
>  	if (test_bit(FLAG_REQUESTED, &dflags) ||
>  	    test_bit(FLAG_IS_HOGGED, &dflags) ||
> -	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
>  	    test_bit(FLAG_EXPORT, &dflags) ||
>  	    test_bit(FLAG_SYSFS, &dflags) ||
>  	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
> --
> 2.45.2
>

