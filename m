Return-Path: <linux-gpio+bounces-5019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E420895A3D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 18:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4028C1C2251B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2115A4BF;
	Tue,  2 Apr 2024 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7Gitald"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141E15A4BE
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076721; cv=none; b=fPBdyXRwZOLgLvcUItQtCziZmjKicFcujaPDfzcgh0xiuChQRvSrvv66CpNMmhHo4UgB8BrkGXcIxszOqwdUbCdP/pjhu+nnh3hOLViInC94raaYx69iF17NGgvZM6niErjB12N+RvSiyLEl+rOlmffoHZPRBYMbedmwvvgXzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076721; c=relaxed/simple;
	bh=SJbU2X7441mYJCFBc2qvaCsgEGCMk8xV0KIIvRAIKzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVfbs28e3T4+yYYzalVXuyUDx05DArkwnnLKeJwQIEs5c4cKJKl9LgpAFwEfBsiZjQ4eQx6N7vDlLnXVkOtrLvOhFczvZlMrOdToAC9WFB2ISH8kwvgWyAXGEtuDAViuiWneRvXO3f58CDOcMUZAcUK10oMRyFhYRlruvPU12Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7Gitald; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-515a81928a1so8934670e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712076718; x=1712681518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgISE5etL0neRViDNv8SHE5eH5odsBSeTE4yjpddWsk=;
        b=m7Gitaldj663ocgot38K3IumLid79g1nMbCPtZWwgMzcyCzvplX84sAoOEp1AqX7Zb
         buhRthXA/lyaILn1mzEKcNQEt7X1Zc0T0CKmkjYAWlF02h9v5GyTeooY3fbA5EyAGh3l
         GEx+i66KSu/gm0SwVxGYQrii+Um9Sk6e6LYFWsR+QlYvoeVUuC/wQy/efioD97Bp8o10
         YAU7rC9dJxPF50QuKXXRFVIxSk/h1UFF8Mjar3u3So0AzaPMA0Bfu/gLozzJaLaHrLyP
         LokMnaIy+GMydtcDZatUBuVdxZStfjKAewICGJvmXI/HVut36LNc3QL9u2LWUy/1rNpy
         r28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076718; x=1712681518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgISE5etL0neRViDNv8SHE5eH5odsBSeTE4yjpddWsk=;
        b=Hl4dq+WYYsZomdaTcL+GYt1CpZIgXa7GrANSUrDaGtLL35uOh8ukJHDEZ0IxXED5FG
         ER0uXlKMYI/EnEaRG6TvHfuLrdXEv82iIRmhDIFqHIpLiFVIdxrjQJ5oFK58pguvpApH
         aEY/1yutV4zLWL9XRDDMSZVWJm9yCMqRjm/QZqqAfD5j6PKxz6YQFSqB+qxUMhSOoOkM
         l4gNZLuUpEuhnQPRSQYb2acec4F7dgy4ppXrqTq8Vh7RakmSXqZBLLVxFd1a52IVUn5G
         Zylh9Dif+voins8H/Rg9AjbjVIkW2tyJMydyVKwNPeCt2zMDBvOHPK3FcWw6Fu6+Jhj1
         KNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMheV5nZxs4FQtvS+2NO+8ZjmMTBlawL5ymB+gAydOPaLkelQJBPOnW/qCaoh6eQMr845PLbFDVweHJa3vMkJ2GctFkvu9wi1GLQ==
X-Gm-Message-State: AOJu0YxkH3gUfSxM9ca6M8aM1KBtq3KLfciT8ryVyzyXxvnt0BqciTnx
	ygG8Gt7GJD0+iqI4B8AeP41NY1ubsEY6QFDRgJol+cUAi5sYBFHqd4dmFgHkVZcfhXsljhzAebI
	matNYHh2hoVhwQfKQA6/BOwzW5ek=
X-Google-Smtp-Source: AGHT+IFkZ8Fljuu+7esyL9W9leJUOufQMhdJaMevUKQhSvGeXEfzLVh/OLYbTMyr2Xz/3ayXWd9W6SkCVg8xApbQmU8=
X-Received: by 2002:ac2:4149:0:b0:516:9eb9:dcd1 with SMTP id
 c9-20020ac24149000000b005169eb9dcd1mr1955851lfi.34.1712076718157; Tue, 02 Apr
 2024 09:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402164345.14065-1-hdegoede@redhat.com>
In-Reply-To: <20240402164345.14065-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Apr 2024 19:51:21 +0300
Message-ID: <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 7:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> When a gpiochip gets added by loading a module, then another driver may
> be waiting for that gpiochip to load on the deferred-probe list.
>
> If the deferred-probe for the consumer of gpiochip then triggers between
> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
> see the chip and the gpiochip_setup_dev() later then gpio_device_find()
> does a kobject_get() on an uninitialzed kobject since the kobject is

uninitialized

> initialized by gpiochip_setup_dev() calling device_initialize():
>
>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>  ------------[ cut here ]------------
>  kobject: 'gpiochip5' (00000000241466f2): is not initialized, yet kobject=
_get() is being called.
>  WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0x43/0x70
>  Call Trace:
>   kobject_get
>   gpio_device_find
>   gpiod_find_and_request
>   gpiod_get
>   snd_byt_wm5102_mc_probe
>
> Not only is the device not initialized yet, but when the gpio-device is
> added to the list things like the irqchip also have not been initialized
> yet.
>
> So gpio_device_find() should really ignore the gpio-device until
> gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
> check to gpio_device_find() to ignore gpio-devices on the list which are
> not yet fully initialized.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

