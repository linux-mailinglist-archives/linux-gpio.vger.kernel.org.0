Return-Path: <linux-gpio+bounces-11909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B89ADF80
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 10:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332981C216FE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396E91B21A2;
	Thu, 24 Oct 2024 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TCviJEoR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF361B0F37
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729759928; cv=none; b=Dygeced29JDKrJTOacECW0ywnOj4UFv4ujpPqYfbpVrguJQTou4ZRSHgXsLoGo+Xijz27ETogA3WutWTY+TXHldLuPVf0RVP/m4EVgslp0H+lZhQlZg/ThMPEAxpev1VO2emsZ39C3bxjlFOR06y+WTGQQTGtIH0MieJqSyocw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729759928; c=relaxed/simple;
	bh=uMvHJKa4mEROjJG2PAs1j+egAUpFeUv3XPkFaUQSNZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0GmH+5xnfd/Rjw0nzTYfRSQnm+rjRnnKu4FuDrEH/tLRnf74JdfTS029TTThiwJPO5Jul2mzt+RaH/2x4tBIl+MX91J+jolDo+ZY9bl1PJF5GrV67ehsy5Jfh++1bEqWZdORXLNlAsjpWhPA3MX0zQpRmBlZy5aWScMQZSUyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TCviJEoR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so796374e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729759924; x=1730364724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIjZ4idjUa4SXQOLvOuypbc09gBZQhFpkeYfTwgOcw4=;
        b=TCviJEoRcoT2Z2CRDrDRgx0kbCO6sOWo0bsOzLbSZz23ROmjztwSemQR3W+CVkmWxJ
         lFayzuVFm9EXXcO9Qd6sCzvIZm15c2p6GUDOQrgA3u6hzMV4d8PuzabC8XUWecCa24CO
         PkSzySGYRh/cIdFhSLi/7FMWqhr/44g7QTk3P64g4/dE1cgQhin9u/TQ+RTC70D+m9S5
         Uxi/P1aap075x0n7LPb4pJxQS7dOa+nqD00ClhPFOXbd5NXi6imG+dZnJeRcc6GO4QzJ
         eGZ8BHD0q6zgNQ031apLFGmYOvLma6emFaTf8kiE8untglEEJn4BAWXGinqJWdI/7mCJ
         6ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759924; x=1730364724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIjZ4idjUa4SXQOLvOuypbc09gBZQhFpkeYfTwgOcw4=;
        b=hvdUAZzCTiJoluymDQxzF4tHifNW87VZog0oJ66DpyLi2RT0uEr4BXlZ2iFv7OqDPg
         yIw/PImS4EmqmFiolQ849uOk5hyb5F0OXOEqk4hmmhi7ERJ5cvbjtEoBizZl24QbAaDA
         VtqzS8NsYX7E+UpqGGR2cRQpUeWCIuInxpjXMmDAMkxvHPZFSevKtW9bfKyqrdCmGKa1
         qPOCJgUXfxYNJtY8ASmVy/dfggwvd6b5pEvSpgzGozflOdRnyNp7xKhVBPPRc57ankXo
         f3MyYm5eF9/RXftiX9mgl+ydI65zheIcONl7QYNDU4wYwheJUAUSSzf63EqrUm00XFbm
         rdUw==
X-Forwarded-Encrypted: i=1; AJvYcCX7eE1KuxDEYutXxE7+drjBZIBsSebaYSl4FPlKl7XRjpxUd4NumBNGh4yjCuzyHoOBMRjNXe2B4aPe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ScR5jpu8Rfi4hPot2muBXGxiX4I4LthEWDtM3GWT6umoEdiD
	TIRoq/wF9yMk1v782fNydyjWKCQeG6YuI74tOmTNRoD5j9oHeLytH6XX4ITWH99u3diOOH9Ke8c
	vRm485HNP8UP6ROhkFbglUpPLsgbAxLfwGPIst/dHaa8HLZAe
