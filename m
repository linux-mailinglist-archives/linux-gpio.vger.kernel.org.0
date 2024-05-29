Return-Path: <linux-gpio+bounces-6826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C606A8D3584
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B31F28636F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5F717F371;
	Wed, 29 May 2024 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2zRylEoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D614B973
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981900; cv=none; b=jiO+3rZNdX2bmLQmiaiqhCK2bd9kei8O2W+CATCHOodM+r7POBev3Ttx7iGfXHjK1TX6TJFLgjRVsufy76rFhBXhWdRJDAm0dvlM1Gi3Ma4LU02BYMtO1tnGn6O/v6xGBdAoBnWKzLJkrvVunVemSkMess6LapNrmq6Agzo28Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981900; c=relaxed/simple;
	bh=DTCCleyVcSCm/MaSCNeHp3zRfmdlT7E0UJ4lfxfio1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKurGSZ6DLMzvu/H9MpnQbQxgV4Jr8zJj1e2S7GEtsX3IOJFhsC0byc3vqtgnQUSGkRGsc0Yg67/CpUniTocHKPMZTiaRA6MAo3pxlLMs4hogLNkFBdQoW25makugVCX/eVk3ldqhpTJx08HVcsnvclE5en5zKzRP9YYw9kWa+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2zRylEoV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b119986f2so507703e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716981896; x=1717586696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ewvEYPrJ+34TaqUmmUUdKceBPfIMWuE1wY14k9hWtU=;
        b=2zRylEoVjQrVWDOYzgXw681+L9XLlfbauG35iudcWqo9qH5WdmpLwWQMxNvKpeHz+9
         Wrpnl8BtHv/A4WTdxEFnU+kO7EeipPSQTTdtb0hWi4dwsAa2ZKgiVR9QmDUJDkJeD+Uz
         hQbgsIdwc+t3eM6VSiblhx8laVeLuo4DJes3bkgQ1d+l3LlR2D+EwXsIgLZWm5wJOvXl
         /tuZd9j4BYGA0uyeIJTXibTMUuB/Ye5HVmso7umQ2Mtbc6OYwiAIxgo2tAzuuK5FWSKk
         0dYsaSraGRANIgS1IhQs4wqZlxsHmc1PlR3wPjgu4W4wJMf0GrzADvvYlQnwFlCTNTte
         GPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981896; x=1717586696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ewvEYPrJ+34TaqUmmUUdKceBPfIMWuE1wY14k9hWtU=;
        b=t6bTyKgx+K2L1saZvuv9aj28aDO+lE9hk6+gn4QjggppabGwxsx9Cc4hpNSJeGYLDT
         3FuV0SeSx++mlAIAfn7bFY+d2VcCSdFJF1D30vxC3zMsJHQ32BTtvdnRHcq050rBXRMU
         kPHj854VqAwoV1J97xp9CKCyweglPMmCTREIDUEmRzckd1XhtPjuvBvB2Q5Gqg3lYW9W
         SO22tKqgwDK12TUhunp+1u24GpuFEMSlNZRpl9E1vQz5kZY0HURNgH9LD7g8Yj2i++24
         yWlLgzXo0+hRGv3JE5zhwBtcT2KTpeqWyKpd4UkHZdIiV+BtGufFf0TkKezIIJLYxldh
         fwUw==
X-Forwarded-Encrypted: i=1; AJvYcCUl9wWXGK/PoMRyRRUCX+nmzE2oWin4ppg+lQRgr/2aa6W/pv2UnEv9L1ya01CXdoUNfkbgfkkdQgB0Zf3yZRpfuDNetWTcKrxbog==
X-Gm-Message-State: AOJu0Yz+a4wuB1nbvKMD/PpaHJ/G+pl1SjY+Mu+ysQwoLCsSrrZh8jHs
	0D/Id4KY4PlrpZw6P5mCrUOC/80gYChm+jfdXsjpsBgDs3N+EWLVphZCvebYjY4m8nzwTWEvLWX
	rUDNulbQBuIZGNBiFC3PstktLbjLK3ODv1gSvxw==
