Return-Path: <linux-gpio+bounces-12048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D129AFB28
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 09:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BDF1F23600
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 07:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6DF1925B0;
	Fri, 25 Oct 2024 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d7byYg7q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BA1BC5C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 07:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729841651; cv=none; b=DKotGVlo7qZQEOZSfQj8ziw3zX3gcqco1vZYJwcAy8sBmOAX2w4gsQcEVoCnLStkGH0M91TBmoUQbfbQsWJ9knc6FDsvA0brrxMOYm7JimfNe8AYg2F5L8H2HukTUTytL4U/9WzV3L4+Eu8AAhwAfNvQkFMNQqFjdXffJuZbQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729841651; c=relaxed/simple;
	bh=MemD0wPJNnwkFC525xZ9QY9sO1X15x2dBA8dLa30uwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKjEfcNPd6rEqcTNYqFAS/LCVpvllNTYBlicmnEOkexa5x3CNEZBgsG50ajPB1SzGGKOHKex+PLfb5AMMZlxkpsEYuf8y30p2FIn+c1BX4quolqiIPGwRyPmRcnOqe12ddgwqFj+BnynyTJpus0oKYvwhrtiR7WhVAfSY1uw7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d7byYg7q; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so1949407e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 00:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729841648; x=1730446448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=292meUOdP2sTe6SVfdsv1Mj/FAPGq1edWRLlhywLEw4=;
        b=d7byYg7q60NpJLQkoVOAXRtB3+1Gvan51nu9G9I1LbwmGdGfqynNaoTqLMzgW5gP6Z
         OSe0xIoXunNC+CJBdrD315bOI4p6dGuB5+4/aMBTean+KRX+W99sjnAFJ1dWR6mj5UU4
         ioERp7Q1lEauX+8bMobp9xvffBgT8sGtcXo5Z7kpOoWbwUgxTs9/ZWCoqO1MVO+Y0/17
         0eE1pRHlTII6On3QG6Kxd2hW9rK3pCVOGdGme8tuaEo4oxwwDdcXyKBDKr8DI5VJASwD
         nLlZgkcwWyH96dMAYf81Yo6GXxqzd9ccbVsszLd2vBncECGsluQCn0h60T1Zqingi79/
         l63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729841648; x=1730446448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=292meUOdP2sTe6SVfdsv1Mj/FAPGq1edWRLlhywLEw4=;
        b=PMMx4Kc70FubM5RHq96CMfaGsERs5355c+THMvsek2C0HcImoCJZTOrxlxCxQPvndb
         d2tkA8Vie53covnTYzDoEmz9ORrP4gwIvZ7wDjKE9GYJkJO4uFsvLAs/9LKdOAlw6rQD
         IM6HPj5pfwKOkWIgOMJhBFxCRdBti+uonJfQ9CR0GWEYuTwJ8nNgnW+dDM47IeNAx1HY
         nsfwHR8xWZ305SUGqY84lvH13NHjK9dm8vLtOEtAwYigLWL/Wc7HOsDxzeN6rqSpDUFw
         /4xdnRJ9yAMb9ZuV+Ux0tB1V827PpnwvwSQcurAATeklEZJWzBSFhABt9VoOuAiKVJmc
         gLtg==
X-Forwarded-Encrypted: i=1; AJvYcCVBCqjQZtpl19Wht+7qNUVxNN5hvcBCYgQJoQK8unA50bTm6PzrNgByZ0+j+6/ldCKxsz3XgoHeLHig@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7e/iK3Vet/UwEXsel69GESAvzUOfWWvSqqrNGrat0s45xhyP9
	x196Pk15hKelboxwDLjGO20dMcsauQz0iXV15vI7sRR1w7lIuvphW58vD9NNoJIDzKE0OqedjVe
	eo4goVnUM0npg7CwouYhd08zyYsPXxymPMK1Fpc5fTD+dlAQ3
X-Google-Smtp-Source: AGHT+IFbzRHYE4JGARVJG8EoTWhO8cJq8T1KsJdF5wD66HIobg234/hoZ1bjo6Fl2r8u17cE09EkdD4g+Wc2i/8cNTg=
X-Received: by 2002:a05:6512:ea8:b0:53a:1d:e3bc with SMTP id
 2adb3069b0e04-53b2375d07bmr1609983e87.26.1729841648196; Fri, 25 Oct 2024
 00:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
 <20241024-gpio-notify-sysfs-v1-1-981f2773e785@linaro.org> <20241025025358.GA47379@rigel>
In-Reply-To: <20241025025358.GA47379@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 09:33:56 +0200
Message-ID: <CAMRc=Mc07xHfvRrZMfZ9ELAs8+02OdWq+XaUfSfiw4a3fH1z6w@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: sysfs: use cleanup guards for gpiod_data::mutex
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 4:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> > @@ -140,7 +133,7 @@ static ssize_t value_store(struct device *dev,
> >
> >       status =3D kstrtol(buf, 0, &value);
> >
> > -     mutex_lock(&data->mutex);
> > +     guard(mutex)(&data->mutex);
> >
> >       if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
> >               status =3D -EPERM;
> > @@ -149,8 +142,6 @@ static ssize_t value_store(struct device *dev,
> >               status =3D size;
> >       }
> >
> > -     mutex_unlock(&data->mutex);
> > -
> >       return status;
> >  }
>
>
> With the guard, this can be further simplified by returning immediately
> and collapsing the if-else chain:
>

Ah, right, it's the whole goal of this change after all.

Bart

