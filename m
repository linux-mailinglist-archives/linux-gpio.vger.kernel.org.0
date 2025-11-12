Return-Path: <linux-gpio+bounces-28376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC7C510F7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 632504F341F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 08:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761F62F39CC;
	Wed, 12 Nov 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xDKk4dHE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8780C29B793
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934789; cv=none; b=VObsLcfKhs5rkJiocRyE0NOZMnIBRg5TPBXAMyOx57WiZJArYkGOGM+d7ea64jpEGoF71Nw6DUaEnbRpH/4WnQZ256UbhYLOJ7pheRD31cDdmBvmdJnAKekyyUiVhlBoKB+OMuIebr/9ld2wwqKOJlFbsLOViFUMYzR+GRjc5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934789; c=relaxed/simple;
	bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBHj50i+NrX9kcB/Ut3V0PXUCIP+6cd7T7BXqAIM6V/0NP/08Bp9xlLFaa3BaDG/Mk3sTG4kIUqPJ46tZ9v2yCGwRv2ixdtXaHgdXNQujmS2NFfLqw8iQBaBRdhas6/YBRGVJciDTXOL+EAik7lOiOp0eZQO4zqnIavsYkvSjGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xDKk4dHE; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5942bac322dso513675e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762934786; x=1763539586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
        b=xDKk4dHEe1YiZnUKxUz2ru/zaNKC8evp/f/YqNWi7rusRi1mfcv0LRunxxJoUfOmpI
         rGFuvyz8x20C+U02FpQHSPX0RxxbyuJWUuupKuuWy/F6OFsUY1qjQwOrMvXUGnp68Fan
         gMaOxY8N4kj+bRxxkTnQCRC6p8emi3Lgsf1lV0Rox1BBIIbr+5TOEjImrQbqwPyn7/4f
         15JYsZyhdDMBe1JGNhwgHHmwqgbfvKkN5PKoVMNku1MpoA6c51ITcA9JtRR1Ua7xTvoB
         ougtYVY2+tdxRtMfUZ+9MgunsHx3PFYBV/4MByM4hxmcRRQWKjbuSbW2gCe5QkXthoe2
         19Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762934786; x=1763539586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
        b=t2+IzTHkEcebaq8/cjkhTHGtGIh/7bjFl3UHG5gZn1CsxNqguS6Cq4t36ajph7eOHe
         cVumPRKVYZOHK+h29GXTGKhIKCUSp0bGx/m4yvwA6nSfS1ppmzn8oJpce3Sa8mXuEoxz
         H3pgRXnPae2eOobmHkuiJ+x5jQ5sIvaKt+RoUL6dgm05Fypd+m5AgsLbUKYYyN3XdV8J
         DU71lHsC+h3Wri4bYA+CIu+q3LrghMrRp8TeTb+bEda+oCXxWd7V+HKTLHJmPs49ok9R
         Ng2OeR4NgmWWYAulu6ZHdTsBdn+59VweCCPW8GqP+lzELmECWmf4Cwq2NF5QOM1fwtZD
         Zg7A==
X-Forwarded-Encrypted: i=1; AJvYcCUOLIPUqtYjS0XehJHfp1XrStoSQ346mHUrs7ECinVD/eqxLDcRfFIfI0k833E3LNHYRQYQXct7cTIZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3bfzXhXHhmPI29UR5Fm9sDX9LoVg+67mWA0zFzldfx9idPfs
	HHZvo8e7nMOzBa/oErX9vpgRSGCn0AESDlUgV1SFEf1uGbMaUiwuscvhqSP4D2FWbfOxBRpFBVB
	dygR9F5uE5b0obFNqKG6LdJcqjzKClEW9RcJ6U0F50Q==
X-Gm-Gg: ASbGncv3ICzj346ywpLo6CPNUvUN7jw6cPCKz0+ixR9K4bNPrDI6r3hU7afbrVBmKXM
	08FJDeiFhVo5z7hZsYVBxnuwfnLNqCwPXdObsh53BnLYKk5wIbec6/+662XXVBLQ4aoSZqLPavP
	vVs84M+/cwzpyZlUBHB3MR2qazvy/4C/u1MJIvvHhf0JxgDU34BnMI1CA/3R5ll27hGyAHkj2nk
	R/RZ+SlqpFy09ErR3RjCqJG11O2CN+0OmjkRvm1Q7iqEGQS1K0FodjXkhtRM3e85qmCMGtI5JJg
	Dsw2ylKYctr2vZs=
X-Google-Smtp-Source: AGHT+IFGOvlOzvk9piywId0UEm/LoEe92kaATxaPyyaUwvvWEVZS+cjBT7dXjw6jb/DtZt422ITz+COnEZi1kuHwxHY=
X-Received: by 2002:a05:6512:3e1a:b0:594:3039:2d16 with SMTP id
 2adb3069b0e04-59576e2ca55mr736184e87.32.1762934785669; Wed, 12 Nov 2025
 00:06:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org> <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
In-Reply-To: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 09:06:13 +0100
X-Gm-Features: AWmQ_bnmO8YFH80sSD6rPVFUgANGxGc1BYRZ0qoygt-PZMj9Pyi0gMYkuFaH7pA
Message-ID: <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 11:44=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Provide an interface allowing consumers to check if a GPIO descriptor
> > represents a GPIO that can potentially be shared by multiple consumers
> > at the same time. This is exposed to allow subsystems that already
> > work around the limitations of the current non-exclusive GPIO handling
> > in some ways, to gradually convert to relying on the new shared GPIO
> > feature of GPIOLIB.
> >
> > Extend the gpiolib-shared module to mark the GPIO shared proxy
> > descriptors with a flag checked by the new interface.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>

I think you wanted to leave this under v3?

Bart

