Return-Path: <linux-gpio+bounces-28808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A7C7049B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C7EFD364EF0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3EB2FE06E;
	Wed, 19 Nov 2025 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JhyqtWVp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669E2FDC57
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570988; cv=none; b=u/WHDPb1JvHhp9g5qmLrE26KPdnWm+gizjISdHs2r/8Np7mx0dOFfriaLf1qBkVlm0BE1kuqBIUn1J4itPkknBCxHmwKSG9z2UH/i4Qi+QZbGEwaWEa60nqrOKctxVNQjmouhNW+0llghJCe0SoAgbnZo+qdQ3yJ59d9CjNlppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570988; c=relaxed/simple;
	bh=vS3GqcZz5/e1YIqg4Y6p2P5bhXNAXrlTE9+KdZfTBYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXbUyXXx6e4WV+gHxxLJvZXb3gVyeFxCgE0IUCI6yx2Vu51EuzGjjcGjGgTLf1f4jEsxh5wO77AOUgVW1jD2stcB21rDtGHNWJQ5Rn1V4/FQC733L9fX7ZVr0dmh33NPdBcN+cYoeVw16WxzvDZAQDBW/M2xy7/d80mGL+fUwVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JhyqtWVp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957f617ff0so7660856e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763570983; x=1764175783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpyvLKh/Mmn1vrCVutB6f5Cfy4PhM6ahAnv3kAcqCw0=;
        b=JhyqtWVpX07L0WANl33eI2MP2gt/oATpSqk2/t09c6NF8gPHOxjjVkwBXhrV3HyJeW
         RDflWvH8YPbaQu9YYHAJcxVtl3iBmldLqogqMueKWNDx0OeC7oG/n1F71WoQ9X/X53F/
         k9QctUJ+LAnsOz9Ts1Hra7CPeTAortI5/eLswOD3dLJelSjfG5Q/xRwUfcusrvvI4oGN
         rIJ7O+5uoVka+x+3zksV8SAfGeS+tnJbvBkjhCxbEwh/tG5qwqB6m85o987ceY7IDbkS
         rUDgzz4XMcqm/6VbzK3vuk6XusbzbRP+I6sD/H/knsahFzTTURyPr3KUmGOiXBOk+dFf
         7aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570983; x=1764175783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpyvLKh/Mmn1vrCVutB6f5Cfy4PhM6ahAnv3kAcqCw0=;
        b=Wsil+AxXuDXC+V4DPpHoDGz0AcmBAqDNifNcgcPBXoNeSvn4CgbpRJOCYe0SZ/2BbG
         Cp9zhPPWdNmV0oJ2rgXTfvvRDyeQ2AgavUhnGKBmAr9df5vlZfeI35uS9GmC2C+5fDpj
         jk1J+4UGEYot8i5Lkux6QaUdAP20oxH1n/ZqSt/pPn3qN+MENT9J05TeNZcQYf38+8sV
         sGW1V3BZmWnqjjOpXRpYn39l1C3egggAs/GsX0v51rRSnYILmeiNUD+RHta7Y6ja8FWC
         uSJwQhxjRD1SkcWjBADsb99t2VwgfJumefFXgxqPjNGsrZM0t+8a11O9bW6shfSbwnew
         icew==
X-Gm-Message-State: AOJu0YzrKi82Ke2edAZbiFFhIdfYBDR16YT0nEgH0g0Mn+05IFO0udVI
	thJJ3AMWhJym851T5LwepZZt+FVKbHUqPJULMycnz+s+ihvWCueygPexhwFM6VKCZGC9MEE3gl4
	CpFmMnwkXR9eptlU036/qW/838iXQ0F1n5VoBQCdbUdMY+/MQB2EyUZw=
X-Gm-Gg: ASbGnctMTqyYzeGT/rZ1r9KqZRf4ifp6eu0wSlLZzjst4JRW197KKTQ7pZjdzwgBlv3
	wjxqiZMPkZGxHV/aNXqmAr8Y185+mMi9SulreLMuj7srr7UESFPCM6f5qYt1gFb5xP8cdHzbEDX
	RwiaLASbD5DTfrxnOsabEFX0DRgUodhgiy2V0byNzLr//B6ju2FwIyT7NL5Vi7auhSyjgybuxcW
	lwWh/hc7NITrr93Qrbcbvpl4KB7kNoMP+ZwSQcxmHm3k+jcOAEoIc9s0iywsjJ932hSlY6lDk2c
	Fh7dncZUUnTwh4WUDDpdV5EL3qtb91Ble1PZpg==
X-Google-Smtp-Source: AGHT+IFsTisXqLbVlfib8qoYQct2imtfeHS1nqYYs5EAkrXWjXIV/4PzaUvblCYoNs8nCi4yHoHai6jS2Y+Xg+cm4JI=
X-Received: by 2002:a05:6512:3b1e:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-595841b5442mr7042616e87.22.1763570983255; Wed, 19 Nov 2025
 08:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org> <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 17:49:31 +0100
X-Gm-Features: AWmQ_bmjhxVSOKFkWMMGQNZ-qd7cGCoUpkpDr5ssCwk_lQAj7mY_DFCa0JUpk80
Message-ID: <CAMRc=MeD4gsyHe_rkGRgRO4p36+szobgCnc0C-CYGWZhm-dQNQ@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine lookup
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> SPI devices can specify a cs-gpios property to enumerate their chip
> selects. In device tree, a zero entry in this property can be used to
> specify that a particular chip select is using the SPI controllers
> native chip select, for example:
>
>     cs-gpios =3D <&gpio1 0 0>, <0>;
>
> Here, the second chip select is native. Allow users to pass
> ERR_PTR(-ENOENT) as the key field in struct gpiod_lookup, indicating a
> native chip select.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 91e0c384f34ae5c0ed61ccd3a978685d4f72e867..dbb5f7fe7b661979f559fcd32=
ad6e1c463431a18 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4557,6 +4557,9 @@ static struct gpio_desc *gpiod_find(struct device *=
dev, const char *con_id,
>                 if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
>                         continue;
>
> +               if (p->key =3D=3D PTR_ERR(-ENOENT))

As the build bot pointed out - this should have been ERR_PTR(-ENOENT).

Bart

> +                       return ERR_PTR(-ENOENT);
> +
>                 if (p->chip_hwnum =3D=3D U16_MAX) {
>                         desc =3D gpio_name_to_desc(p->key);
>                         if (desc) {
>
> --
> 2.51.0
>

