Return-Path: <linux-gpio+bounces-8104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E584392A576
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 17:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 101C41C20E31
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 15:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84BB80045;
	Mon,  8 Jul 2024 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSVjGWf8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8751E4A6
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720451724; cv=none; b=XuZnoRb4Je6AyrnNI/lAc2ARO6rJuvDFDiaZ42zDcn9DfdY5MYaJK9ekbn1E2rtJ/9Pic0syG7PexyE7RIpvJw37u4AYnzXowH11g8IWjTdT3u6sGAMC6OJ0gmcAuh0cDeUiLpOSPmTYLf1goWo4yWawlbKke/sqH8kL2xHsrD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720451724; c=relaxed/simple;
	bh=/N7AbQNznOLvH/admeEuES+189H99niWcnqJEpQIuz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB9kGcoDp8fLCKcveI0QBkpXhAORnBYvWCmeF6CrZDgKYvw2ev8CkOtN0tOskwduXAUCHRtyFf8G1505yiynw9THmbncKp5TkYO3ZzHNKqlNljBJ2kQiMefLwKLxd2QyocumLtJrVYrZrNi9ILwRE4YkjWo4P3ZvaAHjlVmCfms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSVjGWf8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb0d88fdc8so16934035ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720451722; x=1721056522; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTtS+I2hQhM16tvM8TNPX92Jp71BPjuTCXen21HZsTg=;
        b=OSVjGWf8JVypv8OCNmwIlrqmP+l8aIXEMfQMeTM35P/S2IWhR+zUhBAtdI8oTiEZFH
         iE/PnAocrg+cFc+5EhvassxyuCMVIYHrgXpaKN8d04bFaYcNcujX3hHsMybBuYeG1sDP
         6r7OqIUSh7v4teLr6zBYQOHBhV+5uSgmTYWHSOcWZ2kAjgls9gJ5dRZgChl2UKOAmso+
         K3b9kFqu/vfYUw6aKypYmq6ObXkAVcgZtv0QSOj3UU56yo8IoReNU1u1ZvyrUielxkUs
         w7oo1kKE12keCPuBvxCm4UmPsqL9AtaCmxW8FTtb65MR0NezIEs7tD9XF7DzqQiTkUi6
         GRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720451722; x=1721056522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTtS+I2hQhM16tvM8TNPX92Jp71BPjuTCXen21HZsTg=;
        b=rED8We7iRfgDqDSZAG+NRTDsZMGZ6idxzIkhczAsqOlh5x8jQmGsYByuTkalG3c8C+
         vce66Ibn9bJtc62hX8O/alwBh6n5VXtb/OLbTCB9vBNJfeaubdJf7Drnm44bNEC4BcT8
         9c5BWtzEgoizMDBRGoI+9Wioq4FB0ZYEhLv3xnvoF8ySlE8kzC/tCuGr5EuCGIll4DZR
         ujRWscQCsYcaWSUHx+NQgl/sQ+paFbFYDMtC4jdzkFgRkUxzfD1hpRR0OXNyxOgW9W9s
         5G9LZ23CMTT3JZeG8soyrDoEd/gwwFMSo9tJI9B3cbpZ9sf4Mi9iWJRKliWUAP8ZhBVt
         4/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXjbILEqi8A7s71OZL8njMvZ/LJvQWVQ/xdJ5t3IVlAuvvy06CHUW0cSs84h+0oAion8u2KxeKmKpZ1tGFFVcXLQ79D7+Tg6Wnguw==
X-Gm-Message-State: AOJu0YxIXaOBjxRqiLzc4Q/nZ08jcKWod/eA71zCnZIVFOZhnM9ewXKC
	9CeKspk3TX666u5JihquErvkmieqfwzMwatEztud7ixILQaAO9IO
X-Google-Smtp-Source: AGHT+IGzNV4iOKrVupwJL5FxRovAQOwG/LoDCRo729tgmhZFcMKPy7O4Aw1J5WNuCfaiqsve7ImPmA==
X-Received: by 2002:a17:902:da8b:b0:1fb:74b3:53df with SMTP id d9443c01a7336-1fb74b35a58mr28577385ad.36.1720451722212;
        Mon, 08 Jul 2024 08:15:22 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb9482caccsm20940685ad.154.2024.07.08.08.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:15:21 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:15:17 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240708151517.GA355364@rigel>
References: <20240705021750.43197-1-warthog618@gmail.com>
 <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
 <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel>
 <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>

On Mon, Jul 08, 2024 at 03:50:45PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 8, 2024 at 2:43 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Jul 08, 2024 at 01:48:11PM +0200, Bartosz Golaszewski wrote:
> > > On Sat, Jul 6, 2024 at 4:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > >
> > > > > On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > > > > > Generating the latest documentation on readthedocs is broken as the
> > > > > > index.html generated by Doxygen is now being overwritten by one
> > > > > > generated by Sphinx.
> > > > > >
> > > > > > Make Sphinx generate a differently named root page that does not
> > > > > > conflict with the index.html generated by Doxygen.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [1/1] doc: fix sphinx config for rtd
> > > > >       commit: 824c1f39347c2ef46919dfc45e8247441b908827
> > > > >
> > > >
> > > > Btw, I ran across this while updating RTD to v2.1 - their default build
> > > > config has changed since I last updated, so that didn't go as smoothly
> > > > as I had anticipated (the plan was to switch the branch the generation
> > > > uses from my fork to your github repo, but now that can wait til v2.2).
> > > >
> > > > I am also looking at reworking the documentation to use Sphinx/Breathe
> > > > to generate the html from the xml that Doxygen generates, and
> > > > incorporting documentation for the Python bindings, but looking is
> > > > about as far as I've gotten so far.
> > >
> > > YES please! We really need this and I've had it on my TODO list for
> > > far too long.
> > >
> >
> > IIRC we last discussed it a couple years ago while working on libgpiod v2,
> > and then it dropped off my radar.
> > I was looking for something I can work on from time to time in small
> > chunks, and it seemed a good fit.
> >
> > My current WIP is here[1].  It is generating C, C++ and Python docs ok.
> > Still need to workout how to handle the Rust bindings.
> > Once I'm satisfied with the outline I'll back fill some additional text to
> > tie it all together.
> >
> > It is currently generated by libgpiod/sphinx/docs.sh, which is a
> > rough approximation of how it will be called on rtd, with the resulting
> > documentation entry point being sphinx/_readthedocs/html/index.html.
> > That is run in a venv with sphinx and sphinx-rtd-theme installed with pip.
> >
> > It is totally independent of the existing doxygen doc generation/make
> > doc, which I didn't want to mess with.
> >
> > Cheers,
> > Kent.
> >
> > [1]https://github.com/warthog618/libgpiod/tree/doc_revamp
> >
> >
>
> Would we be able to then have a proper RTD website with a version
> selector etc? That would be awesome and it's one of the last big
> missing bits for libgpiod to be more available to beginners.
>

Going forwards for sure.

Going backwards is more problematic, particularly if changes to the code
docs are required to get them to render properly.  I've got a few of
those lined up already.  Should be able to work out something to patch
older versions, but haven't put much thought into it at this point.

Cheers,
Kent.

