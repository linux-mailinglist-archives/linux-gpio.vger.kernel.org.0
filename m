Return-Path: <linux-gpio+bounces-4165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C2873581
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 12:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5160B1C21FD2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 11:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0F577F3E;
	Wed,  6 Mar 2024 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSy/GxI3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420477A0C
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709724029; cv=none; b=PamJX7esiF1eFzC4T+Bn9E/CXDPqq/c8iSVr8IJazuaUiAat40pV4fTDXN9/pzN67cldaRMo6yEGO3LwLiItoUHaVHWLt7ITcfeggEkI8wj+m/l4JyEfQdW42Anfi1ZaxFo3EvuTZ29+3Bo7oRIRz3HZE0VHHP2SI0NdNX4YW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709724029; c=relaxed/simple;
	bh=eopk3piQXW91sIa/OLXvlgs3+dpFj3FUixr6x1WP36o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y380npgCQJOiQHYU8ghnJlIqRN1AmOX9v0QLmDjej0+l+ACEfgSO8nrn2vBPSaoocASKQifTIAvI7DVQISs7Tan8TwWR4ja9XfRykE7RCwrHqBxwrYUSoqyxCfD+Ziqle6sOWLR+WEc09yiF3LG1dSM+raeDzl9FbdFlfUKcpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSy/GxI3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a45c006ab82so51672966b.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709724026; x=1710328826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=El22IQDLPvxrnLo/IpXj5HslQLdLzDv6ID2FMaleaZI=;
        b=gSy/GxI3Qd90LdPRLepRLBb2UEpCdach1NyaVSQcm37wltiwVVzq/SMpJamKN56ty8
         NopXpK7jxmYL3XYPpbkUaQf6f7p3n35IGvZ9zOWYF625JUBDquD2sQdC7qUlYmJl/sCr
         8IggciC9tIeKA4WRnXBogZETGERayDad8DiEJpdr5TFkdXxrl8mU5X2NZdkiMZaxwYnd
         Chy+jb14npGUqMr+X70ykKYI7Xa8KiRnR548Z0sAKFG7dYUow0iVQ3+bb2OmUmCh0rzR
         YkPVoH0Q4qFejsTm14ah7jyQXnY5LbekQyiG5fxZJoZ+YyQnsKGXO2L9Lf0QHpywFKfe
         9QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709724026; x=1710328826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=El22IQDLPvxrnLo/IpXj5HslQLdLzDv6ID2FMaleaZI=;
        b=XresPrUXqIbiYzWTcsJ/q/3cm7MAwrzlRyqyjAuABlOkjzc9hhhQdrBkuDEi27p+GF
         8+PFlR/rrmF97MgV1gitWplAW/0YXpEleohCoVLM38+2xKXDQl2FZiHkDXCKpjGzfPTH
         6E+DC2Z+dupi6ZczA8PPsay1VjEVdPpqJ/ndVii9pMFOtauPpakmoh8iXQAzvyuac0bT
         Sw3QaYKkl5/nY1jjf/1rSIZra45U88BtJQxCmPu4+dLkyjof2PdQZKDSFdheI1uEffAE
         t1PEvBfDEYTZwVVDwj+6YOKxx8u/xsZaEqB1JERNMXcLF7gPCfDXguBZQaAKKSP3uhHz
         RtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD74reqZHXtyMO1KL/kKRBcVlUBgdaz5QhjCzyCoi1t+XKBfA90e03k+2Zjqf066ESsc8A5Sr7+e6fcwdKcy1kN1NGd9z3+rOqGA==
X-Gm-Message-State: AOJu0YwsTxQ7oJBmqU48v0yGT0UA7y0pyj5LWTtH8k5B5z22ZGJ2bAde
	f8zbyAwdMe+4Gx53Bx84j/j3CEwnNA8FFC5LdqWpTa5DAnANbW+TlQEzhbrpSZyVAlUqDKqXuAr
	AZsSe8Yg9I9UaIFxuX2aqhszYce8=
X-Google-Smtp-Source: AGHT+IHtj/NdXOyz9wCfLy0S4aTXV2bqxAlWUJsdw+a/jMthcBYGNL/6Ax7h1mxainb2qHyVB0j/FHeAgDH0CARlPsg=
X-Received: by 2002:a17:907:20b9:b0:a43:6cd2:7a27 with SMTP id
 pw25-20020a17090720b900b00a436cd27a27mr9296049ejb.19.1709724025857; Wed, 06
 Mar 2024 03:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org>
In-Reply-To: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 6 Mar 2024 13:19:49 +0200
Message-ID: <CAHp75Vc2+wx=82kx1qMsXH3uWX4tMdDEMXLm=MqB869-=bcGeg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: nomadik: Back out some managed resources
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 12:09=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Several commits introduce managed resources (devm_*) into the
> nmk_gpio_populate_chip() function.
>
> This isn't always working because when called from the Nomadik pin
> control driver we just want to populate some states for the device as
> the same states are used by the pin control driver.
>
> Some managed resources such as devm_kzalloc() etc will work, as the
> passed in platform device will be used for lifecycle management,
> but in some cases where we used the looked-up platform device
> for the GPIO block, this will cause problems for the combined
> pin control and GPIO driver, because it adds managed resources
> to the GPIO device before it is probed, which is something that
> the device core will not accept, and all of the GPIO blocks will
> refuse to probe:
>
> platform 8012e000.gpio: Resources present before probing
> platform 8012e080.gpio: Resources present before probing
> (...)
>
> Fix this by not tying any managed resources to the looked-up
> gpio_pdev/gpio_dev device, let's just live with the fact that
> these need imperative resource management for now.
>
> Drop in some notes and use a local *dev variable to clarify the
> code.

LGTM, some minor remarks below.

...

> Cc: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Note, you can put Cc:s after --- line and it won't go to the commit
message while Cc to the respective people.

...

>         if (device_property_read_u32(gpio_dev, "ngpios", &ngpio)) {
>                 ngpio =3D NMK_GPIO_PER_CHIP;
> -               dev_dbg(&pdev->dev, "populate: using default ngpio (%d)\n=
", ngpio);
> +               dev_dbg(dev, "populate: using default ngpio (%d)\n", ngpi=
o);

While at it %d --> %u.

>         }

...

> +               dev_err(dev, "failed getting reset control: %ld\n",
>                         PTR_ERR(reset));

Also possible %pe.

--=20
With Best Regards,
Andy Shevchenko

