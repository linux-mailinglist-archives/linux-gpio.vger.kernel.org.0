Return-Path: <linux-gpio+bounces-24132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C477B200F7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2107416B584
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53DA2D9EF8;
	Mon, 11 Aug 2025 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YZ55BwUH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9C2D9EFB
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899025; cv=none; b=MCZ+buuQtN/b6XhggEKwCOqq3LwZtyWTz0Yk0t21aFkX0ws+E7JQWaudXkXJQjX4RCKGpRf5eq1DneX5AW5lHk298cGCdCFIKsi69cZ1hFM9X0UVEe58yFcPtF5ZwGG4HS7rPJ3Td28nd11TyYahtU0AW2SBLex7cGcOlJ2Leog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899025; c=relaxed/simple;
	bh=CJFtm8aT05kS0Usnv5/NsR4DQOUjZUTFcSM8jpLribs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIeIiIn3swS3jZPV4hGcpyB6GAE5hklS4w+cqXEmi8j/X5ABfHclp/wzGL05WLxF5tOZC+dDgOVmzpU8MavcHO4AGV/zn9gYUt1K9TCcFOxrrlSu1NOIvQC+LhP4ZQA14eiiEJcJo+n3kCWCWO9hHf9iaVwRJNlrV9Gk7mSbJjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YZ55BwUH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55502821bd2so4214228e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754899022; x=1755503822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjTF7RqO10ef3txtnjHxWOV2j8hirOXEUm2/myrJmDs=;
        b=YZ55BwUH0Cqn/mp0E7yMgcQluURItIs3lId/s7O4dFI75EvDfH+6HS/PNA6PPasxYC
         eXBZ33Bzcz08b3SZgFXXMa0sjTCDo6TIKDe+QHK6uXCVXB/4+dPN5vFiZZJb9BhTn+GQ
         cWCcGohjzgS+wp8VNtu+M8dZtplIgbVqkz8MK+iq1HIZMn1SqK/zJbCRUdghecKwcxjx
         pG8by+bvHkWqN32R1WHMoJ5TIdbVKVZYbPHm9z0TOH+0/13G7Ik1gf4+VqDAXTLGnWtC
         EPSMv31OLp6g+WH5eT49haL56SRPJWh0cV9ywMutp1WMG1n+EJry9vFUEoWkfy+hSZV3
         DP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899022; x=1755503822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjTF7RqO10ef3txtnjHxWOV2j8hirOXEUm2/myrJmDs=;
        b=KEpUMKmvYoQ58hDF/tptkPArluyWtq840w7M4DAXh7wGMa6QhInW7zwH951HmAn9Ey
         Bow//PxgJzHHadtSmUEVYBJyYhfRa7dWycNmxKCEAUyb8gRop3cdPJz+Af6YEDJU73Wy
         uat55q/lilGCiZmeXOWLWfvIai4JVa2YdF/A8ZuR4TxcDTEoGlTB0Xoab0PKmWX7avLI
         xtasRFktP12OD9P97qrzLRUuIJ6a3Bcoq5AzzELZEXnbNmiSLhk6e1VtzfvE5vFZQ1rI
         oyRx4+OHqOg01cRpIUFFsuUI1NHh0UgufYBOLx4iRzx/bJcReYXLFeBlb5pYrioxAkU/
         ZcgA==
X-Forwarded-Encrypted: i=1; AJvYcCW9iRDVXbOzMMFpSbDPRR7JSdD9lZRa59JpDCSqgagBdW+552Aonwf0ohznpbmfKf6KqgqTVM4t0U37@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4JWnlmw8jWv49BCla4hPnbT1i2EXdqsj0RPCtsdS3iQMCROgI
	pYADEgyuQcYOFrAkI4iD3dO9YunEvGJPXzENeSHGs8fmakSknWC2VUv2gs7SYUSvAV1Fo8559l6
	DXA3fwcYpwHJkRLG9zQFSbNjm8W7Wk49blWCIxmL/AQ==
X-Gm-Gg: ASbGnctHy0exVlfQwV5TQdKVGh6RAPQ6sry4cQR3ZQCgXiTTdp//bHL8K3ySQbi4TuL
	CWEHGCTZSO6hc3YpOueI6AW1dQlP6oggnmgAhTs4n2VwJbFG1zKVzkgBrDxK7HIzi5Ge9dg3LkI
	/vZ6w7gsLy664JqMJa3MlsPpWvMZZAI7MUF/4gGVGcI9KJL23ZAL6Eo+tl+n2h8xEShiKR4FD8l
	U0BJnENDCxJWvOhpw==
X-Google-Smtp-Source: AGHT+IGQH2i8Y/9oCUDP0jds1CiD8zyBoHENbFwp82iz6bSSxifol1LS2z2CYkeffycyRoSzVvzsx1jWGXTt8a00rMA=
X-Received: by 2002:a05:6512:3b8b:b0:55a:4e55:cb94 with SMTP id
 2adb3069b0e04-55cc008396fmr2749117e87.8.1754899022032; Mon, 11 Aug 2025
 00:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806091531.109861-1-stefano.manni@gmail.com>
In-Reply-To: <20250806091531.109861-1-stefano.manni@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 09:56:51 +0200
X-Gm-Features: Ac12FXz3kEkcMo77ykPrhjTh-nDYN-A0dNNICBO0nUM7JygFn2C7N1TD3Y2NU9k
Message-ID: <CAMRc=MdfjuSSsD=LWDpUroyf+fxC7jQrJDtZJtmj_YiQYQjAuw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pisosr: read ngpios as U32
To: Stefano Manni <stefano.manni@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 9:17=E2=80=AFAM Stefano Manni <stefano.manni@gmail.c=
om> wrote:
>
> If of_property_read_u16() is used instead the value read
> is always zero.
>

Please state more clearly what the problem is. This sentence is quite garbl=
ed,

> Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
> ---
>  drivers/gpio/gpio-pisosr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index a69b74866a13..2dc1b1e021d2 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -117,6 +117,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>  {
>         struct device *dev =3D &spi->dev;
>         struct pisosr_gpio *gpio;
> +       unsigned int ngpio;
>         int ret;
>
>         gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> @@ -125,8 +126,11 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>
>         gpio->chip =3D template_chip;
>         gpio->chip.parent =3D dev;
> -       of_property_read_u16(dev->of_node, "ngpios", &gpio->chip.ngpio);
>
> +       if (of_property_read_u32(dev->of_node, "ngpios", &ngpio))
> +               ngpio =3D DEFAULT_NGPIO;
> +

If you're touching this, can you switch to using generic device
properties instead?

Bart

> +       gpio->chip.ngpio =3D ngpio;
>         gpio->spi =3D spi;
>
>         gpio->buffer_size =3D DIV_ROUND_UP(gpio->chip.ngpio, 8);
> --
> 2.48.1
>

