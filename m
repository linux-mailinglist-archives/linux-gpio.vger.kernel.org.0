Return-Path: <linux-gpio+bounces-13552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6859E5729
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0BD2877E5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1233218AD6;
	Thu,  5 Dec 2024 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XYVuGxtA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF23218E83
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733405471; cv=none; b=M3PVmNUVq8u+gBR+USRCQp840OM8cCjrErvWMWJaZU72J1B+bkG7RJ5vYyvMkK46/q4uJ+2wzlpfNnGLeG0ZKwmj6CdAvFwhIIBNB9MgEgrD53Wn/xk4iW54zVK6xmR34oHj8uIKrgHvSXelzuB0L6ubPO0a4AfcGti6p/HxviE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733405471; c=relaxed/simple;
	bh=r/sBbq1/3sVWo35rQBXFODxStFM0BHMbOL9s5FB95I0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny9jijiMMKZZyyLY5u+RqVmRu1xGCZYK2V2ofvuLbkKFqXiMY8q3P6dlGtpo0CKUvmogRoy6+YIJDoT+nZLdAByVNbHDV/D4YXPTHaiOIAl6SqCXPmssaxrPKp4IUOSQuGZGY1eFXnmN+Tm+gHl7qscMXY33a/XGZUvcwdDNNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XYVuGxtA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e224bbaccso918257e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 05:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733405467; x=1734010267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/sBbq1/3sVWo35rQBXFODxStFM0BHMbOL9s5FB95I0=;
        b=XYVuGxtA4s5SxOFa7FgpCj9sHhnTQ97UW4eVK+Bo2kuzrmrQn2+TF513P7/EOfrdy6
         0YczT2Gs8sVXENxdtukPcxcjfoXRZkVmwcaJkEW/ENAAy9XHgh8Di8kEUI6EVGdUAIHK
         qREQUh7HpjzkqzR4InEWYlY17y4ZEx5ejcksyli+vOIhz6pCPP1z3smm+5buhlLEMOqf
         MOdsbMiOa9esmaJJoC4VNiUPfA6EwXw2JAe740DwhcrwW88F6fWcpS3+G8gbEqolqATF
         FwCSZ0gd4kmaToC510dk6gBzjPe10F9fHfVce+UwZ01Ge5ETtibzTXRqR7C40BNR1iQq
         WPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733405467; x=1734010267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/sBbq1/3sVWo35rQBXFODxStFM0BHMbOL9s5FB95I0=;
        b=gclsmKP+/IrJpZVwxBlMfSlvdX5M4NmxvFb/t0FQLZ2vp3k5sBb+s6UtY4qzvVZw6v
         VkjhVoVuCEKk65fWRJb+6fHUliMAYoDVX/EsrckSpMoaWBeICBZYZW6IzajUKAx+9zQ9
         z00sakJGslub/ccoYelDiH6uW0XHIV0/g+B7QDcWzBsiMO9WbLNOsaEbNGbTgVo7IPRH
         K6JIobkx1yx9PDZbtCmHgfrqR8WlMEIrzSIeilOMEEvcEOJBg3bC2WfEZQgyBRgOIHGl
         i4ZMtPNVZ2QCzwnc1XTQpJvBqTH+ufdhGh+Y8f/JFVvwqP9TuRA5poDO0H/d5Shf2T1V
         3dzA==
X-Forwarded-Encrypted: i=1; AJvYcCWM9JcyeNd3O8C0TEOLnGjksSc+IBtIW2vHEyqeb/Ws2nQ97qCV3veZQvet+upEWO3nQdPQUza8dXUu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSY+23f8BhdyyUJY3f7vgel6VMPRhNyoAZAbVNFMjEV6yzQsX/
	5G0fjIeYhRapR0qCyqgJ9cvsDeslV+GH2AgYqG7GeNQ6BYCdf2OBcjdKjlpem9kZxYtftb1gBp0
	u7vpsDL2nCnfxS4DbGyj5H3os6z9rgKukKGjrAw==
X-Gm-Gg: ASbGncvaBspDUzq644oxYAxaEGyaSgEpjXxN6Rh9z34OB720m2Lt/rv2LnwRhafM37c
	1k2mCDkvMWi9UDD+VeHQw8VrtUL8PTht7LNbdoCN0HN5u2VgaHSgBjah9Dk1RzQ==
X-Google-Smtp-Source: AGHT+IFAsHrF59cyg+2gW2RpyWiIyvRivaXKg2fRs6WtD5WQwNYD3+zpqI7rVE3huHYprTJz9+CTgOUdkI3PlnlPMdE=
X-Received: by 2002:a05:6512:3e22:b0:53e:28e0:cde3 with SMTP id
 2adb3069b0e04-53e28e0d049mr355082e87.30.1733405467583; Thu, 05 Dec 2024
 05:31:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp> <Z1GoskmQH0_FhxID@black.fi.intel.com>
In-Reply-To: <Z1GoskmQH0_FhxID@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Dec 2024 14:30:56 +0100
Message-ID: <CAMRc=Me004KgVZDVVCD1r_yDfpRjVsw2TAJCGiHd+TEiQ4xW6A@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in gpiochip_setup_dev()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 2:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Dec 04, 2024 at 09:21:52PM +0900, Joe Hattori wrote:
> > In gpiochip_setup_dev(), the refcount incremented in device_initialize(=
)
> > is not decremented in the error path. Fix it by calling put_device().
>
> First of all, we have gpio_put_device().
> Second, what the problem do you have in practice? Can you show any backtr=
ace?
> Third, how had this change been tested?
>
> Looking at the current code I noticed the following:
> 1) gpiochip_add_data_with_key() has already that call;
> 2) gpiochip_setup_devs() misses that call.
>
> This effectively means that you inroduce a regression while fixing a bug.
>
> The GPIO device initialisation is non-trivial, please pay more attention =
to the
> code.
>
> Bart, can this be removed or reverted before it poisons stable?
>

Yes, sorry, should have paid more attention.

Bartosz

