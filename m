Return-Path: <linux-gpio+bounces-8156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917D92CC52
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 09:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3C08281178
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 07:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262F884A27;
	Wed, 10 Jul 2024 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hJYFl7ig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078C084A21
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598136; cv=none; b=FyVYDgY2gaklYbMOGZL6kWeAZtKGMzskMHXQBPnlMHT1gPAT3ZN6G0Uyb0UrlU5v8wSDkm2xGRPUM/slmj8+/VgcABe3Y3sVhUHiPXLU0GfwKmdENCZyXzoi/5rfeO+scDrz3Y3Zvsl9q45D5tMidF2XcBZG2st5wF2RnS0qv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598136; c=relaxed/simple;
	bh=RVoGJoINLU+GiuJMZRpkUimi0FRfEaZ2M7RxkYQ1UBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtGvZI9HSv+Gz/vT9gV22CCF68kyYJRAbQyHyUvF8haD6wnuHKpVrUC8QQV+4XLdlX3cjeae9a5hGmtnnXNrjlfoxFhvBiZTKtoRhruQgpl1nTXy0q59ohkT5lCKTYY5aunywFAspnp1vHcEgzTscfrf+YbDhzqnMwEVBscUi4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hJYFl7ig; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e9c55febcso7800589e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720598133; x=1721202933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evdfOW98pc+k5FTDMt+2znHs4NSJYxPCOtMVA/GQYyc=;
        b=hJYFl7igPs7J1Ob6wMl3zuazp6VniJ2wzh/d83izaItZhSHtVxkNbh1khHmF3Ak7W7
         7i6rbx948gSP4s8xk0UEZnztsl2Ti3drXnVrAOPyJmdAyNscur26T7W7Fjk9dVwUtv1V
         BsnSMt3+MNZnBB0EASkNxYl3NfDPkjOUYMV7s8CG+L3ivu88Ix7cJiXwqoIeuWA0vPGG
         au3kr5XQ5j2bKkS6xBELWb2oGB+LvnB3Fvfjc/JmlTzRpGyFtpcl47fO3VIcT8CqvFJV
         kOmCX68SZhj52Akb4g7vJoVmyo5Y0GpxGmWQPaXnwqOp3w335zkQbkNBbFax3IIsmZqa
         pMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720598133; x=1721202933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evdfOW98pc+k5FTDMt+2znHs4NSJYxPCOtMVA/GQYyc=;
        b=hEpIULn2b7BEvLXctU2oTWPvrwfrpxUevF5bTyC5TubS2cdlzn2iFcsIpl6eQTAXf8
         B147ese89q6z0d3VyrcufMT6L68B4PQPXcY3V+d6h70zYKmWqnB082uB5yreV4QzRViG
         wA2B7g6B/K7Ndpg0AvIJ4vgxS6AnUZFODEjf6TgRu3WkT7s7OURluHd8FUnW7q0ElaVt
         NgGQZolIY4wR9fuaVT+RPyrMoDUq2dp6+kUShxWJYp+w7qQqOLPGosjKv47ORUSzz1DA
         ACyZ9ifkLXhBV2A5a//SmbbGv9c9aQHDczeCY1w07HhHJCGZwCifv1SAUGKC43DoGZrM
         kyIA==
X-Forwarded-Encrypted: i=1; AJvYcCWwMct91vkvZm7OiNsON1kVI74PrYj9nTciNdFgVCm+HPUHHKQOkOyMkREkGDivit7l6XwgHTfwbHQOrX3oWqo9yTyLEDMSJMapaw==
X-Gm-Message-State: AOJu0Yy0Q5QcSNJDuKRmxA6Z/QHUV26m4Ppp6gl6pfK1iT2U4NLXDvF8
	tU2mIwpWVninN7H+6ebbYBfhLuMq/N5qKnqkeb5PWNA/P41JxXGNyOR0FE32j2KTSSeXagR9jK9
	waTTOyLrg3GxGltzlvB7NLtZazMcS5Iv7i586+g==
X-Google-Smtp-Source: AGHT+IGUAl3RsR/cRA7xV1Pw+0HC4vCxXn1mxec8ZOgFra0SjxMZEl1WTHKryN96PpRebpdOKB08O+e/y8lxE7K6Ewc=
X-Received: by 2002:a2e:b04a:0:b0:2ec:4df7:8cef with SMTP id
 38308e7fff4ca-2eeb30de2b2mr28945971fa.15.1720598133039; Wed, 10 Jul 2024
 00:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel> <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel> <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
 <20240708151517.GA355364@rigel> <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>
 <20240708152946.GA363324@rigel> <20240709093425.GA153473@rigel>
 <CAMRc=MdvPUS2eDQ1u4=hK=GhKmeLQsQjaXE2M5xgpeCSH2MEUg@mail.gmail.com> <20240710014811.GA3616@rigel>
