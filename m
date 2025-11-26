Return-Path: <linux-gpio+bounces-29081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B04C8A233
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 295D84E5F51
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC1A22FAFD;
	Wed, 26 Nov 2025 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClfPAeex"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6F1F0991
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165788; cv=none; b=Fkhm/W3II7VwkpW+4qaLd5XNTvFUXuKZiVsd69D4YPb7+9CD5QDKoDIzk6t+uJxD9su77d0qVHLwebYLxAnDKauUEo4/6hS50e/XVPDEJDnob6dreg/NcMimGGLM0nPjDY999b/zv5Q/JVNECMyekg9DNFL+FMZgx5910NPmCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165788; c=relaxed/simple;
	bh=E4sngIhqOutXvjOl8aX3GMc9+zQwuLNz1SHOZj/U2nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAz4/WNhOqTk82rLL9HJT4P0ciZs7KvHd7tX7QHGJjTn3paYCXQudGOeSIeibfnAzKq2QPmI3NkhHy7D0IYM8ja7zkdsqiGbBmYF9DqWY3nB3XMnpE0rj73kjAyb7d26aU7qPTblBCIRo8w9A2UjfzgZZIwrORdaTu9gcdwqByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClfPAeex; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso11699338a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 06:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764165784; x=1764770584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Zxq7LFozTa8UOST16z7P92kDr19l2Us3OjrO19iH8s=;
        b=ClfPAeexFhzHzMmadWORel+/uZKTwMVgjrpuroN34+q+1W9WZWStqIfyADRTAcYKuk
         rju0pzsIo0WXdU3iPsXdA5+EFrvRv6SF7PkJABT6PzMRYNWZXe/QaQa/SLZI4+iWNiXF
         IqE0v0iRC4KMVF+jG7JlioRDBTz1De4JcqkDtbbj4gKe3JxrdsiePBfa84ppVhTI4g1H
         zB/YwR6j/RRsLWlO7UdMw9++65mNHrIst9d8A/vPyLlOGHVRLDLdAzaLjBYQqJskJkwK
         +RUYEXOECN1Ak4oq8ZeV9aoOkPm9nAm+O2/5RaWiULFK25vbK/SjvyBc6CKy48nORg0N
         rIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165784; x=1764770584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Zxq7LFozTa8UOST16z7P92kDr19l2Us3OjrO19iH8s=;
        b=pnAdIzKkw7V5PVhjwzSkw7DTkUFf73meGs5zPjQ+EfnHxChTILtr/XhN0Qrcky1/lk
         H5BVihWnMUjjSfOHCn3sZu2PQczW1gGNWHknpOIleqBGL8H5YKApTUgQHWHdFp/9Ym3U
         3daDqwYmVXkzibxUC6aL4vt7autLUN/R108yAfnyXOWy9oXIIyKsXeQx4YbXreMhflxW
         ImsWqhPtE2+c/b2qzj1eVx6P0UF8W2WgoXTACrYZ/xiG4aD6lfecCAO+P51eonPdfZW3
         h3I0Y3F5V8qN+44JlhwL39ADZWkdgd4EYtP8URL4quNe7JHK1E5ERcSq8Brm57SZHskJ
         pG/g==
X-Forwarded-Encrypted: i=1; AJvYcCUH5Ky4KL+6QVTJ0RSpSo/nkWCcSZvE7J3Hf9GqCrD9j1TgiX4PwcVjboCUtypXFI9N9nK1+KuiXQyn@vger.kernel.org
X-Gm-Message-State: AOJu0YxsivXRovADUSZUz6tMhdiq0QspoRotO33BKLcK6Ezq/O49Wyvh
	hnUxYr+nmUpi3dYLwym+27VMH/3rTKtBgp40DvuKduMzN3wwoRKb1NJG
X-Gm-Gg: ASbGnctCfB/wc7pDf5FnSM15j8wy9glv1fsbeE/aIslA6iBYDm2O50nVfNLsjK5RTRM
	vy9APK3BGa755UhVk1Dj67VIRS8Ws75aUAevzI6qvd/sSZ4Bh7y8Sc6alyB7hX+4A6hWlYpbb/Z
	ykgOeZrLSW3PG/cu6lEi/Jpi8050lEyPYLdW8be0ILxo/7FHVLTZsKpq2e5bLLiufEwpg/TZgqv
	RTzXfAXP7ZBNVvbfZEg4gimyNd0zYCf74ezmNrcWL6NKEYJwL91h6M2sUplwlRA0WUz0dvGs9qJ
	77Ikic4X+vCk5JXPBYo8zfA+b3KnPwqs/9cldZAl5pqE6R/hFYsedm3+7Bw0TzBx1n4Ob3wNjSt
	i5pgADjBReXbQ/01rJSRFyt50/sF8LwJNJeEBdxPIWtICZF34nYLgr1mMpIkTfq/wxj5QTBQwVI
	fXIUFN9XTtpvrqK/fewmPXCXZSB6/SEf/6pv//qJLAqomUQ7EnT4Li31KZqxGpInWR1As=
X-Google-Smtp-Source: AGHT+IEKc6DMi1rnsiKXGQ7YCm1EduL/BJbWA26zQIPUem7U5uZbM9JaOZh/wc742sj/SZNAl5nqiA==
X-Received: by 2002:a17:907:2d90:b0:b6d:6c1a:31ae with SMTP id a640c23a62f3a-b767183c1femr2036911366b.49.1764165784185;
        Wed, 26 Nov 2025 06:03:04 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:123e:4501:1025:ba00:55dc:4ccc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d73430sm1901764266b.24.2025.11.26.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:03:03 -0800 (PST)
