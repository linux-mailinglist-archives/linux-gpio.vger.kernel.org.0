Return-Path: <linux-gpio+bounces-2501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467983A75B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 11:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F661C21DCD
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 10:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F4017C77;
	Wed, 24 Jan 2024 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UABRBBSF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25502208E
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706093909; cv=none; b=l5lSnWUvb2qe0X1br/JhnKnS17IWTzStFyxkUHjj5GbdH7DYZIk1qXlXVjRlyQgGIJp0GccmgMvW+mojdqZ84Ug+2R3FvO3/22mUCV1b0/CG9jxOl6i9LZ7CRnS7GN3uh+8aiFljXHlPpb9rf6n3Ug7V2i1GorUvEvrZpHv5vKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706093909; c=relaxed/simple;
	bh=U/aFnsktNVeHAKY6zHqHLSGBBe4tZr59iRq93vPZbCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMnqdTlLlHIea3jxGQcQ0DoUDC5mFFfMTOIZRBrPm5gnNoNSnRrLlcFCxMCUVL+J93ASjyF/fIIbYd5ei0tYVLYisnSi4JwExcDu8h/KgUelAR3xYeHoqmLH8v2oCpipIzQFd4nE3eofjtW96cFCIceksbFRH/fGa6eE5dAn9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UABRBBSF; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7ce3c7566e0so1205869241.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706093906; x=1706698706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biiC2+9IgRkBvIwO63/+dyZINeIQ4EIhvkzZ1f1/AEU=;
        b=UABRBBSFUxbZ5nC7qCKjPv0DnBZhsVgBp1/30EdENdYaoLnLPtgYgzLM/d0vBHSWRu
         mpKP4zu1m926qTh1uBx9bN8wkIgSUQogeXjS5MxFDDE4DclM7G7jf0eaVsf+pDcHxHuP
         sq14o8YHKFZdgNi1c4INpYdF0MvWlDtB3MwiHRw3KsIZ7lLIKRUP+uN7dHZKK+TLebp4
         D0rnTKVe/poGyrunqrKEN0UBQrAxqY1Byd4LVKgapfxNLgVNzICTPQoPDPEIJW0VLsG2
         fItqTfseXE7DWSEa0yW04KecGpD3U15iLpHWvSZSMkgMwqVNIhpp65RqC+XeXTIiCB24
         NGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706093906; x=1706698706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biiC2+9IgRkBvIwO63/+dyZINeIQ4EIhvkzZ1f1/AEU=;
        b=HVuBno0gOg2KK6fsWmhGogu2dhWzpb8u9BVQJ433taTud5kIOAchm+JQLYnXUJmx9Q
         7+9xbScoKeP6+8t685ZTJl0YlmideVqzuaZCSk1Wd+G1xJdf1mgjGkI8WnJicItSc8Kn
         wp1rrMfeMjT/C3nrm0T7aZbM69VnwVXYAfaamsOkqInPMAF0Jvwb/Wv0NMVOA63anpQN
         6AQ762+zjqK+WItjc91SCfG1IxPmLU9y5PFeaMh/68DZEshL3iF01SSwPEEkFu3cnrHi
         hvnntyEm19/Bv6+Ao0vO9kCXMhur1vr9mV4Y4QBur10eVVZkqIYA3LGDDBqhyJGrxNYD
         v7LQ==
X-Gm-Message-State: AOJu0YwaR0/sXVvGjfQnoVHkQYucKWcc1JGvLvDPNcAVk+SZeszKMnHp
	EtYIm39oH3rn/Xunv/KuYfXgBhGwJ4gBA82W5HrWeL8rxzyP9kY3V97BTvBQkdKppZM8yyafwI2
	4pe4550++6dnWr+l/ktwH6syqN8vzcUCF5uJdBQ==
X-Google-Smtp-Source: AGHT+IGlkgHFRX1ZbIqjIBx+UaQQo1ss28IBZhWHHx067UrDPuot4Z5qYutqELh+PjqPJHxfFtsn3Kydf7100pP5XAI=
X-Received: by 2002:ac5:c5d3:0:b0:4bd:5f4b:aa61 with SMTP id
 g19-20020ac5c5d3000000b004bd5f4baa61mr332644vkl.27.1706093906736; Wed, 24 Jan
 2024 02:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124103929.66545-1-brgl@bgdev.pl> <20240124105424.GA66219@rigel>
In-Reply-To: <20240124105424.GA66219@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jan 2024 11:58:16 +0100
Message-ID: <CAMRc=MfGJ2UxOdchd=qmM340x2d-QT0egpG4HkR1fCiz8sfyoA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: ignore positive values returned by the
 GPIO_V2_GET_LINE ioctl()
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	=?UTF-8?Q?Jos=C3=A9_Guilherme_de_Castro_Rodrigues?= <joseguilhermebh@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Wed, Jan 24, 2024 at 11:39:29AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > If the kernel GPIO driver (erroneously) returns a positive value from o=
ne
> > of its callbacks, it may end up being propagated to user space as
> > a positive value returned by the call to ioctl(). Let's treat all
> > non-zero values as errors as GPIO uAPI ioctl()s are not expected to eve=
r
> > return positive values. This should be addressed in the kernel but will
> > remain a problem on older or unpatched versions so we need to sanitize =
it
> > in user-space too.
> >
> > Reported-by: Jos=C3=A9 Guilherme de Castro Rodrigues <joseguilhermebh@h=
otmail.com>
> > Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  lib/chip.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/chip.c b/lib/chip.c
> > index 7c05e53..7bf40c6 100644
> > --- a/lib/chip.c
> > +++ b/lib/chip.c
> > @@ -239,7 +239,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
> >               return NULL;
> >
> >       ret =3D ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
> > -     if (ret < 0)
> > +     if (ret)
> >               return NULL;
> >
>
> What is errno going to be here?
> Is errno set if the ioctl returns positive?
>

No it isn't, thanks for catching it.

This patch is incomplete - we need a wrapper around ioctl() for all
uAPI calls that will check for positive numbers and set errno to
ERANGE (is that the right one? any other ideas?) then return -1.

Bart

