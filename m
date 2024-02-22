Return-Path: <linux-gpio+bounces-3624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2585F460
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 10:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055E91F21B99
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 09:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF08376F9;
	Thu, 22 Feb 2024 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cQBRoG4b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100736AED
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708594264; cv=none; b=Ol1Ji2ucfZoJO6hxGAmbRgr/1PKtjDTjG611R+E1H0q9j70RN2pQVBmrPKofJ3Bwpgz28FwE0J1DnmofCEMC0BdTRdRgkPhXFt+FNesUG+2W1sQ+8efMxAOnTkEJbwiu/GM/k8GasSMhaUPVPjzz7/Mrt9FBmuxFNUcWcw6yBy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708594264; c=relaxed/simple;
	bh=9G7lJI5IDfPGdHdX5zwaUalzO36IGTyW3HIIjqi8i+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kesNvvao6BrEylzUX6v7dgN21S3uGNPfDHOB4xgaCwHbPyh2VgGT13c/uFQKUfFpN0d7G2E95Enw53WKFt3NqXzfIhzs1/ju5HfTXTP7GnaWnDs2FfrDUoyINgbLCRQZZuAIDbd/OQE/F/n+ujtA99IrQa/A44Xiba5HzNhsoro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cQBRoG4b; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7d6024b181bso813710241.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708594262; x=1709199062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PlLc1PUqmILNE+p63A9C2ACu1wPfn85XBn9cLMW2dc=;
        b=cQBRoG4bGLayXfOr6c3rKrq0Ij6RKteZz7k17PbBqllkdNQGt/nLH3NBjl3slJFjAi
         VWVJMFatJU+P2ABnjV2tRrWrH/pRfEw4OujNdScLsLsEatxeZq7oQzxkQGABqXyIzFVH
         TzAch8GwIA33OqFT90ge5iv6mtSLZPHysGMzB3DHAby4j1arRIuVuha6uo0xPM+wWqIc
         xR/YgwvYN289dZ9TrgUpj4jXwBIUxfswk6vLOPQq+PdHuZ4O0vi6o+YHnlbFwYhnJngx
         Che7PnR+uCELte/pbPtdY65PRUlwmXenCW5SmMketLs1sYqE2pkZO8mNZaDfTFvvpPZk
         JKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594262; x=1709199062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PlLc1PUqmILNE+p63A9C2ACu1wPfn85XBn9cLMW2dc=;
        b=kQFIIrAjLBH3qJTohJ2hx3XSl/D6bD5zmRGfDAaR/JRDz4dceKgMAZC9+hC5f9+8gb
         tsqE0soKyzDpwXGHdLywIycwc+cwlCDEvr/v9WGVXiJXgB9j5+PE6y50MZUuxSHG749V
         +baV3oDTP2MbFOfaQnCgutfo9zc5snBxp8rKAT/BdFX91dPIjUAw6Yyc/rpnS8CQV8c4
         CGMF2FsxMCh37BfEwGEgofmugGKk27uTzKFVIL9kDxpla61h0/9K2bIySyBgA5zydsdl
         WxQtZb5Dcp5cB3DLSpVVubos2GOdPWP0jL364D+m7y89ErkF7gc/T30Q5lcB84u3UJ9W
         yLjg==
X-Forwarded-Encrypted: i=1; AJvYcCXBu7fdiROvLASKvfdjyhRWR84aV0a/mTMQQy0u2373FOUim3nCvsoEMSpRCTX+M5tM441wB5sbf9nHjrabe9bg9nLA7ndin7d8TQ==
X-Gm-Message-State: AOJu0Ywaxxwi6CFya7vRnGqEXCIkV90CpYQV6w0iX1Dfbo1VLbMfkqxu
	9WzB/aumvPfuRJV3vrGGhZwMz0Wwkd8VY8pct5r2xdb0x2qBe0gCTw4gurFg3W3EoACJNoEP/HV
	gubxYZWYdA6zX8RZg+golnQgein5UU2jmCzKrfw==
