Return-Path: <linux-gpio+bounces-21753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7AADEB13
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 143EC3A17C4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C35F288C29;
	Wed, 18 Jun 2025 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqMyNAD6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF9E2F5324;
	Wed, 18 Jun 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247992; cv=none; b=T0g17up5ia4jun5wQXd1Xyo/I5wfqzRWrXrApoqoNIIMP1yweTQ8zWUy9RcabmBi078AzclRSc1qK+HsTg9G9DcFE+lqCTvLF8Pw6tNpgNU0OFS57x21Wx5aqWxYHlqi+P03F0BDUtoLzNjUeHwZJWc8XU6cHOyk1IYcwhDQfwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247992; c=relaxed/simple;
	bh=J112Eid9Ng8Jp7ieqEaJI/iP3kwH4JceG0YJhdYNpnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyHwkPxwegZ8Hxkq2D9rD6nl5WWHoU1Nbzeu3nTyyzTKYOMLciHujbWDjJ6FpQG407yj1uOuA1hCiMtZqrqUU3qrPUy4O3/ZtMGq24u+xtd4jomc4J6o/MOrkztxqyJy37sZSn3tLZtyWjGq9Oc6C4QtGv8++DOgpUyHfa/+gko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqMyNAD6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b165c80cso5842093e87.2;
        Wed, 18 Jun 2025 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750247988; x=1750852788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
        b=iqMyNAD6eWlY2wicvDhv4FzrTZVRvKE8fZylklG5/ndxrdQ7233vA84bRf52+xDvNl
         sdqJesUcZYVALp1HApg/gHVItwCAqnM00t0teidK0a8xtijynpRaCQVXPEedILB9g0L6
         MFNwphmbBcPaxRH35ARkTn8/q/uRElfnauR09sohEpDkTGTogHSNAkwUh+j4xL5Y/6Zl
         3LYJTqa5ec0a5y4LLI1fkNjW2dzXCBFwK/qoQW+r6dAl2OjpgNPVwM9uWFxWW/+2gLSE
         nXOE6WTB6k+LE18em9zLa0JCsCxNQgSLmTl8T6jL/nun+gBXBrRwvFnpROmGfY6LD1aG
         GvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247988; x=1750852788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
        b=eCfRCkI1vOyUmR+Ei/AEPh6ccNKJ6y3dp3icEL5V+tAh0FRlbAT00lufV+WQAIGdgf
         5rvSDUh1wy9Mxcm/8B6VN202X6XMbou48zT/bs5+zoP+2k5rtwy2FxR/NQRh0IiWvn6+
         3deCNL3Bc0HCZLD1wVzj+T5a0mLaMQJQN9JAqa3+x3GWlm5r4DBBDqRq9lfapiK+XzzY
         aUvyewqSSo7fbI8IhhEhtagHAxdwO1CxmfT5VPxIPkMyfKFXSaRwzqUOIaoErw/eEctf
         L+R7Rna43kcFtIMqW6PCQWp0x/pzuMBl8T7fdiqDvGhKDcGxEKPK+W0XlvXo1soTYY+t
         Sf/w==
X-Forwarded-Encrypted: i=1; AJvYcCUzTDDpn0NzbzzvUtmZXT5XgtixNal61k3c704c7co3nmxrXcMAyX4gUiY+5eRtEcc7tA8MrP7dcTK3A6o/@vger.kernel.org, AJvYcCW3xpcfHr0kIPXPPkCYsxqX0OxcpBi+LjDHx339Wp4zFdxQ1wv19wUy/Q0cYgqyZJjp/V3otPMbFjaVug==@vger.kernel.org, AJvYcCWPfZ1LLHyrswW0SPOk2wYXE1TLJxhK5/y4IcvT7/JhRiOo74oE0UdLERwaqwnp9s/qJW6ql1/SB0dP@vger.kernel.org
X-Gm-Message-State: AOJu0YwEu6Y4smEEkfLp8QCFmaynzR7VacCE37poB1H4UoDWTsnrVFT6
	WVK/KFa+SU6checUvCx9Aavf5JFL6I3viz2k5N1FFyRN9VHkdS77qIuP
