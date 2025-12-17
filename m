Return-Path: <linux-gpio+bounces-29724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B18CC9BD6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 23:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3A02303CF70
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 22:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E0032F74A;
	Wed, 17 Dec 2025 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJlojhSQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CE30C624
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 22:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766011973; cv=none; b=E59B7agETr7ZUO0VNkxg8dsgy07HDin6EWD5PGbFxIgxS01HqILle2kKEJIPHhtfvC5+LHysCD7tCPS92Xym4d6AOONkammV/CUJ/QUAxCQ35PsA5v7mYTzUCBUYQwOv0EZBvgzyxDrR9dHMnh86rZngjBJCVFeqF/e3PhR/tsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766011973; c=relaxed/simple;
	bh=dXzAjuZST5taHyAlqJWpBxtqIGIfEewCcsGF41GgIWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADiZJ1U90P3ARfPMYzx7MUdqCVKqm269WHBPmVPSqqkE9XnzAwVSfdsmnZe5pHx2tI6KnZ8I3SbAqat6Np3FXVBvFSHTfrRphn5iK5FofuTfGT9DO1gP6aY2X/jr3keG3gk+OCktVMQV0rRQVPg664lnJbBDpXgezAC4t9E9Ok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJlojhSQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc305914so4194655f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 14:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766011970; x=1766616770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGPp81slurEQiCKzhi07hN+sNzZ7utSqwlfER5CZSGc=;
        b=LJlojhSQFvWQBeKWb9wqwOlFrisfn9h1QbmYw0ujtzP7iueyzuGD5Ycz9reR/27M1b
         Z1cUG5lFXWL/JkAuRBoMqOjogxkZYb63IdwzAkcKTEd9KlhjLyDjJMDT7e0DdSHzeNPi
         5i22Zc8ZYAmsYpqmi89A3F/pK3vzR/ThS7XQnKMKurpXLkNE48bxgloA+YBFr0B3nWqf
         J+zJUDWnNkSs0F67WZsUcsI/Z7GBc2d0RE2yCHf/NRCPdOhNr55zWt3JEtpUAMPLa/RH
         M8ZRwEJFWG2eFwytuzDjUHAW2Ak99T8Whb0w3HomlApvKe6jlWEa0X1pvKMO5fzKQqcw
         qRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766011970; x=1766616770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGPp81slurEQiCKzhi07hN+sNzZ7utSqwlfER5CZSGc=;
        b=SkgEWkHFHfCOAEaWlEQNZS50as98tRaR0cNbpyRDf083EPFfGrXgFxNKGb3Jt/sfwa
         gYgUJ8EBK6T+oxuvQYR/kEboSIARm1k+iXMF+mus2fVorv4fUgUtn4HlsmfGtNsN8EQl
         MvDPHqg1oVPfHO1imRwdJLR7NiF0bObJgaR5HVgClR7ZxtezUbkTotqmGteLb9ndUr44
         xwbSvb2m7CmpeJaUtRGl6BcUxccZErqCI8BZKPaCrrVAC5OOMaFeVU4NsTU2JKdPoaEd
         i6+udew2kFka3NgZAa4ubEEf6D4fGYJt1qCr+MBIJcDjLBP67EKpm7VTkSRBv/P72s1O
         T56w==
X-Gm-Message-State: AOJu0YyU/xEZwZVoOuGqE8Jt6GoeUYNfJEIi/oXKnrhNanW8sRIen9sN
	eht7vcbXIlE8PI5EXyQUCaa9fZCOqrNy3Tx1NciHmsudFRsG3fUsT9fb
X-Gm-Gg: AY/fxX6WozoBqTVLjS3a8MJ2Fo6pmd09AWuP1LZtSv8cBWS1hSgwaDuxXl0NvAmZ2vx
	agMENGoVUZlEl6FNrdVQbsXG6r+pzkQbKv3fUrEWuWxTQuFn1u/4o8o52UtQC/GaMhVFylz3pHq
	X+D+ClT1POY3ibxEinfHPlMdueYFMQJgq2G8GZJmEk8nGWPFIxANbuPqwQoSTKLVu/YAneOY0JW
	u6lu+sdWRAht2Drt20m0waM/CRNvY/eawZHWqLWdiJilmEuOFtm+EkvjL7c0NGfsPkeAlEYehD5
	H9OYA196rlwzppWTbj0XHG/Gs/ojvnwPOlomq0pElDfDfE/wNxoNFlX5sxSzgT4UhdDZ0uM4KNO
	G3sXO6Qvnygmi/NVWexTHci6m8f5vwgjoL66DAjVu1kXskU0/BEDXnY50YYw8Uwu6WEsiEgoH/c
	9N5IC1wkHOrnKq7yX4DW/rlfA4mU/+9Q+v61EvUb78QQjNyB0A0Z3y
X-Google-Smtp-Source: AGHT+IFHracCeKFQUGLufy+gAUMi7FrrgHnQjkM7P0uiBL8gQC6IuWLanr1sVMzxU6eIKSkuIoFwNw==
X-Received: by 2002:a05:6000:4010:b0:430:f1d3:f96 with SMTP id ffacd0b85a97d-430f1d31a78mr16655611f8f.6.1766011969160;
        Wed, 17 Dec 2025 14:52:49 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324498fbdfsm1420841f8f.26.2025.12.17.14.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 14:52:48 -0800 (PST)
Date: Wed, 17 Dec 2025 22:52:47 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] gpio: realtek-otto: use unsigned long
Message-ID: <20251217225247.5873449e@pumpkin>
In-Reply-To: <20251217202331.9449-1-rosenp@gmail.com>
References: <20251217202331.9449-1-rosenp@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Dec 2025 12:23:31 -0800
Rosen Penev <rosenp@gmail.com> wrote:

> Fixes compilation on 64-bit platforms as pointers need a larger type.

Not a good description...

> 
> Change device_get_match_data to of variant. The data is obtained through
> OF anyway.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-realtek-otto.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> index e6694d5d1696..e9c89b191989 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -360,7 +360,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>  	struct gpio_generic_chip_config config;
>  	struct device *dev = &pdev->dev;
>  	unsigned long gen_gc_flags;
> -	unsigned int dev_flags;
> +	unsigned long dev_flags;

You don't need to change the type of the variable, just the cast.

	David

>  	struct gpio_irq_chip *girq;
>  	struct realtek_gpio_ctrl *ctrl;
>  	struct resource *res;
> @@ -372,7 +372,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>  	if (!ctrl)
>  		return -ENOMEM;
>  
> -	dev_flags = (unsigned int) device_get_match_data(dev);
> +	dev_flags = (unsigned long) of_device_get_match_data(dev);
>  
>  	ngpios = REALTEK_GPIO_MAX;
>  	of_property_read_u32(dev->of_node, "ngpios", &ngpios);


