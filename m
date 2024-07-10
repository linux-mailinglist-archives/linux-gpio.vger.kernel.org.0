Return-Path: <linux-gpio+bounces-8152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16F92C813
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 03:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C37282D1D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 01:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F0E1A269;
	Wed, 10 Jul 2024 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="holkUPei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D926F1804A
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720576098; cv=none; b=fjzBhtKtxBf4w2zV0rYx7o9Gxl8CIUFlrnfHjPrD6RWzjjdTbt3Qhf2qlEDr6Zwc4MVTv4xBIjupaimt0jCt6fJvXw215Y2L7CiT/F7DQ64AAUSdr5ZXTWChdoxQ6V23FVeq4GXm72fMoFr7RIDcOv43oFBXTugv4fQjOlGAO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720576098; c=relaxed/simple;
	bh=XFyqAyLGx23PQZ3CPiM/6UWCzgsJf8sG/ayu9BYVfyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQW9wr1cF2of6R0uZKTNV9QqTexz8onner/0k3MYy7m4Mdh5Wbdl9RlpvN7hkHybUxw0OlcNTNEbU3S2JyLmWcoUdwuX0h49lORsaruZpyOnNjiWNg/Fj78BHtlRIyImHzFoZTcvPNORXgWvj7DHZEtJ/4XUaCKJeYTuTkh4nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=holkUPei; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b4267ccfcso1566797b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 18:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720576096; x=1721180896; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YP4O3JH2DlaGBZgfqwZLFFGjaxAys0hzstwFvMv8tPw=;
        b=holkUPeiuBwit7VYqEUmEVB6UKwtBmGtgi0w97C8yHIOd9qaVceHMh1fZcZT0uFXwm
         pjk+ebBU7TCW//NqH1+oLz3H5izXiPrgzs1/9FWBQp9L9a/jpCurHY7NmyIi94Rl/dZx
         A8gnaW6PEOf5W7aXTIWd/Mcoj/kvdH+oQL6Bh/Y5sRJWJJnLIjJzCpcRBwiIjR7DvQkZ
         LLuhSXW9+9fS5YPSZt4kbiatSLtnSzG463wDGxihin4s6HF9d9Uo0OhQIYQ2IOstj9I4
         0PBb85+9sO0QKyAxOMvMaJDKoATwrqqf1qWYbzWubpj4UZmP8uSPwgf5XddA7+NwxB4I
         8rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720576096; x=1721180896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YP4O3JH2DlaGBZgfqwZLFFGjaxAys0hzstwFvMv8tPw=;
        b=LORDOH/z7rnesWCU7DnN/qzlLSPiNkYn6WZWLoIpalLA7xtUN3Pt2Wft0X1NtgdhaI
         ei41Aeqyxcgp5B8Akeau16WYSIRHueMj1HOyy4pGTn1eP/m+sA4eyVGrZ/Nh06P2E1mm
         mkdxRydA6gFwD3STQS/OfIGWQ1/CHOnYo/s52oylvseIAJfL7n7nWNzB00VfPmssKB15
         SEeWJPcCI/bQu+NVrtuubYsSllhaNbmPGNBWCvVz3rvMiLOdbpcyyvhtqgw8fWvXZGAA
         j2CnqjYsd2nsSpwiFrVj4EZyi1x9qwvp6Shi44w7zlBIW1yjKfgfH51NXbx0KwJX1/5P
         q8PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOjFU0o3z0H6CLwPwKcVzF/pSYhiWxQWDNNw47TmAlu1I6gNbiAj99nQnO0Lc2PqQUQahAAuwT6QjnCFK+cCDNIiGLPEpr0c8IOw==
X-Gm-Message-State: AOJu0YwjgSBh9FIF1xNnxiItGR8LleoBfl/nDqnn/z8vNlVmfau4A2bb
	S9bXrHoOCef1nCmPI2Gh81wqp4XWIFjBsGEuq9nREirzPWzMAaLP
X-Google-Smtp-Source: AGHT+IG1vkvACHrNzBom567VdHkMrSrE/KOob9bngHpaLOndhLZzAxJjrTMnMMZ6/ovN1f0iFSUo0w==
X-Received: by 2002:a05:6a00:3d08:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-70b43576a80mr4319114b3a.14.1720576095935;
        Tue, 09 Jul 2024 18:48:15 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439f0370sm2502439b3a.219.2024.07.09.18.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 18:48:15 -0700 (PDT)