X-Google-Smtp-Source: AGHT+IGzdLGTXcGnAjrFOelLXbwgCPuJARxl0ZBITGikXjJUNbjRsY6GoYtnMLW8inEb7xE2Fg0hSiFhO4zbT6i//+w=
X-Received: by 2002:a05:6512:b85:b0:531:4c6d:b8ef with SMTP id
 2adb3069b0e04-53b1a2fe298mr3188494e87.6.1729759923705; Thu, 24 Oct 2024
 01:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McbWNANVLGSFe6aXjcjMoekUwjov8vM1dSMy03Vp4nXzg@mail.gmail.com>
 <12535751.O9o76ZdvQC@g550jk> <CAMRc=Md6j-xizVcYJoC7U03gDspfM6UR_h-1EBHAWhMEo=bRRQ@mail.gmail.com>
 <20241023235424.GA4180@rigel>
In-Reply-To: <20241023235424.GA4180@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 10:51:52 +0200
Message-ID: <CAMRc=Mc49inFF57dL933txgcs9u4_WT9eutpbW9xw11rCd_PRg@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2
To: Kent Gibson <warthog618@gmail.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 1:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Oct 23, 2024 at 08:17:40PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 23, 2024 at 6:25=E2=80=AFPM Luca Weiss <luca@lucaweiss.eu> =
wrote:
> > >
> > > On Dienstag, 22. Oktober 2024 13:16:17 Mitteleurop=C3=A4ische Sommerz=
eit Bartosz
> > > Golaszewski wrote:
> > > > I'm announcing the release of libgpiod v2.2.
> > > >
> > > > This is a big update for libgpiod bringing in the D-Bus daemon and =
its
> > > > command-line client, GLib bindings with GObject-introspection and a
> > > > slew of other updates and improvements. The detailed changelog can =
be
> > > > found in the NEWS file.
> > > >
> > > > The goal of the D-Bus API is to address the concerns about the lack=
 of
> > > > persistence of GPIO state when the process that requested it exits.
> > > > Now the state can be stored inside the GPIO manager with which clie=
nts
> > > > can interact using a well known protocol.
> > > >
> > > > The release tarball and the git tree can be found over at kernel.or=
g[1][2].
> > > >
> > > > Bartosz
> > > >
> > > > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > > > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
> > > >
> > > >
> > >
> > > Hi Bartosz!
> > >
> > > I'm noticing while packaging for Alpine that the file name of the ins=
talled
> > > lib changed from libgpiod.so.3.1.2 in v2.1.3 to libgpiod.so.3.1.1 in =
v2.2 - so
> > > essentially it jumped back.
> > >
> > > I'm guessing this is not on purpose and while I don't think it should=
 cause
> > > issues in the distro, I wanted to make you aware.
> > >
> >
> > Everytime I do a release, I bump the libtool ABI numbers as suggested
> > here[1] depending on how the code evolved between the versions.
> >
> > I guess I bumped the revision everytime new fixes landed and were
> > released in v2.1.x stable branch but for master I only did it once
> > when releasing v2.2.
> >
>
> If the 2.1.x branch is to continue to be supported then the 2.2 branch
> should've gone with ABI v3.2.0 to provide space for subsequent 2.1.x
> releases.
> If 2.1.x is finalised and merged into 2.2 then it needed to be bumped pas=
t
> the last 2.1.x, so v3.1.3.
>
> > I'm not sure what exactly should be done with that. I can of course
> > set the libgpiod ABI to v2.1.4 in v2.2.1 bugfix release if that
> > doesn't cause any issues but it doesn't really feel right.
> >
>
> You mean v3.1.4 for the ABI, right??  Otherwise it definitely doesn't
> feel right ;-).
>

Yes, of course!

> There is no need to skip over v3.1.3 since you haven't used it yet.
> As I see it, your options are v3.1.3 or v3.2.0, depdending on whether
> 2.1.x is considered a dead branch.
>

I'd go with v3.1.3 as this reflects what happened in the libgpiod
shared object - there are no new interfaces so it makes no sense to
bump the age. I also don't plan on supporting the v2.1.x branch
anymore so v3.1.3 makes the most sense.

I'll address it in git for the inevitable v2.2.1 release.

Bart

