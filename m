Return-Path: <linux-gpio+bounces-11070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB869953C1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 17:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 373541F21DCF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72CA1E0B8B;
	Tue,  8 Oct 2024 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GJqd3Tva"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A011E04B6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728402432; cv=none; b=DwxWOu4QQm/334mWneGI3xT3Co1wPVoKsOFl7+KZIMd6K5NQTPF65iYq9Mle86uppqMzAkhyqZrYFbouk4nQzj7aOamNL09kwXEJLBQivHfOjAZ9Z5wiGhETyYE1ggB077XrgRHIDe7xjTYLqB3HWudC1rf+3uSzmmPbAuuQLbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728402432; c=relaxed/simple;
	bh=B8Fg4qdDTRYSFJF9olwvFBISLl9UJdDVN4uB5AhRUx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi8nfg/mqZ7kspdvDu7tZGqxNVelzBdivQhjpn2IjAprk41p3Yf4oBI4/ybNiJWgpUDe1RvCu6tN637Vhv5FXADG3uy7qbNGeswp/2R2bi7dCZhGLbEU73EJljOPLBV0Zr6hKBq9PkG1J7iJEJLFv3jrQYwXLGP4BmrwNkutQ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GJqd3Tva; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac5eb10ceso51897611fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728402427; x=1729007227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT6N1PBKTvGo5v5tRump2+HZCh+5tfAk/2bWSk9ekmE=;
        b=GJqd3TvaTPCcfODXfjU590FHf01GSRbkg1nbCvsnrvhYRRDQ2ArG0duY6vxTpiN2kM
         pR+R+mDJZl6dfAMg65dQ5kCShWaB922AUZ8D8qJpw05R8lj7q1YHxFP+Mf2OHzLuhShY
         d+YNcloF4MLdedTGKqc4VIVUAXTrKDyVD6oqISry2vi1CiY0I/F59WwE7lsWz2Yb3b2C
         LCIiFnnHM2BMB0MywBuYpflKVxdo20vrFlnQd2TaCxU8zMgjWYO9qInRodVsLKqwLeP5
         sTiQeSJGR6uoaO3D4KAOJhzq6p9JPJ2+oDXvre1xIh+5bs3wBeraUEYmwtj3aseNxbxo
         EZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402427; x=1729007227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT6N1PBKTvGo5v5tRump2+HZCh+5tfAk/2bWSk9ekmE=;
        b=WjzUcV0nPY1VQeXNsXTIZpoDuRCNLcFeILnnZEpzhDW04+VYYmjX1Y1I8BW7WJoDO4
         Cq7s7xrFRaWmQKOxmsFqzGrKHTjego4569LtQKKk7yKXHcpL5XH13wHGD48Py2YIFfu7
         vAPKAFP5AoWn3Dfrh4da6MxfjO98Vp0xy06unSWMX8KgzY/tNU+40tethOeQleYasSyp
         l/wa6LC3/pfo7VYmX0JNOrHBuxGebKnyzQm1AdkqMXXCrSz/KSYQNrjbwBhdWqMZrK1u
         qB9suiSEOyXOefwOaNAEKPd03UVHWIZpZrhVBQjXWSTqvrueJxAEWrMLa15W3qpvEEkn
         pgrg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+yBfsihqjC62AEvzTfy7g7/jxqEhM1Rqx3iT/BibQCQthjteJN2hqO7u6vXv/EwGtDA0yAzgKJ7i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/87mtNW47H3MpYWVIIFl8eyLaTW3vd/F4zaM1a1BuZXKjXFOT
	YScW6s4BS8EOWnCoMJzu2JHMVl21T6aXDeVW2w7BfA9jCqxtkPdg9MUpo6ZZDSabmcJeb86l5B7
	RbB295P3zUYKN4sAyLdITwOFca0Bwz7YRal/znA4IjhlsqhQK
X-Google-Smtp-Source: AGHT+IE18EtQY/7xrpx3ONmwK1rKLpkhGJ+CVmGobkqbfYN3gh9NtxLhUg6FBKQxZEV3mq2JBpM4ZL3D1deyE/BaURE=
X-Received: by 2002:a2e:bc18:0:b0:2fa:c685:404a with SMTP id
 38308e7fff4ca-2fb1602652emr2152241fa.4.1728402427151; Tue, 08 Oct 2024
 08:47:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
 <20240927-vfazio-mypy-v1-7-91a7c2e20884@xes-inc.com> <CAMRc=MenC69BPpkqkU_9H5_skdeFP1nHTKx5_rHCaG0U5-v0xg@mail.gmail.com>
 <CAOrEah507_TM2JV29agMwGKmvKOTfpPvwO4rLEz7Gaq-NAPmsQ@mail.gmail.com>
In-Reply-To: <CAOrEah507_TM2JV29agMwGKmvKOTfpPvwO4rLEz7Gaq-NAPmsQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 17:46:55 +0200
Message-ID: <CAMRc=MeGoRM+AEz3iq_ox=dWLAF-M5eFkee4hXBvUoHrSee0rA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 07/22] bindings: python: fix Chip union-attr
 type errors
To: Vincent Fazio <vfazio@gmail.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 4:57=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> On Tue, Oct 8, 2024 at 8:16=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> >
> > Ok, so I don't really understand what is happening here. We're going
> > to re-assign _chip in every function? What happens to cast() if _chip
> > IS None?
>
> In this scenario, self._chip cannot be None. The self._check_closed() gua=
rd
> ensures this, however, type checkers (at least mypy) cannot infer that fr=
om the
> current code pattern.
>
> `cast` is informing the type checker that past this point, self._chip sho=
uld
> not be considered as None and it's safe to reference attributes off the o=
bject
>
> This seemed like the cleanest alternative, though others are:
>
> * use a local variable for the cast result. This may be less confusing bu=
t
>   incurs more changed lines
>
>     self._check_closed()
>     chip =3D cast(_ext.Chip, self._chip)
>     return chip.path
>

For the sake of readability, I would lean more towards this option if
I'm honest.

Or even - if you need to use the cast variable only once:

self._check_closed()
return cast(_ext.Chip, self._chip).path

?

> * use asserts. These aren't always enforced during runtime so we cannot r=
eplace
>   _check_closed but it does inform the type checker that it can narrow th=
e type.
>   Using both is ok, just slightly redundant.
>
>     self._check_closed()
>     assert self._chip is not None
>     return self._chip.path
>

Yeah, this isn't optimal.

> * add a `if self._chip is None` check that duplicates _check_closed
> (or replace it completely)
>

Yep, no.

> * other "creative" solutions like a wrapper that returns a Chip or
> throws an exception if it's None.
>
>     def _chip_or_exc(self) -> Chip:
>         if self._chip is None:
>             raise Exception
>         return self._chip
>
>     chip =3D self._chip_or_exc()
>     return chip.path
>

Ugh. I see, cast() is the best solution.

Please consider the small change I suggested.

Bart

