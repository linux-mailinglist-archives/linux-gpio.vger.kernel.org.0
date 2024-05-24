Return-Path: <linux-gpio+bounces-6606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C88CE6E3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 16:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C7E1F22693
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDE912C475;
	Fri, 24 May 2024 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="twlBrAIb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74B78625A
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716560434; cv=none; b=QKpkw9iUhcuio4QY/kCdRJSH1x9R0EQ9lX7QrtiJBxa3xBCC9Tb4IrI7UfVEVqRG+IcDKZTzQviDPHvzCGKMRXnxTivFUOstuoHPPKlLSNNO76pBcTu/F4rsZF/Bf2jW20/ATGcjKkMR3nSQnWtCoH9e58sSStsNZyuNA8N3bhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716560434; c=relaxed/simple;
	bh=5K1yuqBeIFrIu6Lj3WPzdCSskKl+115WP2yPLByLQsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NP+9QhQXz0QZxkywtpKFve6c38e1GfYHIlaCdp+mfMAzmNEPLTswm4PMRwSrMECVOVaI8QDkvS3MvzIfxjddmY7COKTPzbpBVxbaZ9OTN5TlJEhotIadDyoX6GpfyTt4HC+pV+GJz5pngRp/IFqTRONCZj7e7Fq/LGjfDYYbP2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=twlBrAIb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52742fdd363so2768075e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716560430; x=1717165230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSa8q92sfB2Mr3u/i+/pRObta0HqlHGTv4MEKFVZqNw=;
        b=twlBrAIbCal1d3Tc3fUuejtJLpDhIrFCROG5gapQ1l55c6mKzxApw4xs6K+TrA3sJz
         UQvcFSIjY2oxK/CULUokysGclgNt4vwxYxt7B8MRQd41WZ7+ecnUcJscAJt0jwdZJ37s
         RVqIdaeLURICLWovON1Kn/RqmH6+akUS4/Kq28Qt3thUdg5mmthxhmNOsat30Shx2VGO
         MqVWTA4ovMYbWSGSRlasYx/2HvNHGNkwaMTq4AD6rMZWFWsHW76giyDOx7fHrq9XfA9V
         u4Vu+33/tJAZSLgpqahyfqytXMikfGLJ8/KXueBrkb3sfxVl7ozs1fKCrcCGU68BGHce
         2UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716560430; x=1717165230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSa8q92sfB2Mr3u/i+/pRObta0HqlHGTv4MEKFVZqNw=;
        b=g3VcQjzTAEF/EStLPLTjcPuV5ya0sx2ZebRS/9PJ1diPfCPLqkuNPB8BBVKoXiBUDR
         POzbNhTS+COuIlYAPG1b/5Fi9w0upXUOk9lj6fGYxsZoZ4yh8CDOs3CmDjHF+7WS3GfK
         bei7v4YKU/s6E4S6EyopJqMAHksq/MF1r3KcNiBjDOJOUGjTMFsr2agC2XSBzQdiPU73
         ef/9U0/qrDsw1LhiG1ZA2WrZvU6OmXfl/UjpqNxKS6fEMGstpoAh7DZCYahajfIaoEFK
         nrqbuMuzjLdgb6UNKvh6Asmh0kRmbRLvPBrgJw4tAmqzjBTjZCMM/JGkJ5nL0Bed6qoh
         7vAw==
X-Gm-Message-State: AOJu0YzXNt4Mhgts9675OThUybgRQA+9/j3tIKO7XZkuDqkdHuJBjd7h
	trYgXnf/8otRJ2dEHvqNUz3tgJV3hDWkhYRotqsFFKeYsDD1LAOhy8OLKWXfMdNB+BlWy/zu1KY
	Ow3lLG4s4bABXZOtUxsiOji/P6KRM5+Sfk7jU5fGRdp4fZRjn
