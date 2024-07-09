Return-Path: <linux-gpio+bounces-8132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C965692BEBB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 17:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8036D28479A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66E519CD09;
	Tue,  9 Jul 2024 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AzA9p8oY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE71DFCF
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540128; cv=none; b=jUc5QuBIpPtfdgqP0uNj5+6gX43p5mN7FdCGuKAfQVhGz4ew1xmcYEiTqJYUeNF5c/0+jeO4FwcT64xUmcr4YdFZtZdTe/UoPW7TLoXPUVsyEu7WCfu0DqsKwRJ2hurWPwIg4gGrvo+Cbkbckmq1hmwjTY+gVqn50cFowKbZbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540128; c=relaxed/simple;
	bh=I8DyZ+1mwIO1dYWBpIlVaw57OqGvYMGeQWKJiLVAcCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEQ2KkGCklO7UhQxYRQyMkvI1OSVLmDT7PNwk3mlRDIhri4SQo3tQu7CDaMbyribwm/GZjHCYYpDxVZenxGBkH+QqPL8wM8qNB08UJ8Je9kSBzG3tjLVV+BN5X2lda/KFfN2K91QNR+aXn2a98P6yQXcAd36DSY3k7tgIqz1ii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AzA9p8oY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e991fb456so4909559e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720540125; x=1721144925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtJfbmdJmsPMydrJ76YueLr3kWtR33DppLJbw70HmKk=;
        b=AzA9p8oYj1M+vODjTnesHsPByqRSMfKCQ94ManyXjXgI407bhVJVfDQcepoD3pxS40
         Xsv3ATqM6BapeXFq/wsIOdqsidRm7Bo2GQ+CAxjiliiYI8sS/NXj2xroTlo3v6c//dIb
         +dHrmhODlCFbrzX4DJks6kjAVbxeIRwTbCVm4ndj589BkeFAZZf2Db13mpTeh5eEz+JC
         slTgR2mSk7cf5lZnaDnFZnwzxQ02Ws0clWmLsYnkql6eN57ebSzk3A6VtIK0YXKF7gYo
         M+bFL8UfQAdu5vbm37tpHWxiei//0hIcNOdTDbtdUUJ9MY/xGJE1lGTvdeOAC6ka9BSo
         9jVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540125; x=1721144925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtJfbmdJmsPMydrJ76YueLr3kWtR33DppLJbw70HmKk=;
        b=QnFwUiliinre2OmRqEHkhrkRNiFsxaCQ5njlMVfCP5LzPZOKjdUlMiXoaZaW7/knM7
         1TwkLQsz1qK0QsKTfVhZxfi0xqDBngurW9HEfCTwJ0sHcRxfvl1WjcdierNP7dsEXtP5
         9agilV8e5eWFat/fGE3Os2NyRUXFjpUu7zomgngzgT42c/alsJ+CAUvoPAQlgeOAmeLb
         8Vamzi6459RpkwgrzycP08/j4Z4Xqy1E/h6NpRYxp8ZPorqeiPg6SXY6QzwWHZfQEn9t
         BS/+vjc8bEAv7/bZMlb9qQCIyhnnLxw1uLhWJrwzVdWRHYaTXWCPQA6BgcCh1rGQAf4d
         bH9g==
X-Gm-Message-State: AOJu0Yzkfhep0Hc0u6yLDRRRXgaAgQpToRtgiC9liJNjMCERFd280ZQg
	swBCXioShptUxMV+CgRBqQd2sW1T9a8gB01GBICVlVdJ3sHvY/8bt2TslYixVDhQRrDIIZZjGb5
	C8/Wz16M0+eT5s2wfBte4gujR5jYP4iO9sFoubQ==
X-Google-Smtp-Source: AGHT+IFThmdPiE9bumtyBVceYNWrmKLI4EUI54m+UBgFPA3jyeDdgChqkQ8NQWPylX9H6DiPH1mL0NRSh4kmkvCxjDw=
X-Received: by 2002:ac2:5188:0:b0:52c:c716:1f09 with SMTP id
 2adb3069b0e04-52eb9d8fdb6mr792128e87.22.1720540125029; Tue, 09 Jul 2024
 08:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705021750.43197-1-warthog618@gmail.com> <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel> <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel> <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
 <20240708151517.GA355364@rigel> <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>
 <20240708152946.GA363324@rigel> <20240709093425.GA153473@rigel>
In-Reply-To: <20240709093425.GA153473@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Jul 2024 17:48:33 +0200
Message-ID: <CAMRc=MdvPUS2eDQ1u4=hK=GhKmeLQsQjaXE2M5xgpeCSH2MEUg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
To: Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 11:34=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jul 08, 2024 at 11:29:46PM +0800, Kent Gibson wrote:
> > On Mon, Jul 08, 2024 at 05:19:41PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Jul 8, 2024 at 5:15=E2=80=AFPM Kent Gibson <warthog618@gmail.=
com> wrote:
> > > >
> > > > >
> > > > > Would we be able to then have a proper RTD website with a version
> > > > > selector etc? That would be awesome and it's one of the last big
> > > > > missing bits for libgpiod to be more available to beginners.
> > > > >
> > > >
> > > > Going forwards for sure.
> > > >
> > > > Going backwards is more problematic, particularly if changes to the=
 code
> > > > docs are required to get them to render properly.  I've got a few o=
f
> > > > those lined up already.  Should be able to work out something to pa=
tch
> > > > older versions, but haven't put much thought into it at this point.
> > > >
>
> And the python build has changed too.
>
> > > > Cheers,
> > > > Kent.
> > >
> > > I guess going forward is enough.
> > >
> >
> > I'm not ruling out supporting older revisions - but it will require
> > additional work.  Longer term I would like to see all 2.x and even 1.6.
> > But the immediate goal is 2.1 and/or 2.2, depending when it lands.
> >
>
> But of course I have to look into this now anyway, as it impacts how the
> build is structured...
>
> I was thinking the maintenance branches could have the sphinx doc
> generation backported, and the versions exposed on RTD would correspond
> to the maintenance branches. Those could be updated and rolled out
> piecemeal. So I'm thinking that is quite doable.
>
> Then I recall that the bindings each have their own version, e.g. python
> is now at 2.2.0, and rust is 0.2.2, while core is at 2.1.2.
> And I'm not even sure what version C++ is at (does that track core??).
> How do you want to handle that?  The simplest would be for the RTD versio=
n
> to correspond to the core/maintenance branch, as I had intended.
> The corresponding binding version could be displayed on the page for the
> binding.
>
> Would that work for you?

What level of versioning clusterf*ck are we on anyway?

C++ bindings track the C API version. Rust and Python are entirely separate=
 now.

For docs: Ideally we should have separate pages for each part of the
project: core C library, C++ and Python (there are no Doxygen comments
here, only pydoc) with their own version selectors. C and C++ could
potentially live together though. Python bindings should probably get
their own stable branches at some point but there was no need so far.

For rust: I think the docs belong on Rust.rs. Viresh, Erik: Is this
something you plan to do eventually?

Bart

