Return-Path: <linux-gpio+bounces-6859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8348D397B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D801C22139
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBB7159594;
	Wed, 29 May 2024 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KPVZsj8k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B415920F
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993520; cv=none; b=Y7RwH3cxGuSVMJE082uQYLxO9IF5thx+CPM9utaVg1UQ2b4lLpt2xfinAGFDawzVRBNSxmmZSkP2POm0hoQXFx6SK6ys1G1foT68hJFIr+9vY5+iN8v+/hBzvgOI99/OuCiNDLX/+iriHx9+bBl9OhHGRdSg+kfGt0Cn6TfycCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993520; c=relaxed/simple;
	bh=qtx7heFq23Ik7RP0+IKkj4MhAFl1SLLrhfCCxu4Y/iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSUTHp+lVnNHN/OSmizbxsSncIUSLqhRTlCAYB6D0AT33PGP7tWUSdpJG02PH7wa4Ze+dXanZ4vkbXPily+VwlFg2cwZjw7CoNZ+iHswRAFRxO6mqipC+kBS4Mu5up7pSN+N8L3AoGToWBSZXFtEHuwj34f38mCCIOvnHWwm+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KPVZsj8k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42108856c33so148665e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993517; x=1717598317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NXlxBJgQstiSb1iHCBoySUt4Dr8xVwSho9/4h77j9/Y=;
        b=KPVZsj8kfvrlqGxbyhrgjG3IDqnkkY39IVuhBMIuXI/rqVNwir2Gd1dRiYCTpLb0GM
         IRDzbSgYs00UqAJ9L/CpJIuonpFKvjUjwsWBv7K6egTLd+EJkGuGNQQQomsNipW22dZ9
         9bs1Z7YbIlwQIaiAslEtb/NQd7XXmBrrOmppCeJ4M5sJeLkAtvkZZWMdOM8hQ1G9LB2s
         z06vIg6p3Ip0BBe5zGvs02AFcmoUIaD4LwpyDa4NpRI4ZFSMErGgFC1xQtS17PYzaXf4
         6g5k6ek3FUHM4D5ZTH03zvygR1cBnTJLXNOvbZu08v4dIvBbtEFuueA9AnG0XX1J9dVx
         WvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993517; x=1717598317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXlxBJgQstiSb1iHCBoySUt4Dr8xVwSho9/4h77j9/Y=;
        b=rpFob4SfbMOHpdR3A0Jf2wYnQJYBH9dPj5nwm6g2zNogQGCEyAaRf4m6d8jxsGasCi
         6HxQBEro/NkPnc+L9aoCSQnnNwuZNhyAinKWaYybOCbDz5CUyiln2rslIZCpLJEaGa2u
         rZmpM2hp4jjm7RoBMFq8ilr9TpR7Bgr8e9RERsWhEzdhbVXmcCPUct30iv1+FGkdv9JM
         KePKiwFMJ13iccZ6W1hbd3iWbT4e2TjgxN0OEmpIcp7wXkPthraEF3cUCF11IZTib2QF
         4l8XO+1Qkt0CU9VzjpFq/OwLqtKF9xyy7kxhtF2u2Vf1IuDiAPFsZet7UxqgwKzSNbZy
         P9lg==
X-Forwarded-Encrypted: i=1; AJvYcCU0XmN6YThgQoVPaouV7Z3lgHOsgAiCn8qsre7gptWjSGlw0N229PoEM4KjfHd/TEKSTIWgBQdffvVbuKbfEUtHNheMFTFNGFijSg==
X-Gm-Message-State: AOJu0YzjWHvgqCDrO8n3lKMr+0H1a6FS5KsZRqroBMDu+PYuzgnuSw3H
	stzsJzi/Ldvob27DquEWFh3poqQGJ1RPoY1MtDG+sSPo5sYP+wL7C8zU66K8ZxM=
X-Google-Smtp-Source: AGHT+IH716sSlQ0shXbTlDViazn4mQcqRoOCpRWv8t8XYiQ1HLYo/wxnu2ygHpUNyh3b8AdjgrqGIg==
X-Received: by 2002:a05:600c:4450:b0:41c:73d:63b3 with SMTP id 5b1f17b1804b1-42122adb00amr20059995e9.3.1716993516434;
        Wed, 29 May 2024 07:38:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089cc4e2sm183157625e9.39.2024.05.29.07.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:38:35 -0700 (PDT)
Date: Wed, 29 May 2024 17:38:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH
 interrupt type
Message-ID: <8689fbcd-3fa3-410b-8fc9-7a699bf163b8@moroto.mountain>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>

On Wed, May 29, 2024 at 09:45:20AM +0200, Matthias Schiffer wrote:
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index c957be3341774..400415676ad5d 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -126,9 +126,15 @@ static void _tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hwirq)
>  	unsigned int offset = hwirq - TQMX86_NGPO;
>  	u8 type = TQMX86_INT_TRIG_NONE, mask, val;
>  
> -	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED)
> +	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
>  		type = gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK;
>  
> +		if (type == TQMX86_INT_TRIG_BOTH)
> +			type = tqmx86_gpio_get(&gpio->chip, hwirq)
                                                            ^^^^^

> +				? TQMX86_INT_TRIG_FALLING
> +				: TQMX86_INT_TRIG_RISING;
> +	}
> +
>  	mask = TQMX86_GPII_MASK(offset);
                                ^^^^^^
>  	val = TQMX86_GPII_CONFIG(offset, type);
                                 ^^^^^^
>  	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);

The offset stuff wasn't beautiful and I'm glad you are deleting it.  My
understanding is that a hwirq is 0-3 for output or 4-7 input.  An offset
is "hwirq % 4"?

There are a bunch of places which are still marked as taking an offset
but they all actually take a hwirq.  For example, tqmx86_gpio_get()
above.  The only things which still actually take an offset are the
TQMX86_GPII_MASK() and TQMX86_GPII_CONFIG() macros.

Could you:
1) Modify TQMX86_GPII_MASK() and TQMX86_GPII_CONFIG() to take a hwirq?
2) Rename all the "offset" variables to "hwirq"?

regards,
dan carpenter


