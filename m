Return-Path: <linux-gpio+bounces-21827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6AADF7B3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 22:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2A91778C2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 20:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAEC21C198;
	Wed, 18 Jun 2025 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UwLJ3Th3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E921B8F2
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278629; cv=none; b=i5MVWFWDYeUH4tVZIuqMnJmVLADCjZXMqyEtJKnFfpDI2m72a+xEKlYMJ/VzQmnsErPhnllmiZ19a8XqzY8rJM5W3E3mEwVqlgTosHej4bfGwyM5CvoVgaOfZV/8UoW/hy7UJcJj0Gvy7080iRh9/CH2WyIKECczgidUsK5Gx2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278629; c=relaxed/simple;
	bh=YLdoNDkIQTY/DyyxkoUYCZc4oqwMzTKWqm89SruIgbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHDpiAziCUlC7/z4dB1pcbVvG44KDEAybHWJv1EgTYORIkcYtpvwEn+JBGcSm/nrQ6ar1GFCvUGCbcjvRd9qpaqyGpOaronzhrCUcCKnxXYYDONgFgQYYoL5au+Phe/ouGHPQWtI8y9DtCHJg53vpg85qs+dqH4TI/cOHRxFB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UwLJ3Th3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-551efd86048so9915e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750278625; x=1750883425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLdoNDkIQTY/DyyxkoUYCZc4oqwMzTKWqm89SruIgbw=;
        b=UwLJ3Th3lN6wvc31nbG2/WMTM3kNq2Pnpf1n48KgnhehVES/ia8/LE2Fm9SBd1WeHI
         Ljd/GaQjjTtGbjTZGLA+1+hlKPeCb+n6MGI+myQ0m4G07g7V6nYQnXQqLblEmrGzXZVl
         jEN6WRzURSx1Mz8OjrEKP6dKtCH1n0UKSGSzhMGIxW0oN00Qmtsz1ItImV9DvqMA6DM6
         qOAeKZuSAXcpRUx2vqV/+n8b8pAjfDL/ZHI03FQQW8vEobvXO1Fh/CMAoRsL/QNG/mhE
         y0lkKZbczUH87CKp2ptX7O8KqvS0PTy2Snf2gj+4q1DTX+xzLNEjJfvMywkeC9a//bdC
         MHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278625; x=1750883425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLdoNDkIQTY/DyyxkoUYCZc4oqwMzTKWqm89SruIgbw=;
        b=NlRo/fVh88Zdry01UErFjdt2dDhDsJChvR1QuxjDTDKuZwAC1tPaqc0SvPpzwk42Ql
         yXz4TBBpsD5+C6JAmd90wKNofB0U7XZj3lcRP0hlErlr02NB8Ql6VvhDoT5RoAPSdNbK
         kIrDC6YrCKo0OwBblNg+ih4hKMd3ZpaXFAHlhJtu0Ql2z+XHiE/jouPNpEENrx2+z9vj
         4HTfebWuFnQYq3BHUUPEiMmep6MkOt2PmOm1bkAgUDz1u5iLNYg3m89y3tRC7evG+QTX
         0NPq6N+QdOtwfmZOORgMYjnWwbVVQPikrLJYVTr3i+3EjOQVNkrNp/qDo8ZneS2g1u7l
         0qqQ==
X-Gm-Message-State: AOJu0YxWacMpooNS7vjTPnb5kmmacqm4h8z2JpouciCWywR3eTjz3FJP
	e/21JikYoAZuQhIVC8aK/xlFtYvW9MAj/9cg8Tq9D7NS8Yj5tHJYm8+ghnNjzi4pcJKb7jEOilw
	lK59+jnCXLxe+naZQUwkLXaeNXaey9SyEt2Df2xhGwIjphEqxIhC4sxY=
X-Gm-Gg: ASbGncuTFeo06gkR3enWC5Rqp7reVXSuLA/mNs+tSYRG3qJrI8lQBsLShjdPDGv7brM
	fGUPXr+JxkO2beKMgAxQ0yK+Sd92mSnRjZc6Lm5pAE0ecqTccanq6bWuSQNq49VI9UuR7ePeOHL
	1OHtNu2FIbex/ZZ6RsXUsolVLlABT+MIEc2jRIXApN2K2MD/SKq8sQ9PWPLg9MNf/9aYtNu4Wii
	w==
X-Google-Smtp-Source: AGHT+IE3ya3l3Vyjds/CNEC+pdJ7PNfRktSY/oaPcwaVLIYdAk74hU9wOWTfzaAg/Th6ffhCwtiYM7BcbzGbnbKmAts=
X-Received: by 2002:a05:6512:b97:b0:553:6570:1999 with SMTP id
 2adb3069b0e04-553b6e8c0c3mr4673762e87.13.1750278624608; Wed, 18 Jun 2025
 13:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618124319.19220-1-kabel@kernel.org> <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
 <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv> <xov3tbnn7gcenyu4ud5vvdfmw6a67g276aws2clpfvk2l7jhbz@mj35nxxysw7y>
In-Reply-To: <xov3tbnn7gcenyu4ud5vvdfmw6a67g276aws2clpfvk2l7jhbz@mj35nxxysw7y>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 22:30:13 +0200
X-Gm-Features: AX0GCFs9cmSUmY_Jmx7ICPLWGPbm8lRu4wSMy3Pp9EIGyzkUoqAYScI7QeCF-ak
Message-ID: <CAMRc=MdrpRQyQ84PRAi_6QsEDFcpNU9G140xiEAYHob12UbCfQ@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 8:54=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> On Wed, Jun 18, 2025 at 08:47:33PM +0200, Marek Beh=C3=BAn wrote:
> > On Wed, Jun 18, 2025 at 03:20:15PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Jun 18, 2025 at 2:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kerne=
l.org> wrote:
> > > >
> > > > struct gpio_chip now has callbacks for setting line values that ret=
urn
> > > > an integer, allowing to indicate failures. Convert the driver to us=
ing
> > > > them.
> > > >
> > > > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > > > ---
> > >
> > > What's going on with this patch? I sent it a few days ago, now you
> > > just resent it without changes. Who should pick it up?
> >
> > I didn't see any patch for this driver, only for gpio-moxtet (for which
> > I sent R-b). Did I overlook it?
>
> OMG I see it now. Sorry.
>
> There is one difference, though. Your change makes omnia_gpio_set() retur=
n
> -EINVAL on a GPIO that does not support output direction. I put -ENOTSUPP
> there, since -ENOTSUPP is also returned by direction_input() and
> direction_output() methods in this case.
>
> I don't know if -EINVAL or -ENOTSUPP is more consistent, though. Feel fre=
e
> to apply your version (you can also add my R-b tag).
>
> Marek

I don't care that much, I can take this one but please leave an
official Acked-by in that case.

Bart

