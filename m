Return-Path: <linux-gpio+bounces-20419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2899ABF10B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 12:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238F11BC19E9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F285259CA4;
	Wed, 21 May 2025 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vFFDLiiV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9F253942
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822293; cv=none; b=SqoxBxezNU1vOtLadlvTZRHvyU4Nao+mZbRAHA/iNjBuCrOI+GriqdZO8OaveYb3U8vwQlOncxFJh40drreryzJbD5PPGw13/m0R6G4WVZMH3ia3LTLIwZkIJrFQ7ZqNooZg770dF+EZh2SD7/om9tnfucVPCq/RYLd5MEmNj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822293; c=relaxed/simple;
	bh=Z00efLlPP3jt+Pl422jmXr+y6NkyIzcc6sW3cBob4Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckVco/kTSQZ4a50XTnAGDPewSgtbKpfdDIxRcyBTYWMmTv85e7uZIhupD7Exu+WfdYHafW45/+zo6Jd6MKjPAK3Et+/LiN9jEyfiobnrD6IsP5Q790j0YMvfiMsanztHcuNUSPnOUXEFm4hc0heDC6CkhcvsNWrBmcFqa5nJmA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vFFDLiiV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551ed563740so4767967e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747822289; x=1748427089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z00efLlPP3jt+Pl422jmXr+y6NkyIzcc6sW3cBob4Js=;
        b=vFFDLiiVqHWljv06FJBPIN9B2tLWKXaTZxvflgeuDe2+8lrCBtBc4AaNZs81Q0qXYn
         o5lG2GWbISNHfiOB8DK4MU09eUqSrs2aoldF9ikwo9H5AaT5C3cDxgwwGqhfFcM3v87Q
         YDZZ4bk/iqU2yQhdWcr+aIjf3D4LMWq8pZci6FhccyRHKbBLBMbmYE8J5+GF2pjNcnsC
         E0BXE8CExqiJkiYEYMGn5SXu7yL1+6VuhIVGyKJk1D/dnTgXr3rdzUncO8qJJXsuoHzz
         Kts1ZcjLGn7A/f3H1o3yjAsbgVonRBPCfPGR+C++9ZBuqqdNUDplF4MwTwvYwWP22b+F
         K/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822289; x=1748427089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z00efLlPP3jt+Pl422jmXr+y6NkyIzcc6sW3cBob4Js=;
        b=LY2AAznVAlEwHFcRynBmvlQHNpKZhCJHp4qIc1wk8jy5fMl/DE4bY2BsZVwApOifDe
         JkkagfTfiy2e3WjrEd/TSXsqLs955DEtjRHZigCZPLUGvHkRtXUMNRB+rBH03Az740RI
         AnX4J4G7ruGaT5GzYlwRbEP+dkVaEyjnVA/pQToWDgMRdjB2a5ppoJO5Cy5zkdNFb2je
         xXRnYNYVeI0QsvotoxnWABfzxZZnqH1MCMFudWVku6VkFlDulcaYrSuGExtEj2yhKT+P
         DIrZVjrMv6AMq+qm5dInTij8rYkl+2e0TTVIl6cBbAYiz2dZv6FMXUb7BlKmkmkZnQwX
         beDg==
X-Gm-Message-State: AOJu0YyqaVGmg1dt1Qw3N4TXjFksnOFpCTQBI8IXoWzns34xN9iXTh3B
	l3AIV2fzr93LA23fX4q/C55RvHBf+q81eKztpSGMkGA0vtMW7TryfAL7g36UOsPl8Aj3fqwPMUE
	fnnwQhHdavC/0LmMznHPnZh4V8Jc5gdjE8hWgEA+o7rnLPaq+CNga
X-Gm-Gg: ASbGnct8raj4uaSUxYMSLiH9tT+d6HDmbUt9df7i6FxfSn3qg9qKpX2sTRHw2vq2gti
	y6s6kS8/bOqZ9NLZr6+TtrhUxm/qOk82fdyEHSq2mUr63MiuV8ntlYsdfnGO93gGciEiSMc6g+m
	vshGMsC1YCKgen+s6HrPPgi+55g+ezjhXTUilRcZtKu9h8KVBFDMwS3S1VC7/plT95
X-Google-Smtp-Source: AGHT+IGyQOxm/t8LEmLJVpOF0RgzST+WAggScATkylTCzv4NUrE+1D3emAzxM0BQ4w6YALBDBt/C8hmx338Y48LCtTQ=
X-Received: by 2002:a05:6512:6805:b0:54f:c4da:2346 with SMTP id
 2adb3069b0e04-550e71cfcf5mr5596828e87.29.1747822289180; Wed, 21 May 2025
 03:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com> <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com> <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
 <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com>
 <aC2b2L5h4-0U5qjT@smile.fi.intel.com> <CAMRc=MfE=m+_jYKwAU0jcyopUZYFnY6kOdZJmAY29dJEHO+gPQ@mail.gmail.com>
 <aC2djJxol61MmuyO@smile.fi.intel.com> <aC2h0Wpxh-8ekr24@smile.fi.intel.com>
In-Reply-To: <aC2h0Wpxh-8ekr24@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 12:11:18 +0200
X-Gm-Features: AX0GCFtFvWCXx3-XPhvrpsxmtyajgVQ9QeK_zTtAF8s0OCIVKKUoz4FAAPqDfGE
Message-ID: <CAMRc=MfM=yTBeOn0+SRZ09BoaF5eNmmWsUnA5GKmr11o2rgKDw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:50=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 21, 2025 at 12:31:57PM +0300, Andy Shevchenko wrote:
> > On Wed, May 21, 2025 at 11:29:41AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, May 21, 2025 at 11:24=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > Ok, sorry for the misunderstanding but if I were to drop them, then
> > > I'd have to rebase tens of patches that came later, it just makes mor=
e
> > > sense for you to do it.
> >
> > I understand that, but it's an exceptional situation. Shouldn't be like
> > this ideally... I'm about to send an updated PR.
>
> Here we are (in case you missed my email):
> aC2gABILEj1yRCxF@black.fi.intel.com
>

Now you're just being mean. :P

Bart