Date: Wed, 26 Nov 2025 15:03:01 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/9] iio: adc: ad4062: Add IIO Trigger support
Message-ID: <57msi3wjxm7oilpaky2ezurqvun4p5hdsicrhq5rhkljka3ryo@xqvdzdiwnl6y>
References: <20251124-staging-ad4062-v2-0-a375609afbb7@analog.com>
 <20251124-staging-ad4062-v2-5-a375609afbb7@analog.com>
 <aSQnDMsE13zwM1YO@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSQnDMsE13zwM1YO@smile.fi.intel.com>

On Mon, Nov 24, 2025 at 11:36:12AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 10:18:04AM +0100, Jorge Marques wrote:
Hi Andy,
> > Adds support for IIO Trigger. Optionally, gp1 is assigned as Data Ready
> > signal, if not present, fallback to an I3C IBI with the same role.
> > The software trigger is allocated by the device, but must be attached by
> > the user before enabling the buffer. The purpose is to not impede
> > removing the driver due to the increased reference count when
> > iio_trigger_set_immutable or iio_trigger_get is used.
> 
> We refer to the functions as func(). Mind the parentheses.
> 
> ...
> 
Ack.
> > +	struct ad4062_state *st = container_of(work, struct ad4062_state,
> > +					       trig_conv);
> 
> I think the
> 
> 	struct ad4062_state *st =
> 		container_of(work, struct ad4062_state, trig_conv);
> 
> reads better.
> 
Ack.
> > +	int ret;
> 
> ...
> 
> > +	/* Read current conversion, if at reg CONV_READ, stop bit triggers
> > +	 * next sample and does not need writing the address.
> > +	 */
> 
> /*
>  * The multi-line comment style is as in
>  * this example. Please, check and update.
>  */
> 
Ack.
> > +static irqreturn_t ad4062_poll_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +
> > +	iio_trigger_notify_done(indio_dev->trig);
> > +	schedule_work(&st->trig_conv);
> > +
> > +	return IRQ_HANDLED;
> >  }
> 
> ...
> 
> > +static int ad4062_triggered_buffer_postenable(struct iio_dev *indio_dev)
> > +{
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(&st->i3cdev->dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ad4062_set_operation_mode(st, st->mode);
> > +	if (ret)
> > +		goto out_mode_error;
> > +
> > +	/* CONV_READ requires read to trigger first sample. */
> > +	struct i3c_priv_xfer t[2] = {
> > +		{
> > +			.data.out = &st->reg_addr_conv,
> > +			.len = sizeof(st->reg_addr_conv),
> > +			.rnw = false,
> > +		},
> > +		{
> > +			.data.in = &st->buf.be32,
> > +			.len = sizeof(st->buf.be32),
> > +			.rnw = true,
> > +		}
> > +	};
> > +
> > +	ret = i3c_device_do_priv_xfers(st->i3cdev, t, st->gpo_irq[1] ? 2 : 1);
> > +	if (ret)
> > +		goto out_mode_error;
> > +	return 0;
> > +
> > +out_mode_error:
> > +	pm_runtime_put_autosuspend(&st->i3cdev->dev);
> > +
> > +	return ret;
> 
> I guess with ACQUIRE() this function will look better, because the explicit
> reference count bumping (with an associated comment) is more descriptive on
> what's going on here with PM. Same for other related functions.
> 
Oh this one slipped through my fingers, should be using ACQUIRE as well, thanks
> > +}
> 
> ...
> 
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "Failed to request i3c ibi\n");
> >  
> > +	INIT_WORK(&st->trig_conv, ad4062_trigger_work);
> 
> This is mixture of devm_*() and non-devm_*() calls. How did you (stress) test
> the removal and error paths here? Wouldn't devm-helpers.h APIs help here to
> make / keep order correct?
> 
Oh yeah, missed this helper

  	ret = devm_work_autocancel(dev, &st->trig_conv, ad4062_trigger_work);
  	if (ret)
  		return ret;

the path was missing clean-up, and did cause issue if there was work
being done on detach

  ERROR: iio:device0: Unable to get next block: Connection timed out (110)
  8<--- cut here ---
  Unable to handle kernel paging request at virtual address bf00715c when execute
  [bf00715c] *pgd=0b43f811, *pte=00000000, *ppte=00000000
  Internal error: Oops: 80000007 [#1] PREEMPT SMP ARM
  Modules linked in: ad4062 regmap_i3c nvmem_axi_sysid [last unloaded: adi_i3c_master]
  CPU: 0 UID: 0 PID: 8033 Comm: kworker/0:6 Not tainted 6.12.0+ #4
  Hardware name: Xilinx Zynq Platform
  Workqueue: events ad4062_trigger_work [ad4062]
  PC is at 0xbf00715c
  LR is at wait_for_completion_timeout+0xf0/0x118
  pc : [<bf00715c>]    lr : [<c07ec920>]    psr: 60000013
  sp : e0911ec0  ip : 00000000  fp : dfb960e0
  r10: 00000011  r9 : 00000001  r8 : c4b89d40
  r7 : c49e4500  r6 : c49da040  r5 : 00000001  r4 : e0911ef4
  r3 : cb455500  r2 : 00000000  r1 : 00000000  r0 : 00000000
  Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none

thanks,

Best regards,
Jorge
> >  	return devm_iio_device_register(dev, indio_dev);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

