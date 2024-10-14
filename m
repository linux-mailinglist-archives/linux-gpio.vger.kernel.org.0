Return-Path: <linux-gpio+bounces-11252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B236C99BDA8
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 04:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B964F1C21E74
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 02:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C3219FC;
	Mon, 14 Oct 2024 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbTIuZoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97460F9DA;
	Mon, 14 Oct 2024 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728871763; cv=none; b=FvT+z7qomuCH6VWU2+lmabdM24tBo+N8wXsWOVQkEQFOyF1D5tBRjyNPxX03EA+jfam6M1chihm5pELrrP03ghLUE5zfKo4WP3XZuVWXLi1x6V3q4Aupme+DD2/hnYsc2rRnNuvlCnPhHo6OB36wLxjXsiDJCXu87WcCPzPL2xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728871763; c=relaxed/simple;
	bh=3VESqHOV8b4hh3jdkOwFyKCj52yr9zL+dTduLnCVo1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUHZwDBrmF1cLlZpcJqJjDlAwxyk4958l3B6nI6eHbF+/nnMaU3VxAHT9OId8Jla4hpD46lf6yhbZW0o67L4k28hdxegU9Cp5teH+xsV83VR8KXFq4SFPMum+6PP5sp2+1HZmi7r1n+J0fgo74vqiWXcUMIx8oSFy+yz0QdctoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbTIuZoK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e06acff261so2417504a91.2;
        Sun, 13 Oct 2024 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728871761; x=1729476561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bMxPZI6R0DCCpJSP/haNfeI2p06/kQeE3JVhKeXdTg=;
        b=JbTIuZoKk508n87kOMeuaoBrviWkXYym8p48N+qYwhOBx7PoH6OwdcmToGhd6CNXaA
         AuSBIjh4KIz6XxEJl0Ag84gcxTAlvwhm8PtvSrEFrvT2uzGa/Dh6DajvwqeSaTw1iIvk
         V7jKKQGkMhXXII+YC49v3pZ6Whg1tVWqPtR5xg6Ea9bsYslwz1V7tDqXVOr3Y0r8Rd03
         EgvotNEmzQsKuHi/zpDayEdBejZLcjgJF3B7s+052aIVLg5IsoMjpTTBxSy4/iQDj1zN
         RccKyx4h8WUS60YP8A0uZAEcA5CnVYj+/0T06s3YaP08xYc6DlZXTD39/8bk+bHXJdzw
         Eabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728871761; x=1729476561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bMxPZI6R0DCCpJSP/haNfeI2p06/kQeE3JVhKeXdTg=;
        b=qsCkQv5FqpKCg4uKlzWLaliKOhBBRKZc9YcRPE7DSQWxRyTfIMArSbVYvxhflIlwHv
         PuM5PaDnT/SRdDclPsAdd5F/SzZsrzpRtsDd5d/UU4+zs1DGWLkRIKiWZd2myVvJq5e+
         5pLD1ik0/iEDoSROPQ4cf7ZHYk7z7XIvS8HrQzsQ6yl03h/01D61RnpySyZ4s2h+Vze8
         WXdHfKRMIyyLQjZRBohcPJ4uvwlFHJHEkmwKfXZpYUicFPZSD6xxWjOgrtV/s9C+1a0M
         +TQpTDobCikLylSglzGQXjpDIPfVKj8Aghe3CgCZ5lshOjFH0ZDfcyorIC+1MsLwM1WE
         /GTA==
X-Forwarded-Encrypted: i=1; AJvYcCU35LsstM7AxXgFN7w2X/YpLYEK7F1wZrQSKtAMcy67FtzpxBFZfol2s47lvTAPSbnjl0/RPsoWPipPiKsP@vger.kernel.org, AJvYcCUtdOeT/RSK+E4BWumtGcKzfQWiI13shn09GgyTa6GvQwJB+maTMDYpAUaG7n5O5mDjefNaUepqtNPd@vger.kernel.org
X-Gm-Message-State: AOJu0YxgU7FNcWgAdhPhcOWhicIeNV86cdove1+Oaz6NnDp1Q6qGcj7k
	TXnCLiMPZKVPQC5VWIJlgE/f0O5PaxDPKIk52Vu0knwFxJggdZyc
X-Google-Smtp-Source: AGHT+IEHAm+OCqzKTtab9/nCqP1werlpfqDB6YLUn+/qDO4nzM5j+j0Z8N9dnQ0+b874kLR/+PmObg==
X-Received: by 2002:a17:90a:be08:b0:2e2:991c:d796 with SMTP id 98e67ed59e1d1-2e2f0aa561bmr12731274a91.9.1728871760758;
        Sun, 13 Oct 2024 19:09:20 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2b41f8377sm5730756a91.1.2024.10.13.19.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 19:09:20 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:09:15 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 4/6] gpio: cdev: put emitting the line state events on
 a workqueue
Message-ID: <20241014020915.GB20620@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-4-b560411f7c59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-4-b560411f7c59@linaro.org>

On Thu, Oct 10, 2024 at 11:10:25AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In order to allow line state notifications to be emitted from atomic
> context (for instance: from gpiod_direction_input/output()), we must
> stop calling any sleeping functions in lineinfo_changed_notify(). To
> that end let's use the new workqueue.
>
> Let's atomically allocate small structures containing the required data
> and fill it with information immediately upon being notified about the
> change except for the pinctrl state which will be retrieved later from
> process context. We can pretty reliably do this as pin functions are
> typically set once per boot.
>
> Let's make sure to bump the reference count of GPIO device and the GPIO
> character device file descriptor to keep both alive until the event was
> queued.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 72 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 60 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index dec6c9a6005f..2677134b52cd 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2451,6 +2451,7 @@ struct gpio_chardev_data {
>  #ifdef CONFIG_GPIO_CDEV_V1
>  	atomic_t watch_abi_version;
>  #endif
> +	struct file *fp;
>  };
>
>  static int chipinfo_get(struct gpio_chardev_data *cdev, void __user *ip)
> @@ -2621,29 +2622,75 @@ static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
>  }
>  #endif
>
> +struct lineinfo_changed_ctx {
> +	struct work_struct work;
> +	struct gpio_v2_line_info_changed chg;
> +	struct gpio_device *gdev;
> +	struct gpio_chardev_data *cdev;
> +};
> +
> +static void lineinfo_changed_func(struct work_struct *work)
> +{
> +	struct lineinfo_changed_ctx *ctx =
> +			container_of(work, struct lineinfo_changed_ctx, work);
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	scoped_guard(srcu, &ctx->gdev->srcu) {
> +		gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
> +		if (!gc)
> +			return;
> +
> +		/*
> +		 * We're doing this late because it's a sleeping function. Pin
> +		 * functions are in general much more static and while it's not
> +		 * 100% bullet-proof, it's good enough for most cases.
> +		 */
> +		if (!pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
> +			ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
> +	}
> +

This block should be conditional on GPIO_V2_LINE_FLAG_USED not already
being set - most of the time it will be and then this is pointless work.

Cheers,
Kent.

