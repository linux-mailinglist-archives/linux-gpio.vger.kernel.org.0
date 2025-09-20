Return-Path: <linux-gpio+bounces-26420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06410B8D18E
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Sep 2025 23:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06F5F4615B8
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Sep 2025 21:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F423D28312D;
	Sat, 20 Sep 2025 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpseLoSw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E827B345
	for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2025 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758403634; cv=none; b=rTkwxifXRadA+PiqSmFX9nYJtNUltesxCYO5i3oT8ZktMFFACAOelK+9wMKYi82vRNUkalXrpOjEoEoF6qNArQF2sb1DZCR+8tYqdBsALkPv+KqQz3QLOwVy4fs4xD17cG5ZRg2TlBcDlDq3MqfKDPicD18MjdtCONnT/TRXnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758403634; c=relaxed/simple;
	bh=f7gaqrL+IdTMhppclJNecJwlQYDnd8rNalUqZDwS9BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeNJvp30Udt1WkaXp5rRsZYlrMx1oByiXFcd0dJ6EELkvsgq0l6xAGwxVXKC+tghWoLfEWZVC89kOvBPa90q28piJbl2kCrup2yYViKqPkBQ3Ckh4fhYs6PWJvSO2s+lVRkB4IWNp6P+Io2PV/mwh+np+VpQIJJSLlnNdnms6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpseLoSw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f1a79d7e5so879224b3a.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2025 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758403631; x=1759008431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZag6O+eNvRyqeUVqQW0eazqLmcxqUXmRta6WqjCdqc=;
        b=LpseLoSwx17AelclNn/2XNY/zir9cJREODHa8FLdRu/XsdAIBFMSa/TOfnGYbiZAvT
         zzYEzjixjmGq47BtsGNAb+AW7TOeBNs74QdPSrkqNY2kaSXTbg76UAsHMNtwW3yZxSAo
         7dQQATvqdlQ4c2BDc95hG1ukkUwaEGxoxhFb0Y+23UmiNgFzgFIB9o3nxsdTZawkIEw1
         Q1Y7DedOilyNaUjFYo23mXTt2xieoSIztniDsMB+Ebn6Kc+cvYkwgBF8Qd/qoYNbWiE2
         ZxgJRJqHFTHu+U0zBB2MDnS3QciMn7vsMP9T4BJ0e7LChGDKR6y1LjH5DsilqORReeMB
         SmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758403631; x=1759008431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZag6O+eNvRyqeUVqQW0eazqLmcxqUXmRta6WqjCdqc=;
        b=JvzWkgZLxZV7CtNiaQQJWexW0dK5+Xp94JWbw1ouFTgPEALuNq2AONpv59egi4uvkG
         V6Z4LJpk8Dmeiw04Qsgirudwrmtk+wx3MZGOVQC+xeNwDbjcGWHKLBl4709NSZL6Iqc9
         gh3xHhLNjFO0+y0SsEaaHFeJaFgSwEtFJvzUQudEsXqj47tpk2gCPIQW5vBqB4JoPg52
         wuN7W+GTym1/WVn15nZW5G94YLzy8gAC/llZvDbkDxfbXCB/25zZiJGROG1sOv3cKrU/
         /AX9Jy1YuuUepRVyRboPnYJii5+tlMJBz9lz0ozKOXLjT3jeBPKsoXtViQ8mDkWrjzMy
         OfyA==
X-Forwarded-Encrypted: i=1; AJvYcCWj9KWYRXXxWhcwVbaZpt7Fa9X+BR17bDdMaNYB70M15Adfwrdd55FmtASXkNwr1vvn+EZpikghsk1i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cNhZp2PTGz1+CK9eFGPJt84dzGw3S7Xu1yGiJESrJO2pI+wb
	3X9LwJOjvfM/ndW0Y+W6mdNkVYcWl60c5rKUIzF2DKAE7pqiB6hqwWt0