X-Gm-Gg: ASbGncsnyHjVVAJoDFAQ8lgzIYMDYlnyk7xGaI7pPdCvn/9h73MGNcjj18wGmv5GNX+
	V8tx1GboQcyDfFt1e6BFECbR2r4i2SQ8wtBmXIOo4qKyWWrJXm0z1WYCYmWT+KH2zfIjz5akgEC
	mGbyl1lTRUoWLC/CWOBpfu7J5RBuL3gPs2LJsDi1oueF0Tf7cZG1LT2szMzCfoJw1ZgIucLa5Do
	7+OrBARnPBekBqIGZ7EXpwpd0P7t55GOJQaN/GjreEXkybLFIDrdMJ3qtUu7UhTkL2i2Y7S4UBV
	898s7VCJSkJvr/nyNFqyo6cBJ1Rz2ZSH7/W2u9I120zKv2xCf/dU3ZGO9O9/BjOI0vGHhx2h6w8
	DqA==
X-Google-Smtp-Source: AGHT+IEEuLAvgr2OL57VbH9FchKBqYmVVAHa3AT4JbHjg5k/1SYfHWucA3kEC25R23C9uvFFL7j1Sg==
X-Received: by 2002:a2e:b8c4:0:b0:32b:2f36:4d92 with SMTP id 38308e7fff4ca-32b4a413262mr52990161fa.12.1750247987973;
        Wed, 18 Jun 2025 04:59:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-32b7dafc837sm1702891fa.47.2025.06.18.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:59:47 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:59:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter
 callbacks
Message-ID: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>

Hi,

On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>  	return 0;
>  }
>  
> -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
> +	return 0;
>  }
>  
> -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  	unsigned long flags;
> @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	gc->write_reg(gc->reg_dat, gc->bgpio_data);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> -				 int val)
> +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> +				int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  
> @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>  		gc->write_reg(gc->reg_set, mask);
>  	else
>  		gc->write_reg(gc->reg_clr, mask);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  	unsigned long flags;
> @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	gc->write_reg(gc->reg_set, gc->bgpio_data);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>  }
>  
>  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>  
> -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			       unsigned long *bits)
>  {
>  	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> -				   unsigned long *bits)
> +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> +				  unsigned long *bits)
>  {
>  	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> -					  unsigned long *mask,
> -					  unsigned long *bits)
> +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
>  {
>  	unsigned long set_mask, clear_mask;
>  
> @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
>  		gc->write_reg(gc->reg_set, set_mask);
>  	if (clear_mask)
>  		gc->write_reg(gc->reg_clr, clear_mask);
> +
> +	return 0;
>  }
>  
>  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
> @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
>  	if (set && clr) {
>  		gc->reg_set = set;
>  		gc->reg_clr = clr;
> -		gc->set = bgpio_set_with_clear;
> -		gc->set_multiple = bgpio_set_multiple_with_clear;
> +		gc->set_rv = bgpio_set_with_clear;
> +		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
>  	} else if (set && !clr) {
>  		gc->reg_set = set;
> -		gc->set = bgpio_set_set;
> -		gc->set_multiple = bgpio_set_multiple_set;
> +		gc->set_rv = bgpio_set_set;
> +		gc->set_multiple_rv = bgpio_set_multiple_set;
>  	} else if (flags & BGPIOF_NO_OUTPUT) {
> -		gc->set = bgpio_set_none;
> -		gc->set_multiple = NULL;
> +		gc->set_rv = bgpio_set_none;
> +		gc->set_multiple_rv = NULL;
>  	} else {
> -		gc->set = bgpio_set;
> -		gc->set_multiple = bgpio_set_multiple;
> +		gc->set_rv = bgpio_set;
> +		gc->set_multiple_rv = bgpio_set_multiple;
>  	}
>  
>  	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
>  	}
>  
>  	gc->bgpio_data = gc->read_reg(gc->reg_dat);
> -	if (gc->set == bgpio_set_set &&
> +	if (gc->set_rv == bgpio_set_set &&
>  			!(flags & BGPIOF_UNREADABLE_REG_SET))
>  		gc->bgpio_data = gc->read_reg(gc->reg_set);
>  
> 
> -- 
> 2.48.1
> 

Isn't this missing to convert gc->set() to gc-set_rv() in several
places?

Without the attached diff I get a null pointer reference on e.g. the
spacemit k1 driver.

Regards,
Klara Modin

--

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb23..57622f45d33e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 
 	return bgpio_dir_return(gc, gpio, true);
 }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
 	bgpio_dir_out(gc, gpio, val);
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }

