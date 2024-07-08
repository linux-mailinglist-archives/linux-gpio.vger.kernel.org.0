Return-Path: <linux-gpio+bounces-8098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FA892A40C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A375C1F2143B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D2C137923;
	Mon,  8 Jul 2024 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dilQ5w+A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F41B970
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720446660; cv=none; b=mnIf9sI0iu0E4xtgOsQ6b5bbxypre6RehJ3BM+09rTsguKJUrToqU9kplQUFOgmVZLzE/kyK6Kz1cROaYzrfaQzyw/vh3NTsfqWkPyQi9SFSuCWNEvhKVqqHZ+5HikgDHJ4f+uY6GsxyvrIYELFS19g0noEkS8rfoezZHZILcYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720446660; c=relaxed/simple;
	bh=R4sZeaZNEHX6vxrwIZR+YnDprmcRSLna9zpO2M98pjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyaMwAWBUabqTpOhFuOL6yV2QuTGD1xeKpKgrjLPHV7aHrTQUvieJiMuwGVlwnUG97LKUmp2MMecpLRioFx0Nn42iqTCzA8dBlKeafVlWMtjrvobUIO2HdEEKO/f7WmotG6ClPqOkxYhF8sb1O5qUuqJ/pMyg33FKRIqFNSWRVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dilQ5w+A; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so4348373e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720446657; x=1721051457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWBiL5XNe6jj6GK8jb4i6FkoBUpy9YvNcIxomP/S6jU=;
        b=dilQ5w+Ac30ETPDa9oCeql0hbOuCc+gGrDsjCfoYpH42ghHZTsZqz0XYB0Oy773WKJ
         HQnrFrKiXXOAYiaq04dybQ17VU9H5xW/zWKgZU6CVblLQCvLkx7G7ETE9+NVb/Ckeiws
         IHRFNbMJNMaLzIhxzv3H2v9Kh9pyRa46GFSUglWUcCa4NogsCEWlYiXHEe3dmTMH12ZB
         RVlwkiSS9Hp9+7XG6ZcjKZUgzZVAP+btzoxggC0OHT/bhyF7+78aLIYpcSPkVEPenEJ5
         cYS2oUllayN20iPgafFM3bygBN8DIMkO8u9L0BvNgaoD+H/1OswuxkTL1O40AwTatFB4
         7lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720446657; x=1721051457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWBiL5XNe6jj6GK8jb4i6FkoBUpy9YvNcIxomP/S6jU=;
        b=SQPbPnOBW+ecNbwSxaarXYILKqlQOjA22336KiZYkmtyyJdp3lkKjcFf6dGThlf0ya
         Ohi9zcodW1McgkKYccu5SRorffK5W7Rofrj4loAL+AvcR0bwHq4SUJkkgMBpCrLjdosD
         sQOLjip+Rk0XgNMDJtYdr9sSXWo2LJbsnPIRk6F4bpAu4tCXLE/GvStgODY+MwiGyJXv
         Dyj+nIHzBj8yoPEIF+rnh4Ww+hSuHcKZLPJDAc8qBIEBJEycNgS4oZV0Mt7tBnEVbkIj
         GFUk8EFjyeyoTKg8q0biFGxkKDio/AcTVKui4+sM8KY09Cy030bsovtdQ98ocfGS6iTm
         GK1g==
X-Forwarded-Encrypted: i=1; AJvYcCUwP0sL0sxfaTv5vyXpZvSVneWeJcIUUgoVjqJ6rNSaEQ457d0WWB8WGIbwsMv1FpPFa/U+E9CMYqtVuWklZ33f4vnAtzt95rYsOA==
X-Gm-Message-State: AOJu0Yx9tcCkinC5YEKfyh2O8qjxz283z7SFDSPElOCqLPC40Ii/rs1h
	BKwyLnIbf6OwOgEkbHo+MjLiN7aGls99P+J79+J4zaAKU5sqlVio8/E0EjsvKKXO+B72OViKhLd
	mEO3jNXH4TV9YIsDcbzo+gAgU0mOst31FQrnMqA==
X-Google-Smtp-Source: AGHT+IEc+xGlQXmS2QGfI0NbFfIt7SJQFZbGfCAexJvz2pLyOrYRrS9vVq5KLdSqrZLHm6S9woGsECwQMb7sYvPMgVk=
X-Received: by 2002:ac2:4db7:0:b0:52c:da09:ae65 with SMTP id
 2adb3069b0e04-52ea06365ebmr7970977e87.9.1720446656548; Mon, 08 Jul 2024
 06:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705021750.43197-1-warthog618@gmail.com> <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel> <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel>
In-Reply-To: <20240708124331.GA255037@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Jul 2024 15:50:45 +0200
Message-ID: <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
To: Kent Gibson <warthog618@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 2:43=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Mon, Jul 08, 2024 at 01:48:11PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Jul 6, 2024 at 4:55=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > > On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > >
> > > > On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > > > > Generating the latest documentation on readthedocs is broken as t=
he
> > > > > index.html generated by Doxygen is now being overwritten by one
> > > > > generated by Sphinx.
> > > > >
> > > > > Make Sphinx generate a differently named root page that does not
> > > > > conflict with the index.html generated by Doxygen.
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/1] doc: fix sphinx config for rtd
> > > >       commit: 824c1f39347c2ef46919dfc45e8247441b908827
> > > >
> > >
> > > Btw, I ran across this while updating RTD to v2.1 - their default bui=
ld
> > > config has changed since I last updated, so that didn't go as smoothl=
y
> > > as I had anticipated (the plan was to switch the branch the generatio=
n
> > > uses from my fork to your github repo, but now that can wait til v2.2=
).
> > >
> > > I am also looking at reworking the documentation to use Sphinx/Breath=
e
> > > to generate the html from the xml that Doxygen generates, and
> > > incorporting documentation for the Python bindings, but looking is
> > > about as far as I've gotten so far.
> >
> > YES please! We really need this and I've had it on my TODO list for
> > far too long.
> >
>
> IIRC we last discussed it a couple years ago while working on libgpiod v2=
,
> and then it dropped off my radar.
> I was looking for something I can work on from time to time in small
> chunks, and it seemed a good fit.
>
> My current WIP is here[1].  It is generating C, C++ and Python docs ok.
> Still need to workout how to handle the Rust bindings.
> Once I'm satisfied with the outline I'll back fill some additional text t=
o
> tie it all together.
>
> It is currently generated by libgpiod/sphinx/docs.sh, which is a
> rough approximation of how it will be called on rtd, with the resulting
> documentation entry point being sphinx/_readthedocs/html/index.html.
> That is run in a venv with sphinx and sphinx-rtd-theme installed with pip=
.
>
> It is totally independent of the existing doxygen doc generation/make
> doc, which I didn't want to mess with.
>
> Cheers,
> Kent.
>
> [1]https://github.com/warthog618/libgpiod/tree/doc_revamp
>
>

Would we be able to then have a proper RTD website with a version
selector etc? That would be awesome and it's one of the last big
missing bits for libgpiod to be more available to beginners.

Bart

