Return-Path: <linux-gpio+bounces-11550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8BD9A24B7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB491C2137A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E5B1DE4E7;
	Thu, 17 Oct 2024 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gr87njSN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACE71DE4E5
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174481; cv=none; b=NUxG4wdgewOKQugrFyn7HXRzZp5LsQCEbe+pI3CXL9go89NXNds98/VfD73KcgbM+PO37pVn+ddwqsTujRfHMXPa/SHa8H6Bw/BWFHCf2YGQIHJx11IMzjEbbKcPFuTgM9FLMnGmDXv69D0OcEHsbjWIyDwPpJJ9Eb83F4ltEOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174481; c=relaxed/simple;
	bh=RubLFLen1FETkeZhkg8VQX/fOQOtmcMWwjgzrpld7bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEFDzRQdIf+aCN2Mm7q2Uxh9gj/PpG3nKVORjWXCxE+/XoJ+ksqgG2li6yrXDAvr01Q6Zv30A1YxqFXs3MBotptas/QaRfFGGSZGZ1E6xRxacERuvpbJT6KB13d2IX+Y2SWaX8JkFK7ULDBpWk1MVbgITS+yhRp+f757PKBJ6cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gr87njSN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1067503e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729174475; x=1729779275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3lW4pLpgJpmHhkj8WRgmUbACtcwRwobbY6ktmQNWH0=;
        b=Gr87njSNfHFzvRC0WSTUt/S4XxMx0UKjYMyDF7WkIFZQhbLxFZsud2CTpKpl879WP6
         qzANVq7+EN8He8T5VjFidXtBb1uy3b5y2aH7PElAabX89EWRs0IfSb6Zr6nVJKw/j1rN
         39/bFlQZWO32xilOP5sdCcuECvWd3NiKPk/m8fSGYXhBqBe7mITdhjqHWR8CIi+NPvlE
         AgQi8owt9Rvcr9M81Ykyu1g/RiKDNk1dIn7UYJt6nT0b7ra/hPdnu0IGOO5XPFF4VM9w
         sYNzMQZXs3CXB6LBUGPSB0zbfKzh56tejIL7J/Oz77f2gw4YTVsH7SGZYOOsE3+ImzWl
         a9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174475; x=1729779275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3lW4pLpgJpmHhkj8WRgmUbACtcwRwobbY6ktmQNWH0=;
        b=J/GnMIntt5lorQ+8skPBzHiyGbglafWdrqK4GjgRMA4qjywblLhFjH83603ws+UMu1
         uVXOcNKYus/zA4Bs33ZQrxHWPMhBgdT2ri78x5sNLGgvIHdvAUAyB7cE0Ln9COL/Cz2t
         SI/jiKkiO6mDF8Qi/cOn9eFl4Nsr71Qr+FVvoFEWILygCxGoUXLTzWxvd80cfko4uoTG
         rMYh+WD6xnqUw2nW/zcxzLwF3Yqb6CzZMOPGlAhrcgb77Vk/NXpkQDgm7E8ktGjFoEmp
         MCvoOUp8osA9ixAltknSElSCLj6yIbC7VW79Tnvpijot3NLLOPxV5Q/4n6YBhBpD7t6N
         etsw==
X-Forwarded-Encrypted: i=1; AJvYcCVuY3oSyZ+qii+ZBT6vn65BLSCx04ZD4w/GINyLixZ2vn4whLUw6aSxwcZDJkMnBcwUV4bUzarQ1gL7@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFIG6zPHQz3JEUzd8AZC8Of+BYidPYOxjwSQO0XxT4JF8bGSB
	vdOKgp0n7Vog5ZjeXRiDiFOenLQgRf4coNa6Webjrg99rm8PZhjWFC75VWkl/GPPUnqccBByOfl
	kH/vG+DFu377Fp5dzZHvmMroUBTrYoF9JPryM8w==
X-Google-Smtp-Source: AGHT+IHt8dDyDTaD9fUKfoXDTLml48K+uAvzK2c2uXiEHkSh5c5LuxbrOwh+cq4KC1vnWVX847XEPpG8ykM9fItqaXU=
X-Received: by 2002:a05:6512:3d24:b0:539:f4d8:ee43 with SMTP id
 2adb3069b0e04-53a03f29dacmr5506738e87.22.1729174474914; Thu, 17 Oct 2024
 07:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org> <20241017125349.GB221864@rigel>
In-Reply-To: <20241017125349.GB221864@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 16:14:24 +0200
Message-ID: <CAMRc=McjCinBEFNoHSTyFH7zU=JuyRfu1cfrOxkq=OjciKQkvQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 2:53=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Oct 17, 2024 at 10:14:16AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > @@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr=
, void __user *ip)
> >               }
> >
> >               WRITE_ONCE(line->edflags, edflags);
> > -
> > -             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> >       }
> >       return 0;
> >  }
>
> I still get errors from this when reconfiguring lines with debounce.
> You should leave this notify in place and use _nonotify when setting the
> direction.
> i.e.
>
> @@ -1436,11 +1432,11 @@ static long linereq_set_config(struct linereq *lr=
, void __user *ip)
>                         int val =3D gpio_v2_line_config_output_value(&lc,=
 i);
>
>                         edge_detector_stop(line);
> -                       ret =3D gpiod_direction_output(desc, val);
> +                       ret =3D gpiod_direction_output_nonotify(desc, val=
);
>                         if (ret)
>                                 return ret;
>                 } else {
> -                       ret =3D gpiod_direction_input(desc);
> +                       ret =3D gpiod_direction_input_nonotify(desc);
>                         if (ret)
>                                 return ret;
>
> @@ -1450,6 +1446,8 @@ static long linereq_set_config(struct linereq *lr, =
void __user *ip)
>                 }
>
>                 WRITE_ONCE(line->edflags, edflags);
> +
> +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
>         }
>         return 0;
>  }
>
> Given that, all my current tests are passing.
>

That looks good - after all we no longer notify from any place in
gpiolib-cdev.c anymore - but I'd like to learn what's wrong exactly.
Are you getting more events with debounce? Are you not getting any?

Bart

