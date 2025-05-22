Return-Path: <linux-gpio+bounces-20509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F64AC1667
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 00:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D965B1BC0E85
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 22:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20CA263F39;
	Thu, 22 May 2025 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQL6Gpjj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2125FA26;
	Thu, 22 May 2025 22:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747951467; cv=none; b=dEEmcpLP76VAH+C/4MHMIk0JDjuhOlAA2M5HnyV3V3FK4TghNjLxCDwoL5Szmx/luorIXnX6zfA5xBnVuZJdFt/tNl9Y3HBO5FYxvDEOa02cxxqRBMejbsOnsBT7aW8pu/Q8rtFXESZPFiOxCBeDOc3jGpeGy+vO/X3CPiSazGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747951467; c=relaxed/simple;
	bh=b1iqC+lVF9SNqQ8B9xDMbSuNnjq7Dsax8x/dVX3V9l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7RFXtROQtwtPFTK/KJyqCbUc3YZDa9omf2yRs2E+h1xaMgCjHIKQvLPeYOtA787I+NWTG2QmUTTbAx4WSaClqYRIq+egay9PW1iNhiefK6YTEx8eSOgYFGtb5q9ijbf21m9PDLoxm4YVk+RNvsjbcQI6NKONZWJsfWdQLLNk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQL6Gpjj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b166fa41bso12906683e87.0;
        Thu, 22 May 2025 15:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747951464; x=1748556264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHnPs9hy3e44g+CeJ+TJwX+Ll6i5NcRIRCw8fze3SFw=;
        b=nQL6Gpjj0iZpVTY8oZIZIJGxPN+J2zN8t0W8S2zCykaVvnB3df4QTxVwnd0SVR1LnS
         QFiCe59LOOoaZJavBpVRW4JP23G6FmchsoawRcyWlFfQq6bGj/nFOcY6Ckespr1yejD0
         b3UzGLkB2dApwFicoaTRbVWFqxhAug7+Hh0NoXay9lWV0sfQjarWOgsrDlDRNc+a+mhs
         0g6r6EHBY8/lQTcTz1+AQ1XLWEChUwq1mqzs/enczuBjFPseXmU9iw7S4kg3YC1Tqz1h
         2KAkYXK5AGOm08dKw7elmKFWnYb4yjPGAH56eFNim8JwqGQ5ntVz/WzX5uFfzggvnkdu
         /tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747951464; x=1748556264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHnPs9hy3e44g+CeJ+TJwX+Ll6i5NcRIRCw8fze3SFw=;
        b=sq33SwTFP5pUmZIpdHGQNRk/KETJISyAkLyua2vwY4k2InvlDEsLJw6eqRujwg8nl1
         bdYFi7xCiOrzWiMvOxtHe3iHs8hVFaZJaDp/GvCxA1ijVCC/EtB3YVPW2OG8XJ6glgdE
         L05deNJu/+s+WrNuRurK5n7m/lWh+eh7EM5s3/8ztJhToLTrk0OkvUR0rUx2ZFRFT/S4
         c/u115ij3Ji1ItHXMu5mZcHkezlWP0Jfj2GA2UJfTpaQEe2nMlFwRD+QZ7LVgMy3Bgls
         wlxVrpS8uab+dMb24AXTDjoI+u5A0HSWcLR+wXY4jejDEM36t67P8JYIzpR5VxvgpMe7
         +ASQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIxBUm9HONuzDstEYmF3F3QPVdiyyRooQ7IuO0k292OcAWtE7KevonHF7es3F9Nlii980fm1/5zMlFvU1E@vger.kernel.org, AJvYcCXko0fwO07iReNPxu+snWyQgfS0PjzJyHJRG2M18N5X1G3XYBd1lCSuf88ta5zCsTdH16/T+8CVzfcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlHxlKS9JTJ8gnCjwCPy/BZf5SgFDmUFUnmwCJnhQfIBc8eBe
	eSltxc+IjUHbaaGNAtl0Z6M6M/PerWt5KHXp6Y3GeyGgKKC831g1BhTGhtmIPlwocQ7SjbxkIeD
	NXRV5yo+TlEKRRhSfOvUrSUNuGLceyWulCgOw
