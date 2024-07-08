Return-Path: <linux-gpio+bounces-8105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3092A581
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 17:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E481F211D6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 15:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C9013C69B;
	Mon,  8 Jul 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z68SGkFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB176035
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720451996; cv=none; b=BTWuRj1Smuh0iVVUTsn8S4LGwEf/M1uxNUGlVZkVm9hWsM9ls5/SfW9qV3LcVR27DizJNXeDLkgkz71tV5Fr1xI/DAGa0gnLOc5tz0feFo7/Ja56UkpUhNboRwIefSH0L27IVC9vIsWzcUVOgPa1suBIsiktIkA7V8i8H1HOfSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720451996; c=relaxed/simple;
	bh=pwCmaRGeAdlACyBJzkGDjLy3FHsQdXHrIa7/8J/f0uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAmVOrcOObK38K/YnkUU4Jw9JspEtJzeiKo77kF51B6J1+JgSawB1gezSVvxrlDR5aSKU8JgdDhGUsHPUr7bLIXt4eDKOJVo3EpTn2ITLHf8i8ogpf/jTEAWAhkwg8iwYkdlRpVQEG4iQ8c1Fvezdu1oQSUQPn/ABKZ2rleCbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z68SGkFM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so4068201fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720451993; x=1721056793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMlVt4+GlmXp4tmvqWD8XsS0fTAdb6XE2pcN/R3NWRA=;
        b=z68SGkFMsID1yh5yQryMkOxRTQAaXTAgpQOoQ1zGF4NakZc0F46LgFCn5wf9Z1iZUy
         Hnz955gv3VKVI0nhljZsDE27+cy7voFZSDmg+JM2GqC3QhNMbKrY+yiRTZr/m9wbF6rJ
         6a9ot5E1Xk83HxXY5KciWfZEzwvVDKZGQTguDovqGm0cuuoV/JhAMOyPZKmOWMNZHA1w
         Wbqn90slBYXyYjYNJJ9oUzKugJ5pZJW0hMenOqn0LJNqra92HxLoQBhSLvDfpVw8GZ+a
         UoM8i3HAuRfmkU7XFiFqXr8UKWMjPIktFjWKJm73ntqM9SHjac4DPAJ62f1nPFw/mwgS
         1M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720451993; x=1721056793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMlVt4+GlmXp4tmvqWD8XsS0fTAdb6XE2pcN/R3NWRA=;
        b=wKodEabl+8WJPdXH85oQ7X8gor/YEJf9ImvwHb632IfqwyUFuSd97okLQkh16cMVI1
         8jSOHJnjLfeypURwtYNFs65z9z9Umk5koU3VZrlkbEjHTw9xzf73lmo+h7jVNO9v5E2N
         Xk5Fyk2Sab0Qo97a0UFDRRiAy936nK9f+v2H9RO2uhRKLlLCxNd8j2fFXYGODxm9v4Vb
         hxe0ITKEpuyhK4j83vGg+iC4x9LLBGM2awlVaNoZs694d7mg3U1vTEDbo9HDLwBaGoAT
         QLxUM2ncv/Awg1Eujnz3HjguIBJuolKR7/3wON0Nk+JQdxapeUKRpfVWDkxV1ClDxQgm
         aOTg==
X-Forwarded-Encrypted: i=1; AJvYcCXmhfCpPpJomuS8OHGgYhkGsPGO6LPLas3OHBByYggbmYHI1jM+cq0d1+2DjDvU5uEyy8vmOycaLXvX3/FM2Y3rDS3P6LhMxM5GUA==
X-Gm-Message-State: AOJu0YzBPJkv/wafMsHvNmkxVv0ppQUQBMiZvWcUIAm6o6CYPlRHUgi3
	yb7FPUxck5ijP/l6/IM+tJBMfzsTgujeXlvpMMwfxpbz97QaWlx+KQ+fZSHetE8NT6kKDSbIm2V
	waKYMMCLbdP1QO2HjTXy+vmjySDGTOw4azvdrQA==
