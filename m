Return-Path: <linux-gpio+bounces-7056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879A8D8030
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D73742850D8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5414F82D64;
	Mon,  3 Jun 2024 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KOiLMFG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE944C6F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717411105; cv=none; b=tPB9NIQXivvh2Guhcqwj0MjlpmMRQ8OqagyVcShKPxewM+cp6YE2deOZYYKqwMYK+zOXZv4NQhtGn4WuXBAfsLFHwnn7YWBKzLxfQ2Ia9W8iPJj9Nsxrzo6Lgal9HVR0Nqd96UYejnr9Yw5WdBkSMLUHCCrACcrqdfnBGFQuQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717411105; c=relaxed/simple;
	bh=Lwm0YV4fK66WSeYPLKqyFGEIRfvD5qrutpg3z+fQgNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuP9i5bAFozirfAGc8GYI1jFUCaBpWfUbSY4WpiAesEY/R7lfQKhh1sSFwsT7BsHE2y9jJYiVbLfgGhxYzU8b9IEYrYvAEEf6iB/wU7aWjFcJev33H5qRvnsCoFQQrgY7OfoURF8keNa4YTO75i38FYW9zPKBjP+7lmN5IiOW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KOiLMFG0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaad2c673fso13687001fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717411101; x=1718015901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwm0YV4fK66WSeYPLKqyFGEIRfvD5qrutpg3z+fQgNk=;
        b=KOiLMFG0/sHl4jL4H32SKS460B5HPPFhqCbWgCRUDtxwGTXj8v4VmtTG8uhStJBU01
         6rTZb5hj5KdOAI03gut7ET4uVxFICciJkCxWAUe+ArkmNdi6nbOSu/oiNy586Q+JdC5R
         DaFzr0babcLxCBROSta/tAy2ATXhnFnRLWSFWvwnUowQd6haVSAZ24ENpiRJS8ofFV5K
         6069mi1pe4XRy5hUeydohpNeh/DPW1Q46I5Kphvm4QxcB38Jc67cgZZgkXj/0oagprF2
         +IA0lLHD9R7JUNyD2zqEx1DZyKefBfo3AY9GRGsq8RwG0eqeEeYzDqVjnHZg/5lssAA1
         S//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411101; x=1718015901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lwm0YV4fK66WSeYPLKqyFGEIRfvD5qrutpg3z+fQgNk=;
        b=xIKmV1XX85m8lQNBUwx4pdw1UlNLTzpSKmcWa5i8TqcaLdFFnRBWwSNpfkoLtpa1AZ
         Gawa+Yv6scUS9aMeZc78tfRZzObTqgDaIeSrqdCM3L+8XzZ4xvDhuuRnh1tT2icqOgnM
         pIaAf5lem2ToojOrPqPUthTWnEGcsm6SV63ReiF0Fv+cpvAIyPU6PoIS5ytdeXHvOkM3
         U20wvparVbO7eSynveyZtNwFq7LVI2EHuTFieT17Tv//7sIGK4ntEYcUTF9WlwCzdHF2
         kAk26mFnrkPH8p3WcBPq2Icg/YC9+hgAmLrS9SiY/x98kAG+NLkZbEoKj2uuEiFgBSe0
         1X7A==
X-Gm-Message-State: AOJu0YzpWnO9uyYlvPoVkmJHgmtj7/OjRTgTFS+nubrYW0i/UoPfTN38
	eEaao0QtbSm3JZRynxd4EmHsp9SboeQEMHBAldet9n7qKdZpTYpNACMeM4BH8iQWxjAZsVrLKo8
	UDe9tm1DsiSWiUdQwlO0SEMuveTXOmfF+7nUD1g==
X-Google-Smtp-Source: AGHT+IHDeXv6ZuLG0OcJRYWCbxWwdWR7J5leN3WG7gawQxodJtssM3exK21Ob+ZvfsD3/wsW1czdTD663tfUSrOkNI8=
X-Received: by 2002:a2e:9f05:0:b0:2ea:91c1:f3d5 with SMTP id
 38308e7fff4ca-2ea9510e39cmr69488901fa.15.1717411101214; Mon, 03 Jun 2024
 03:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531134512.443850-1-warthog618@gmail.com> <20240531134512.443850-3-warthog618@gmail.com>
 <CAMRc=MfHwp8Lj_5rFiqo61E__Y9+o4n3Bu5e4KSF0P6n0DR-0Q@mail.gmail.com> <20240603085844.GA78808@rigel>
In-Reply-To: <20240603085844.GA78808@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 12:38:09 +0200
Message-ID: <CAMRc=MdKTXeLWMkaRqg6z-iTeThWWCYcr4En2UgbM-81BXPFpg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/8] tools: tests: don't declare and assign separately
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:58=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jun 03, 2024 at 10:52:39AM +0200, Bartosz Golaszewski wrote:
> > On Fri, May 31, 2024 at 3:45=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > Fix shellcheck SC2155[1] - declare and assign separately to avoid
> > > masking return values.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > >
> > > [1] https://www.shellcheck.net/wiki/SC2155
> > > ---
> >
> > Shouldn't the commit message say "*do* declare and assign separately"?
> >
>
> That is wrong, my bad.
>
> I think I was going to change it to "don't declare and assign together"
> and got distracted mid-edit.
> So either that or simply "declare and assign separately".
> A leading "do" would be redundant.
>
> You ok to fix that, or would you like a re-spin?
>

I'll fix it, others look good.

Bart