X-Gm-Gg: ASbGncvmSp7mKilA8KrO55OqLBFhim8HZz3nIzcgT9NzFaiA2qfRz5LLqjXQZS6Mm6v
	jzlKdZI11eeyp8S5pqIEiMhM2us5l6svEGjGEQe1c4z/6AArgYapCwoSlFEVpCr4k35EueRueR4
	oeul+u3HHTGeI2z46/l8BQU1y56t3eJYv4GMxE7cJGvN4NDbS51oCUa/m5GpzDe9MhB1h/8QOzw
	3ttn77ELKeujmzoZQ7TClatS3gm1KMbMUUxIIMJcxnBt2naluXI0GCfK/6OKQJbhWjYsUJ30GGt
	1PXo02GzeKo1SKNAnbpp47g2yP4BmPZbEC9uwEI/UdanprfYkpbaYOjWqrorw/n+5nNKIrCJtGH
	URng9Wc2ZKwRrFaGNfgAdfCk=
X-Google-Smtp-Source: AGHT+IGITBO0tfJKLwT0mwSLK+UoL+A//Eq2cJmFH0SGOX6eRMi/hhWWMwDIlaR00acM/zLrO/w3rA==
X-Received: by 2002:a05:6a20:12c7:b0:263:5c8b:56f9 with SMTP id adf61e73a8af0-2925ca2bd9dmr11817653637.10.1758403631238;
        Sat, 20 Sep 2025 14:27:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fdae:ef9f:3050:cdfb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b553e0c92acsm1054462a12.15.2025.09.20.14.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 14:27:10 -0700 (PDT)
Date: Sat, 20 Sep 2025 14:27:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Extend software-node support to support
 secondary software-nodes
Message-ID: <w7twypwesy4t5qkcupjqyqzcdh2soahqpa35rqeajzh2syhtra@6trjploaie6g>
References: <20250920200955.20403-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920200955.20403-1-hansg@kernel.org>

On Sat, Sep 20, 2025 at 10:09:55PM +0200, Hans de Goede wrote:
> When a software-node gets added to a device which already has another
> fwnode as primary node it will become the secondary fwnode for that
> device.
> 
> Currently if a software-node with GPIO properties ends up as the secondary
> fwnode then gpiod_find_by_fwnode() will fail to find the GPIOs.
> 
> Add a new gpiod_fwnode_lookup() helper which falls back to calling
> gpiod_find_by_fwnode() with the secondary fwnode if the GPIO was not
> found in the primary fwnode.
> 
> Fixes: e7f9ff5dc90c ("gpiolib: add support for software nodes")
> Cc: stable@vger.kernel.org
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> Changes in v2:
> - Add a new gpiod_fwnode_lookup() helper instead of putting the secondary
>   fwnode check inside gpiod_find_by_fwnode()
> ---
>  drivers/gpio/gpiolib.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 0d2b470a252e..74d54513730a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4604,6 +4604,23 @@ static struct gpio_desc *gpiod_find_by_fwnode(struct fwnode_handle *fwnode,
>  	return desc;
>  }
>  
> +static struct gpio_desc *gpiod_fwnode_lookup(struct fwnode_handle *fwnode,
> +					     struct device *consumer,
> +					     const char *con_id,
> +					     unsigned int idx,
> +					     enum gpiod_flags *flags,
> +					     unsigned long *lookupflags)
> +{
> +	struct gpio_desc *desc;
> +
> +	desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx, flags, lookupflags);
> +	if (gpiod_not_found(desc) && !IS_ERR_OR_NULL(fwnode))
> +		desc = gpiod_find_by_fwnode(fwnode->secondary, consumer, con_id,
> +					    idx, flags, lookupflags);
> +
> +	return desc;

Bikeshedding for later. Maybe do it like this in case we can have more
than 2 nodes at some point?

        do {
		desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx, flags, lookupflags);
		if (!gpiod_not_found(desc))
			return desc;

		fwnode = fwnode->secondary;
	} while (!IS_ERR_OR_NULL(fwnode));

	return ERR_PTR(-ENOENT);

> +}
> +
>  struct gpio_desc *gpiod_find_and_request(struct device *consumer,
>  					 struct fwnode_handle *fwnode,
>  					 const char *con_id,
> @@ -4622,8 +4639,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
>  	int ret = 0;
>  
>  	scoped_guard(srcu, &gpio_devices_srcu) {
> -		desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx,
> -					    &flags, &lookupflags);
> +		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
> +					   &flags, &lookupflags);
>  		if (gpiod_not_found(desc) && platform_lookup_allowed) {
>  			/*
>  			 * Either we are not using DT or ACPI, or their lookup

Thanks.

-- 
Dmitry

