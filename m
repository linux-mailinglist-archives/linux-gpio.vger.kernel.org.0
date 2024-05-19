Return-Path: <linux-gpio+bounces-6467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2959B8C9587
	for <lists+linux-gpio@lfdr.de>; Sun, 19 May 2024 19:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D371F21D92
	for <lists+linux-gpio@lfdr.de>; Sun, 19 May 2024 17:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B013B50243;
	Sun, 19 May 2024 17:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QrtWXu4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE83F46444
	for <linux-gpio@vger.kernel.org>; Sun, 19 May 2024 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716139688; cv=none; b=g58LxbEFK0mnaQqw03bn9NWizH2Iii4hG1BvZEx7HjRk8ZGafZMeZrac4pXbr9i8Zd2I5eIFKXXe++FcJCZpuXTCXYWC/WmP6mp/pg9c0lEclV0GXZINNQyTvEcswMKCr0dcNOKVx5cNzhNMYrWS5hdJQ4MbL+8+RxCddQIqApc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716139688; c=relaxed/simple;
	bh=C7Bo8yy7avAwm4E3qVaujOfZItIgyC/ssTWzng36bw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQYfQm8a19SCtEUluRTIeA8gbQbevmdWx9vvF7ssMXmc9E1v736pD+T8WsS+mjxJ76OnLr5ZCNMAaS6OAZbd+57TtXOfIvK5IVfkwXkIEo9Kg3qa0xy6MiRjn4ZgHQcjY6LVpCO2U1CsHxkUMcZRbCgFpplER9iz7qRtKdYui5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QrtWXu4a; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-523b20e2615so4260165e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 May 2024 10:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716139683; x=1716744483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfftBWeVqaeieWMDwDgaFTXo1TkiwE5SU6imM85kzuY=;
        b=QrtWXu4aR5F9UcSLPaA01efyHlCTiid74CEVnSI7licYxhkKDF1uBBd7+cFo2L9YgE
         TEeaGI0vP4SVF5LBZb/3QpGUFPo8cwQmJWONaGnKejyLPYA+Y0Fne2Zf0e8jmCHsM322
         9TnoQ3VyhIZ20Dx+AKRvD6+H4jVUIxknmpRSgFCMo5nbsTbKp0ayQ07UCYkqp7AX3yFS
         dzj/OXq7q6kNVGRls+sTAwtSpc9lp7zRFz9qPi0lGU4iZrxfhTzE7wUpjVjI5zQMSV4c
         VWCia82c6AqZ5/7bBKHstwNZwT6+ZL3OYwUQM71B5Ru1iCqDsK+WxSbIFyPQQzmwUi3y
         MmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716139683; x=1716744483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfftBWeVqaeieWMDwDgaFTXo1TkiwE5SU6imM85kzuY=;
        b=CLi65vHJXCWrel8GnomjImsSjTwe3vuroi8itsyJFhzm+neWbRJG9NJ1z36S+1GumJ
         UyNoIev2FhxFZ2RuWN3s/QhdFhBLCMOgmfxA0fm91odcc6ZSU+c7Z+UUhF69AYv4TMek
         yHJWd22ckckuLKarDg/xYSYIOcRPWt+wY0PgctRP7PJeYzVK68eppaUugTCjX7EK9EgG
         8qDT1ZzSY1WJcFFQmwmX5L0D/7PjQ7BXZJg8zkxfuxZEYGWohafwNN29av+6fYEVqD4n
         mSV+8UMYYDQyRGte2raGWA2m4EToCE5zXs1BZJ7irIK2CrHPCXRZ7Nrk2HkcVzLMgj0M
         yBYw==
X-Forwarded-Encrypted: i=1; AJvYcCX1J6CKKNiNr+L/o9zll+d3iLL3xOUpCK3ZApBhnivuKuKAiLTH0Y1pBeQALeYYJo8SRgIDcuoUGVbfbNaS3aYqSBCV8LPXRYbYnQ==
X-Gm-Message-State: AOJu0Yw34KfqlfSbNQjAkzB9eTHaU0B1I6pcoc7HjFnvDVDD9rhh/mvV
	43FWjgv2NDrEoGH38f8EVnRV7anW6tavVtiUeUsKqXKKRGq9UdJtht/TeIVi9fdmSCUoaZ8iUPg
	d2Eu/lbvwd9fIJXfCOvn9whWCxbsX+Kn+5uPK6Q==
X-Google-Smtp-Source: AGHT+IGD+GgVDLIiKKswOsHFmDBuBrzI2l17OB+2USkIGab8PvZL3e9XE/DZZS3iluh1MJ32jR6QDGZFzo4MA2wTzqg=
X-Received: by 2002:a19:8c4d:0:b0:51f:2709:3641 with SMTP id
 2adb3069b0e04-5220fb72e2fmr16098806e87.26.1716139682752; Sun, 19 May 2024
 10:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519144920.14804-1-egyszeregy@freemail.hu>
In-Reply-To: <20240519144920.14804-1-egyszeregy@freemail.hu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 19 May 2024 19:27:51 +0200
Message-ID: <CAMRc=MctEsMiRgaV5UTiaxjoFDa2izX9wnLAU07=G8gBEcSKoQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Introduce "linux,gpiochip-name" property for
 device tree of GPIO controller.
To: egyszeregy@freemail.hu
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 4:49=E2=80=AFPM <egyszeregy@freemail.hu> wrote:
>
> From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
>
> Optionally, a GPIO controller may have a "linux,gpiochip-name" property.

Oh, may it really?

$ git grep "linux,gpiochip-name" Documentation/devicetree/bindings/
$

Doesn't look like it.

> This is a string which is defining a custom suffix name for gpiochip in
> /dev/gpiochip-<name> format. It helps to improve software portability
> between various SoCs and reduce complexities of hardware related codes
> in SWs.
>
> Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
> ---
>  drivers/gpio/gpiolib.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ce94e37bcbee..e24d8db1d054 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -860,6 +860,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, =
void *data,
>                                struct lock_class_key *lock_key,
>                                struct lock_class_key *request_key)
>  {
> +       const char *name;
>         struct gpio_device *gdev;
>         unsigned int desc_index;
>         int base =3D 0;
> @@ -896,7 +897,16 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc,=
 void *data,
>                 goto err_free_gdev;
>         }
>
> -       ret =3D dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
> +       /*
> +        * If "linux,gpiochip-name" is specified in device tree, use /dev=
/gpiochip-<name>
> +        * in Linux userspace, otherwise use /dev/gpiochip<id>.
> +        */
> +       ret =3D device_property_read_string(gc->parent, "linux,gpiochip-n=
ame", &name);
> +       if (ret < 0)
> +               ret =3D dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev=
->id);
> +       else
> +               ret =3D dev_set_name(&gdev->dev, GPIOCHIP_NAME "-%s", nam=
e);
> +
>         if (ret)
>                 goto err_free_ida;
>
> --
> 2.39.3
>

NAK, this is udev's task in user-space if you need this.

Bart

