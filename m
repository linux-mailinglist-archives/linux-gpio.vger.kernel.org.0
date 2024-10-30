Return-Path: <linux-gpio+bounces-12311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94089B6971
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDFF282C1F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 16:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D0621500A;
	Wed, 30 Oct 2024 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RzoXNKTI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE428F7
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306651; cv=none; b=PMjmQsY2ljFZnmHy0miQdfH/7huQerjJbCZHwfGtd40xoxugK+bBDlCInUK5akdgUtCG02pwWQLIPt/E+FcC/ZpnaiQ6IRTB4X7kLgor6R39xjHNZZiHW6S03pAcpWwV8K/SyLN46SAccQZR4YECd3/jL78K8juFPHd3tHWR7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306651; c=relaxed/simple;
	bh=WwWqx4o7XjhXX9R23m9CDYEIFUF9Qm6fI0Ek6MiyNm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAg2KCRBKWxZJWELxFPNSABS7W6QhzdL8y3LF7neSnBxKwpkTdq/HRh3zZemPuUfiYran0JZgv8kNua0nniwsgsEZfawmktxn/1XQCllWcy7gscJ+RnO2f/3YQCCMlghPlSVF1wGDUQ9IVf2QaWkIaJTZnSbQAEhUtWImUV+5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RzoXNKTI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a007743e7so42684e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730306647; x=1730911447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCtjX+ozVgiRdnmSFGTHSFQPiMY5pSNkOvyIgXNK6I0=;
        b=RzoXNKTI3JxKCPa27muOeU0iaLYAXCeevty8m8fSHWXIpYUPfLZyHIzu9szZzu1Q/w
         iHPkYnSJR/QkHwA1qBOEuYNh9pRTZmoXE0kR2Fku1EYI0S8Hvnax03XXVc2YAIxINaMK
         KsCo/srlAFD0UXdO+cKJmInld8oxUVroNw/ioepaxDXwZ9bK2KJLb7sWMCCHUFUuEATj
         UxIJdKX1dJI+YWSlPBI9EnXk22HWTtyoow8Y/e+RsFYhfuGI4HjZaEdr9X7j+W+P1UZe
         oGjZ/UqCqmcEOePVA+JDBjXpPulCc910XTOU9ByMtMGUnDzaSJorrB0Hs0lxI8qYiWyy
         dVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730306647; x=1730911447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCtjX+ozVgiRdnmSFGTHSFQPiMY5pSNkOvyIgXNK6I0=;
        b=BNtoT23SY2T8mj0hCaM2vTpYkdPIIR6+KzhmeXfDsf0kzZ6BbokrsL+z3MWre2G5Cd
         ukQlHxOTpy7G6lIZJrPhcy0U0cFdAgTlxyRnT6/dlPPQI2z6HB2U2Mn6BIvpgxiCPyBr
         tEQFXhD3mPz4/OnmVUfIPL5iYm3FohXyVbGbq+w0+EB0cPG386ckMM1PznNNxMQzwYEV
         phcqvIqd0l8C5muhktxD28BBRfvMmMTS5dCHQ51+7n61mA0foqUYcW5EW2AiTIYKNK9f
         peFoGepdKyaYClHuF0SzhAMt8t2+S1p9Cu+zmgK+J9YV8O3N0H8t8wTWOm0RfRpvD9Nx
         Hk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC5EFapNRDoA+/Ya2gWET19HlF7EE4o8J6Th5gPiHE8NGZw4JWZxVo4Kb/tmh92T/MA4R4wXfkUvY5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5Zf4gFqYqYVLFHmiYBc1z7BcUEY9NY1KabOAnllXRbPkl1X7
	yEHYwos+ySQlwaWnozfA2pzUV6kNpcRGF39n/9MZRy3jJStCdIum3i/lXSOZIe5MCuUOKI/VHSg
	lq6OnSXFyubbhVzqO8G+BavJa8e8ymHPveZjkbg==
X-Google-Smtp-Source: AGHT+IGo/ITkgJuG0uQfDtW5DgfpPBqnrV/BCb4sQ+oxUtEnQlE46DtCRhJKXJ2LG1BryoTFClZcZeVoViked7jsBEI=
X-Received: by 2002:a05:6512:2216:b0:539:f7c1:5feb with SMTP id
 2adb3069b0e04-53c79e8f0a1mr81987e87.39.1730306647227; Wed, 30 Oct 2024
 09:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <140b0f7522ff2f86a7fad0be88c19111fa6cb5b1.1730282507.git.geert+renesas@glider.be>
 <04040095-27c2-49a1-b956-ac7bbd5f919a@gaisler.com>
In-Reply-To: <04040095-27c2-49a1-b956-ac7bbd5f919a@gaisler.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Oct 2024 17:43:55 +0100
Message-ID: <CAMRc=MdAq3t7P_+SSCcZC3J02B5RuDQvUZjFXQbi4KViiK=-Pg@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_GRGPIO should depend on OF_GPIO
To: Andreas Larsson <andreas@gaisler.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 4:45=E2=80=AFPM Andreas Larsson <andreas@gaisler.co=
m> wrote:
>
> On 2024-10-30 11:03, Geert Uytterhoeven wrote:
> > While the Aeroflex Gaisler GRGPIO driver has no build-time dependency o=
n
> > gpiolib-of, it supports only DT-based configuration, and is used only o=
n
> > DT systems.  Hence re-add the dependency on OF_GPIO, to prevent asking
> > the user about this driver when configuring a kernel without DT support=
.
> >
> > Fixes: bc40668def384256 ("gpio: grgpio: drop Kconfig dependency on OF_G=
PIO")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpio/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 158ec0d7e52e2e51..a7b27a8541f572d5 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -341,6 +341,7 @@ config GPIO_GRANITERAPIDS
> >
> >  config GPIO_GRGPIO
> >       tristate "Aeroflex Gaisler GRGPIO support"
> > +     depends on OF_GPIO || COMPILE_TEST
> >       select GPIO_GENERIC
> >       select IRQ_DOMAIN
> >       help
>
> Or alternatively:
>
>         depends on OF || COMPILE_TEST
>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>
>
> Thanks,
> Andreas
>

Yes, if anything it should depend on CONFIG_OF but is this really an
issue if this shows up as an option in Kconfig? It's not a hard no
from my side and I have heard a similar comment from Torvalds already
but I really don't get it: do people go through all the make config
prompts on a daily basis instead of using some base config and doing
make olddefconfig or menuconfig at worst?

Bartosz

