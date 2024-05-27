Return-Path: <linux-gpio+bounces-6641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3178CFF21
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938041C214E2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7CC15D5C2;
	Mon, 27 May 2024 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rKIuKKW8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7137F131E41
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809890; cv=none; b=u+hHIGoAj/Qn9mPwDjpxzxTvZiq5eANNj1IrQIXd2TCZG9E3GVZD0NH1r3TBis9ohn4yLxpg+c1iLBY7ffcEYwNi2KWVtDAKMmNqXr4LQgMs3Nof9zSTSvjNx54nIXi9A2LuK0RVcuhyAsdNACPwiJyll03LNpbVCMlD/KKFzz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809890; c=relaxed/simple;
	bh=Dgbz6dj702RlZKT+eqJcrM3mxxgu3tv0Apn+UO0FjvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJtGw599+4rSjz80iscwPYWjNaXs+GBbuARJ5bHnnO052zAR8n15NjV7neq54IOtJJHfPwEOGnkT2NfGz+CS5MFZ/IllmhfA/hv+waXpzgiIRt0gm28fHxekjGHGxJ+VFZ0UmxNKIAorawKTRfjqjBCB1ss4DEC2bxSnXDssOts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rKIuKKW8; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e95a7622cfso36046961fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716809886; x=1717414686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnbYtUct4rqtK+O/oKnuLrNzbZSoeD114dRYc3nO5k0=;
        b=rKIuKKW8MH6kmR6pbR328nfzT67RGwwdyWdGnchb0RtuEE6A6JAfT3DKejE36QrbEO
         4otD79IniP1aoff7m02mc/Rm75Te5baYC/MShWNEHXpAssJHNy9VmSs2G1XUEAFfXJC0
         jij9tiNet4aOl1EU/JgjQILYECvfOJg2a0L390yuKriJ+3SruweMG5syaJipgR+X9d7y
         wtYCDg5EHbazq60EP23rt5SN/YJ+T28Tk1rMP7sZXjbOcJeBfF2+uBHK71pYBwo84CNJ
         YAm0sluhoR5amrDn40LRGcU/5YYIGOF3U5hLW/snDTNXDSJKQmB3oanTkNoA1DkS47Rs
         eDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716809886; x=1717414686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnbYtUct4rqtK+O/oKnuLrNzbZSoeD114dRYc3nO5k0=;
        b=Rjbu1S2GFniOihIRJ9HpqZXYAkx3lg78CqOzwp668+2pbnMKpUZQHMN9E/ntc9brJB
         7S72g89IW1Sy4tx5Em2ViirmPO2ICfeZUl9rK6zj+bzCEnlo+9Xf0Pmtw8u7ePmXB57R
         NFTYBAaMXbPYCI/J0DgFvMUGyALrQuqIq+bzKYNLhBQx3wKpJLo0rIXeZSo1T5eF8BiW
         IfGXG6EUkjEDnp0XjZrr8cZMkWoxx+ezMFdU+H8F0UrGeBlwetqZU3IbZdrmbsk4kCsf
         R6WJtGVLCv99EYJPOOdU32t8e1+DoVhoxWHsK3wzq8EgGcVVs4nH+rGs/Y06E74kQwNx
         r+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtFCjLYq63Tx7tsPVaJZReZUwJropVnegiwla1WwFVIxcOCVxMUGCDyPCNH1DFvGQFJCLDVmAlE6tQ87EEgJ5Zy9cgH0cFgvMpew==
X-Gm-Message-State: AOJu0Yy40EEV8JrV2+SLqda2MXkO+DrhhfoF5xE7dm3a2M5XWv7ywHOA
	FP6oK6rCYh+XDxIUWkK0tjhD6aRH1bpcTD1HK7ChqKBPq623MygTdfthU0fK0etnDekpJSvOBoq
	CcPVta8HneEWby2bAjR1snOOXhlqQtijbGxwX3g==
X-Google-Smtp-Source: AGHT+IGVL5df9qZX0rKyZszRM1wSQ9mQBhQ94s0ig8TjJWA/kV7lqTNT/8wMVQ/vDbcAJhO8lc5L78H/kDpnKWcyIRc=
X-Received: by 2002:a2e:9607:0:b0:2e6:f3ee:c443 with SMTP id
 38308e7fff4ca-2e95b24c610mr55712631fa.36.1716809886525; Mon, 27 May 2024
 04:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
 <20240524-fix-bash-tests-v1-2-1397c73073a6@linaro.org> <20240525015431.GA5731@rigel>
 <CAMRc=Mfk_r7v86wfgQgeSGxwVFZkm9SUXw5tFJxBX6cVFAHPUw@mail.gmail.com> <20240527102435.GA61454@rigel>
In-Reply-To: <20240527102435.GA61454@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 13:37:55 +0200
Message-ID: <CAMRc=Mf-uG5fJ0KoyTq-7yXxX9aH5GXew8LfsViE7c8yQf29bQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod 2/4] tools: tests: use $@ instead of $*
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:24=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Mon, May 27, 2024 at 11:49:09AM +0200, Bartosz Golaszewski wrote:
> > On Sat, May 25, 2024 at 3:54=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Fri, May 24, 2024 at 08:03:28PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > $@ does not break up quoted arguments which is what we want in all =
cases
> > > > in the bash test-suite. Use it instead of $*.
> > > >
> > >
> > > I believe it needs to be "$@".  Everywhere.
> > >
> > > Where do we use quoted arguments/whitespaced parameters?
> > > So this is purely about "good" shell?  In that case why stop here - e=
.g.
> > > shellcheck picks up a load more "Double quote to prevent splitting/gl=
obbing"
> > > and the like.
> > >
> >
> > You're not wrong but I have an impression that this is just a
> > sarcastic way of telling me this change is not needed. Could you
> > confirm?
> >
>
> Me? Sarcastic? ;-)  Well, yes and no, but mainly no.
>
> Strictly speaking, the change is not needed, given the functions in quest=
ion
> are only used internally and we know whitespace is not an issue.
>
> OTOH, I'm fine with this change, but I do think in that case we should fi=
x
> everything, to some accepted standard of "good" shell.
> I believe Andy suggested the same.  I happened to suggest shellcheck as t=
he
> standard as that is what my editor happened to be using.
> Happy to go with something else if you have a better alternative.
>

No, you're right, let's bring it up to shellcheck's standard.

> If you want to apply this series (after fixing the "$@"), I'm happy to pa=
tch
> that to correct all the other things that shellcheck throws up - there ar=
e
> lots.
>

Sure, knock yourself out. Resend the series with this fixed then.

> Then if we do happen to make use of whitespace in the future we're good.
>
> Cheers,
> Kent.

Thanks,
Bart

