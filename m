Return-Path: <linux-gpio+bounces-2918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2704848FF2
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 19:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CBCF1F21ABA
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 18:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD8124A1F;
	Sun,  4 Feb 2024 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3SmweqwH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208724A1D
	for <linux-gpio@vger.kernel.org>; Sun,  4 Feb 2024 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707071697; cv=none; b=KokC4sg8kW03mkdHSkos7wvLcSzX7qkWmOfxVD8QN0+JgANzwZPsMq19gtncjL8ql0yspqgNjpuCE1MMJoN3GMo8fyBa7nuBtCqhQvp/16xqryds9G2KJ7PVlzhxSOCFFyMBg/0GRxLCj+z7yufkIyD5eyiOZXq6VNJlAiU/RLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707071697; c=relaxed/simple;
	bh=ZQmBds6I526OgZz80vHGXLR8h+4khj0jQbh9dcT7Leg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcpvnl5W9gLMRfCdotOLVYX4MbPqF+GG7vc90TRsOxN/MTmZusnHd7doQjTEhIWDUmZy/r7fahDgvGSdrRW9T9udy8KYXWeP+eLyc1dcopU+t8CtWij+qOw8zRxXCB/3DViCBe98D5P6Brm3llePdmWCL4JwLalnruJhj2bI0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3SmweqwH; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7d2a78c49d1so1397291241.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Feb 2024 10:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707071694; x=1707676494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGNDwLihPkMuiLw24VbnCKgstM3WE3ciwlWemrRdu3A=;
        b=3SmweqwHUrwfsOEJOAZmta1tuy+WcYkPOevVJeoYnjuY80DL3iSOnr4kOypIk7U0hd
         rTsustcOAW9D1ENXdLl+IPCVbn22o//g2DBTPiWqR4gImEYbOLJW2BvvOhzOolfZaFkr
         AQSokmNcGtEAmZO42ctEkhqVA2ikTO6J8gKEINdI3+iI2+TtyEiBYsMtm5XaOgIzwW8Q
         MpelDkbt2IifhO+Df3hETXO5smbOZGfqiOeOIjBr18Ow7FrI19vI3WYwM989rgOaVYK2
         4xzdyWUiTHRFhejg3FFGbnOX5qU+AJC2pCcsIdpkCXpN2hQkv03FzZB0YB/wMNGbcoRz
         avNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707071694; x=1707676494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGNDwLihPkMuiLw24VbnCKgstM3WE3ciwlWemrRdu3A=;
        b=QCK71dPhUkjL0NRZwuxBFHJm+MTF0Ro22uYXfFgCIwigJ7dnAHDHUw1gOkQ0umRG/L
         bO9WY6zHYAPajd28Fg+XLVnV+6DX6WhE2XVPqDDP1pkrvw1RNkDKdFJmb8tMTNJACaP9
         xDFkywKPGmzI+aZAECyuD98IXataHd3mxoHAFRFd6377cdZME/RatK/dXQ2Q4xMK1t+u
         Rvv67rOZJDejZdiZB+WgjliTLUHUzSrfc/k4sy6S5bqgOYJI3B7blVnSRAblHNDRMUlM
         pCx4dpJaYGZkSFxyTe94gw3A+fbrqIiI3VtRR+TyBXmigiLZqAqb4th9I9w5fuqTtaFT
         ghTA==
X-Gm-Message-State: AOJu0YyCeLXtlVTL4T3OF0dx+zxJpeQtaD7fxnRryiYrnzI3zsrEQpTO
	DpoheMqdwW6dWXYis25MnMgxzYIht8USP7JRcJv4GsywYQWlu3L62reo2dXRE22YOzL4TAzVkJk
	ryNTOULHGzDbW4SrEOC1woFguEC9Y/EohxkwFsA==
X-Google-Smtp-Source: AGHT+IHpA95+RI8LHK0B2t1V6F3nSm87L8MTP3VxDtNMWGAw1mCIDHwdb/VXuS3XWPK8lxe1OKGcU0XJo3BjMCyMZb4=
X-Received: by 2002:a05:6102:1898:b0:46d:2b14:db7 with SMTP id
 ji24-20020a056102189800b0046d2b140db7mr706816vsb.4.1707071694229; Sun, 04 Feb
 2024 10:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204-bus_cleanup-gpio-v1-1-82d91b4ee1de@marliere.net>
In-Reply-To: <20240204-bus_cleanup-gpio-v1-1-82d91b4ee1de@marliere.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 4 Feb 2024 19:34:43 +0100
Message-ID: <CAMRc=MdSApjK2b66LxLE9XZufvT-+SThuqjdr+yG-hsKEb4sVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: make gpio_bus_type const
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 5:29=E2=80=AFPM Ricardo B. Marliere <ricardo@marlier=
e.net> wrote:
>
> Now that the driver core can properly handle constant struct bus_type,
> move the gpio_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d50a786f8176..24d046268a01 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -63,7 +63,7 @@ static int gpio_bus_match(struct device *dev, struct de=
vice_driver *drv)
>         return 1;
>  }
>
> -static struct bus_type gpio_bus_type =3D {
> +static const struct bus_type gpio_bus_type =3D {
>         .name =3D "gpio",
>         .match =3D gpio_bus_match,
>  };
>
> ---
> base-commit: 3eac8bbed22e940ac1645a884f221bef408f675c
> change-id: 20240204-bus_cleanup-gpio-57eea8d32a5a
>
> Best regards,
> --
> Ricardo B. Marliere <ricardo@marliere.net>
>

Ha! Does the same work now for struct device_type?

Because I just sent this:
https://lore.kernel.org/linux-gpio/20240201162758.50733-1-brgl@bgdev.pl/

And maybe I should make it const right away.

Bart

