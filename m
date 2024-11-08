Return-Path: <linux-gpio+bounces-12701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FAC9C17F2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD11E1F238F5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926B91DE4FF;
	Fri,  8 Nov 2024 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ya2h7S/Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5291DDA2D
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054581; cv=none; b=ju9/nwrxD44GlfGIz2j7fYIZp4hgKW82VMl5hqdEqp91kaGPWa7SXKW8icUlsvtCGKTFmrqtm3zlQPKesyNiCgJ48u4xpbZZEIhlph7ns+F/S25xd+yEcmiNCPSadGluyRNiA/B4S42h1LZww0JRWuVB3eMEoxxzZn+ZLV/a5QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054581; c=relaxed/simple;
	bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0hRDKSu/Nz4NXnyslxOcKKd7IMN0Hqex4AQ9ACR0Ze/GKipYXDTdf1rMSyPh/C7WMtRapS7wTlRf31j1qXYcADr3/gH43D8UPt6b8EEbHT5FHFygbZZ2Lv2lsb9y6QwZLtwzKNh+R77B4eaBln6BO/St1e5HzCVjd0OKcgJvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ya2h7S/Y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb561f273eso17234191fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054578; x=1731659378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
        b=Ya2h7S/Y6UDtD5Ih4cBErT+XuggmfByoxWEicnE27DkOuuy+NkbY2dvI5k1IhI2yFr
         5LqWpjV/CQwG3syEab+n8MATv44h4yoT6QVYoYtLaMwoxltI+kkF0FV9miz6cOHL3UgX
         jC0L3zUqDUaDM491YzgbLgODiz10RiM9XONK+tWLRnStmioAj9gnUO0e9oibbyCb/Ky/
         h6hgfF/O7pXNGLptMrpdDOZyj+RVSa1ph9cp8CCZmhMM7Oq+2/lidNGJ67t7eFn2UjE0
         +8dMthQKGF9tnNpulrP0vB0ArqcAsSffGko+5A8e3B1SiLAYDtu9kf2qlBPJbAtupBbz
         1cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054578; x=1731659378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
        b=a7b3P0IKmLGxvGVtZFPkaQQAFoLkHSugCRsp3YrX5e8kDCZUr0UlLEMym+WyIcw+oS
         giu9mjhJrzAErVzewcu78+D4pl6ZVGn9xWhmhAMqdjqT1Apv4HjryhaAXFgqkPHcSiv/
         5Ad3fhelCNFa4smGUVvtLLtB/PdjZgs2VmUNS5ST/MZ26Vj+SeEF8Rba2fVfMihZ47Yo
         XaCz7NJ82+KA72/BWp/qKI/C9sd2C05Mx9mvbS+xsU2rIr7V0pxy3IfHKlopzsRzmwUS
         QQwR9wOvYzEcPWYfYTzsetSd1Fwf7fKpjcYkEIm0r17AL/W5QjGgutKnK9oxDUmpYWzd
         w6+w==
X-Forwarded-Encrypted: i=1; AJvYcCXLAYQKTh+U6ScJ4UNQN+kUAYwe8lq3cqD3ZvyrhqykkSz51rTjcAwD54T+hQn3DFD21EjVuCKUfJHN@vger.kernel.org
X-Gm-Message-State: AOJu0YyCP9ijls3CyLOt3nGK56C1Nyxysv1BR8ysQvZABAwW0hN0VouS
	eexuJWRTkgfYypi1Duj2D4tvE/9IonrNG+WUuPk41FwP/ZByZ0aQHfD4pYpNbwUmmTngKSoU8cN
	vsZctAJM+ghvlOcOfTPIMu5ioYx/0rFe9SUrf5w==
X-Google-Smtp-Source: AGHT+IENM6vfeCH9jGfRGzsvajDFe9k4SE9omtWG0eiWqQPEFEarMA3/0+sqGJR+WelYaCDndudO9wf9Qnll7perQ3o=
X-Received: by 2002:a05:651c:881:b0:2fb:6465:3183 with SMTP id
 38308e7fff4ca-2ff201e7398mr8693241fa.3.1731054577786; Fri, 08 Nov 2024
 00:29:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:29:26 +0100
Message-ID: <CACRpkdY9VMRQftH_eqxikpKSh+a7yFKsHa9fANZUkZx6Md3vpw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> No more users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If the series flies, by all means:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working on this!

Yours,
Linus Walleij

