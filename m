Return-Path: <linux-gpio+bounces-16631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F6A46209
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 15:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5C03AEE1B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 14:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC14221DBC;
	Wed, 26 Feb 2025 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/dUISma"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7021E0AF
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579281; cv=none; b=Qepocayjo8U8jzsMtxDwkPXooj1FIeGXAs9oyhz5/dcuVRuKbZkd+cWwC1H9IhqdICEwMqtyEPKjy0BS4radAUFHw/bWlqWyX550Q2RpIGeI+IA4KL9fgO9aR8YZS/EMUeDHy0WHKAJMJFWrcccCS2RkNLTwDyPB+JOy4Cqi7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579281; c=relaxed/simple;
	bh=LX2XSUIj2bqmtXIFEbc/wRFdKzgVtWlqUTiSBuY3DCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9RyzR77IlGIC2xvdGFykfl/bJFR68ivdfwHduDh8Yqt15OTDsLYnib0MnyIedY/JqYhdzdBbdZMUPxJ6VqZ41khGBbbN6SBecTF6sa+Xzi26IroCS23L7IZ7VYvaeoju8qT69wplXIUmmPDtgie5W+x2oSj9XI/bvzMyZSBL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/dUISma; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e606b74ccc0so2796301276.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 06:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740579275; x=1741184075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX2XSUIj2bqmtXIFEbc/wRFdKzgVtWlqUTiSBuY3DCk=;
        b=k/dUISmaK7iNxvCp1KgDkJA3F4naHAjCMZJsTqEAaWiUWgHOYN+1Y1K9YVaCpOr8wD
         yeEx1bxbwl5bD42fyOFF0sCn0JpJLE4k7ajdwpD016Tjd11XH6OrFd5C3v6PMUqu+H2R
         w00pOibPbdNk6/mmALYULTx3gTTf2zY4QJClUKrI7Es2BU6G/AWSE3c7bTME75aPhf3j
         dGO1o1ZOlhHv8gcSbaupb20cSw/hZtGPqI9mr496VhyiTC25Y2e5gS3gJPNhekCmTmji
         exX6Q/HYL0Sd+zkjBjALWtTolJLmat3pd0Pag4gJ7zBcQZMSUvpITEhTmjT870Ztq+jL
         Stlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579275; x=1741184075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX2XSUIj2bqmtXIFEbc/wRFdKzgVtWlqUTiSBuY3DCk=;
        b=DB9fZWBUxsPnXe3dh8V3trD9pbpHGVq8xi5BU7OW+7zZ+gYm8UP9fOP1tu81WHQDdv
         dVTmQGDXKTH1qG6rgDyHZJeq3m03HW4AC66Q7EpyZ/cR4rVLg4lg96jwQwdnbDFxJXHM
         2XThsJAWZChPkySD5qWZzZFBxxNnUEmxtmj0SbBQhQ3kbZYz547nnqWwjaOW8xK9YSvq
         7hqPjQDoF+fvXMu6fAsW9mTMB4++HzgjzqVXAAZNSCw9Rp33IOFL8BBUcxFdsxww37av
         eFAe5yiHpgHBHIqr4Vmn8ZYNg4cZkevS4LcH81BERPcTjR5p08CDX7WFCn2B6C82xq3H
         wqww==
X-Forwarded-Encrypted: i=1; AJvYcCXaCZU44wa7/9Q5iNKRNvhFWO45OG+k+wRNM5JK6+e9wGgoAUujdtBukFZBmWzQyhD29hjRHu0dmZou@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsl4IYLKV0fXyZRcCTyaEKH/SS9xDJRq7W2c4zlVJN7xwkqWLN
	Ny4tKviWQi5pzh3BYZbAGE/Y6rSA9loW9XYRy0/kkGX6rzz88vVh6uHF4SM03MzN/MyhxV+cjDy
	CCoIO43SNgICy2BVoAPZhLRZEJp6iyPVynQtEBA==
X-Gm-Gg: ASbGncu2MIQk4FT71YVyVgd8NccQjUPG5NieuolpJxaYb2XRmdyKYB7H5suiQq00VcZ
	N+80LsquRT9iUGe+O7oFoWqrGdkXS4/4pQ4yiiovnpruIl7YB1ahyoIVmrAW5H2tX7IBxV0AJ2c
	VMXMV++1o765/dqCrAaQvfXJTLY/uNEy/TXR53
X-Google-Smtp-Source: AGHT+IEX4wu5j82nOLm5VM0kOISrbX4gSyb4L+WcDmjP1Qsdn6b72+IZdtPz57qGabsSe+EpTHSUCTQhwXW8UuTpO28=
X-Received: by 2002:a05:6902:2607:b0:e5d:fd9c:f4d with SMTP id
 3f1490d57ef6-e5e8afc4b41mr15466365276.11.1740579275247; Wed, 26 Feb 2025
 06:14:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
 <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de> <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
 <a8c9b81c-bc0d-4ed5-845e-ecbf5e341064@molgen.mpg.de> <CAMRc=MdNnJZBd=eCa5ggATmqH4EwsGW3K6OgcF=oQrkEj_5S_g@mail.gmail.com>
 <CACRpkdZbu=ii_Aq1rdNN_z+T0SBRpLEm-aoc-QnWW9OnA83+Vw@mail.gmail.com>
 <Z78ZK8Sh0cOhMEsH@black.fi.intel.com> <Z78bUPN7kdSnbIjW@black.fi.intel.com>
In-Reply-To: <Z78bUPN7kdSnbIjW@black.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 26 Feb 2025 15:14:24 +0100
X-Gm-Features: AWEUYZnbMeCHev03p9RWQPC8yVSoQaBwao4RL0MRMqRWnB_wlBGnSpwb4oA7_tQ
Message-ID: <CACMJSevxA8pC2NTQq3jcKCog+o02Y07gVgQydo19YjC9+5Gs6Q@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, brgl@bgdev.pl, 
	Paul Menzel <pmenzel@molgen.mpg.de>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Feb 2025 at 14:47, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Feb 26, 2025 at 03:37:47PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 25, 2025 at 10:25:00PM +0100, Linus Walleij wrote:
> > > On Mon, Feb 24, 2025 at 9:51=E2=80=AFAM <brgl@bgdev.pl> wrote:
> > >
> > > > In any case: Linus: what should be our policy here? There are some =
pinctrl
> > > > drivers which return EINVAL if the pin in question is not in GPIO m=
ode. I don't
> > > > think this is an error. Returning errors should be reserved for rea=
d failures
> > > > and so on. Are you fine with changing the logic here to explicitly =
default to
> > > > INPUT as until recently all errors would be interpreted as such any=
way?
> > >
> > > Oh hm I guess. There was no defined semantic until now anyway. Maybe
> > > Andy has something to say about it though, it's very much his pin con=
troller.
> >
> > Driver is doing correct things. If you want to be pedantic, we need to =
return
> > all possible pin states (which are currently absent from GPIO get_direc=
tion()
> > perspective) and even though it's not possible to tell from the pin mux=
er
> > p.o.v. If function is I2C, it's open-drain, if some other, it may be co=
mpletely
> > different, but pin muxer might only guesstimate the state of the partic=
ular
> > function is and I do not think guesstimation is a right approach.
> >
> > We may use the specific error code, though. and document that semantics=
.
>
> Brief looking at the error descriptions and the practical use the best (a=
nd
> unique enough) choice may be EBADSLT.
>

In any case, I proposed to revert to the previous behavior in
gpiochip_add_data() in my follow-up series so the issue should soon go
away.

Bart

