Return-Path: <linux-gpio+bounces-3436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81367859D33
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 08:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 373781F22C75
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 07:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E92020B24;
	Mon, 19 Feb 2024 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G+pEhP16"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD421363
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328658; cv=none; b=O14BQVv0Vo8qtkHLcXRCGvo0vlDClEMtmk/C5z/0dfr4PuQZZIdX8lgbseFLN4cx9Oa0nIIIXTU9Ud881jCffY++PNHMbr8ROQ2Z1R9F30Bj2+1MHozptgsD9tn1rY+1jbY7VRNs+jauURuUscGpKS6Ep7ExthjuxSwKUMp0W5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328658; c=relaxed/simple;
	bh=7/qPoQrZcFSiHts/pkXzTwa8vDdpEHbTGYy9TW/YEl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLoqqBPXLK3/pqZMD3O7mrBnYpcRZMMgSpyu+v2aEAEcNu1O6mxzwKFLQKATJ/1dCXB+YGmEOonA9l7Gg8fv95CVhOGC+jA1MYXVVTLhIRZ2+r0YkaxAYD1NPo9A6NH+5fanM3KUq8MqEavMGFm0ZxLt2GuByEUOXSCd4a2PZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G+pEhP16; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-47047e7b068so15102137.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Feb 2024 23:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708328655; x=1708933455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tg3MFuW2EZ67A7xGiTJNMKIfel/eoLDMzTrRgCoVUVI=;
        b=G+pEhP16ey8jfIZnnBOLZmLesMGhN2WpWjS4KCYxhCiqOcJVGhJxdNrmyUydzQw/GB
         Sq9v+pkBEdZ0lKCbUWxvAGihT1Dn0euNrfVvxGicp9ZkGnnWJr+VpawSAHJzncojsyg+
         DJgVU8UrY1IDuCTYvpKSeBi+j4ckqYqO8N3gQdCl1qdMZPCMwlULGXHE2v5yxfiJAD6C
         1jHmOQfjhdfcsB+Wzk85CdzDLegrHIFgIq50YCMKLZQrVvx4+B8SI6Z8xsthmQIGjW+8
         BvBdF2W3AqBp347S6NiHcM/0PDruJZMbEzLQ5F1fyXHB0d+Cn2kR5ZyyauEcKWn10A6i
         m3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328655; x=1708933455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg3MFuW2EZ67A7xGiTJNMKIfel/eoLDMzTrRgCoVUVI=;
        b=NjG6mjTrc0r1ymO4npgy88q6z3CxRelmHedfn2lYaQDptzVlbZiz7cifGmwLbWWkX+
         lACb0PJCpODs7BucS9S8peyH/UwC+srCXbPk421X2z2+Kg2POeWoZmIcAYNjoMB80Ts5
         +CsbORVByuHzcjyrKXJ6+psZyz2dQWx13g0t2Z9xXagNCgv8VoRWRUhs1ujcdZf9+d+G
         fmv/VQQDmtmtpUDYn7TejULA2H+EpCH4AVCe2KT5GgyLP6nL318eGytlyqWrxEWdXQQF
         6X+CDLjachv8wT24Mw+t+92oiNizY5lC5+I/8zxGFB9aZ+1AHHFbPrTPBYPMD2eLU3VP
         Bz3g==
X-Gm-Message-State: AOJu0Yworx7rOjk+M3B/MEZU/kUclxexi9nGMpXnH72LJgaT6UX3w75h
	s00l9bF1iQNr2Zmshr8ZOEvuU0wsBfiV3fcxgr5G8ODI6ldqLvivX3p3JGbXdHiuxmZeKDU5dMk
	pGLvpAVa2vEdHJJ/PfvJEYSfohkN784gGxzbbvA==
X-Google-Smtp-Source: AGHT+IGunJEBsTI0SmSoWKg+aPSEXOJMsTGF+Un8NyhjOhAtwMpa/tUFgrHw8ZsoB0/YwQv+yUpJYgxlkXCOcm1vhQ0=
X-Received: by 2002:a67:b607:0:b0:46e:e861:fb09 with SMTP id
 d7-20020a67b607000000b0046ee861fb09mr2778487vsm.2.1708328655070; Sun, 18 Feb
 2024 23:44:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240218174853.6492-1-brgl@bgdev.pl>
In-Reply-To: <20240218174853.6492-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 08:44:04 +0100
Message-ID: <CAMRc=MffACd5XyGVv4DQO9AhbeYiVhougS8_SJ23xHd-jpfF2g@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix memory leak in gpiod_request_commit()
To: Xiaolei Wang <xiaolei.wang@windriver.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 6:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We now copy the label string directly in desc_set_label() so it must not
> be done a second time in gpiod_request_commit().
>
> Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> Reported-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Closes: https://lore.kernel.org/all/20240217135255.1128716-1-xiaolei.wang=
@windriver.com/T/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e4dd13d81b4d..3c22920bd201 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2250,12 +2250,6 @@ static int gpiod_request_commit(struct gpio_desc *=
desc, const char *label)
>         if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
>                 return -EBUSY;
>
> -       if (label) {
> -               label =3D kstrdup_const(label, GFP_KERNEL);
> -               if (!label)
> -                       return -ENOMEM;
> -       }
> -
>         /* NOTE:  gpio_request() can be called in early boot,
>          * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
>          */
> --
> 2.40.1
>

I should probably stop coding while sleep-deprived and in the evening,
I realized now I sent the exact same fix as you. I thought this was
removing the allocation from desc_set_label() and not
gpiod_request_commit().

I'll go ahead and apply your patch and you can disregard this thread.

Thanks!
Bartosz