In-Reply-To: <20240710014811.GA3616@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 09:55:21 +0200
Message-ID: <CAMRc=Mfaq9sN74DWZB2Lb56v8UXRPGtpLf10cYye97_YLWcvrg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
To: Kent Gibson <warthog618@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:48=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, Jul 09, 2024 at 05:48:33PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Jul 9, 2024 at 11:34=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Mon, Jul 08, 2024 at 11:29:46PM +0800, Kent Gibson wrote:
> > > > On Mon, Jul 08, 2024 at 05:19:41PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Mon, Jul 8, 2024 at 5:15=E2=80=AFPM Kent Gibson <warthog618@gm=
ail.com> wrote:
> > > > > >
> > > > > > >
> > > > > > > Would we be able to then have a proper RTD website with a ver=
sion
> > > > > > > selector etc? That would be awesome and it's one of the last =
big
> > > > > > > missing bits for libgpiod to be more available to beginners.
> > > > > > >
> > > > > >
> > > > > > Going forwards for sure.
> > > > > >
> > > > > > Going backwards is more problematic, particularly if changes to=
 the code
> > > > > > docs are required to get them to render properly.  I've got a f=
ew of
> > > > > > those lined up already.  Should be able to work out something t=
o patch
> > > > > > older versions, but haven't put much thought into it at this po=
int.
> > > > > >
> > >
> > > And the python build has changed too.
> > >
> > > > > > Cheers,
> > > > > > Kent.
> > > > >
> > > > > I guess going forward is enough.
> > > > >
> > > >
> > > > I'm not ruling out supporting older revisions - but it will require
> > > > additional work.  Longer term I would like to see all 2.x and even =
1.6.
> > > > But the immediate goal is 2.1 and/or 2.2, depending when it lands.
> > > >
> > >
> > > But of course I have to look into this now anyway, as it impacts how =
the
> > > build is structured...
> > >
> > > I was thinking the maintenance branches could have the sphinx doc
> > > generation backported, and the versions exposed on RTD would correspo=
nd
> > > to the maintenance branches. Those could be updated and rolled out
> > > piecemeal. So I'm thinking that is quite doable.
> > >
> > > Then I recall that the bindings each have their own version, e.g. pyt=
hon
> > > is now at 2.2.0, and rust is 0.2.2, while core is at 2.1.2.
> > > And I'm not even sure what version C++ is at (does that track core??)=
.
> > > How do you want to handle that?  The simplest would be for the RTD ve=
rsion
> > > to correspond to the core/maintenance branch, as I had intended.
> > > The corresponding binding version could be displayed on the page for =
the
> > > binding.
> > >
> > > Would that work for you?
> >
> > What level of versioning clusterf*ck are we on anyway?
> >
>
> It looks to be versions all the way down ;-).
>
> > C++ bindings track the C API version. Rust and Python are entirely sepa=
rate now.
> >
> > For docs: Ideally we should have separate pages for each part of the
> > project: core C library, C++ and Python (there are no Doxygen comments
> > here, only pydoc) with their own version selectors. C and C++ could
> > potentially live together though. Python bindings should probably get
> > their own stable branches at some point but there was no need so far.
> >
>
> I agree - if C and C++ are tied then it is simpler to can keep them
> as one. We can always split them later if the need arises.
>
> Ok then, what you are describing is what RTD refers to as subprojects.
> The sticking point being RTD expects tags or branches to key off.
> To date you've only been tagging and branching core.
> Given the need to backport doc patches, branches would be more
> appropriate than tags.
>

Neither is a problem really. I can tag older commits alright.

> Python can be a subproject, so maintenance branches for any revisions
> you want to expose would be useful.
>

I'll create one for the current python release.

Bart

> > For rust: I think the docs belong on Rust.rs. Viresh, Erik: Is this
> > something you plan to do eventually?
> >
>
> I think you mean docs.rs? crates.io is the home of rust crates, and
> the libgpiod crates are published there ok.  But the docs are built
> separately on docs.rs, and that is where the build is failing - as it
> can't find a libgpiod library for libgpiod-sys to link to.
> So that will need to be built first.
>
> Back to RTD; the RTD Rust page can link to docs.rs - I anticipate that
> fixing the docs.rs build would be easier to sort out than working out
> how to get Rust doc through Sphinx, and docs.rs needs to be sorted
> anyway.
>
> As such, RTD won't need branches for the Rust bindings.
>
> Hopefully that all makes sense.
>
> Cheers,
> Kent.
>

