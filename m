Return-Path: <linux-gpio+bounces-6655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A368D0073
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10FE61C222E6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9280B15E5CB;
	Mon, 27 May 2024 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IP1vhR5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8499015E5BE
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814327; cv=none; b=J3f7rUASM4jx4hPF3EtafCqQfVTXn609QCnsuA5cn4cP0VU8yFdb5jlAbjCcfC/z8D4f8jVTHuX6Mme7pQs1uYzqsnEIllj+ijNl99F8Gy6mvq5nrQJeV80+0A+dbl9XzyAn+dTKVnSo35FgOdIgGhVUztZQBl8tu6hzDgnuaxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814327; c=relaxed/simple;
	bh=btTWDEdQaxpuLigP/PuoUZBqtCJxF9/Q0co9xL4Zorw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEj/bnf+RNbl09gYeg3mOtx+nb2usLaIPBLEd0y8CzMOSqqE2cASWdSqKjCML7dzydOhlfddce/plveKdyLXE79+OXNqerK/DnajrCbrJ4yh1/8iIpdO2jDuUH9y4rM9Sh/Cfho/usKLx91O7X9QAXzQ7YFKlyeY70O8Dsx99Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IP1vhR5z; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e95a883101so39559871fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814324; x=1717419124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D91I2FpQG8vAJCP3dZ83IIYb4JQCMCB/rxPgCiE+16M=;
        b=IP1vhR5zSmfYkIfIwrJ5rzAyZZNC0z3gAyT18aGKdC0O48pM3gfH15ot05Tx6bExIt
         hJ8c1e3RVWQcVzFEY3pxGq5WXN7PbWpnYZO43VYBncef/pFXzg3riaFgSzyrVeDysbv7
         WAGkR8CfjTsa2z1gPi9HsMR3ILJJarV7cOi4q81WQFChQmjRD4/sv7dZO52L33Jy5+u3
         iY+7OPBG6H3WFIOohDzgRQNKUVfS9+GgQ+4N1J96N0QV2z9BTyqyTz9fL/dX/cJX5xiA
         sp5xV3RT2wH8KKJ76+YH007gaqvjb3EmB/B3BWVGMleBT5ZE81M+MWlY/dvyz+dBoPLE
         gn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814324; x=1717419124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D91I2FpQG8vAJCP3dZ83IIYb4JQCMCB/rxPgCiE+16M=;
        b=otxFODoBVkBunAdl+zFZC/wYUw3VR8khMs9hD2yrHlIJTmsPwGcNoHWd/D6l0t6xVQ
         3Zd97HK3MQrVh5v2t95UDWIOQokqQQJheO22EknFkZsbt+MNxlM3cIm1U14XNOCB0v34
         ose9+s7YuxwOzKEmN28FTG7urRRBYVr2vDjUA+H8SMLFcDg/fYI4kKpbi7Fi5S0XNqqR
         4X0mLDFXBZ/0tOBL76ofJrPo7csoP9is/XvALdem5P6xVgetwvvG3pjLfaciwfWxMWCQ
         L899H7ZQhn8rcPXlkZBvTZlo3P1qjCxPOsgsjPDB2aOv5f/Qq2x+UGgsFseJ97joD8EB
         Yx8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV86f0yGS+568xUP2I3bAsx1CYeEC/5PcklkFsrPfXT1VydCd0yVryYCEpvgjBX5vD0CuuB2QP2TMdCRvMIW8D7XvksCdhk+aTkzA==
X-Gm-Message-State: AOJu0Yw9N/RxK1ij1XEfZZwCEl7RMQWLGxRPaZHbOyuHohf4a/gBDW4z
	vCb16PrVQEEcRV2zbkkGS2E1MeTzL8lIn/hRmQhZGTvdYcee+20OgdFULJABVYv9P1q9/7EjRga
	J3ATyjyf2fKOCTth9rLVnOqleAa2n1bdIJsnKQajut/1nZoRs
X-Google-Smtp-Source: AGHT+IG0CD7hMmCh/uCkuoh5IbV7y0qURocQobADI/iYsIr+2lDGrLFLKlSkvAPE6ZX9c+Zc+prNC1Q4cYeBg7BACm0=
X-Received: by 2002:a05:651c:1992:b0:2df:b7cf:9607 with SMTP id
 38308e7fff4ca-2e95b0c6fb1mr82175041fa.22.1716814323632; Mon, 27 May 2024
 05:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org> <20240527124420.GA108041@rigel>
In-Reply-To: <20240527124420.GA108041@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:51:52 +0200
Message-ID: <CAMRc=Md5OF7+BM8gqTbu581cqbWZsWUNCS7T--Hu0Dwq-r5mfw@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 2:44=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > $@ does not break up quoted arguments which is what we want in all case=
s
> > in the bash test-suite. Use it instead of $*. While at it: prevent
> > globbing with double quotes but allow variable expansion.
> >
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  tools/gpio-tools-test.bash | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> > index abb2f5d..dde26b4 100755
> > --- a/tools/gpio-tools-test.bash
> > +++ b/tools/gpio-tools-test.bash
> > @@ -27,10 +27,10 @@ GPIOSIM_APP_NAME=3D"gpio-tools-test"
> >  MIN_KERNEL_VERSION=3D"5.17.4"
> >  MIN_SHUNIT_VERSION=3D"2.1.8"
> >
> > -# Run the command in $* and fail the test if the command succeeds.
> > +# Run the command in $@ and fail the test if the command succeeds.
> >  assert_fail() {
> > -     $* || return 0
> > -     fail " '$*': command did not fail as expected"
> > +     "$@" || return 0
> > +     fail " '$@': command did not fail as expected"
> >  }
> >
>
> Ironically, shellcheck doesn't like the '$@' in the fail string[1], so yo=
u
> should use $* there.
>
> It also doesn't like looping on find results in patch 4[2], though that
> is not related to your change, so leave it and I'll fix it later?
>

What does it want here? This looks correct to me? Should we do "$(find...)"=
?

Bart

> Cheers,
> Kent.
>
> [1] https://www.shellcheck.net/wiki/SC2145
> [2] https://www.shellcheck.net/wiki/SC2044

