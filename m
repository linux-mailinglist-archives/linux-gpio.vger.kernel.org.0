Return-Path: <linux-gpio+bounces-18367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296AA7DF37
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E7118885B0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACDE253B68;
	Mon,  7 Apr 2025 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qztqCVis"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F94252906
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032565; cv=none; b=XjyDsJOb7Fp+nWeUtNiNGt4CG4A4QmOVSZ9jxeMqPH2jCKQn2ej53pIdlvbJ+XLxPxLe0Xwbp54sTEZrKD+OejtBHvKJwgFbMtXveAkEAjfRl47KJbtiRJykYQFFspYKhAb0wWJkuUjy7aw23t4u5NZrbCwNiv656v1SGXnQ51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032565; c=relaxed/simple;
	bh=9mpTOzXTtZhzgDxpHjaUQndjrrlV6hkModuaRIwNpNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kizaw22P4hP9vAJk37U2mW7/aVwNxoniL9xL6PUho5DRlK1E7nAFzUN5E1nvdcC6np5moyeaTonYeeELx7p3wFNtuqrM8DdDIKxUjCrzqhuNiZGDWjUWXyLFP5quda6I9Kl1YOLfGaZ3lYtSy4wgB/qvAjQqj7LZeT4FpQyRtu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qztqCVis; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so3181892a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744032563; x=1744637363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ajHSN1cCUijZc9GsoTHrD7erAp1SQSZtWGXja5UGiA=;
        b=qztqCVisOQhHbCc8xZdLGM27sdlkMsPYf4UVUd0Q+xXIOITqcS7Xpl1uvaIRkUKO+r
         /34jaCdeGQFALLZRg7TTcGmhSRCzDZiS5oIMAfgLPqRAux4+qDFygCYTCFJ5MYGFUaCO
         FhlRfmiz9enHnhw1MSSjBUU+xjiydOQ6gKb1lDNa611mLjNNI02MmnoOsG816sZ0TyHo
         GfjGV8/zRu0MFy5U3Dwy0WnbzFmACYMaaP4vZP+sjD4XeRFVOzOZW1s/7WVujJp5MuiE
         VGI6yo9kwwHPS7g6h0VCRB1UTE0yd8eH7T8GpQyEFrNMgAoccLhn60+F55RHa52YrFot
         XVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032563; x=1744637363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ajHSN1cCUijZc9GsoTHrD7erAp1SQSZtWGXja5UGiA=;
        b=FOYgcuuNFVEfUxXTZARiBqEYQVDsR71hd5y3ctITSp0BsTdtWm5orK44PE2XwYVH31
         77ad7Na3EcgZW79YKtmlXPCspjCfcP864fM7IQrfNZixXjZljUQ5ECb7X8ZZ3vaq7o6D
         WlxvvQ1KBta0P+mUWfTzz1A1tr8yWw5E9BWTJOJ70xBla1ZA1umHIMdtrMNZZauqCoDh
         +1FEM1d3oFXWUcmz+WGiNJZLGQ9sJ/QMU7mPCgEyVX51ypR5zEtZwV9W36yNGNO77pRs
         XKiHKf/l1gMasO/yKym1bC4Lotqy5BLVDT44TZjGE+W19ivERYvzrR7z/T8BpntDtsaF
         I3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMziEQoAUf+6GcAqUTzuHHC6ACLJb+PJgj73y7i9cPypDuLb1DtCDgAE1/XRy3+kqvmH2B+Q4nq4y0@vger.kernel.org
X-Gm-Message-State: AOJu0YxFwiorKsvgxj4KN+migIb/ukpgZzXRFWweQcKq9AEPJuQAgVXU
	XBmDHFvCrgCPVoLCubefe3CzAQJVaID6+0LKe+18bQHxesOseP18o/K4w4/JfrK+p4vq3wbL6VO
	6yGa9tly7uGuEGZv2+Mifl+Ryyz5JxkME7lVc3g==
X-Gm-Gg: ASbGncs/T32rgRviHavSUfcOWL4eE8iytY+PWZzkRPxZMz/pyrlc2ZnxR2euHHfNjgk
	a5iBFDBrF4Am+WVX3QC3u/z9VX1DiRDN3qr3/8ZIXcy5uRr27XK3siKhoH8CAZI+6QOMPnhdvZ7
	w5rT4xfcPA+p4uv+smP1znknD3CWmiL7bbpFt/x9YAqsqOhanEZbPXzCjoHCbdLm4Ha4Gx
X-Google-Smtp-Source: AGHT+IGKqFC5LHX0jTabWx+okI10tLsLEWz7jJM0RCoVhL8tSdu9r04tB7T2j1t5Drqrr9abQp3S+efjjieviBgTso8=
X-Received: by 2002:a17:90b:5251:b0:2ee:aa28:79aa with SMTP id
 98e67ed59e1d1-306a4821d7dmr17576304a91.6.1744032563009; Mon, 07 Apr 2025
 06:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk> <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
 <c16d3116-256d-470d-96dd-7f3dbe3334c3@sirena.org.uk>
In-Reply-To: <c16d3116-256d-470d-96dd-7f3dbe3334c3@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 15:29:09 +0200
X-Gm-Features: ATxdqUE1lakRv6EOuCGarXSPzi9CAEc3IM8tN_Opel4nS3X41aAEE-pBaohpZLg
Message-ID: <CAMRc=MeYcgje7dFq8WDiTB8mTQ1COv3a_6xhAGkTukD_V25Wgw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 3:24=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Apr 07, 2025 at 03:15:13PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 2, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > > I believe pwrseq could actually be used to hide the enable counting
> > > > for GPIOs behind a faux GPIO chip and the consumer would never see =
a
> > > > pwrseq handle - they would instead use GPIO consumer interfaces and
> > > > we'd have to agree on what logic would we put behind gpiod_set_valu=
e()
> > > > (should it effectively work as gpiod_enable() meaning: value is 1 a=
s
> > > > long as at least one user sets it to 1?) and
> > > > gpiod_direction_input()/output() (same thing: highest priority is
> > > > gpiod_direction_output(HIGH) and as long as at least one user sets =
it
> > > > as such, we keep it).
>
> > > Like I say that doesn't do the right thing since other users need to =
be
> > > able to see when something changes on the GPIO.  If that just happens=
 on
> > > normal gpiolib then that complicates usage for the default case since
> > > they now have to worry about things not actually happening when
> > > requested which doesn't seem ideal.
>
> > If I understand correctly, regulator_ena_gpio_ctrl()[1] changes the
> > GPIO value (even if it's shared) and then notifies regulator consumers
> > about a DISABLE event. Now if we'd be implicitly sharing the GPIO with
> > an enable-counter, we could possibly emit an event that's a
> > false-positive?
>
> Yes (or vice versa for enable).  If the device thinks power got pulled
> when it didn't it might get confused about what the hardware is doing.

Sure, that's the example I was going for, maybe my wording isn't clear.

Basically: we may set the GPIO to 1 but it was already enabled and we
tell consumers the regulator was just enabled when it wasn't OR we set
the GPIO to 0 and tell consumers the regulator was disabled when there
are still users of this GPIO so it's not true either.

AFAICT, it's used in a few places to put the regulator consumer in
reset if the power was *actually* disabled.

I'll think about how that could be improved.

Bartosz

