Return-Path: <linux-gpio+bounces-14022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000B9F7D49
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 15:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2173016AA1A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 14:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A019522541A;
	Thu, 19 Dec 2024 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i4wH9VH8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702252253E2
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734619320; cv=none; b=R2IZKgLWqLofF2DWRi5IlafZFkJtTF2GqQhZTSqgzVnz1OY3ybuxCBbLIIPnaPuo8zzYAleyYzUXLnRuTmfPYh59biv4NPWZ83AOPq/IC9NQ9GpMwfAoMNbq+AqDIYwHqBNP1KLCPNzaAVAfRGWd3g+39Rilu0a1jKBwW0Lubcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734619320; c=relaxed/simple;
	bh=Fl3oziaTP4kHZ10ctDFR8I1hJLgipCXr/u4BflK8MuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdY3umLqtMYItBDqVe/vxD/zGq2/shVoTgAFZyXZP16ORCK2280o7DOWHjw11TDdPdY4qjvjq7JrSdqT21iXh/antHSM23shDn6pxgmJgxB4q0qSZTpp0xDUCoatP1pywIoI1wGEgelTvGxxVaaF1KztU4KHu7Ep7t0jkH7ETjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i4wH9VH8; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54026562221so759384e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734619316; x=1735224116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxYEuoMZ5LfJwQjhz5KV83rxBRNvhLN860GqDjOQrj0=;
        b=i4wH9VH8yR5eerlTfxqhmCdhFp1HzQ0hl0gAy1XfF/yxTWvi3MW2KmcCVDs1NBVCXh
         yfZYtFT43yJ7QGikjV8NP4z5XsbovZ4vuIDqOuSD6ygzQc5OM1+7wU4TO8KhyGB/a7pD
         gE2w0qHYN4q9hJ1c+t9/6UUxyGnfymTvBzMVCAvCIovvWkgGV2G31Ihlt3OUMjnut55p
         g8TDvA1nNVDiz51HzZ66xBHt4M5XxTdFyVZOqGQiZjqLRttfiG2p3mAXNDY9KeZuNG7p
         zD28G2hchqbamF028yDI0KeVJ2LuvcEuw01pp+CLfDLNYoBtJXPFXDzIFfWbbrBz0/Cn
         IggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734619316; x=1735224116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxYEuoMZ5LfJwQjhz5KV83rxBRNvhLN860GqDjOQrj0=;
        b=ZtYoloMB7r9ihodJK2mUDjQgbt+H9cE19cMijTqgNq1AEWuKqz9ZcjCUDBZZV2ugD2
         hg5IO4Dif/vNg7/uzq73OECUpwOO6BezEpYwRxPwUybvfR2kXBIUqLv9Z+Ars8OteO5C
         kFHdZ+hXDIDAg6mEVqwaEJCIAIbysalWJEI59tRiaSZfI7sdJBEBP4vKWHs7BqlICiIe
         hcDn9YUjQSnl0rxQzbz3GAaSbOx9JWJk483xf3qBR2KxCH1PtiPr7r1r6RyRHvz8Qzsp
         6XmGzjUICCQy05uMF/aljJXnNEh+fcqV3J9ZlEwNDRD/vcDV5b/NcEg/7nOhsXANltR4
         th5w==
X-Forwarded-Encrypted: i=1; AJvYcCXgwB2sFK2ePylmrxGp53HpRbMIU1Uxx4o8q+Cxf1MiRd1Fn4dSNMsG/o7wfnhE1PiIV66psDBdBhQO@vger.kernel.org
X-Gm-Message-State: AOJu0YxRpw4sJAkhr0D76RaAGPkxpqTJnnnGWBXYTNGS6El5/M7nCn53
	AYK/T2gBMfW1MuDDw61JAmszWY38iWCXkO7PuMJ7/Y4Ech6V68MjS3QbUH5Lbadp3iN1j4UkcWM
	alu3ZPzcnAuf6JA6TUg7sDr0dOQ9PVZbE7H8h+vigf7jkUIAw
X-Gm-Gg: ASbGncvpv8/aCPKAQvSAnH+/1skRZp8d+1mdjIUSWEn1EEl0LDiYVDGlxrLn4aaPVXE
	RnEIpTKt1Cs+Yh0v22I06RHdcbbSknz2IsdZUTqdNYbuBkXQD/KnHe15xOiO86pyiv1r1Ng==
X-Google-Smtp-Source: AGHT+IFc0jWoAJDnuATA6ruBVKbnveRdjKdw+7eMKMFdl868p8A1Gd72J6g0ONI/c8vm4/zDeNjuQSTo3Z8UV2ZLqqA=
X-Received: by 2002:a05:6512:1320:b0:540:1fcd:1d9a with SMTP id
 2adb3069b0e04-5422102f5cbmr1154200e87.48.1734619316460; Thu, 19 Dec 2024
 06:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
In-Reply-To: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Dec 2024 15:41:45 +0100
Message-ID: <CAMRc=Mf7=9N1Wo642XnGJ+nzqBY8N3D_cHb3TnsG93y+KTqBKQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: log an error when failing to get the reset GPIO
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 10:39=E2=80=AFAM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> When the dirver fails getting this GPIO, it fails silently. Log an error
> message to make debugging a lot easier by just reading dmesg.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 272febc3230e90baf370811f498383b9fb12cc6f..be4c9981ebc404ad5c1e1b0ba=
9f9f948122de462 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1088,7 +1088,8 @@ static int pca953x_probe(struct i2c_client *client)
>                  */
>                 reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIO=
D_OUT_LOW);
>                 if (IS_ERR(reset_gpio))
> -                       return PTR_ERR(reset_gpio);
> +                       return dev_err_probe(dev, PTR_ERR(reset_gpio),
> +                                            "Failed to get reset gpio\n"=
);
>         }
>
>         chip->client =3D client;
>
> ---

Fixes: and Cc: stable tags?

Bart

