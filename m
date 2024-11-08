Return-Path: <linux-gpio+bounces-12706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1417B9C1812
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8A41F24166
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7321DF254;
	Fri,  8 Nov 2024 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L93ynh6C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93A1D356C
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054877; cv=none; b=XueveKz52QQdaA+zFpHRZy4BxrejnaTy6LAJtWrqxXnjg9pwdL+VW4S+yS+G9gGaNqPIcQLzX11J/a7FDsviwMbGAyHrcmZT8Qpfe5b2X2IdwWqoyfpc2+iRJKaBC6DthNrmox4aNsvM5c8YxNfSv3GmfdU3qcPhZo8/mjN4fjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054877; c=relaxed/simple;
	bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbAc5i1O4fr91fLygy+5NVHxOXvb59Gl3kW+E5q5o7RyUqakYN1USjMjo5YLPUAvVta0hVOc7AaZR0qQRDfeZUCN3L7ouKXZFkFaY3+qAc5Y9bJAytGcyvCXQO/+0k23w9MXexDZfCZCdYcuApYWjTBbn9oCuSZSaF/0yqaieUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L93ynh6C; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb599aac99so19187421fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054874; x=1731659674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=L93ynh6CHyhXe7eMSVqxntYPLpP65gZs43Lr5g7eg9TnF8YCXc+Wg5/Fb1Un92/v6i
         9U5RL51w/R1zszPbiJvb+JXkIyzs+Yf+UetH6J2oP4MLTANMN91LCiBn8n+IT7vbAOXo
         MytLzt9vkyVX/rL+ZRcbSSmmB4BOkdpgvkHaURTFrUbpDcQWI/uxCWObJ+kK6IkLaTjU
         +C1GZTAyw6hXz6GStYIUKEFt6gEOichAEiHrSDOqCONGwCW8WUTJOs9gsIuqE1lB09lP
         3gzbDIqRTZFE3IVl3p33RYYKkpam3fT4g6DEgv03bn1ytgHCbD06itM7jbTnpK2JCg9g
         k6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054874; x=1731659674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=sHuk4L9ZO/lG2w5N33q+QbTnFTiYJ4Q9Fn7hXmQeWxoe1NJJDsWdeQhi0vaHkU8dLF
         WSwSj9vN9dgESmv0yDNdKdfN9DfZ85+ERkPyHKC4/wekMp2CxOmTzK+4G7zV0OiEvqVV
         QVFuiF0gW766YdIa494afkN2s+vdXxm/mkABg3Ksdt5oodHtt459D028sufk1+AZzy1H
         mD61mVG62H5tMbOFjp355Ef9rTkx4V6a/gfivNLE3DOq1VrReGwmhpE1p7vZ21s3bzWW
         XkJREn4P2egZt/8SkBBEIK+uoZt6N8p5VHiMuxG2sPpsIsSqSIe3DdtQ2tpXqH37aYB/
         vRHA==
X-Forwarded-Encrypted: i=1; AJvYcCXGT+RA0OgEBQIwzEL2fB+UvrwTViw1+yWzecMsvHuLAZsDi3UqiIA8o0BjgaRLNQB/DFZhoxPFYHNe@vger.kernel.org
X-Gm-Message-State: AOJu0YyGseyPU2M0nLwPfrGpFzaADixFQxSJgazcGfAqr8uYs+1taQl+
	Sl2KOnIFWTMe83Lqo/J+EATwUCLhCIv0lhMUedI3WsdYjGARhN87gAarcXeUd4iZJeOUopMsgPh
	5QH+ICewX4jnzFtXJRV7JDjR1/65Bm8aTFwYsJg==
X-Google-Smtp-Source: AGHT+IHx7mAPhJnzxE7EYgyRjyP79PfLYtwkdmgWKx0QpJkHxCqAuAqQZIcNr65Vl/TTpb1mgGDc7xzfzo1LsoeLK4Y=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr8041491fa.22.1731054873529; Fri, 08 Nov 2024
 00:34:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:34:22 +0100
Message-ID: <CACRpkdZ6gYfbkjcWMNOOyN9owg8n6ApFVv5XZXUA2CY4-JXOVw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
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

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

