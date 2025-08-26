Return-Path: <linux-gpio+bounces-24993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEA4B371D4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 19:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588703A0FE5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 17:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2C22D3A69;
	Tue, 26 Aug 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XLJp38fH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AED23AB95
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 17:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756231080; cv=none; b=Qik+n55UYiLAvwYA7e41lqHubJONKRsm0xjuynHumr3aK4OqM3BqWUkA1blUfwdbQDRRnUG7SETurJDPmZz/Dv+2MmwUh8wtBI2hTSDM4tVGDPDIRs4vq7y77H/+mNxyOail/HfDBtbJ0M6AF7HapNNxSJpjOGgAH95nSg0zonw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756231080; c=relaxed/simple;
	bh=Wz7IuQEieJ82ppZyNl9OwbGMLBADxreXpQ5ATGSSSSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JM7qxppCi4dTvfzvnjHZdM/DQF7m8ALTvO63aX9nWy/qkcEHqU2b30WQYq7wjZmZdUyu5MdrzVsIivxyWp4EQ+5yBcsm73tQt+JLxtAfph2EmDMZb+l470H5Nq8ULk+iU35YAvwZoCVV6b86DpYaimL7sMhqiM+oGIXu2IyufIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XLJp38fH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f3533fd05so4134024e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756231076; x=1756835876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0W/rNg9hKGxRH0cJX+JwxMCE4m7o2nGOfQgFSmK0jA=;
        b=XLJp38fH7zExfWHsNFsUXChfRRLYc/90owWqY5bjT7GKkHZnopDoGHe48KSsknhYle
         uAaXCH13hFgyOpucMAXIBh28xrlCOZboa/12Zdr9wswG0UDDkmC8OYVcEi3458Yiyveo
         ry4DYRr46mv+d3STCSoPDPoKIkIkNeenvTIcnlztoXqLhUAUY4es121IkCtF3s4llF0Y
         CgzZRJl2ic5eOLepkZmVD/b5MvmP8Nlg43wLab2ZYzgnMFiJnz8lF/sqXEjt2dgc0gWW
         4idttN3TMHB6aj3xB4N28nY2Jt/KGphup94Z9UGOPg6qLzVSQzvIzHNlwf/PFntaspzG
         jOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756231076; x=1756835876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0W/rNg9hKGxRH0cJX+JwxMCE4m7o2nGOfQgFSmK0jA=;
        b=idd475w9nfAyF7SlaQT02mcJeoXmt58WJ+GgZRId8IeZ38x46KpLzUc1GflJGb+v4Z
         XR6zTWOa2v6dvxcj7yvJscICQzKn0y7BQEqG4axSd4jbIRuPO59WwwwgPc1WD7+hNK4l
         EEkWOAS0JohZFMFrvkLAN2quClaAnhJDGOA6mMmcDEoKeXz87ZNywy3T+3+pithywGi3
         T1TPgcm3FQyxwryjvKc9meuEzkg1WbbG7KeAOgpZU5lJf35Q4uwjzi8Jy+3Wy4J2aeg8
         +Fft01BJ/9QIbaeH57sBMb/y+KQ39E+eegJW4VkBFF214oMkjF09I3ULoCg2BHQ9T3Kj
         miIw==
X-Forwarded-Encrypted: i=1; AJvYcCWifGWiCsuXsCMyA8dTDDpWxNEb3t9nzmWsg9QzU16YKzicOv/VzWLRmUaFfH3u8XFJy5GyJOvlV2Nf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+r8exl9Gsaz1S19MDoPZ2pSMyCY+hTtdWjVLC3o8YJp1Uxx3L
	ilQOlrEgz1ZEFUmav11wfCMcDOBY8MDQJse4op2PWUuZ26YQGpan/EMwh2FEWXDRL/Wopek7DFs
	4ooKJWtowieFZFcoCNdjLRPJrcfFfF1umgCmvXTpvcg==
X-Gm-Gg: ASbGnctaH/t96JASqPqnaW+UvVUjCGGNBtJky6EVILvAXjvLOBBX2Cj+Mc+LXwcZUNk
	pzyJYS4HRUTzkcb5oW/WYQwoo5utT0h0aepxBIJjScPDwuqEtuAYiaG+ZaopZqT4Vw2A88X+hP1
	M6mE9AxiLV36pp2QAIn4UiEm76KACCeCut628DF1eVnH5/dPmxb9qC9zVy5snAUERuQ6yDQJCDi
	DoiM91sfffuJ8QeFnYKStdLPWQmJlsqhB8U05K6YMg5wYd9SA==
X-Google-Smtp-Source: AGHT+IEVnH3FJFAyLvm6EQBQlV8iRR5jmBrZkysg2WSA/Gieb/NIrV224GvmDwbt/g+byP/9WYvwXGoEamgsnHxLlH4=
X-Received: by 2002:a05:6512:6285:b0:55f:4016:ad2b with SMTP id
 2adb3069b0e04-55f4016af4dmr2923464e87.30.1756231076006; Tue, 26 Aug 2025
 10:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB160390AB37F4D9216E5A7FA09F39A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB160390AB37F4D9216E5A7FA09F39A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 19:57:44 +0200
X-Gm-Features: Ac12FXyTSqLXnqjdWcGtxriA-6thy_BfxlSgHOwawLv8GeJ24u9-V2u0FdpkSeI
Message-ID: <CAMRc=McyDvuWA37ZXWUac2OZPa8Sgcbye7tRKh8gHVxzA7Ve-A@mail.gmail.com>
Subject: Re: [PATCH libgpiod] build: bump required GLib version for tests to 2.74
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 7:54=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> >
> > Oh and I forgot:
> >
> > Reported-by: Vincent Fazio <vfazio@xes-inc.com>
>
> Thanks!
>
> >
> > > ---
> > >  configure.ac | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/configure.ac b/configure.ac
> > > index 9b6c862..fe96739 100644
> > > --- a/configure.ac
> > > +++ b/configure.ac
> > > @@ -157,8 +157,8 @@ then
> > >         PKG_CHECK_MODULES([MOUNT], [mount >=3D 2.33.1])
> > >
> > >         # For core library tests
> > > -       PKG_CHECK_MODULES([GLIB], [glib-2.0 >=3D 2.50])
> > > -       PKG_CHECK_MODULES([GIO], [gio-2.0 >=3D 2.50])
> > > +       PKG_CHECK_MODULES([GLIB], [glib-2.0 >=3D 2.74])
> > > +       PKG_CHECK_MODULES([GIO], [gio-2.0 >=3D 2.74])
>
> I know there was a lot of noise in the Github issue (my fault), but did y=
ou decide that it's not worthwhile to implement Philip's suggestion of GLIB=
_VERSION_{MAX_ALLOWED, MIN_REQUIRED} to "enforce" the cap?
>

I don't believe it makes sense for us. Users are already unable to
build with anything less than v2.74 as configure will bail-out.

> I didn't have time to try that out via Makefile.am in the respective subf=
olders.
>
> > >
> > >         AC_CHECK_FUNC([atexit], [], [FUNC_NOT_FOUND_LIB([atexit])])
> > >         AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])=
])
> > > --
> > > 2.48.1
> > >
>

One more tag I forgot:

Closes: https://github.com/brgl/libgpiod/issues/143

Bart

