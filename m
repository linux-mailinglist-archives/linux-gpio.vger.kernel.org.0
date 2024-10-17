Return-Path: <linux-gpio+bounces-11555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA19A2556
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97118285740
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA821DE4D4;
	Thu, 17 Oct 2024 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PTcsCFaS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8A61DE3CB
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176208; cv=none; b=ruyIaUyjtQjjDRFQzyLJsdjINYyjA7r1DcPcFZptrIKuiufZXQyYqWrXtcY41vrWUQobIaF0CNTU5ZxqcTRCrW1DUTd93rA19EGBQ5xOZDJXt6jvGTXm+o9FgBwzHtWfCVIU02qWnltdTqg0spDVmNCO988dNpCtokAHB2VjOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176208; c=relaxed/simple;
	bh=UjBFYKe60ecOXdv/EykcvXPrGJPVLEqALNLtsIb1yDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDdD+AnjmYrLvRGYeYgBI8/eem5CYvPB+d2c2WA5zljL5gkdcgRDMq4YRAzUeXDqXT45AajnEP6NlE42emuzchdLBJ2esC8NxaSvFiP6Cdlrrip3H/eKEAn50Mw03FUVrgEFiqnmu55mP6iyAcBxwwt/KJfjIl5hpHs28q8jH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PTcsCFaS; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso16599581fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729176201; x=1729781001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlFEzHaazLnpmF9YqMx0KYtmHI6sgbTNFiorl3kdp7s=;
        b=PTcsCFaSGo+wRAy3ny+EjVjVfWGYSa5vuuWjsOc0VnPB6xdzTxx5PMRWvcs11Bpcgl
         OE1SezJHTr02NX2cChV9NTmraulSbXoVPhXBvHPXmdfo3qxgS969yUXRQoTnOkyKuigO
         JpvbiopYV8crez5ft9PbAydckLhYYsHzfeaeDygbAQHlWoZ9B/KefY2Sxt2PdUp0YR2z
         FoVwhp8uHvpuRzjKNlMqLEt5V2veQenSnVm/gkoM81i/s2GuqZfptI7ja/5It2aO0imz
         mszFouQ7wVQBObfkiytvysdt490X5fcxZihaairbguFnSdmjrQA6Z3JKaTR6EFVIBx5O
         IZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176201; x=1729781001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlFEzHaazLnpmF9YqMx0KYtmHI6sgbTNFiorl3kdp7s=;
        b=UnMyNPNSBKAjri1uNZ1sFN+MuFWAImxIIpsfBn52Ey5K7s33FXrfjLYsSo7Dv1qpFX
         e3ZMbpMweZv+zKjEqFrFl/wKS3LKFD97R1UOVBXOEfiDwo0E8Ij/GkxgJRKQk0fOXG4m
         TXCzADjQACSGzlDOr28WPYE+854iss49qTIGiDTWKK6U8Y7ah/iYZLHIEGu68aSDOt9n
         apak12MucnVozhlcHrSP3s3I4jZSiFJ9niA3NOlVwtT3N/6UEbTiTDu40E3Kn2wEFuRk
         Uy2AX3JqkTzZlNMcg3Rcx2A98RA88LALKPwguS6ffmXOgFtyf82mzcHLdsMDtBIaSYQw
         0l2w==
X-Forwarded-Encrypted: i=1; AJvYcCXJs9cmRf/fFyjUV7cRktiGI1vX4VDneuwvtKtzKRCJJ526Pd3eOvJW3OFQ3tEU8o+DGr2rQS9T4dOu@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMtHTp/zf2Nd9HOR9E2BqRs4QaWsSh8Qo/Fx0/Ro/9l1fVP+u
	7tcE8lPuW4LQaWWKo6oJgYdFxtX2doffN42+AX9hmHozrKguYg89bZT74cNYcS2RgnLWF0FKEvQ
	Guy3nshXtkotAjn2J96EUnJ2KvxOQnjSvNy3CBA==
X-Google-Smtp-Source: AGHT+IFmNvFbz6qDkOnZvEFCx23p5SEWvvIyIIPpGOef8u5mkEu6REsm1UGa3oQmTEYp5G2voSMspTUWw/JZrRP36Zc=
X-Received: by 2002:a05:651c:1506:b0:2fb:62ad:89fa with SMTP id
 38308e7fff4ca-2fb62ad8e1dmr63534141fa.45.1729176201033; Thu, 17 Oct 2024
 07:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-3-64bc05f3be0c@linaro.org>
 <20241017124418.GA221864@rigel> <CAMRc=Md=6WkwJRt7-7K0fTqOUMz3EzzOGLPbiq2SEw1+1Acc4A@mail.gmail.com>
 <20241017141605.GA242458@rigel>
In-Reply-To: <20241017141605.GA242458@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 16:43:09 +0200
Message-ID: <CAMRc=MfYZKPg5oF1bSZKzDPapRLhTLWyKPSxf2b6Du5zwTzz8A@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] gpio: cdev: go back to storing debounce period in
 the GPIO descriptor
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 4:16=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Oct 17, 2024 at 04:13:14PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 17, 2024 at 2:44=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Thu, Oct 17, 2024 at 10:14:11AM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > @@ -1047,7 +925,7 @@ static int debounce_setup(struct line *line, u=
nsigned int debounce_period_us)
> > > >       /* try hardware */
> > > >       ret =3D gpiod_set_debounce(line->desc, debounce_period_us);
> > > >       if (!ret) {
> > > > -             line_set_debounce_period(line, debounce_period_us);
> > > > +             WRITE_ONCE(line->desc->debounce_period_us, debounce_p=
eriod_us);
> > > >               return ret;
> > > >       }
> > >
> > > Not related to this change, but this check looks redundant to me - th=
e same
> > > is performed where debounce_setup() is called.
> > >
> > > Want a patch to remove it?
> > >
> > > Cheers,
> > > Kent.
> >
> > Sure! Can you rebase it on top of my series?
> >
>
> Will do - once patch 8 is sorted - so v5?

I will send it out tomorrow.

Bart

