Return-Path: <linux-gpio+bounces-19659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B4AABC9D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 10:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F1987AEF3D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 08:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DE320C028;
	Tue,  6 May 2025 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H4qZA6D/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33020B813
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518836; cv=none; b=ZqRhvf8umicdetBozwe9X5HUS3NGula2KdooQyvudMVZYMXvC/E9AnjouddK3p0h8o+h1IQHFLLcTm/SxOcfkeG/RBSxVu6E/kPmNiFB7SJEwpoUW/aJvNPWbjDwJ2c4k1tEtnSwF9It8HSxv3aeGmaKZWjfzivlVVjKd9M8e0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518836; c=relaxed/simple;
	bh=/i/S7NDpaV/eqwKPT4Y4crlS4XLw5APJiQbbcfUmI+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFYTpjdvKJEVi1Z6CbvOM2M75Fs7tcpSydIBlk2AVjc8uT64Hxj6SkNicQs/OVcMRUIAxN/w65Rc3dZ8ZF/u51iDn5PPSOLqWm+LY6vjKiFDoWLcHgTvt9nqXyEgGdPbs0v3cRJiezkDEKz8gO8nN/De8b6KxJH6+IoOx4bCi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H4qZA6D/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ea69e9352so6346402e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746518832; x=1747123632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=;
        b=H4qZA6D/mTJunFcq2f15O0aC5SYL/RVC7lMYPpknaxX4IiUbxtiVRbwWed0TUPnag6
         hDnXvBa9LsAT/K1enliHJolXi75dGDBPD86VP2BduRYMXrvHOf0y3qibuVK/1qHOUXAw
         sJQQe/kt0gURiAuWB2LZUCNJWP/4wtkEDbF6h2WhIaX/NDcw3K6a5HSql0EquHK/CyX7
         fbpqwu907nYqTr1TkwrVUx8TzrKs148S89nsQo70GrHpmCocUK13sNIEAhK9ypAlNEyA
         8ufOUhXn/utzWcd7FXb6sFDcf7Ky+XXURhJ07E5kP0uBNNZiXpO4Iix8bK90AskmjtFO
         Vvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518832; x=1747123632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=;
        b=YnohEuBSSwxKAvJ80FySwTFikxSjxsVFICcznmq6PCjHLjryC+ONSsEoWvOjKWj5Xo
         D4sw+qpoDb+Jc1ohAws67J1btN+qTvBtHG2aTq2VV3GIyGkV/28i+h07VkDI4fHnNmDT
         K3upLqB4mVAUNBqskM9ErQDBynsibzQdaduP93+ImvdaBqhcdpZU1jARV09ahvhAsZeN
         5gcYs1qlrnj+FN8ge7/TqIxjWDmv2hIcxlJybEvpseke8/S56hu83EULjDPzVWo7YEVW
         4C4mFJadb9CrOlRkRwKEvBhp4DuGNOcaENxrgJDhPXeN/GMx730hFVEprTCVCTxDytI0
         K97w==
X-Forwarded-Encrypted: i=1; AJvYcCVFtukHapaqHuiLjjoBfC0s59PM2vSOZCf1nnyJmba4x6HIBtXyIiQMiiyNyrxNoc0/I09OakPKERs/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Y7T+GdHv9eKnkneYvtBe4HGrTnz0fYAE6vjAAZNSpo9neIxB
	KeLgpH1x8WZAgctlO5C47ueRyunj+dqxTiP9m6z9CHpseGn9lgr8Yg6bK53nGvFeKJIR77LnFCz
	wk/gScUz5NMvth4G4FHio1m4DAjambFHPSWp2tw==
X-Gm-Gg: ASbGnctTWtBd62aanAC9M20NIGgixfrNfyRGUHgG7sEQvIF6jihJ254pMY4VAzl4YmC
	SJSqnTcusreIrCyRwLw8WukiUcIS7ugaXUlnAc29E5ccj6oNRq/7sTQFwop5N56OOVNz6R7yjIa
	E1FifhE2RmFm7na3rKLhmUnuLZpYhRhKKBZl9AXQ3pF4E46YovTrn6Tw==
X-Google-Smtp-Source: AGHT+IHqoCICO9862R9K2Lm84ouPAwINr3VP7krJifWUL5WSBoQ4Kvr33P34RfQvhWkjHIDMgMqYGqtI1g5tPyBwgtk=
X-Received: by 2002:a05:6512:1048:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54fb4a14406mr712084e87.30.1746518831752; Tue, 06 May 2025
 01:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev> <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 May 2025 10:07:00 +0200
X-Gm-Features: ATxdqUE_9uM4g2e9vDQcwVZ74pJhDseN0shdJbJ2G8cWvYqvkY72EGPX5Nyfbec
Message-ID: <CAMRc=MebFf-DBh_=H0J4ORStaxBYhOnfY+jSk2d4UpdyS=m1LA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] gpio: Add new gpio-macsmc driver for Apple Macs
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 12:07=E2=80=AFPM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---

[snip]

> +
> +       smcgp->gc.label =3D "macsmc-pmu-gpio";
> +       smcgp->gc.owner =3D THIS_MODULE;
> +       smcgp->gc.get =3D macsmc_gpio_get;
> +       smcgp->gc.set =3D macsmc_gpio_set;

I must have given my Reviewed-by under this driver before we started
the conversion to the new GPIO driver setters. Could you please
replace this with set_rv() as the old set() is now deprecated?

> +       smcgp->gc.get_direction =3D macsmc_gpio_get_direction;
> +       smcgp->gc.init_valid_mask =3D macsmc_gpio_init_valid_mask;
> +       smcgp->gc.can_sleep =3D true;
> +       smcgp->gc.ngpio =3D MAX_GPIO;
> +       smcgp->gc.base =3D -1;
> +       smcgp->gc.parent =3D &pdev->dev;
> +

Bart