X-Google-Smtp-Source: AGHT+IFm3iRWb9vu5ubNNpagZdvyV8acuJn+l1fQIDdCSp825lFbjv/6qsgx7fwxNRjuqTsgL3xXuB70MVb3xq60odk=
X-Received: by 2002:a2e:bc0e:0:b0:2e9:69ec:f690 with SMTP id
 38308e7fff4ca-2e969ed0743mr91947531fa.30.1716981896331; Wed, 29 May 2024
 04:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527115419.92606-1-warthog618@gmail.com> <20240527115419.92606-4-warthog618@gmail.com>
In-Reply-To: <20240527115419.92606-4-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 May 2024 13:24:45 +0200
Message-ID: <CAMRc=Me+M5PQfuOE=tqqxJF-Q_TVdFb=wh-=ApBO_2PvTV=ZJg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpiolib: cdev: Cleanup kfifo_out() error handling
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 1:55=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> The handling of kfifo_out() errors in read functions obscures any error.
> The error condition should never occur but, while a ret is set to -EIO, i=
t
> is subsequently ignored and the read functions instead return the number
> of bytes copied to that point, potentially masking the fact that any erro=
r
> occurred.
>
> Return -EIO in the case of a kfifo_out() error to make it clear something
> very odd is going on here.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 47 +++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index c7218c9f2c5e..6a986d7f1f2f 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1642,16 +1642,13 @@ static ssize_t linereq_read(struct file *file, ch=
ar __user *buf,
>                                         return ret;
>                         }
>
> -                       ret =3D kfifo_out(&lr->events, &le, 1);
> -               }
> -               if (ret !=3D 1) {
> -                       /*
> -                        * This should never happen - we were holding the
> -                        * lock from the moment we learned the fifo is no
> -                        * longer empty until now.
> -                        */
> -                       ret =3D -EIO;
> -                       break;
> +                       if (kfifo_out(&lr->events, &le, 1) !=3D 1)
> +                               /*
> +                                * This should never happen - we hold the

I'm not a native speaker but this looks odd to me - shouldn't it be
"we held the lock from the moment..."?

> +                                * lock from the moment we learned the fi=
fo
> +                                * is no longer empty until now.
> +                                */
> +                               return -EIO;

Since this is so unlikely maybe a WARN() would be justified here too?

Bart

>                 }
>
>                 if (copy_to_user(buf + bytes_read, &le, sizeof(le)))
> @@ -1995,16 +1992,13 @@ static ssize_t lineevent_read(struct file *file, =
char __user *buf,
>                                         return ret;
>                         }
>
> -                       ret =3D kfifo_out(&le->events, &ge, 1);
> -               }
> -               if (ret !=3D 1) {
> -                       /*
> -                        * This should never happen - we were holding the=
 lock
> -                        * from the moment we learned the fifo is no long=
er
> -                        * empty until now.
> -                        */
> -                       ret =3D -EIO;
> -                       break;
> +                       if (kfifo_out(&le->events, &ge, 1) !=3D 1)
> +                               /*
> +                                * This should never happen - we hold the
> +                                * lock from the moment we learned the fi=
fo
> +                                * is no longer empty until now.
> +                                */
> +                               return -EIO;
>                 }
>
>                 if (copy_to_user(buf + bytes_read, &ge, ge_size))
> @@ -2707,12 +2701,13 @@ static ssize_t lineinfo_watch_read(struct file *f=
ile, char __user *buf,
>                         if (count < event_size)
>                                 return -EINVAL;
>  #endif
> -                       ret =3D kfifo_out(&cdev->events, &event, 1);
> -               }
> -               if (ret !=3D 1) {
> -                       ret =3D -EIO;
> -                       break;
> -                       /* We should never get here. See lineevent_read()=
. */
> +                       if (kfifo_out(&cdev->events, &event, 1) !=3D 1)
> +                               /*
> +                                * This should never happen - we hold the
> +                                * lock from the moment we learned the fi=
fo
> +                                * is no longer empty until now.
> +                                */
> +                               return -EIO;
>                 }
>
>  #ifdef CONFIG_GPIO_CDEV_V1
> --
> 2.39.2
>