X-Google-Smtp-Source: AGHT+IFd+sXFXiGJU8oqHpDFnPn4BK5VAKetewmmcPXG8fcN5Vpv3AXzOklGMCgJKrK+aEcBVjdf1XUrVNTxIcYAK8c=
X-Received: by 2002:ac2:5dc6:0:b0:51f:52d9:d552 with SMTP id
 2adb3069b0e04-529664dae4cmr1381071e87.45.1716560429640; Fri, 24 May 2024
 07:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240513101331.GB89686@rigel> <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel> <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel> <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
 <20240515141436.GA349711@rigel> <CAMRc=Me9ffciaXnOKE+ABLDBVbSRzTAEHRVzpLk641eocF4q8g@mail.gmail.com>
 <20240517123732.GA423787@rigel> <CAMRc=McuzzzRF8ttRKZWouayF250p8V2OXwmyjSrKOYe95Mn+g@mail.gmail.com>
 <20240522124103.GA172631@rigel>
In-Reply-To: <20240522124103.GA172631@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 16:20:18 +0200
Message-ID: <CAMRc=MdXUNbPP1Czn9wzAtueJZCx60aot6a+Ts38Q0VZVv6dUw@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 2:41=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, May 22, 2024 at 12:59:39PM +0200, Bartosz Golaszewski wrote:
> > On Fri, May 17, 2024 at 2:37=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > >
> > > Oh, I agree - that makes total sense.  The direction I was headed fel=
t wrong,
> > > so I figured I must've misunderstood what you meant.
> > >
> > > I'll re-organise it into a separate unit.
> > >
> > > Does that unit have to act through the core API, or can we give it
> > > access to the internals?
> >
> > If we can avoid it accessing the internals, that would be awesome.
> > Unless you hit a road-block, please try to keep the core separate.
> >
>
> If you want the ext functions to store config then that would rule out th=
e
> shortcut constructors returning a gpiod_line_request.
>

Actually this is why I initially proposed to have another object
wrapping gpiod_line_request. I don't really want to extend it unless
we make use of it in the core. We can always provide
gpiod_ext_state_get_request() or something. We could call this wrapper
gpiod_ext_state so that we can cram whatever persistence we will
require as the ext library grows (which it inevitably will).

> I was thinking that the ext could be a friend of core and get access to
> some things not generally accessible, in this case allowing ext to store
> the config inside the request.
>

I would rather it be a wrapper around libgpiod which simplifies
operating on the core API.

> Without that, the two options we have is to rebuild the config from line
> info, which you don't like, or wrapping the gpiod_line_request and have
> the wrapper provide an accessor to the contained gpiod_line_request if
> the user wants to use core API, which I'm not thrilled about.
> But that seems to be the only option.
>

If I were to rank the solutions here from best to worst (personal
opinion) I'd go:

1. Wrapper for extended state providing accessor to gpiod_line_request
and storing the config
2. Rebuilding the config from info
3. Storing the config in gpiod_line_request

> > > And where do you stand wrt the idea of adding a config pointer to str=
uct
> > > gpiod_line_request itself?
> > >
> >
> > We'd need to make a deep copy, otherwise it could be destroyed and the
> > pointer would be left dangling, right?
> >
>
> No, as the config is constructed and added by ext - the user can't actual=
ly
> see it.  It would only be accessed indirectly via the ext functions.
> If using only the core API then it would always be NULL.
>

Ugh, I really don't like having a useless pointer in this struct. It's
not about memory - the 8 bytes are irrelevant - but the logic of it.
Making concessions in the very core of the library for what is
essentially an outer shell around it just doesn't sound right.

> Well unless we were to provide accessors to make it accessible to the
> user, and then which way to go would be open to debate.  There are other
> functions in libgpiod that pass ownership, so copying isn't the only
> option. I haven't put much thought into that though, as I wasn't planning
> to go there.
>

For now that doesn't seem required. At worst we can provide a function
to lookup individual per offset settings from the ext state object.
Settings can be copied alright.

Bart

