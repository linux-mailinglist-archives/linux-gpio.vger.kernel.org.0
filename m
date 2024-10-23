Return-Path: <linux-gpio+bounces-11894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCE99AD8BC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 01:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA4EAB22326
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 23:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDB91E2610;
	Wed, 23 Oct 2024 23:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEFwfvLQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362361BDDF
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729727672; cv=none; b=Pwz0U3T3c92QMXHjVBWpCq2nkDReHbtbGY8RHZCPWOk0LyeClsUSZl3fBflJtNu5yCn7zjoJdtMaKz7aTbJm0RIcOfQdDKyxV0co+nEW+hXzGUHmO/BiMcQKr7CgvpdtBuWpl0w7kEJs47y+mqqry0DqqN2y+yFyqBpq9Ritabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729727672; c=relaxed/simple;
	bh=BPRY1Pjl50eZKFX8bzxsEdSsEdGpFo8A1gpBpZxyIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sglcD/okbf9pVM8BLRU1Vk4SA5lEAnSUZvcIwEbYiTYneoxAyxZufFpZPvm7q+ka2tpSSSd84mHExrY5z9Y0qpQlmvuJMikEzO8RlOOa3hArR65AFcdAINTK+FEyWAf9XUxWXz5/C4+N8EvAfRDdZvAqTLQToDqMT/9ege8OlLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEFwfvLQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso273023a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 16:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729727669; x=1730332469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6M7bart6VPPPSaQUgGeBDuk5Z0ISm2MWm+FhF4l7o1M=;
        b=mEFwfvLQ6mt4+dVz2Gt4Rm1ksP0cBPGBwfDWtM0/GduefyrVkFrS8E0iNlrAynHCda
         H2lXEtpSsUDQyFWXqK0HH/3LXhR8aG0AejnUswcLkIY8btDLjxa59S4y4TWmLVlq0Ezy
         UNPkfrO86rU2PAqeCthUxygKZDJkxMNdg1K9WzfHiOwxU8U7Bv3zCidcA9VMusIA3Z+o
         wJeiIuZc4UAG8qdc9WK8K+Q3L5sG3YrR+Ik+DQRrINa9/9Q9mIk/Cbs1BwxKHGKcnnnK
         U5WT+NGyr91VdqJf4bt/Y2aK+HYyXjmd6FxSolv6YhyokJh0NQ9r+p7vYNsn/Gw8ZnoE
         4Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729727669; x=1730332469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6M7bart6VPPPSaQUgGeBDuk5Z0ISm2MWm+FhF4l7o1M=;
        b=taKx1zoTFF16+aw81GjsQ/a9Xe7ngj1vp4e1sHqpYaPjUBuaDLpwdFuxY1a7lZw8Jn
         pP/Cb7/JX1/ZXrDO2cXnUfTvu9HQI3kZeLrOdW616nUu6UboymADCbGTRZnSbnJsuXOc
         SMG3Wjil6HXTRjPGnQkpXQiG0dyEwAKZzldbjI77O8SLxgftQgmAs7Hq372Fz+2Z9g66
         z5N+i+AtUvLTZ40knlDrYFnmOsFdqJoX/Z+EmNFonBgC1oycGs+v+0Ue1z2zcYJejxdP
         cFpQxSv4msaDe0ezI918yRkEIL1sepgEzkMuS+Ou9uS6CiXMKRD94hzDmFKC6Fj76dfW
         k5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyyVupEAkxuY4GbC/bLlfIaLwpGm+SLAAK91cA7+z9PexIQG37eZmLEJiTCW5BDiFkKE9C+ntxOuAl@vger.kernel.org
X-Gm-Message-State: AOJu0YzAwvl9/NZFz2NrD2toLtPg0WO0tmRwagHxpYHbt5QyRw1leHkj
	x6ud6yvPrIZ9Mmm3Y4AjppIjRqxz2d0wB1sqtLq/svJT20JhadfPlDJwYA==
X-Google-Smtp-Source: AGHT+IFr1az7HTovRjDc3ro0pCx5x3ZedgZjzRTXh0ejC7HkOaN9Tumoys0vDq4+knZkhGm1Hq3jkg==
X-Received: by 2002:a17:90a:6408:b0:2e2:ede0:91c with SMTP id 98e67ed59e1d1-2e77f74e3bfmr120356a91.36.1729727669291;
        Wed, 23 Oct 2024 16:54:29 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a321dsm80844a91.53.2024.10.23.16.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 16:54:28 -0700 (PDT)
Date: Thu, 24 Oct 2024 07:54:24 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [ANNOUNCE] libgpiod v2.2
Message-ID: <20241023235424.GA4180@rigel>
References: <CAMRc=McbWNANVLGSFe6aXjcjMoekUwjov8vM1dSMy03Vp4nXzg@mail.gmail.com>
 <12535751.O9o76ZdvQC@g550jk>
 <CAMRc=Md6j-xizVcYJoC7U03gDspfM6UR_h-1EBHAWhMEo=bRRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md6j-xizVcYJoC7U03gDspfM6UR_h-1EBHAWhMEo=bRRQ@mail.gmail.com>

On Wed, Oct 23, 2024 at 08:17:40PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 23, 2024 at 6:25 PM Luca Weiss <luca@lucaweiss.eu> wrote:
> >
> > On Dienstag, 22. Oktober 2024 13:16:17 Mitteleuropäische Sommerzeit Bartosz
> > Golaszewski wrote:
> > > I'm announcing the release of libgpiod v2.2.
> > >
> > > This is a big update for libgpiod bringing in the D-Bus daemon and its
> > > command-line client, GLib bindings with GObject-introspection and a
> > > slew of other updates and improvements. The detailed changelog can be
> > > found in the NEWS file.
> > >
> > > The goal of the D-Bus API is to address the concerns about the lack of
> > > persistence of GPIO state when the process that requested it exits.
> > > Now the state can be stored inside the GPIO manager with which clients
> > > can interact using a well known protocol.
> > >
> > > The release tarball and the git tree can be found over at kernel.org[1][2].
> > >
> > > Bartosz
> > >
> > > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
> > >
> > >
> >
> > Hi Bartosz!
> >
> > I'm noticing while packaging for Alpine that the file name of the installed
> > lib changed from libgpiod.so.3.1.2 in v2.1.3 to libgpiod.so.3.1.1 in v2.2 - so
> > essentially it jumped back.
> >
> > I'm guessing this is not on purpose and while I don't think it should cause
> > issues in the distro, I wanted to make you aware.
> >
>
> Everytime I do a release, I bump the libtool ABI numbers as suggested
> here[1] depending on how the code evolved between the versions.
>
> I guess I bumped the revision everytime new fixes landed and were
> released in v2.1.x stable branch but for master I only did it once
> when releasing v2.2.
>

If the 2.1.x branch is to continue to be supported then the 2.2 branch
should've gone with ABI v3.2.0 to provide space for subsequent 2.1.x
releases.
If 2.1.x is finalised and merged into 2.2 then it needed to be bumped past
the last 2.1.x, so v3.1.3.

> I'm not sure what exactly should be done with that. I can of course
> set the libgpiod ABI to v2.1.4 in v2.2.1 bugfix release if that
> doesn't cause any issues but it doesn't really feel right.
>

You mean v3.1.4 for the ABI, right??  Otherwise it definitely doesn't
feel right ;-).

There is no need to skip over v3.1.3 since you haven't used it yet.
As I see it, your options are v3.1.3 or v3.2.0, depdending on whether
2.1.x is considered a dead branch.

Cheers,
Kent.

