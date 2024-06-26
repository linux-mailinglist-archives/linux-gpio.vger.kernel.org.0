Return-Path: <linux-gpio+bounces-7728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC0918089
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3700B1C2236A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED5F180A98;
	Wed, 26 Jun 2024 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AF/doiyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C72180A80
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403602; cv=none; b=lFIqENKIqejxf/6UYFEVvQ5RjmtpysnDpQzyopSwwucdMDaU+Jl9dfRnTHJO6A9KfyEPK+L3HawnDx0SlVqqJd1aSR5KEDaWsch9vIwf4PJEDxWvTXeElAfXCx6Wdxr+mrrfzWXddXjJvCz+qMNPKdvbJ8VaQxTW3HGpwNJOZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403602; c=relaxed/simple;
	bh=OzHbeL5WtJqCPBFNWo2wRad/ZDM5wcfh7viKbjMBt04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tySii4tlxM1TvlRQoK0Nu6Rxvhyzt7uw4mnlTkqiwcsmyjKdeFjEsza4JKDNEmfUawjv7FdlQDkGZ+7rVW2R6524QzHgQk1qlttEgpOh9EuMKlvsMHVCWv3NME+39g2U/hF0ky/Zi2LhZ+PMHHn+ZCHnZHo6HjZVQUuuWSLJl84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AF/doiyb; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52db1a5b3f8so508461e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719403598; x=1720008398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2+2NLpsRBb/A1mZr1EFBFFtwdFUpWW1fRqczPXb5as=;
        b=AF/doiybsyEhy9bOJW3nzxbhIhqRaVGQ4yJ5TsaHEIOEbA2q+PqCXgqrkL/5w67cGq
         UJpQjB06ns+INe+KEq4PJoKaNIauW2pOUyofBRmrUNdkQO9rokbO2Rf8LPsInC8koT4r
         Hj2NZUWfJ6A1z7X7YgJt31kBwIEatI3HWP9AmogKuPp1LdfGmby7Rv1hREz0J5DRMkkr
         x4Eho4fjClZ9YhaalzfPO5V14xocGjalACJvnKDw5HageK23/+UIlrrpvb6UtGb/ZSsg
         DuoctC6jlqU6v6Bq5oMF2l/gJ3yMW840bsPTzxGEtKii87DjS1UaSRdr3tX16flWjMHH
         LX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403598; x=1720008398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2+2NLpsRBb/A1mZr1EFBFFtwdFUpWW1fRqczPXb5as=;
        b=UW/WarOCo0pzvttiTNjKlz/0yTy114CJB8l1tBOAhlmlrYp5vbkukwZ5d3TOjA7NRg
         5qagjYWEAy2PFwZ02IQ+Vp5jOJB+VnaVSSUdILt5gPZDxFZWiXRid4zh6S7uhSJsDtv7
         NYi5ZnQm2y87TuuFrAoFk2I4xZzE83frrn5wo3loWNntUg80xnSTIp/KxcX6Qq7hC4J4
         B4EMVGqEC3c8jGeZpyjiDxnV0rJXmXAdAvvNOYQ8+bbRBRv2thtExUEq4rf6m46cIOyV
         ymapMO+WVrNhMv6L7FK7VbDyjxV6fy7Y1rz2uDYFvqVZpcCnmxTqPYkmfSk9PEYYwn3g
         2nfQ==
X-Gm-Message-State: AOJu0Yy4zN03C0l6FH0JanSmchXG7TmLN1ZqkoznYq2bi9ZyyPWxkKVX
	cSOHCJtlXFZJ+YWQs8Pd6isI67EaQMBWvVyEApRX3IkZh3eH5Ka85xcWjLdQ9BDGC+hbM8v6t28
	R9HF8VtpeL95LwHOFcFANgWBE0REnjt0NjSnrPg==
X-Google-Smtp-Source: AGHT+IGNXOPWzj1X7QU8se3idG/m9LeRfsovZgHLg/ViLLaROhPSd8hd4XH038GACB9qaHOrbJO17dJiAmpUbT0kK+I=
X-Received: by 2002:a19:9115:0:b0:52b:963d:277c with SMTP id
 2adb3069b0e04-52cdf25da2amr3552489e87.33.1719403598599; Wed, 26 Jun 2024
 05:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 14:06:27 +0200
Message-ID: <CACRpkdY=xAKNz5S+sbJXYRs9EoivJS_nZEtYHKc2m4UDkLvscA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	linux-kernel@vger.kernel.org, Mark Mentovai <mark@mentovai.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, =?UTF-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shiji,

thanks for your patch!

On Tue, Jun 25, 2024 at 3:22=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> bgpio_bits must be aligned with the data bus width. For example, on a
> 32 bit big endian system and we only have 16 GPIOs. If we only assume
> bgpio_bits=3D16 we can never control the GPIO because the base address
> is the lowest address.
>
> low address                          high address
> -------------------------------------------------
> |   byte3   |   byte2   |   byte1   |   byte0   |
> -------------------------------------------------
> |    NaN    |    NaN    |  gpio8-15 |  gpio0-7  |
> -------------------------------------------------
>
> Fixes: 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init(=
)")
> Fixes: https://github.com/openwrt/openwrt/issues/15739
> Reported-by: Mark Mentovai <mark@mentovai.com>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> Suggested-By: Mark Mentovai <mark@mentovai.com>
> Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Tested-by: L=C3=B3r=C3=A1nd Horv=C3=A1th <lorand.horvath82@gmail.com>

Commit  55b2395e4e92 also contains this:

@@ -614,10 +616,15 @@ int bgpio_init(struct gpio_chip *gc, struct device *d=
ev,
        gc->parent =3D dev;
        gc->label =3D dev_name(dev);
        gc->base =3D -1;
-       gc->ngpio =3D gc->bgpio_bits;
        gc->request =3D bgpio_request;

After this patch gc->ngpio will be unset for any GPIO chip that
provides a ngpios property, so restore the above line too.

But maybe a better fix is:

+ #include <linux/types.h>
(...)
+  else
+               gc->bgpio_bits =3D round_up(gc->ngpio, sizeof(phys_addr_t) =
* 8);

?

Yours,
Linus Walleij

