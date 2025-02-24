Return-Path: <linux-gpio+bounces-16519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F0A42D1D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 20:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EEC0188B524
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 19:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8402063D8;
	Mon, 24 Feb 2025 19:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PEzFkShE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455AC70838
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740426941; cv=none; b=lPbb8zVI6NhXkF3IiNl8P9PmEmUFGrwgdFQP6PO3En/jSijhGTY2Hg28wKYbuXIp49oQ90jzC6BgohjxJwpnEuP4g1ev4GHt64O+Ei89fXpD0aY2WCQWrIXNxaO86fPPuBWOvomTSV56OLjvgX/yYhD50WdEQkf7KVIa6JaVdAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740426941; c=relaxed/simple;
	bh=a3tYcvyfjcjX2bkAZi2UN8xxGzuMy345oEEohUHtRmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DASBHZb94wJm8Ewfu/60c8V0ZHTIjwK7DP4cSfbc/G0bQ9qpQSnEfDkgsOQgQ4hdnjMuAplrq8oVzUrRQPsUWOzBMfK4w262k1oStq8n2q+dWODfAv/+wuBcHbILEl7EsQxIqN81U2phKEXtCpOhkMvsjd+7vkIvZMYfa7lxwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PEzFkShE; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54298ec925bso6912507e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 11:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740426937; x=1741031737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noL6pe1CTXApYXoqvddRN+rJwafGoHXHcCwbvEcDCmg=;
        b=PEzFkShEkecG3Xn0P6YC2XgYS7US5pJJjKvo6GFfeBOp038UpA4ntlqPoA3j7iFHyR
         zzLt9ZLcKJLtQonFepF7NIFesxeoNSpLgMztBa+VOTXamtV/QJlxrMlGw2lZobxjC7Tg
         kmCRgIV5jdorNOMX2YLAPa/fxLBRVDXbreIvtAcv463yRKQ4wCeXXZo9sQMgwvRAHtEs
         FDeRWx9fMGj3TR0XCUQ+E/pcuyaMpQ0lECwbwb4ocAo1aCAvfUPFCGYC9H1heVSlv1kg
         azhEQQW2QFm6qQ0fWejvr3gX8ag4EbMJtSYLO5ksZ2RTjaa9klwMgPKS500vj349lU4a
         GS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740426937; x=1741031737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noL6pe1CTXApYXoqvddRN+rJwafGoHXHcCwbvEcDCmg=;
        b=auXTS6lIge9imA7ZlLZ//wYimxguBzka8QGS0f2UBCW03F0KJJXblz6jZRnBx/pzLc
         jZrqGcaCR6pt+QW43o/kgWaL26Ey+H1XHhXm1kK6KOevHVy2lTPwetvyG9Un6swvQTLN
         lcEXkg0YRosEeUB4keEGXomemMzBkLZGuE+qu10WT8JsORQU3I0v1ZOqTMFEnuYQsb6W
         Lh9N1SAHMkVISp6GdA9LfZZmYK8nVCKTLqS522yL30Xaql/TTEGFc+7jBfVzaIwI70j5
         EXbu9Rveg0Ld/RvCMVO5/dyqw+m+SKdMN+2PPF5Q9C4qXGXVJ4ruOw7VyR76HVLduWHd
         eyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUrOJplSOK6RWBwgPIUjZB5sEAzBUZzsNRceSgOlArZbri70WXpLNyivWdKec4Opgn5mn9SbnGbMLRE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxdn137UqtUdpONT6CaJb3ssovl6nfG1b00AYgofT6p1PNDpLb
	L5gcR+S+x93zpMMqQC3jHFnohtvaIAwIMC/f1Lw2f7YKDjfaqBojkPuD8xyih34Fd/pcBC+xHN6
	fdisR9mntiZTPfgiuG0N35UOT8mkpy8ZTXIBuzQ==
X-Gm-Gg: ASbGncv42heteKWmK0sxslQyDagVJ7I9lDRZcXRGx9hx97pReShANTIDdUTTXsWVU1e
	ymwY6bT0KG4EQg9wj2bPgdHJYGCOIT9FwFTMtkhdCmlXHUTOkILKtSCs0zpk1aISWwrs+cDJIOk
	8Xu/pFh2Fwj2dbWoch3pzEl7LgjfI/BrM3WMfdxQ==
X-Google-Smtp-Source: AGHT+IEdoth87C9pXjS6cljcsGr8chgpHWMEQoQgMWVHFA/xI9zBtbKzgIyfz3TeqYR49asb5m14SZMtTvAMeCCql3A=
X-Received: by 2002:a05:6512:3f17:b0:545:a1a:556b with SMTP id
 2adb3069b0e04-54838d3e458mr5466845e87.0.1740426937204; Mon, 24 Feb 2025
 11:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org> <Z7yfTggRrk3K6srs@black.fi.intel.com>
In-Reply-To: <Z7yfTggRrk3K6srs@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 24 Feb 2025 20:55:26 +0100
X-Gm-Features: AWEUYZlJt7OmCFrq9OUSasQvObhDFFCwRBTSz2T8Jx8X8FsGB71Wdcw12FbMEVg
Message-ID: <CAMRc=Md-bMUEKgF7srLFqwdetDcTDB-0YzrisccQmReDs-Ndvg@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpiolib: sanitize the return value of gpio_chip::get_direction()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 5:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Feb 10, 2025 at 11:52:02AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As per the API contract, the get_direction() callback can only
> > return 0, 1 or a negative error number. Add a wrapper around the callba=
ck
> > calls that filters out anything else.
>
> ...
>
> > +static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int o=
ffset)
> > +{
> > +     int ret;
> > +
> > +     lockdep_assert_held(&gc->gpiodev->srcu);
> > +
> > +     if (WARN_ON(!gc->get_direction))
> > +             return -EOPNOTSUPP;
> > +
> > +     ret =3D gc->get_direction(gc, offset);
> > +     if (ret > 1)
>
> Would it be better to use the respective GPIO*... macro instead of 1?
>

I did consider it but I don't like comparing against enums, it doesn't
feel right as the value behind the name can change. I think I prefer
it like this even if it's not the best solution either. Maybe we could
be more explicit and say:

    if (!(ret =3D=3D IN || ret =3D=3D OUT || ret < 0)

?

Bart