X-Google-Smtp-Source: AGHT+IG/BXpfXpStoilTspFpJHJHCDwLF1BVchuy75q3p4/UUnv6tXSzxAG5YZ+AATJ7r2IylGUOrChq6lAXduuR4EA=
X-Received: by 2002:a2e:3e17:0:b0:2ec:4d03:d5ee with SMTP id
 38308e7fff4ca-2eeb3198b63mr74721fa.51.1720451993082; Mon, 08 Jul 2024
 08:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705021750.43197-1-warthog618@gmail.com> <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel> <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel> <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
 <20240708151517.GA355364@rigel>
In-Reply-To: <20240708151517.GA355364@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Jul 2024 17:19:41 +0200
Message-ID: <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
To: Kent Gibson <warthog618@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 5:15=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Mon, Jul 08, 2024 at 03:50:45PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jul 8, 2024 at 2:43=E2=80=AFPM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > > On Mon, Jul 08, 2024 at 01:48:11PM +0200, Bartosz Golaszewski wrote:
> > > > On Sat, Jul 6, 2024 at 4:55=E2=80=AFAM Kent Gibson <warthog618@gmai=
l.com> wrote:
> > > > >
> > > > > On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > >
> > > > > >
> > > > > > On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > > > > > > Generating the latest documentation on readthedocs is broken =
as the
> > > > > > > index.html generated by Doxygen is now being overwritten by o=
ne
> > > > > > > generated by Sphinx.
> > > > > > >
> > > > > > > Make Sphinx generate a differently named root page that does =
not
> > > > > > > conflict with the index.html generated by Doxygen.
> > > > > > >
> > > > > > > [...]
> > > > > >
> > > > > > Applied, thanks!
> > > > > >
> > > > > > [1/1] doc: fix sphinx config for rtd
> > > > > >       commit: 824c1f39347c2ef46919dfc45e8247441b908827
> > > > > >
> > > > >
> > > > > Btw, I ran across this while updating RTD to v2.1 - their default=
 build
> > > > > config has changed since I last updated, so that didn't go as smo=
othly
> > > > > as I had anticipated (the plan was to switch the branch the gener=
ation
> > > > > uses from my fork to your github repo, but now that can wait til =
v2.2).
> > > > >
> > > > > I am also looking at reworking the documentation to use Sphinx/Br=
eathe
> > > > > to generate the html from the xml that Doxygen generates, and
> > > > > incorporting documentation for the Python bindings, but looking i=
s
> > > > > about as far as I've gotten so far.
> > > >
> > > > YES please! We really need this and I've had it on my TODO list for
> > > > far too long.
> > > >
> > >
> > > IIRC we last discussed it a couple years ago while working on libgpio=
d v2,
> > > and then it dropped off my radar.
> > > I was looking for something I can work on from time to time in small
> > > chunks, and it seemed a good fit.
> > >
> > > My current WIP is here[1].  It is generating C, C++ and Python docs o=
k.
> > > Still need to workout how to handle the Rust bindings.
> > > Once I'm satisfied with the outline I'll back fill some additional te=
xt to
> > > tie it all together.
> > >
> > > It is currently generated by libgpiod/sphinx/docs.sh, which is a
> > > rough approximation of how it will be called on rtd, with the resulti=
ng
> > > documentation entry point being sphinx/_readthedocs/html/index.html.
> > > That is run in a venv with sphinx and sphinx-rtd-theme installed with=
 pip.
> > >
> > > It is totally independent of the existing doxygen doc generation/make
> > > doc, which I didn't want to mess with.
> > >
> > > Cheers,
> > > Kent.
> > >
> > > [1]https://github.com/warthog618/libgpiod/tree/doc_revamp
> > >
> > >
> >
> > Would we be able to then have a proper RTD website with a version
> > selector etc? That would be awesome and it's one of the last big
> > missing bits for libgpiod to be more available to beginners.
> >
>
> Going forwards for sure.
>
> Going backwards is more problematic, particularly if changes to the code
> docs are required to get them to render properly.  I've got a few of
> those lined up already.  Should be able to work out something to patch
> older versions, but haven't put much thought into it at this point.
>
> Cheers,
> Kent.

I guess going forward is enough.

Bart

