Return-Path: <linux-gpio+bounces-16612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C2A45B8D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94F6E189A074
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A872135DA;
	Wed, 26 Feb 2025 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utWFaXvL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF85420E302
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565150; cv=none; b=FQwZKPkRBChzmZ9KxZw4c2USojgxUZHMTHCX8YLvMOVqvlctwel0TMJSKdOF9AtCZaVhiDvEEjjZeEitCfhKcvfuW2WQVvIIAxlWrfRSBElnmZZAQDAnacvxnNIFVnVsZfAND20X8Ztr2+GTMw8HECMyN5dsTB0JPZK2/i7kD48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565150; c=relaxed/simple;
	bh=DKJPAUCWpMarL6wTRvPVlA7VYpvvjyB6zrJZ3/cdENU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nr729N7cLwCzGXzJCOu1bf/CRNd3Cf1eOamXSwrdFT7DmBueSCGSKpL/GsvLnYjUWcHci6s6pAQOeEJ++6rN0fS0qqhcl+cXh/up1eshLTw65V9d/T4hOQ7dzxBf/RlZD7msNusY5Rk6COJ4psMp8gEA6IdNDLmBZuW1xxnnNcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utWFaXvL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54622e97753so753917e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740565147; x=1741169947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKJPAUCWpMarL6wTRvPVlA7VYpvvjyB6zrJZ3/cdENU=;
        b=utWFaXvLMnJxUSS5zmFp1zMLVLctrM8Cbe1nzLsNRGWhBJoACvjkquhXJBV+3rkJHW
         rtzapm8lDzWTq2lmp8rNzk3Qe5NkHrMHC+9kYftMvfzDHusMfhnav9JyRMz2jICebb6h
         O+iepKZpSvAXjmf+f3NkFWoeWhdxTqj0UbgvPDJeCpz0owP78ivQsQfzf543q32lZbDW
         RXH9PCQBklsOO2OJpTx9AU1u8Gx3KLm9AuyriTecz7/PX4IJ9UQEnp+0YLTrltNZqght
         DoAWSdnmQLnxe3fPn2vTM8vXJkx5FBbWNXmn3kOVz8bSybKyXhO7iq5xMiRpCiRscy9Z
         wWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565147; x=1741169947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKJPAUCWpMarL6wTRvPVlA7VYpvvjyB6zrJZ3/cdENU=;
        b=UQ6ujJoo+zkZrQEUoizubGyIhcjIeRpAuxpx4zl5CQepnKwTO2zN4t7uhlgKzgph85
         bjcLjSGqkVYGvvEi0354k9Yg2ivSmEGev4aTo2oLAE590jTilDTfbCh9gozPrCn/MXSM
         fLT8d5ALRCFu1yRKUWwQO2LmY7DSuMjdsj+KLIlxdvbTXBjR5Sf6VUFWHqIZK5cBHuyz
         8fvElG0eiDNAq6NW2LhDsUBi0Qw85y49RC4W1jxvqixY0xaEH7jHzzM/UT2QvSrbO/gv
         BA84b0Y+o2WO2wg/W77yWqy4x7N8JekF647pE5xteVcRYr7MTIr9uLO90xbOqHk8aGoK
         OB+A==
X-Forwarded-Encrypted: i=1; AJvYcCWqLj1Oou+HraVjdOojY1cszQIgTr4rhAxba/pbz8gqevXvuqhukmJ0BFmpxgfkp2q651IuUGDdlxYg@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/4MDvws/bSHuR6W6yb2C2etkbqHYzf1t/p+Dohu3tCcz3o7V
	ZBegklK6rowNPfwqXv57BNuZDpxjoa4qQjSmJZ/dQyJQ/XEa+olN4KxDaYNyNNpgNU5/d2/gHG2
	2hF1bKRuqCT9T1fF8GOhYo/qwfgestidCQhqNb52Hc+QqvG7I
X-Gm-Gg: ASbGncuo3JaUBouY+G3qQjSKxjguazLbMF4mKNcgqZqEUkdK5b3u8t3nvnTho/P777B
	4DnQ3CiBFnxS8zbtg4IqnNdo8Rc+IZ7bXx/413K9QfbPoDEHKm10z4MVxtNHnOgpRtPEI058Bew
	v/hoyKdsc=
X-Google-Smtp-Source: AGHT+IH9IyLn8GVoExU+oQLlxh7oTefH69fzA03PH2aYFHwj0v/wUocnCBinUIb/4NLpBPrOJ0p2aprs1CvgBYqqRcA=
X-Received: by 2002:a05:6512:308f:b0:546:1d8c:60f1 with SMTP id
 2adb3069b0e04-546e4662ce7mr11792066e87.15.1740565146777; Wed, 26 Feb 2025
 02:19:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z71qphikHPGB0Yuv@mva-rohm> <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
In-Reply-To: <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2025 11:18:54 +0100
X-Gm-Features: AQ5f1Jp5WtBrqIoIAmiHI68a90umMToYtMRHUCvv-S3W-GZVg3ZNkYQ-qANM-U8
Message-ID: <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 7:09=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On 25/02/2025 23:36, Linus Walleij wrote:
> > we can maybe move it to struct gpio_device in
> > drivers/gpio/gpiolib.h?
> >
> > This struct exist for every gpio_chip but is entirely gpiolib-internal.
> >
> > Then it becomes impossible to do it wrong...
>
> True. I can try seeing what it'd require to do that. But ... If there
> are any drivers out there altering the valid_mask _after_ registering
> the driver to the gpio-core ... Then it may be a can of worms and I may
> just keep the lid closed :)

That's easy to check with some git grep valid_mask
and intuition. I think all calls actually changing the valid_mask
are in the init_valid_mask() callback as they should be.

> Furthermore, I was not 100% sure the valid_mask was not intended to be
> used directly by the drivers. I hoped you and Bart have an opinion on tha=
t.

Oh it was. First we just had .valid_mask and then it was
manipulated directly.

Then we introduced init_valid_mask() and all users switched over
to using that.

So evolution, not intelligent design...

Yours,
Linus Walleij

