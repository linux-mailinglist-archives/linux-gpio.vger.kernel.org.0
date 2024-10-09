Return-Path: <linux-gpio+bounces-11121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673C9974DD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 20:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D34281B2C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07E11DE4CE;
	Wed,  9 Oct 2024 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vuz+ecUQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A181A704B
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728498260; cv=none; b=RGUWbXOxTQ5NsLUja4cO1BfHPfHKit7qCZxusBlEvIWgjVidatNHUxbQXSTNYBJ68oMiukRWpXQxnSxpiNl9YkBa1WbTNn2+c2OvDpx2VDkziEII5NnbSa8Hs9DLhzIu5r5LKKAhK75sbxqnCGpBWtjYTt9mrTGlUZKo+C7je4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728498260; c=relaxed/simple;
	bh=kwx2JflPPmYiwBEnX6wdYc31/7p5yWQyVj7J4vKdsQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORIJAz60fiymL+nxF9JbIvBNUp/PAgVVj+8cMxqWqnsTQJPNDLfb0I6S3AffgOTSdSsr/03WC0s/9oeznQlaoM9BEhXvbKLTamwzUX8jTrWOHrVKYD0+zSY6J7A306iGrbNAAy3GVvOBCdJkaWKNkbi51bLSpT3vkQdEFttEoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vuz+ecUQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso899381fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728498256; x=1729103056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=US6Zed3EObcKYBNXw27IVmHEEKLisMNCpotZ25QpgGo=;
        b=vuz+ecUQ3lJKo9X8kRjwZ1LrTpoJ3QYR5EXcbGAG4G0yZEkwxn0hLGdKKC/3IFjjXy
         T85TlF9qjymO3zw1WrIfnsNw10Fs0FrWZuk2bI8WSfSGhEYy0P7JBVyDNL770MxEC5nn
         T/qoZhInstauIMRErwHFPsohEOZjBw2Llh1WX/rSF2+lNQLqJNhDSOijqxc+xiB1NVBK
         T/uYPZZsLkQSoBkgSllPe9h2QmaSSO5MK/PU2JwWn6dfZdi3m9fCwJ92whOpv0Q3T/vq
         U0JoQhk7mUtUM5xl5+Fz1wg8ZggUl2xMkkUmPbk0Jv3kRYwhwjmWWOX39Ej55JtPpmhG
         8VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498256; x=1729103056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=US6Zed3EObcKYBNXw27IVmHEEKLisMNCpotZ25QpgGo=;
        b=ajo48IrTCyK2nJ1ai5pWKpfbKUa8tCCZhCgz8c19yS4SaR1e8MR/hKaGnJK7+wJCSA
         zbq9bWDV7pBLUaVpzS+vvzDfeYqYoZCw7lY5h0i/lfqVu6qt7uCeKiYQg1zNBb+f4Gvp
         4nzN30YBPcXkV92rGSUOL0JxoFNnRK7u/lrO8peVjoCGosNDyJgU99LlmU3bI1O0fe8O
         PIvHH9lswQMiGNDQzirBRJQEvl8vvlIaMoojsPc6V45nmMcXLyqtFvb39P0IRGUrSMKr
         pOcAIFLGJKyof3Pq+hJ+iMm+oJjIUjjLXcasUatnz5XJ0bBbRJSmMAfAoQFR+dTBxSDS
         6gjg==
X-Forwarded-Encrypted: i=1; AJvYcCVqk27GSX8QFeKWDQEJ5hZhKU22GEr/kWoiXaFi3ug/cFaTR8QLd7HAeZug2lQxyDSj+zBOtm0Dts6k@vger.kernel.org
X-Gm-Message-State: AOJu0YzbvT9NgXodOH2XF39cPYDre84pw6GK/6XjEzT7d5WwAo4QcOsx
	4UmYsfoVd0wYCeGMoa5o/e4axze7pYTXqVOXaaoVc+8QmCM3WeBTl6QUjE5eW8PEQIIselpHAXQ
	pOGhLZ7algg0w8j72rrt0NZoxIlnh9BelcWwluhISYPzWipbOMFU=
X-Google-Smtp-Source: AGHT+IGM7+nnvIjWW8NQgGoD5wSz7VBTTSil37Y81pGnDak0OmuiL6d8CPRwti6EW/sctHsHDQHufbavc47qPqIaJDE=
X-Received: by 2002:a05:651c:b11:b0:2fa:c5d9:105b with SMTP id
 38308e7fff4ca-2fb1871e59bmr31714661fa.2.1728498255412; Wed, 09 Oct 2024
 11:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
 <20240927-vfazio-mypy-v1-18-91a7c2e20884@xes-inc.com> <CAMRc=Mf8_Opks07HmruFTYvt9n9MHM02ykQYUoFcfofHv0NA6w@mail.gmail.com>
 <CAOrEah7pBF7dzCpPC=5v8CBv5DdUAoD9XBU9r-cFjNePq7Fw=g@mail.gmail.com>
In-Reply-To: <CAOrEah7pBF7dzCpPC=5v8CBv5DdUAoD9XBU9r-cFjNePq7Fw=g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Oct 2024 20:24:03 +0200
Message-ID: <CAMRc=McxQdHs6QvndE1wd7S0jctqf0YcUrnvOO5hBaSuCE9Rtw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 18/22] bindings: python: tests: add missing type annotations
To: Vincent Fazio <vfazio@gmail.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 6:41=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> On Tue, Oct 8, 2024 at 8:32=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> >
> > I admit I don't know any better but does it really make sense to do it
> > for individual test cases?
>
> Some projects type their tests while others don't make it a priority. The=
 way I
> see it, the overhead is minimal when adding a new test so why not add it.
>
> One of the caveats is that mypy does not type check the bodies of functio=
ns
> that have untyped function definitions. So:
>
>   def _internal_fn(arg: str) -> str:
>     return arg
>
>   def test_fn():  # will not be type checked by default
>     _internal_fn(10)  # so this will not raise a type error
>
> It seems important to ensure the test cases are either abiding by the typ=
ed
> library interface or knowingly using invalid arguments to test "negative"=
 cases
> (type errors which are suppressed in patch 19) for callers who do not lev=
erage
> or ignore the library's type annotations.
>
> When fixing the type annotations for gpiod, I used the tests and examples=
 as a
> reference for what the call interface is expected to support.
>
> For the situation above re untyped function definitions, mypy does have a=
 knob
> that allows type checking the bodies of untyped functions. If we used tha=
t, it
> could be argued that the majority of this patch could be dropped.
>
> So, I guess some questions:
>
> Do you want the test suite type checked?
>

Yes, you've already done most of the work, so I'm all in favor of
keeping it. I see value in having everything typed and I don't expect
to be writing a lot of new tests so it won't involve much overhead.

> If not, a lot of the patches touching tests can be dropped
>
> If you do, to what degree? Do you want function bodies type checked?
>

I take it your changes already do it? Sure, let's keep it.

> For example, mypy identified the problems in patch 14 and 16. Even if unt=
yped
> functions aren't checked, those problems would still have been flagged.
>
> If you think there's value in type checking functions, do you want to use
> explicitly typed function signatures or leverage `check_untyped_defs` [0]=
 (this
> could be added to the mypy configuration in pyproject.toml).
>

Thanks,
Bart

