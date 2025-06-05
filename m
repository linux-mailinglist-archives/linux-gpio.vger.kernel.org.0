Return-Path: <linux-gpio+bounces-21046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C0ACF01A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1713A6042
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822FC225405;
	Thu,  5 Jun 2025 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WqCsjrL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10C51E5B95
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129409; cv=none; b=Sma1a1uq3vRQZGeogCsuXi90bT2XmDlVH4qAkTBphrJrw3thsmrI88Rmn3TyBDfQnXS6SuZs3HWn9fndjUJ5pvNu3olq8IrekDKP5VUhNzAKAd3GyqIuQojtdqfVutfFDjMrySZSNiCK8fZDRGOg/uNxot3wfIjZQgO0jyVBgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129409; c=relaxed/simple;
	bh=k0Hbyy3QvPmBEmGfE+iw2klZZIGcUzF4JX5g7Ivo23Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZorkJCX/W/vjqhuLrcbOhSuVkJwd64Fie3sDgqvkw3JW++GifW3hUgmANkOIdevslQXS3MhYwN+qQTRLshXEaNCLpr6IznWcG8ZzFSUDZP9JFIp7dzIQD358Dk0qRtBJhTJ2VnQQKMhTHzGOLtyagvnxUEbWr1Wg6bSTZ//sTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WqCsjrL/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1278759e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749129406; x=1749734206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
        b=WqCsjrL/PINi7XA3g9VTu//V5gowv4RCHLjliivBp/UCZElsxBvTrQDRoE4oFskZqG
         Fsclrv6k6VUHvlmLszGfItAYZq9/r/cjuu0FGKnjvKmTc07epoAa8R0qzxPObcnZrRbd
         d1tKwphqo32XgMBhlSnMBlRYQ0ouQeP3aL0OzNdeHGZKj7tK6/Zbnw/5YNaFxNl5Lz8M
         j5kXfgruW2JIWl35alN4saTsSds8ipV/p31Iru8w0gQPm4eQifeYaz1pFjujn7LVvP34
         aVn0ZXJFEiTtmILWKSH7sRKbyRuDvENHy6Rj453IKWtjnxZaWcJD8Jq4bOU9OuLpjib+
         9lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129406; x=1749734206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
        b=BxMn4jGHAyAPjhU4B63TE5oI6M6QTOMxQ5Jy25t+11S3OadSWROJLaHbswUY/J8RV5
         kUZVRB0xSaW6HlP3diV9DY/NUzCn7CP3pGlW9sEw9G9hPenOize3HTPot5NDM+oVvVL8
         QBN+UqwzXuIiwx6vTe0DFldvDmm85EQjVlMaqY9Vi644iT5/jGXk8KQXrOSYyw1QAjza
         i7Zcmpjq+fwnIv2CE+diRh1eJSnbWUO+2cE/Jdck4ou5PV1A/KukZhr2nWu5msx/MTo5
         94NQW/UY9j9a6885qItMfESny/pa4i4ZEotHq6Qsi9dxeHhrmpKO9JO7CZ23CxoPR3Z1
         KcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwS1SglbAZfTXCL8zB1CXmTLC0AOXu3SS/Xs9alvMctEP2YRuFfDkU4AL8ogTTyQjXXASN0XB1zEEm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+EMPzwvymWvWZfFGJ5NmGqa5VxAR5G1r8YysesvAY6uv6Zq5w
	r5CovNGiZrepA7PqMJ6LBKr2asjHJ9BLV/ZSTW9t/jPwYxfZAmEDhsEbqLZQm4CEcwJKgN/TpFL
	oTslPsihNGltcKpNu9y8MbJ1CpeCunyY+58d0ybXONw==
X-Gm-Gg: ASbGncs3FkBdyMQemSr9AUTrAl3Z4Vqf9XU8dbIFlgSdX4m5ooYtccXHPyLMisB8N6e
	uCRXIFdi7hlXUfrjjzq4iw2/YkG/fL36mBNU8WGgOvpWdJBmuh5doknX/rl7KCS2fbyFQDhmhKL
	wOb4Fk01kYiHzc9UT1bN9OPnvmZSFsA1g3gYNZ/8CdLuJ6yX5lxeOTe0xbwmNx21Y=
X-Google-Smtp-Source: AGHT+IG1FLIfsa6ezMp3MccDVHC5XAJOHj0QyInfJVqCTEun1SDxwdcWFvKFJCuA2PNkGlpvqJmb88wRcDaLGqLLsh0=
X-Received: by 2002:a05:6512:10ce:b0:553:37e7:867c with SMTP id
 2adb3069b0e04-55356df2a9emr2071437e87.50.1749129405586; Thu, 05 Jun 2025
 06:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 15:16:34 +0200
X-Gm-Features: AX0GCFt62eNdDo8nSZ5fnuh_lgkPFAVa1oZqnviWb6rgA9ggBUhsLTEWXYkHUBU
Message-ID: <CAMRc=Mddp=rmogziQ2XrzsO-TiRh9A5U3v8UxJqz_so1otPMLw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:04=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
> <clement.legoffic@foss.st.com> wrote:
>
> > Cl=C3=A9ment Le Goffic (9):
> >       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
> >       dt-bindings: pinctrl: stm32: Introduce HDP
> >       pinctrl: stm32: Introduce HDP driver
> >       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
>
> Can I apply the driver and bindings patches 1-4 separately
> from the rest of the series?
>
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
> >       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pin=
ctrl node
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2=
 board
>
> Or does it need to be merged along with these?
>

Would you mind me taking patch 1/9 through the GPIO tree as I'll have
some gpio-mmio rework going on next cycle? I will then send you an
immutable tag to pull.

Bartosz

