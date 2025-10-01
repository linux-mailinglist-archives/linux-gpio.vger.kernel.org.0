Return-Path: <linux-gpio+bounces-26739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925ABB1947
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 21:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A6C316440A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 19:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49072E9EA1;
	Wed,  1 Oct 2025 19:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hvpmYxh0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B942D8781
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759346316; cv=none; b=eW4PVVjv/l/OXkv7toDu8X/H01PCqiTOXPwZQVI5V/znzAb8IIA11ypt+c5/+lQTAOsZU8HGHyzp62iYtMpogXLoBlaDbbib2DSiWmOCzq0isuoHM9T6D+bkSkzAduVnNKfdAFQeu1fHRjecJj7U7mtqf2zSWu3WfITyRqwvwZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759346316; c=relaxed/simple;
	bh=duPcS0wfMeB+YtIDMwyoth5EHINr1H5VM9YOTBe0lDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEb76zTXIqe+aYjp2ROWVHUryw48ayAgZmVS6QIUBPwy+nj0ZWConxrSUVGT09iAwyDqEtyMzNoOAkjdIOCRD8YJ4Xf5toy+GB4OD7PEb7XogRIx9VdB4X62UST7Tp8kH4eyy7UWm4NXCoB0VeUKYrY+rWPb5ZxzqOnJthRu6SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hvpmYxh0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-367444a3e2aso2090601fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759346313; x=1759951113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ika2EwTLbPs/hB14my45j17pHFrdQm4poatSi0eQJhA=;
        b=hvpmYxh0u7SqMc63OqX5wEXGXQQWEIOhgyt9KqsanJ6K1yzlgZ/p8ynsJ+4o5d0Q0Y
         //X3ZqRUJqyPhAg9TE1fHUr0X5PIOCBjFNbCXlTO6zrnxbLo/RK/BUCkBYrUZ6pvsx40
         H52oU/JFQQFF65ciQeYSK3xlMEq8md1x39OzojEgoju/trJ7Ut+HHJDIPhIIprKy1Sd9
         Q+GpA4USAAIxVjqqOS7h/ajPmFdkenCm4jNqqRKh4vzAm5nHd4yciXsanLyp4AeizNKj
         Rlb/VG41Ff7rkm9dBUdTBzGEeqIZNVjrabba107YFBde8Snt/BZ7ZnsAAYocg6SuoIDq
         Zv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759346313; x=1759951113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ika2EwTLbPs/hB14my45j17pHFrdQm4poatSi0eQJhA=;
        b=tP5H7cx5n3VhHjWMjdqUzDLAq+Knkn0t9rnEWPIauCWJiElqofarlXiIa06Th0vscj
         IYiP8aKxNEi/wdEugXW9ssoEoAn11vLmR9DFUii4QjuMSvsYbvrhPsy/hNVxgEbDOPuo
         qwf11hLFhuV76SbO/tCjfWrs7J9AlcS6qCBJ44YIBLZMHrSeKZmCCSumtvGbHIq9eTxd
         cD4hz9UuMFMAByTihl6THVKFlSwElV5JtvfVCeddgNQEn6xkvZH85M9bi1uBkQw9ooYQ
         sjdwtnjbRn3Ht/2oywmlQtcnh4+fmAp89iO0cBZZnKTO66r+vJSO0vl69p6WKRhRS3hy
         +eqg==
X-Forwarded-Encrypted: i=1; AJvYcCVzvqfYvNNJTvomOBF9f0uhPkTC6W9I+DwtFJ65v8R9ynfvNhnY8CdSVywO+sh/GmblX7i9lN9ER3p0@vger.kernel.org
X-Gm-Message-State: AOJu0YwJE7Xu4GiH2eOAnIR0xBWxCe1sZFZxD3MwoieCJvCHxJSnUmBe
	543wW/nYPtaI7HKGk57nYX5WiW+MidIbVGJJGFPPatrk7MTRJ97cBtdC7i1xkfoY4qi3R90dLjV
	hoq0+CaT6O8YVXjtDWP0QMnU3mxEbp7qYSV240tyHAA==
X-Gm-Gg: ASbGncsincAaiNGLf84NGVpZHNUxVElTcyMRH/HwD0OTKiQPkgZJXtbb2+dnztBNLgB
	vHd7CZwG1YOPtTclNgP9dK9mxLDALgn0WKSdaL2FRwLl1NZAbd2RaW+oHpm1d7OrGHyac6BoCXI
	RScuN770B25TBsa2mUZat8RrYu6dSCvJrAiVTtvqnZyMW/1Z67dP2vJMh2vz/9uB0xhp/KEs2pV
	/d3aMcIrFY8JUbQ9/FB9gjWQOAGIchfu3EHyyoyPquoh0pVefKCEBwU1+opY+rwjJd/vOdhyw==
X-Google-Smtp-Source: AGHT+IHdKtzst+020FzI9gZfNJFk/Y8mES72dcb0M1Lunet0OYSDf8iqU3erDstle92eJI6mXzgIdHwjDya8pxKfaCQ=
X-Received: by 2002:a05:651c:548:b0:373:a5ad:639 with SMTP id
 38308e7fff4ca-373a70e3f74mr12786451fa.8.1759346312603; Wed, 01 Oct 2025
 12:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929094107.34633-1-brgl@bgdev.pl> <CAHk-=whnmvjsan9Y=LcV0encJungD451VkdqYAKrRpk6YyA6-w@mail.gmail.com>
 <CAHk-=whPqa8YnjjH=Np_Q8r+9xDrypJVL4SPtFzgN-Znjb6knA@mail.gmail.com>
In-Reply-To: <CAHk-=whPqa8YnjjH=Np_Q8r+9xDrypJVL4SPtFzgN-Znjb6knA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Oct 2025 21:18:21 +0200
X-Gm-Features: AS18NWDziKtG5ep_vpgTvGBSV3_avAhsqs2_NmERRWgOx-Xl5t9ov70C9jXbNqM
Message-ID: <CAMRc=MeFzn1CfjAaLJgFNyEybCudmaFfQ-9GQDCb6k5FureNsQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio updates for v6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 9:06=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 1 Oct 2025 at 11:36, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > It's trivial to fix, but I should not be in the situation where I have
> > to fix it, and I should not be getting pull requests that don't even
> > build under trivial configurations.
>
> I see that it got fixed in the MFD tree, but this is not how things
> should work. At all.
>
>                    Linus

Hi Linus,

Sorry for that. All the patches should have been a single series going
through the MFD tree but the GPIO patch was sent to me separately and
I applied which of course caused a build problem in next. I thought
the fix was to have just the core MFD patch in my tree which we did
with Lee and due to the order in which branches are merged into next,
the (unfixed) problem remained hidden. I'll pay more attention next
time to these MODULE_* macros.

Bartosz