X-Google-Smtp-Source: AGHT+IEToLxGWX/9/V3sCdh/JRMTTDjiprSrSqjpvWgISAjno61KBiZrERpbtPCIbor9/5i13hG+MwHnX47Z9DOnSow=
X-Received: by 2002:a67:fc58:0:b0:470:4e67:3b38 with SMTP id
 p24-20020a67fc58000000b004704e673b38mr13429459vsq.14.1708594262009; Thu, 22
 Feb 2024 01:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221015920.676063-1-swboyd@chromium.org>
In-Reply-To: <20240221015920.676063-1-swboyd@chromium.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 10:30:51 +0100
Message-ID: <CAMRc=Md5BZxS-sCZO9oK9y02kf-Rh04DpaM8-cXk6KoJiDzmWw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Pass consumer device through to core in devm_fwnode_gpiod_get_index()
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 2:59=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> This devm API takes a consumer device as an argument to setup the devm
> action, but throws it away when calling further into gpiolib. This leads
> to odd debug messages like this:
>
>  (NULL device *): using DT '/gpio-keys/switch-pen-insert' for '(null)' GP=
IO lookup
>
> Let's pass the consumer device down, by directly calling what
> fwnode_gpiod_get_index() calls but pass the device used for devm. This
> changes the message to look like this instead:
>
>  gpio-keys gpio-keys: using DT '/gpio-keys/switch-pen-insert' for '(null)=
' GPIO lookup
>
> Note that callers of fwnode_gpiod_get_index() will still see the NULL
> device pointer debug message, but there's not much we can do about that
> because the API doesn't take a struct device.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpio/gpiolib-devres.c |  2 +-
>  drivers/gpio/gpiolib.c        | 14 +++++++-------
>  drivers/gpio/gpiolib.h        |  8 ++++++++
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.=
c
> index fe9ce6b19f15..4987e62dcb3d 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
> @@ -158,7 +158,7 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct =
device *dev,
>         if (!dr)
>                 return ERR_PTR(-ENOMEM);
>
> -       desc =3D fwnode_gpiod_get_index(fwnode, con_id, index, flags, lab=
el);
> +       desc =3D gpiod_find_and_request(dev, fwnode, con_id, index, flags=
, label, false);
>         if (IS_ERR(desc)) {
>                 devres_free(dr);
>                 return desc;
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 44c8f5743a24..c6667a887ecb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4133,13 +4133,13 @@ static struct gpio_desc *gpiod_find_by_fwnode(str=
uct fwnode_handle *fwnode,
>         return desc;
>  }
>
> -static struct gpio_desc *gpiod_find_and_request(struct device *consumer,
> -                                               struct fwnode_handle *fwn=
ode,
> -                                               const char *con_id,
> -                                               unsigned int idx,
> -                                               enum gpiod_flags flags,
> -                                               const char *label,
> -                                               bool platform_lookup_allo=
wed)
> +struct gpio_desc *gpiod_find_and_request(struct device *consumer,
> +                                        struct fwnode_handle *fwnode,
> +                                        const char *con_id,
> +                                        unsigned int idx,
> +                                        enum gpiod_flags flags,
> +                                        const char *label,
> +                                        bool platform_lookup_allowed)
>  {
>         unsigned long lookupflags =3D GPIO_LOOKUP_FLAGS_DEFAULT;
>         struct gpio_desc *desc;
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index a4a2520b5f31..c6e5fb9aa212 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -202,6 +202,14 @@ static inline int gpiod_request_user(struct gpio_des=
c *desc, const char *label)
>         return ret;
>  }
>
> +struct gpio_desc *gpiod_find_and_request(struct device *consumer,
> +                                        struct fwnode_handle *fwnode,
> +                                        const char *con_id,
> +                                        unsigned int idx,
> +                                        enum gpiod_flags flags,
> +                                        const char *label,
> +                                        bool platform_lookup_allowed);
> +
>  int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
>                 unsigned long lflags, enum gpiod_flags dflags);
>  int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debou=
nce);
>
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> --
> https://chromeos.dev
>

This doesn't apply on top of the for-next branch of the GPIO tree,
please rebase and resend.

Bart

