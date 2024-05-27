Return-Path: <linux-gpio+bounces-6633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 062318CFD74
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58BF280FA4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 09:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D470B13A86B;
	Mon, 27 May 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="15kghdVL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C013A3E5
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803364; cv=none; b=ojaYyZZIcdeRXNGzpAWjwsIzeAPzyHfL3css5iE5nEg19TPwPAvZlCKIS1wRUeaxReO3VIFokGYZdRzmzOmS9fgKblbEMHeY6EhK/lLiFHNBxXwlHN04fxLG+31fXlb7wVc0wp4pb0Wc48oKQCEBU+itkL7LmkkNYuIWZU3N+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803364; c=relaxed/simple;
	bh=Vmu1j1Qn+58qX4PxlGZs3oPRiZLYFy29NnOk2gC+89M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrEOeJCpjpgtAniRU9KEN1GK1gsKZmMUODANABHoT1dIRQ7k5Ve60XVcbe9iO5PJIke1oM+SRI7pBxLgmMwv53N0j2wLJ98YpHpNx80XCMalggfJbZwmxDB0Ea+DtLhVuYCZ9BvhkS8Ug0FngW29z5GcuCDl1R34oWbJPs1hOc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=15kghdVL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52961b77655so3435424e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716803360; x=1717408160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSiQL76cgzFg2WAF0FuUsPggtOnsWqN4etknRqmZ0Q0=;
        b=15kghdVLq+R2Vzvu6JCVM3XwqFHs/08/f4o68dphUIl4sSiAI1u19ay7ar7RSBUodj
         c+lFtdhlh7y6bZ/1ot2gQF/eCJFZcE8pAFzELgFaWFS9ONm++L2XrYrtQO4NQHr9mrGx
         ny3RRNjxPXzCGlrbX3r73R5RMfCOYx9uZAFAftq0b0hFNLUmATQXb2KDPXkMCekvVj4J
         qBo3eiZ2BdUpA8oyeB6OPoGkaw709LaPCf03V21hNO5tVe6vavf4B7GvrcuHdhAGyygf
         zieo+UyO1WxcX0QFWGc0HxnnFOy7u64xn59aF8O4nuMniEhbkdG6ZqGs8POvuudijwrP
         bEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803360; x=1717408160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSiQL76cgzFg2WAF0FuUsPggtOnsWqN4etknRqmZ0Q0=;
        b=qAELp98kd+qQWjrckRRWMuUu3FaczZRloDASnFpz/Cus1nvmBtUiPG6NhVd2chwzmC
         XIl4kQ3x9PRi59lyOrKDV1i+7k4HhF0lft9/8L9LJRZjWVh5Lizwd8dgXlqr6mgNKVKT
         rAerdUoYL800MHXLFYDiWLoU5BZskJCW7jjBnobVH5krw4tHil6RPXNT3aB1ihc6g6Xx
         0rKo7MB8Z/EjF/pyPUHAMjul8C3n4vNysWKjpLUVKvs7GOF9eFF0uGEmblvWTasxubZv
         VvhCIXC3vSvlzdlZfIsojGKGa8VgLI/LP8M1uJcem3Xw4W8KvYQldOWZLDepTbzVFgZK
         aoLw==
X-Forwarded-Encrypted: i=1; AJvYcCVtEuzXSB3CDI8K9GGMsr6AxDiQq1PreMkwY631eYnPlVR534NGYBVx+DaZ1/SSn2PVfn0ruNLsfgWRXfx3T2pR35zpYA6oQnRvew==
X-Gm-Message-State: AOJu0YzjRnJm78//QrP5ZObTmQnU1e6IpG+kkP0KgZoSc1fGHnJ01S2M
	gSEwjHxNo7kbDdhkaTgUaYMQaZ9lFNyC6E+gXnrxZ0KA2LydTqYoJAgNBgjEfhcIQEtp3c92OoM
	7UoLySVaRIZMWmre3jEzpGpMNfRMLuCTNra5x7Q==
X-Google-Smtp-Source: AGHT+IGLbgLd+oZQyn2Ef06n1CsNNeUDZGimQwdkjPPHphbXo+1cECo78Tf1NvMLrQZ18LnVyuHQcizAAJ2ssG1Pcq0=
X-Received: by 2002:a05:651c:1a0b:b0:2e5:8685:8b13 with SMTP id
 38308e7fff4ca-2e95b0c22b6mr59153011fa.25.1716803360449; Mon, 27 May 2024
 02:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
 <20240524-fix-bash-tests-v1-2-1397c73073a6@linaro.org> <20240525015431.GA5731@rigel>
In-Reply-To: <20240525015431.GA5731@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 11:49:09 +0200
Message-ID: <CAMRc=Mfk_r7v86wfgQgeSGxwVFZkm9SUXw5tFJxBX6cVFAHPUw@mail.gmail.com>
Subject: Re: [PATCH libgpiod 2/4] tools: tests: use $@ instead of $*
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 3:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, May 24, 2024 at 08:03:28PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > $@ does not break up quoted arguments which is what we want in all case=
s
> > in the bash test-suite. Use it instead of $*.
> >
>
> I believe it needs to be "$@".  Everywhere.
>
> Where do we use quoted arguments/whitespaced parameters?
> So this is purely about "good" shell?  In that case why stop here - e.g.
> shellcheck picks up a load more "Double quote to prevent splitting/globbi=
ng"
> and the like.
>

You're not wrong but I have an impression that this is just a
sarcastic way of telling me this change is not needed. Could you
confirm?

> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  tools/gpio-tools-test.bash | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> > index abb2f5d..8b4f054 100755
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
> > +     $@ || return 0
> > +     fail " '$@': command did not fail as expected"
> >  }
> >
> >  # Check if the string in $2 matches against the pattern in $1.
> > @@ -71,7 +71,7 @@ gpiosim_chip() {
> >
> >       mkdir -p $BANKPATH
> >
> > -     for ARG in $*
> > +     for ARG in $@
> >       do
> >               local KEY=3D$(echo $ARG | cut -d"=3D" -f1)
> >               local VAL=3D$(echo $ARG | cut -d"=3D" -f2)
> > @@ -253,7 +253,7 @@ dut_regex_match() {
> >  }
> >
> >  dut_write() {
> > -     echo $* >&${COPROC[1]}
> > +     echo $@ >&${COPROC[1]}
> >  }
> >
>
> Does echo care?  I realise a linter, and that includes Andy, will complai=
n
> here, but is there a practical difference?
>

The practical difference that comes to mind is passing less arguments
to echo but I don't know if that really matters.

Bart

> Cheers,
> Kent.
>
> >  dut_kill() {
> > @@ -283,7 +283,7 @@ tearDown() {
> >  }
> >
> >  request_release_line() {
> > -     $SOURCE_DIR/gpioget -c $* >/dev/null
> > +     $SOURCE_DIR/gpioget -c $@ >/dev/null
> >  }
> >
> >  #
> >
> > --
> > 2.43.0
> >