X-Gm-Gg: ASbGncs9SMHudymZoqYlAomXXbbbKbKjvSMYfI+oU8rkgUgnkkef4vJhGCk1uKTOpCM
	OgmdAl3RjZ/EKAU8EHoxPIBAkXt+VaAPb3en3LGYBdKZHVsJPXCG2y0YYp4bTPaKV8Rils4JsLj
	EUnYLWrgN8DR/qK2gnfJbb2vXno4e7hsX7yg==
X-Google-Smtp-Source: AGHT+IG+lf+FV0w/ypnpr9NzfKFBXPNd/VtRW5d5hBBV8+wCc1uF/AhQyBHaurOVyu356cA1+wCyILFc2HB/51laGdU=
X-Received: by 2002:a05:6512:10c1:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-55216e0cd3emr133075e87.13.1747951463535; Thu, 22 May 2025
 15:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v1-1-d6b1a3776ef5@gmail.com> <805d0d65-9391-463f-9cbc-bca8dcbd5aa3@kernel.org>
In-Reply-To: <805d0d65-9391-463f-9cbc-bca8dcbd5aa3@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 22 May 2025 17:04:10 -0500
X-Gm-Features: AX0GCFsgNwY4FJPLEf1bVBOPn23xxtjRUexAiyoCUDSyYG3r0uiA8MGL4OdgjwM
Message-ID: <CALHNRZ9Hkz3_yJZmzJJR9jaJdYpxO2FddrXG_V1GZMLp=jGCuQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: palmas: Allow building as a module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 12:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 22/05/2025 17:52, Aaron Kling wrote:
> > The driver works fine as a module, so allowing building as such. This
> > drops the driver specific init in favor of the module macro which does
> > the same, plus handling exit.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpio/Kconfig       |  2 +-
> >  drivers/gpio/gpio-palmas.c | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..be5d823516d0e2bff4b4231=
dac6a82bf10887118 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1464,7 +1464,7 @@ config GPIO_MAX77650
> >         These chips have a single pin that can be configured as GPIO.
> >
> >  config GPIO_PALMAS
> > -     bool "TI PALMAS series PMICs GPIO"
> > +     tristate "TI PALMAS series PMICs GPIO"
> >       depends on MFD_PALMAS
> >       help
> >         Select this option to enable GPIO driver for the TI PALMAS
> > diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
> > index 28dba7048509a3ef9c7972c1be53ea30adddabb0..c70782be502b2719bb30cf3=
e40065c89ecec3cc2 100644
> > --- a/drivers/gpio/gpio-palmas.c
> > +++ b/drivers/gpio/gpio-palmas.c
> > @@ -191,9 +191,9 @@ static struct platform_driver palmas_gpio_driver =
=3D {
> >       .driver.of_match_table =3D of_palmas_gpio_match,
> >       .probe          =3D palmas_gpio_probe,
> >  };
> > +module_platform_driver(palmas_gpio_driver);
> >
> > -static int __init palmas_gpio_init(void)
> > -{
> > -     return platform_driver_register(&palmas_gpio_driver);
> > -}
> > -subsys_initcall(palmas_gpio_init);
> > +MODULE_ALIAS("platform:palmas_gpio");
>
>
> Drop. You miss proper MODULE_DEVICE_TABLE instead. You should not need
> MODULE_ALIAS() in normal cases. If you need it, usually it means your
> device ID table is wrong (e.g. misses either entries or
> MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute for
> incomplete ID table.

I just copied from the other drivers for this mfd, like clk-palmas,
palmas-regulator, etc. I don't know if there's a reason these others
have aliases or not, but they all have it. I'll update this patch per
the suggestions and send a v2.

Aaron

