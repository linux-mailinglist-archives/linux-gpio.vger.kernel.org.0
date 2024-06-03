Return-Path: <linux-gpio+bounces-7061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476A8D8197
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29085289096
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E486244;
	Mon,  3 Jun 2024 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UCbiRKk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884B86146
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415490; cv=none; b=rOHz8P6U8l1y3VizP6N57rjHSAFGisJNWndk4nvhy3OoX3Zh+3AO7un+zwj9Y/llmf2yiPbfczRJPBJAG/PhBQfPjW9/n39wFLBry4Vgiot06o4MjV5NOyiKSvMRRwpokPRc6xF6V5AIAwwuzn9hXmm4nvuNb/tKSCp380RDYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415490; c=relaxed/simple;
	bh=C9go8wK0D7ON0CDJvJHACbY30FzO+O/zEJz74vr37eQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMyQFWdQWD+weAxF3Qiy64AwWmFSyH+ncyvhjZMtg/WyNe3XYNiMqKFdW9I407r2K+8rdBeA42kd9Xr9W9QxvbtAU7Rr+T0BxX9wCfevMNgmBmIh92xPuXLgQ8CTXKoOQ7Xp/LpgekiHnt5HJk+AXU7QD8P5TA/5oFRxRICr+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UCbiRKk4; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e95a883101so55714381fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717415487; x=1718020287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xoUB4VMgPtU5rOPvBmqV/y4x2edJ2qZo4fdswVB8AE=;
        b=UCbiRKk4SX62MqtCy2ZquYtBvmbNr8z0RxwF70fKH5TnC6nYThtmPO+EAZPRtnTeVP
         xMHu6kqG1R/iGCmhwkNROvcowspcIH6Mvq1BWIugVodaT3D5p0GlFcYVCtG+eGlip15s
         gRA1JEBDnenPPUJlPjHk0dN7mTuMeVtXbwPcxFmkB26Jznjgp1yThqcdpESzmx5wBA03
         AgciMi8KBs8/athWfHjvbS0YfRABoF1+3e12RVUsy0Pe1XC35AUleg4JYCwDcwonxbLq
         RVpld8ZwoJFmhAPOXZhXNWPqBEBnUnSVxYFsDDs1xMmzPFWFmzptOw9ZJT76mvRkeEJy
         DaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415487; x=1718020287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xoUB4VMgPtU5rOPvBmqV/y4x2edJ2qZo4fdswVB8AE=;
        b=ATZSL0c9L0aYIkOUs1lg4q//DTb0V+fluDp5hg5TK2id6LfKeNI/GTxv7n31bmmuaM
         rAOO3MWI2PQMI78TOgpGFXOJHjnAQw9TYU10mJb9GiD6ZQN55y5Ia06EF3KwSMgMImJg
         LPjgU3o+Wk3p4MeNE8sCGnBNLQhOxF1bFU+5fLWJYpJ+1pKH2LNODqiXZu+vsjur/ysj
         LU1+VezS8zVV8Yqi2JA6Cl2vnTfN8CF3fxMt+8uN79oYD3hKPyZ12C45y1gGjbp9KuyE
         yI0mIn9GWuuSiDRwQn2Oftv5jDh+albztlky+blS/cS+4/crcQlgHMMewwDdItiWsA9o
         jjFA==
X-Gm-Message-State: AOJu0YxQCAs4Ul1DthUKVI20SAOnqHPyD1YhkJ70lYSgLYC3bAqMTgMw
	7ldg/uXJAgxiU3ve+tTF28Hia4Fn2AIyCQGQXH+mWIZ3xfVYXvdovHu4A8KWrYZhaoYIimMFcQF
	ORmUG+K09EOzSs0vdtaUMSlq2QN9XWUTCd70WxM4j6BJJ0fPJ
X-Google-Smtp-Source: AGHT+IHXAEiUdWsp0Ri2CpEdHhSdXndJuVWJ45UYk+q2Cb2h4c/0OcYyLtBgKmh6BgOQHPbNuRyc0uvGOA91pjQB4WY=
X-Received: by 2002:a2e:b818:0:b0:2e9:820a:abfe with SMTP id
 38308e7fff4ca-2ea950c0482mr58637991fa.4.1717415486668; Mon, 03 Jun 2024
 04:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531134512.443850-1-warthog618@gmail.com> <CAMRc=McChxEY2cnbzmHY1LAwSAxT5+irRWtbv3KqW8anDgfL4Q@mail.gmail.com>
 <20240603104308.GA95478@rigel> <20240603105914.GA97042@rigel>
In-Reply-To: <20240603105914.GA97042@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 13:51:14 +0200
Message-ID: <CAMRc=McWZBVpuQDS__NjP-abq-=RBG-wqmH3VD0dQ6DbAGAB8g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/8] tools: tests: fix shellcheck warnings
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 12:59=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jun 03, 2024 at 06:43:08PM +0800, Kent Gibson wrote:
> > On Mon, Jun 03, 2024 at 12:40:37PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, May 31, 2024 at 3:45=E2=80=AFPM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > >
> > > > Following up on recent discussions, this series fixes all the warni=
ngs
> > > > detected by shellcheck.  The resulting tools test script is now cle=
an,
> > > > at least from the perspective of shellcheck.
> > > >
> > > > These fixes do not correct any known issue, other than shellcheck
> > > > reporting them as potential problems, the intent is to remove commo=
n
> > > > shell issues that may impact future changes, and to simplify checki=
ng
> > > > that any subsequent changes to the test script constitute "good" sh=
ell.
> > > >
> > > > All the patches other than Patch 8 address a particular warning.
> > > > They are reasonably self-explanatory, but each commit comment inclu=
des a
> > > > link to the relevant warning(s) which describes the issue and the
> > > > appropriate corrections.
> > > >
> > > > Patch 8 addresses a number of warnings, all related to word splitti=
ng
> > > > and globbing, and those constitute the bulk of the changes.
> > > > Some of the earlier patches also address trivial splitting/globbing
> > > > issues where that would prevent a line being modified multiple time=
s.
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > > > Kent Gibson (8):
> > > >   tools: tests: don't mix string and array
> > > >   tools: tests: don't declare and assign separately
> > > >   tools: tests: fix unused variables
> > > >   tools: tests: use read -r to avoid mangling backslashes
> > > >   tools: tests: don't use variables in printf format string
> > > >   tools: tests: check exit code directly
> > > >   tools: tests: shellcheck don't follow sourced file
> > > >   tools: tests: avoid splitting and globbing
> > > >
> > > >  tools/gpio-tools-test.bash | 459 +++++++++++++++++++--------------=
----
> > > >  1 file changed, 234 insertions(+), 225 deletions(-)
> > > >
> > > > --
> > > > 2.39.2
> > > >
> > >
> > > Ugh, you added links after the SoB and it messes up with b4. Can you
> > > resend it with links before any tags? Or better yet: make [x] into
> > > Link: [x] so that b4 can interpret it correctly?
> > >
> >
> > hehe, yeah I wondered about that after I'd sent it.
> > I'll fix for v2.
> >
>
> Can I confirm this is the format you want:
>
>     Link: [1] https://www.shellcheck.net/wiki/SC2145
>
> cos that makes checkpatch.pl unhappy.
>
> Thanks,
> Kent.

Ok then make it:

[1] ...
[2] ...

Signed-off-by: ...

