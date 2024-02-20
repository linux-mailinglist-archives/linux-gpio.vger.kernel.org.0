Return-Path: <linux-gpio+bounces-3514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93685BD7C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 14:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995531C22EFB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 13:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD0D6A346;
	Tue, 20 Feb 2024 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wYTRKQXs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9E69DFF
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708436840; cv=none; b=bMQv78l+740PJEfH+TYZFb6IQK1OepO2Q6ZD+Sx48nSvmYPxZowP8F/tX8fcVBKblSqlotLCH/FV0jGLOzkf7EbpZjdvIjORtD91fH54iC2PC5sJK14MaHosx2iBfjTPz0UrwpUmWUc934vSwEKlqJpK14mlDI0kDU4a1+XqisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708436840; c=relaxed/simple;
	bh=mE0j+Qrke2cddcGFIvvUiBvzrErWLU7t4wERqe0Rprc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaJWZB5u1iG8o/ooKDAl+J0JpTL/l14tSTfKhLFHawWx3ga2FwHDYQ2QKlLY2YJGJh5wlLcBWavVJL5eXEfNtnyXBWvjPfGaC5Sii3kRMIl47pUf67deNuVG9HYgPrXa3Orqw5LbhSU3a3q0epoAfezCTTdcHaGcCNUaPU200ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wYTRKQXs; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5c514944fso2870896241.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 05:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708436838; x=1709041638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOKKbkQWU7AKt3SSuiELRArPG+65DzkCYGNRa8cvu24=;
        b=wYTRKQXsnOUrQOG+3MeYA8V9dXihvdD66W7wPJLmR8WMvtvhFTVWMP0qTjLdeuFaE0
         3H/Lt+el78P3WtRC7JRmRq4cpiNNFiPU6x+25j3ule9lJa/nMNvEF6l9VGzl/28bSq4c
         dfMNRyeQS4vHZQDZJV9D+Kp2/r6U+XLj4QvaP1zHhi4Yz3tkN/hihiNI9Xhv5q3Jejvu
         L4ykgGQkZQb2lvAMoZGh0BJC+5/HAQcVcLr+WippT3R5Vl43YE0FynkCNvfwDek9sXM7
         X3M6M7lziiRZVwy7cJNPwHJ68JrfqgTxR+OvHgQcJwARjNLs20357sUX5pNRLhkKIczj
         /1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708436838; x=1709041638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOKKbkQWU7AKt3SSuiELRArPG+65DzkCYGNRa8cvu24=;
        b=vabNVa4j2d2mEIUJri016IfHUjauAsRdVST8hMf+ZiXdCnYtDYkvrayAnOkOtmOJGK
         3zgZbzmq2Him9HvmATyzn8fF36pP1un6Ts0SbXkamEHHfTjY/ennEyIoBlobXpdH2pDT
         zrPsA07TpVmfb1+QhWMb7rmko7kbEi4cbuvR+dQPHnEDj2XXw0ihlTRvOa+5TWeGew8c
         vjVYKjbVBC0pSYm5X27aZ5IjE/mdVv+1jUGcPaqFggTPlnjaXcNSHBXEgyyqQUssoP3Y
         I5oW29+y4TF5YRLx1c0R50hJLdHDZ+8roTdOcAg/NEdBd8hWBLtnc2yfX8pLIrjI6lzZ
         Vu+g==
X-Forwarded-Encrypted: i=1; AJvYcCWv8Fr7GSvmkixvxEY6rc1s4dunjBwttHOL7i/6BZDoq7AH80T9c8smB5MDJAiFX95sTbj0e2W0VkTYaXyQkv2Eq678lGOGfa7QXw==
X-Gm-Message-State: AOJu0Yw0P7eNH/W0o0xSYNA0doPA0g80Vw3KPY2Lowjhg/siF4xttZb4
	eaZe+97d6vJ7gLvPs+LkFC7tyiBrY2f48NjxCLCTctefiWx6q6p/BfNfe2TIX2atn+jiSItomRL
	4fDRppSwuu96X9/plWQkTZ9Ky3JwzLHHu/aEp9Q==
X-Google-Smtp-Source: AGHT+IGLCernra2jUl0A5+U2XB+a/z0FjsKHUQpK3wonJZJuh3Ofef/exclTOHmsAoggIscjPYbwp2F278HDfRp749E=
X-Received: by 2002:a67:fa93:0:b0:470:5cbc:4f4c with SMTP id
 f19-20020a67fa93000000b004705cbc4f4cmr3232337vsq.16.1708436836995; Tue, 20
 Feb 2024 05:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111019.133697-1-herve.codina@bootlin.com> <20240220111019.133697-2-herve.codina@bootlin.com>
In-Reply-To: <20240220111019.133697-2-herve.codina@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 14:47:06 +0100
Message-ID: <CAMRc=MdFuJGm2AUq45SkR8SpNDg-4Qe58fc7+ow0Oy+==aACnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: call gcdev_unregister() sooner in the
 removal operations
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:10=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> When gpio chip device is removed while some related gpio are used by the
> user-space, the following warning can appear:
>   remove_proc_entry: removing non-empty directory 'irq/233', leaking at l=
east 'gpiomon'
>   WARNING: CPU: 2 PID: 72 at fs/proc/generic.c:717 remove_proc_entry+0x19=
0/0x19c
>   ...
>   Call trace:
>     remove_proc_entry+0x190/0x19c
>     unregister_irq_proc+0xd0/0x104
>     free_desc+0x4c/0xc4
>     irq_free_descs+0x6c/0x90
>     irq_dispose_mapping+0x104/0x14c
>     gpiochip_irqchip_remove+0xcc/0x1a4
>     gpiochip_remove+0x48/0x100
>   ...
>
> Indeed, the gpio cdev uses an IRQ but this IRQ is not released
> (irq_free() call) before the call to gpiochip_irqchip_remove().
>
> In order to give a chance to the gpio dev driver to release this
> irq before removing the IRQ mapping, notify the cdev driver about
> the gpio device removal before the gpiochip_irqchip_remove() call.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpio/gpiolib.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8b3a0f45b574..079181b9daa8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1051,6 +1051,13 @@ void gpiochip_remove(struct gpio_chip *gc)
>
>         /* FIXME: should the legacy sysfs handling be moved to gpio_devic=
e? */
>         gpiochip_sysfs_unregister(gdev);
> +
> +       /*
> +        * Tell gcdev that the device is removing. If any gpio resources =
are in
> +        * use (irqs for instance), it's time for gcdev to release them.
> +        */
> +       gcdev_unregister(gdev);
> +
>         gpiochip_free_hogs(gc);
>         /* Numb the device, cancelling all outstanding operations */
>         gdev->chip =3D NULL;
> @@ -1085,7 +1092,6 @@ void gpiochip_remove(struct gpio_chip *gc)
>          * be removed, else it will be dangling until the last user is
>          * gone.
>          */
> -       gcdev_unregister(gdev);
>         up_write(&gdev->sem);

Please rebase it on top of the for-next branch of the GPIO tree. We've
had some significant rework recently, we no longer even have this
semaphore.

Bart

>         gpio_device_put(gdev);
>  }
> --
> 2.43.0
>

