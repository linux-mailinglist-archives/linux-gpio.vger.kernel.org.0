Return-Path: <linux-gpio+bounces-8096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7B92A17B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 13:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05127282287
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 11:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC807E103;
	Mon,  8 Jul 2024 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SaXXwMcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8757C081
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439306; cv=none; b=W0/O8/BvPlgtQMeZSP73/Q1yMWpy4tR/hxHcDIvAjyiMV/LbfNTi5J1QGSk13B3oA/0ogory4yKekMRu9XbrI+Qx1ggPC3NAiAGPY5vjypvaK+NdvTyunMM95zgl5tZEAhUwojqeo36kaBy/qTMLRTwY6ClkUbOsCUmOivbv7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439306; c=relaxed/simple;
	bh=vRioWlm7ODde1XP9P7Xcn3QmCX9woejhu/8Ts5VwJYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8a4YLK2dzqtEiaA9trKXqcr7pYnBMmuPZR1fVDqYnHzqfIXlC87yoof2yDz7fK/5JlotTm+2OlCSgmfs134UwuraMxeR2JbBSVQ13oRH6RB2ncY1IBOW4EMeYWCnXtSgzlZXcppyVfq/4k3uzSmOsR8rdfSkTX4dRUgZ9Hw0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SaXXwMcR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso4035591e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720439302; x=1721044102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY+6j/RwMJwGMooOf4ME8y2ioCnHK+dSL/6GvuM8vr0=;
        b=SaXXwMcRRB0ssMoM5jhbvhGy8vZz9kxO3zi8ReoITJxuCt+1ZBSYTmxtnHyshUe0fj
         5+nwv85qire5Ijy2pyQeTv0sj+ZX4XoZB3KlZ/1PB05QdU3ErU3t5rz1liBZOxZ0mLQL
         Gb+GMp68CnsM/lJgD9pX1gUuDV7J1/zrFOZ/MMBfyagu7V5dSBVZQ5l1jICKnxNZuJ38
         BRRCS3dpxsH+j+qi2bQEoqnTfZp689Vqpd9o5hDBa8BWD2d5CV7VLUuce8Lp2I/sqLuS
         fYJ+UYuvYLdfnPFm015PsywU36zOaKgy7GdzAYcDDew3hcAoOX8D6+aiDfKtX8k27Po4
         5YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720439302; x=1721044102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY+6j/RwMJwGMooOf4ME8y2ioCnHK+dSL/6GvuM8vr0=;
        b=NsbgZfV0y07jVty+8Diy7J23OuNlFZHDSVEOkkXQdAEAXZr3aXTm7lNfN4Deaz7kdm
         o+NRsFZfVojmRZFyPtpktM9Soz9eecAw+RY45sNO2mF9rhBxxxf05WC1PeK9ttznlP1z
         mPCNV3bj9wqdRaf1jnUvPJ5cKMXkhBDqBL7aW8dW+0VN8ynK5X5UORRiF6kmCLUV577D
         gYI9eVhyAkOKNZLAdrlrBZblibfV0e9TABgb7uELoSJ/LnhUCRAIMWimBoGCYh/EL/ND
         APYccE65Hv5aDHGxQdjHgRW5osBNMWxCfVao4J/yEvxC/UgOAx5Q2jfmPE2dhMgVxYiV
         fRSg==
X-Gm-Message-State: AOJu0YxS35zuzJylv9RJR3OojmpfGtyXK8OJqaXSmXaNJXA2klWz/VSk
	w6PjpEVr1UjcCJ5trpCi8JulW66+BERYweAjUrt4ftAKp3wGApAKCXagxlJGrxOAjnA6g3+bqYQ
	y/rKB9ia0zd+uYKVOp0J8OtNDeKiIQEt9tgHg/g==
X-Google-Smtp-Source: AGHT+IFP7LbCzmMbEEIHmym6w16mKf+/Eq+E8G0m9d0IipcCBHIhqWNA6cipIAZ2rDQ0go8eFZAmJEQkkcipeBfADjs=
X-Received: by 2002:ac2:55af:0:b0:52e:813f:ab60 with SMTP id
 2adb3069b0e04-52ea06e2348mr7396600e87.56.1720439302523; Mon, 08 Jul 2024
 04:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705021750.43197-1-warthog618@gmail.com> <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
In-Reply-To: <20240706025456.GA13007@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Jul 2024 13:48:11 +0200
Message-ID: <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
To: Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 4:55=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > > Generating the latest documentation on readthedocs is broken as the
> > > index.html generated by Doxygen is now being overwritten by one
> > > generated by Sphinx.
> > >
> > > Make Sphinx generate a differently named root page that does not
> > > conflict with the index.html generated by Doxygen.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] doc: fix sphinx config for rtd
> >       commit: 824c1f39347c2ef46919dfc45e8247441b908827
> >
>
> Btw, I ran across this while updating RTD to v2.1 - their default build
> config has changed since I last updated, so that didn't go as smoothly
> as I had anticipated (the plan was to switch the branch the generation
> uses from my fork to your github repo, but now that can wait til v2.2).
>
> I am also looking at reworking the documentation to use Sphinx/Breathe
> to generate the html from the xml that Doxygen generates, and
> incorporting documentation for the Python bindings, but looking is
> about as far as I've gotten so far.

YES please! We really need this and I've had it on my TODO list for
far too long.

>
> Not sure what to do about the Rust bindings.  I was assuming I could
> just link to docs.rs, but the build there[1] is broken.
> Can we fix that?
>

I don't know. Viresh?

Bart

> Cheers,
> Kent.
>
> [1] https://docs.rs/crate/libgpiod/latest

