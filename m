Return-Path: <linux-gpio+bounces-12103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDBF9B051F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 16:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B331C21957
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502F31FB8B9;
	Fri, 25 Oct 2024 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sz2pSwUh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8B1FB8AF
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865297; cv=none; b=YQMgcrFzBMI7Dr7M6v/VLwTeOeh0IPmi39Imq/0oUC3Juaaep35Yo38+sdTw2wfqXdmKhoAXuiYVN4BPZoIeVADuY5KwhquveLHnSN/x5R2fsV9xdREyK5NFuCMC6aahi6IkuW/ARKV5T+nDBULPpQBWA4WM74PU6ThjSP9+QnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865297; c=relaxed/simple;
	bh=DoSspA7//UMeR1vr8KWf06H1LbH/GE6Hngs6Zz2+erU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyZ1HJ65MvWV3jntbgaGQO6ORiqL3qTjMo3ml+3rDCEEtX9CRpt6XA87p250QzYRGH3pPF9BXEpeutWNrEtRjwSb1FVIG8xFTTvmSftGAUKds663WdVKy7AEAnb3N2zCVljGKUgF9J6eiHCNzAxpepTr8Btce6ApPoTl8JG1llM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sz2pSwUh; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so20457091fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729865291; x=1730470091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ST+UyHh/HP6X2Z5LZgfmL+1Z9UxnSzRRcskNFqLwhiQ=;
        b=sz2pSwUhjxhlgNZqdyrrOEINDVURr8tGlPxBqDuDSd+lz99bC4rHLgJn2rBYdOLKi2
         wBRs7LSkPOEa2b/PnHgsaGl30eMaQynxCiJXsbdtfnUpXQKzsK09sxOxSxXiU0q5tN+H
         iJEkf1274wBkOPCiIR7LKhwcuSShRB8Vmt073vZbeUadFewvMyymrqmmVEe143PtFGCM
         rGBTAn6W2mq1AepCywIAysd8LZ3ktsBz5PKcoGYDcdxkLN5/iqgnESOLeXEZsRUIn3su
         2qW0OmX/vkKalvBA5zTGWrmZ+A1o5IRhfVMedEJIV0ApTyRnnX0togMcDNRZy4fBEN18
         0sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865291; x=1730470091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ST+UyHh/HP6X2Z5LZgfmL+1Z9UxnSzRRcskNFqLwhiQ=;
        b=ZAd72NkfcoGRw7PF0sEwJWjr3Lymzw6hlMqMiyarkdyatlLQr2dTtzILAoRT8rjqdb
         w+l//8pJ0vh7+2TvrkKU/PTbYtbUQ+/h5/Q0KD+B0iOSyI15DMDDSOkJXOwRLkQaAe/S
         dgjwGJspY1H55cUkams0C3qHdadN2cvz6TdxgbKohwxTvwgVd7w1Xty1Ss2vRObJofEY
         p5jJaE/hwU+3pAZam95lrK3a53fw2d9n5LPIiWeS7An4xtm2X2LhkpN+5NbLMfae8MaZ
         fdkE6PEFGpgb6QvJfNm20A6vGrAQicWRpFdGkSHh29bd2MFHGl78Ma6b9I68WnbTWpya
         EFbA==
X-Forwarded-Encrypted: i=1; AJvYcCXgwrH/jcjir3iD700cbzgcsJIWjAYRVqQ0Z4VMv+Pl3371Mv9edsPVGoQak5OM94eIxuJ8JMzq7Gv2@vger.kernel.org
X-Gm-Message-State: AOJu0YxcelG6xnnX4Tu4Uep3coXYQ4yIuzYYGqMrML8maHD3Ev1qsEyM
	jTbdvXXMln+Rs+diO/DdjyVaHvrtmFdMzP040kydmHhqRm+zrSSoSK+ZxRSAIqC6/9RvtA/NR/X
	2tRQ7Y0iQ5HWTpvBihaPTCSQoAJYa05QsUB4hSA==
X-Google-Smtp-Source: AGHT+IEE/lcC9tVckz9C15HEhaGv155dfI/otmWtIvUhrm9XJj8ptFLkwdKlPuAl7OiPPl/SHQXmVbDusfvmhjlZ32Y=
X-Received: by 2002:a2e:a586:0:b0:2f6:6074:db71 with SMTP id
 38308e7fff4ca-2fc9d315a12mr55696751fa.17.1729865291412; Fri, 25 Oct 2024
 07:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
 <20241025-gpio-notify-sysfs-v2-1-5bd1b1b0b3e6@linaro.org> <20241025132420.GA155087@rigel>
In-Reply-To: <20241025132420.GA155087@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 16:08:00 +0200
Message-ID: <CAMRc=Mcd8vVCwDvRysMxB00xUD77zmJK1EApFuAEfWpwOhkviw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: sysfs: use cleanup guards for gpiod_data::mutex
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 3:24=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Oct 25, 2024 at 02:18:51PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Shrink the code and drop some goto labels by using lock guards around
> > gpiod_data::mutex.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpiolib-sysfs.c | 81 ++++++++++++++++--------------------=
--------
> >  1 file changed, 29 insertions(+), 52 deletions(-)
> >
> > @@ -139,19 +132,17 @@ static ssize_t value_store(struct device *dev,
> >       long value;
> >
> >       status =3D kstrtol(buf, 0, &value);
> > +     if (status)
> > +             return status;
> >
> > -     mutex_lock(&data->mutex);
> > +     guard(mutex)(&data->mutex);
> >
> > -     if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
> > -             status =3D -EPERM;
> > -     } else if (status =3D=3D 0) {
> > -             gpiod_set_value_cansleep(desc, value);
> > -             status =3D size;
> > -     }
> > +     if (!test_bit(FLAG_IS_OUT, &desc->flags))
> > +             return -EPERM;
> >
> > -     mutex_unlock(&data->mutex);
> > +     gpiod_set_value_cansleep(desc, value);
> >
> > -     return status;
> > +     return size;
> >  }
>
> This is a behavioural change as you've moved the decode check before the
> permission check.  Not sure if that is significant or not, so in my
> suggestion I retained the old order.
>
> Cheers,
> Kent.

Yeah, I don't know why it was done. Typically you want to sanitize the
input before anything else and this is what's done almost everywhere
else. I'd keep it like that.

Bart

