Return-Path: <linux-gpio+bounces-817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7C980075E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 10:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95AA12814D1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ED21DDCC;
	Fri,  1 Dec 2023 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RiGjBsq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F755B2
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 01:45:45 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-464434e7804so664767137.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 01:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701423944; x=1702028744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ekfjW5/RgeJMklE7juR1PMpyxSeXgb7TqD/ojEgNQc=;
        b=RiGjBsq508f4Xnodj8k5T9pILSjQRsHEhMzLYt37HgBTQtRbfowOIOb9wfbMgzVXCd
         0/NdgOaZeeGhkSbomoGCl3c+918KoFMrdJCg8xRcpZTbfu1TygZSMUbxTHwtug34Kfzd
         I65Xjnp9YQo5CGIDwqRNDs3C9o1wMzujGSn2ORkL3ulKAnDh6gLbE7/L1ydp7RJdisso
         yCGdTBOfdJHykysDnP6dQiFHLecWAK0eS/PHcIsPAb9/Ge80jIhb8OwdmG4iIQpEeGKa
         SWdISdHaHgR0nGtxE0dkPpCiPKT3p9frsfaIsyYFhx1VCArOLbCKqq90s4kFBcOwZiup
         z9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423944; x=1702028744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ekfjW5/RgeJMklE7juR1PMpyxSeXgb7TqD/ojEgNQc=;
        b=v6Tt6R16h5Szzt0/zvqqZy2XDdlbdTvfs7pG/KLV8SFCX4Q2jAw8trxiIU83OBzjeE
         VFbFsW4ZKAMLmLuJGSwvhJ2EUP99LjxihmsV8RemVxEpEOLYjBp7u1tHZDD9S1KCi8CA
         mWYqvwC836KiCBxskdDIPNPdO0I1gYHKDfrFElkXfpLKRJbyyulshZi0KdNOA/53y+0B
         gyod0xod0ADyeiGG/WjP4T1wHC2BJsmEDsu/uu0LjD8sFZ53Xj1P0yHwJcDTKVU+ViIi
         4CwZQH8lrnKJazPCSA2KbLgiuVjpCYEksr7WcMgCcFwnUb/1XmT9IZjIQ4GybrSuyKPS
         ZtMg==
X-Gm-Message-State: AOJu0YyBY8qXJoJJ0MKysmrN7lLHjkA10S89JeJjc6nnApiBMHOQVFUt
	Gnrhap5HYuplPocAXH1ZEpJZvXZCoE9MtmpqZ6yOUg==
X-Google-Smtp-Source: AGHT+IFr+Ufz2SBZX19p2XbDRne9u7F1ltfFub1k2ZxTvyuIg3+ny5t7o6ebQ713T2lIv6X1Ub4M1HAWVO27LQo6MNk=
X-Received: by 2002:a05:6102:450:b0:464:6018:abc5 with SMTP id
 e16-20020a056102045000b004646018abc5mr3747554vsq.5.1701423944545; Fri, 01 Dec
 2023 01:45:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129152307.28517-1-boerge.struempfel@gmail.com>
In-Reply-To: <20231129152307.28517-1-boerge.struempfel@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Dec 2023 10:45:33 +0100
Message-ID: <CAMRc=Mc6YV0ayaaSO9CnxnTGT4FAe7kADt+j32xKY+xh1OwBRQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: sysfs: Fix error handling on failed export
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: andy@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bstruempfel@ultratronik.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Boerge Struempfel
<boerge.struempfel@gmail.com> wrote:
>
> If gpio_set_transitory() fails, we should free the GPIO again. Most
> notably, the flag FLAG_REQUESTED has previously been set in
> gpiod_request_commit(), and should be reset on failure.
>
> To my knowledge, this does not affect any current users, since the
> gpio_set_transitory() mainly returns 0 and -ENOTSUPP, which is converted
> to 0. However the gpio_set_transitory() function calles the .set_config()
> function of the corresponding GPIO chip and there are some GPIO drivers i=
n
> which some (unlikely) branches return other values like -EPROBE_DEFER,
> and -EINVAL. In these cases, the above mentioned FLAG_REQUESTED would not
> be reset, which results in the pin being blocked until the next reboot.
>
> Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond =
sleep")
> Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
>
> ---
>
> V2: https://lore.kernel.org/linux-gpio/CAEktqcv8NC0Cy+wo7nRGOp9USoBdta=3D=
n=3Dmrbo-WomxgcmWN5nQ@mail.gmail.com/T/#t
> V1: https://lore.kernel.org/linux-gpio/CAEktqcuxS1sPfkGVCgSy1ki8fmUDmuUsH=
rdAT+zFKy5vGSoKPw@mail.gmail.com/T/#t
>
> Changes from V2:
>         - Capitalized all occurances of GPIO in commit message
>         - Added Missing - in front of Error Code in commit message
>         - Added Fixes Tag in commit message
>
> Changes from V1:
>         - Marked all functions in commit message with parenthesis
>         - Elaborated in commit message
>
>  drivers/gpio/gpiolib-sysfs.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 6f309a3b2d9a..12d853845bb8 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -474,14 +474,17 @@ static ssize_t export_store(const struct class *cla=
ss,
>                 goto done;
>
>         status =3D gpiod_set_transitory(desc, false);
> -       if (!status) {
> -               status =3D gpiod_export(desc, true);
> -               if (status < 0)
> -                       gpiod_free(desc);
> -               else
> -                       set_bit(FLAG_SYSFS, &desc->flags);
> +       if (status) {
> +               gpiod_free(desc);
> +               goto done;
>         }
>
> +       status =3D gpiod_export(desc, true);
> +       if (status < 0)
> +               gpiod_free(desc);
> +       else
> +               set_bit(FLAG_SYSFS, &desc->flags);
> +
>  done:
>         if (status)
>                 pr_debug("%s: status %d\n", __func__, status);
> --
> 2.42.0
>

Applied, thanks!

Bart