Date: Wed, 10 Jul 2024 09:48:11 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240710014811.GA3616@rigel>
References: <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
 <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel>
 <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
 <20240708151517.GA355364@rigel>
 <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>
 <20240708152946.GA363324@rigel>
 <20240709093425.GA153473@rigel>
 <CAMRc=MdvPUS2eDQ1u4=hK=GhKmeLQsQjaXE2M5xgpeCSH2MEUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdvPUS2eDQ1u4=hK=GhKmeLQsQjaXE2M5xgpeCSH2MEUg@mail.gmail.com>

On Tue, Jul 09, 2024 at 05:48:33PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jul 9, 2024 at 11:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Jul 08, 2024 at 11:29:46PM +0800, Kent Gibson wrote:
> > > On Mon, Jul 08, 2024 at 05:19:41PM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Jul 8, 2024 at 5:15 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > >
> > > > > > Would we be able to then have a proper RTD website with a version
> > > > > > selector etc? That would be awesome and it's one of the last big
> > > > > > missing bits for libgpiod to be more available to beginners.
> > > > > >
> > > > >
> > > > > Going forwards for sure.
> > > > >
> > > > > Going backwards is more problematic, particularly if changes to the code
> > > > > docs are required to get them to render properly.  I've got a few of
> > > > > those lined up already.  Should be able to work out something to patch
> > > > > older versions, but haven't put much thought into it at this point.
> > > > >
> >
> > And the python build has changed too.
> >
> > > > > Cheers,
> > > > > Kent.
> > > >
> > > > I guess going forward is enough.
> > > >
> > >
> > > I'm not ruling out supporting older revisions - but it will require
> > > additional work.  Longer term I would like to see all 2.x and even 1.6.
> > > But the immediate goal is 2.1 and/or 2.2, depending when it lands.
> > >
> >
> > But of course I have to look into this now anyway, as it impacts how the
> > build is structured...
> >
> > I was thinking the maintenance branches could have the sphinx doc
> > generation backported, and the versions exposed on RTD would correspond
> > to the maintenance branches. Those could be updated and rolled out
> > piecemeal. So I'm thinking that is quite doable.
> >
> > Then I recall that the bindings each have their own version, e.g. python
> > is now at 2.2.0, and rust is 0.2.2, while core is at 2.1.2.
> > And I'm not even sure what version C++ is at (does that track core??).
> > How do you want to handle that?  The simplest would be for the RTD version
> > to correspond to the core/maintenance branch, as I had intended.
> > The corresponding binding version could be displayed on the page for the
> > binding.
> >
> > Would that work for you?
>
> What level of versioning clusterf*ck are we on anyway?
>

It looks to be versions all the way down ;-).

> C++ bindings track the C API version. Rust and Python are entirely separate now.
>
> For docs: Ideally we should have separate pages for each part of the
> project: core C library, C++ and Python (there are no Doxygen comments
> here, only pydoc) with their own version selectors. C and C++ could
> potentially live together though. Python bindings should probably get
> their own stable branches at some point but there was no need so far.
>

I agree - if C and C++ are tied then it is simpler to can keep them
as one. We can always split them later if the need arises.

Ok then, what you are describing is what RTD refers to as subprojects.
The sticking point being RTD expects tags or branches to key off.
To date you've only been tagging and branching core.
Given the need to backport doc patches, branches would be more
appropriate than tags.

Python can be a subproject, so maintenance branches for any revisions
you want to expose would be useful.

> For rust: I think the docs belong on Rust.rs. Viresh, Erik: Is this
> something you plan to do eventually?
>

I think you mean docs.rs? crates.io is the home of rust crates, and
the libgpiod crates are published there ok.  But the docs are built
separately on docs.rs, and that is where the build is failing - as it
can't find a libgpiod library for libgpiod-sys to link to.
So that will need to be built first.

Back to RTD; the RTD Rust page can link to docs.rs - I anticipate that
fixing the docs.rs build would be easier to sort out than working out
how to get Rust doc through Sphinx, and docs.rs needs to be sorted
anyway.

As such, RTD won't need branches for the Rust bindings.

Hopefully that all makes sense.

Cheers,
Kent.


