Return-Path: <linux-gpio+bounces-21441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D8AD70B1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4074D3A14E8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041DE230BD9;
	Thu, 12 Jun 2025 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X2lQWMd3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA0221DB7
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732360; cv=none; b=iYfw25kwvVa5SkGD6klU0pZOgXoZDpoFA8etnuRj86J03lTSa8xM/EDD5UCEKr9Vt1xzJ7GUcTPKYMwkor2rXahadh5Up98vl+5Ws1kVC1RXbb/3I2We/NPOLOjGWNw72M9tWHwO5q4AQnqDtw/orVccngtQxhA3nDzzOrgnBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732360; c=relaxed/simple;
	bh=1HdeTsKzO17uuGONKnmRpLqzCeVNHk7yoQQEiaXqA7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQBR+M7mp/i6lXUbILvylsa5tuR4+V8Hg+unM9YSr3V99C14ZTDz1u7vwtdDx5hI8+1NErpE2WwOmXt4Wk45mOYCsef98r/PlgyJbIQb/I1MrM1gbz6s0opBOMSEO4ar+nEDFXiZCZ1IKklKaUHdxC/k09yaqafvwp+/1/8azh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X2lQWMd3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553a4f3ae42so771269e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749732357; x=1750337157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U7VSbXiyqPZsh+GuDnhbJ8vkS2YTh1A7lk+84P+QSc=;
        b=X2lQWMd3pZEbMHiKN9S9F7rjaOkARicttsTHwaHb+fSc9TciZ7ouVls5AY8GTiIM/V
         fM3mYNRN9Z17bojgfx5bA/DgiY6X+6MhOyF36ZfdzqRd6kmfehsfNwgnNY2sttdqy3bn
         58G5qccGsZA5iUAstRFG+q0xb24wkiIpu7oijB1tE65M9IlHYQmZVx0PUUc3frdEsyjN
         kCK42wAFyVyIRpINTxfx6pfj0+qSR1M8d2vgbhPimXhO3K4+aHqqtjpZpqQpczf1krGY
         rzYJITEQrJJftk/oEyZuAOtIbiyIj+EVqUdoZ4T4322fHjrjIU1EUc2VmLfO+TDCHzxa
         ISmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732357; x=1750337157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2U7VSbXiyqPZsh+GuDnhbJ8vkS2YTh1A7lk+84P+QSc=;
        b=s8thWcj57fsi0VQ9qg9LufFKdiZ5AiZftcvgf/7HnP4/A6ec5jHg9nPa0NWkg04ump
         rL/0Zxy8xhhVOJ21XWG53WsZKiRHkNLYYQxyDj7yqoFY2PuTdaM3SYqVC8M2rkBHZ+kr
         +W44W7kT7I44bfbKUdNeM+49EBgL5uCm75LS3eagZtaA6P+kLmk5ujCklNiPy2MTE4Zg
         FgYOj5+fT8JqoBov/6FStAQqbv3GQ4LcTetzPYyM30eq/n1AYfRp2RM0gN168exNUdFN
         JNodzaegrokce91e2DdYTgfBlfvmIr+gPvqbRO112qe5mPVvu2Y2FQPgl5FVanhdoBXw
         FSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqcGOooeAeVyCoZciF5ZXvwULq63kbe4GJPY270iF2wa+MHgJXah+40oJCiIzMc8e7pZmPwTTH9kOo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zKMWvPL3RxloYo3neK1lei53+GD4k7ByZrnDNTMLFuPg2HNT
	104xZOsz1U2BvImWIofFrty1i16sYza6Jhhpm8XwamLaTRzq3DTTODuuiSxzVF+KGdaSHPmrHPO
	q6tmBt+VYuaaB78kQ4WnyH4Vl2OSBFXNq9Q6vnW8RHg==
X-Gm-Gg: ASbGnctO8JmuTTsKHWjhrI9Jm+NHcI4ns9DFy+YvViFOAzkVs8MKjMkXYQwLxnC88tL
	DGNPiyC2DW4k/QKoY2JAKbbYqBGIslVwmGon2l2NB9fsyx5CnqZTB5oJ/FjeLfkgrfeNqWMWOu3
	WCBGbYyRqLtQRcwUe9+u3ovrLS3LD9MmgLmvK3dUpb4TKclG/dzHN5yNWmMToqjkUtlf4alJAoH
	AY=
X-Google-Smtp-Source: AGHT+IF+0Mekv6FpFqTRyts5+5VmEL5JiWmZ43lLx3r++M9HONAgJixQI4vI3imUBxU9EG9kgVe/b9KcTe0breTR6dg=
X-Received: by 2002:a05:6512:2354:b0:553:2edd:a7e0 with SMTP id
 2adb3069b0e04-5539c11671cmr2453917e87.16.1749732357132; Thu, 12 Jun 2025
 05:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org> <aErJz7C7f1iC4Aqm@opensource.cirrus.com>
In-Reply-To: <aErJz7C7f1iC4Aqm@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:45:45 +0200
X-Gm-Features: AX0GCFu8U5zT7-CTdlghDirLZZrOO8-pxVidLweEpr2lAEyo77Jxgek7rDwDTzo
Message-ID: <CAMRc=MeSTN51Zjn5Ou9+bbSwS6skPvHh-eGC4Zs9j0uCu=B9Bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cirrus: cs42l43: use new GPIO line value
 setter callbacks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:36=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Thu, Jun 12, 2025 at 02:19:54PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > +static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offse=
t,
> > +                         int value)
> >  {
> >       struct cs42l43_pin *priv =3D gpiochip_get_data(chip);
> >       unsigned int shift =3D offset + CS42L43_GPIO1_LVL_SHIFT;
> > @@ -493,23 +494,27 @@ static void cs42l43_gpio_set(struct gpio_chip *ch=
ip, unsigned int offset, int va
> >               offset + 1, str_high_low(value));
> >
> >       ret =3D pm_runtime_resume_and_get(priv->dev);
> > -     if (ret) {
> > -             dev_err(priv->dev, "Failed to resume for set: %d\n", ret)=
;
> > -             return;
> > -     }
> > +     if (ret)
> > +             return ret;
>
> Is there a reason to lose the error message here? Always nice to
> know which of the two paths failed when things go bad.
>

No reason other than being in line with most other drivers which
typically just return a value without a message. I don't care much, we
can restore it.

Bart

> Thanks,
> Charles
> >
> >       ret =3D regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
> >                                BIT(shift), value << shift);
> >       if (ret)
> > -             dev_err(priv->dev, "Failed to set gpio%d: %d\n", offset +=
 1, ret);
> > +             return ret;
> >
> >       pm_runtime_put(priv->dev);
> > +
> > +     return 0;
> >  }

