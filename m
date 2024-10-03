Return-Path: <linux-gpio+bounces-10782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38E98EC24
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 11:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25CFD284BFA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 09:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE77213CA8A;
	Thu,  3 Oct 2024 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7etPmRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47679CC
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727946975; cv=none; b=WT2P1yHyqfACKjgkll+1bXf5Gp8+8vl/Z2u89YTF8G2WpmlkHzLGUzWmimX9kS6IEQ0LO3ddAaEiM81KyAB/ThxhyK5964ewASfI5hNrroCr8jn8+GENPfpQaZgl/qsZt75JsZ0Ofh4sAcoGuZBB8RnNtGHgeIZYuKTQTDekP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727946975; c=relaxed/simple;
	bh=cqIz/q248NHRZFnWazh9wBE2O84lP2tM7ri0jEl5POs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEymaydH3nZgtQtnHXajSokoriFKtl8pY+4jci6h/jq1up8FGPkPWsRZq66+MAnVZ4jfw232RqQs+6nP2HtVe5VfTv0daHI+uZOT4lztLqgpXtb/BuhQv4zbrqjCBVL3nEHJ3zAhbtZciQfLvdKVd3AU67oHyDx8mzWamhmVW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7etPmRO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b7259be6fso6689335ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727946973; x=1728551773; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f70yWGJh2QZ+vrSbFG7AohGnPyhD2zhbej6Dffrsn7U=;
        b=J7etPmROucQIADs/lDJHpjDc19SeMIOp1w2jhptNwugnBZP4XJ2KlTmtDpl/d7j0lO
         TIO/AyPcocsd6xe8adxNi1NUiRm053HevwGSS/1CauHI8u1G10UfMHzgPQyUZWAOIfYc
         /srAlRT3LHPB1Lp7dE9lVvprw//Vttfq8Y1N3hzqNe8Zzr91ptUvU3oQ3g+i9MzKAdwo
         jHHLzu0JqPpZOdvaqlxaYNgLVFxK7LUSi4qOiSMLr7sVYrfxibPhAR4nrUL9b5Yh067P
         LGDYs03WlOQEhgK4KHajUKXGW6hch0CoaARq1hjYENcBFFL/id0tJd2FGWDTwUEjIJyA
         UgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727946973; x=1728551773;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f70yWGJh2QZ+vrSbFG7AohGnPyhD2zhbej6Dffrsn7U=;
        b=RGuSvjyIdKArdeLf/tUn2aQQDS4mfVnK8ky49ORVPfGiMc8zidmMv0a3pBubKGGt+z
         CMX4xxNuPWQ9i1rfA664Br9WnotvWUtgu+oZEQgAWmLi0kVUtrP3yIPHHxewi5MueQh0
         DD9NUbTdq+cxiAxQ3KB7yKiKOSJJbcCcpGPk7FoOXT72oixHTGR/87ARxY0rScy7tUR8
         gzixZJjfzJViA2WR07olH1tpqiY+4GWgx1EsJsM04c/PZ1h8MaK6UDwWmJodMfrc6G7p
         5yvdRw59Ep2h2KvPuI5vpwqmQ+hnkiH4QBfmkAeMkg4ne/W6zK+ia+0Bjv3PAhObHpYT
         5Hyg==
X-Gm-Message-State: AOJu0YxfuQIusKh8BMSWaKM8YbBqwhkjSEpL83bkud3iln2vwaknANdz
	NxgAfe7sNnZxrRhvbNK/z7IjUb++Vvk+Y7HAHC/QyWh6q/rbCAo7
X-Google-Smtp-Source: AGHT+IFXD0lUQeQCJz8lwgA0pRsdZgHq0Nf1WNHTqYRafhY8v6wOGhY9hLhksAj9GZHne/T3vm2A/w==
X-Received: by 2002:a17:902:d486:b0:20b:90ab:67de with SMTP id d9443c01a7336-20bc59ae2f5mr87487285ad.8.1727946973451;
        Thu, 03 Oct 2024 02:16:13 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad259sm5328475ad.196.2024.10.03.02.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 02:16:13 -0700 (PDT)
Date: Thu, 3 Oct 2024 17:16:08 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Fazio <vfazio@gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2-rc2
Message-ID: <20241003091608.GA246042@rigel>
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
 <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
 <20241003032457.GA63612@rigel>
 <20241003033640.GB63612@rigel>
 <CAMRc=MfO2NB0jpzhHU-cU00zVesdofM7EUqd11xmE9sCVdBQ-w@mail.gmail.com>
 <20241003085552.GA236079@rigel>
 <CAMRc=Mcut2sGzac6vN2cvGP-DHtgC12BXksTvmcQNBaf_VvpZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcut2sGzac6vN2cvGP-DHtgC12BXksTvmcQNBaf_VvpZA@mail.gmail.com>

On Thu, Oct 03, 2024 at 11:06:34AM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 3, 2024 at 10:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 03, 2024 at 10:45:35AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Oct 3, 2024 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > Why is gpiosim-glib being built?  I'm not using glib.  I don't have
> > > > glib. I don't want to install glib.  But now I can't build. Yay.
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > > >
> > >
> > > That wasn't the goal of course. Let me build a vm with minimal
> > > environment and go through each build option individually.
> > >
> >
> > It was the --enable-tests that pulled in glib for core tests - despite
> > --enable-glib not being selected.  I was able to build everything else
> > without glib by dropping --enable-tests.
> >
>
> Ah, yes but it has been this way for a long time, the test harness uses GLib.
>

I haven't done a build for quite some time - at least none that
involved --enable-tests, so news to me.

Cheers,
Kent.


