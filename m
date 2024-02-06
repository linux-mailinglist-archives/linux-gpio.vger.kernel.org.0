Return-Path: <linux-gpio+bounces-3027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9684B5C5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04FE71C23C46
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 12:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8F9130E5E;
	Tue,  6 Feb 2024 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AcJZiakA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC8131725
	for <linux-gpio@vger.kernel.org>; Tue,  6 Feb 2024 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224273; cv=none; b=IFFC883JoWMEZcaKHADAt4BIu8pUR4A+A0hNXdZkTrCOgjIOEB/QlXe//vKM8EdMWCXDG50phSUNreDAFJv+qjG02uTgKNHmpN3L2m6ZFP2A4B+jlRbx2Hepy7Dc5X6ul31N9ho3ZSjaB0Nm/bSzm6kjNpvGRGv7NOs1zwf8EQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224273; c=relaxed/simple;
	bh=Dz1C2FKSg8Ps4eODqw7tR2caClrdu7B1RUvCeAVqjBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+IsDlWv+pmOLTRSQKKlVIm61vjhnjhyBwlYW04FMj2aaPkFcVtbd57hPOXK3Q4jDO5+DRDkO3KEhj39pO/CupFMmW5LZSOybD4SFPfstelbRBR95Zmasf9ejVOKS+sqSx1l5DonPt9w8a0JrADN3jCEyGorrDZKTwlxXAflF5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AcJZiakA; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57b9so2273123241.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Feb 2024 04:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707224271; x=1707829071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5svFZeRKd0+hhVkOuAoktHKWb/1F+wemdTZj5yfOkxQ=;
        b=AcJZiakAIMGitYUVtizRbKWMLVyMovVIwK42RoKLwAxdMMZYS2FVrOsm+crHf+ikcx
         hkmTLC7bJ97wvwY6sSdMehfU0aOtws3tBcULs/ehF3JmlW183eubio+k3JluXFtDQ+xJ
         EClVKIdfWuTqwAuvKUGeSWyPieFSflkAh8HDYNt9OkKJgrvKCWwMjshXFJ9VQTQD/esI
         2R66GXDF5z/A9DEol3vX1tZVpcCWnp5w4/k0rGwNoEweXbFK0vwo5skviqF0k6dIMKxK
         kcqcZSYDO2TcLp2yZnVAPQz2zO8w0YSlOoyyD24hq4pQ8c+OnF7RB41zrDC6nvjLWSQI
         Bjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707224271; x=1707829071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5svFZeRKd0+hhVkOuAoktHKWb/1F+wemdTZj5yfOkxQ=;
        b=pPo2T7ZbL6HTSChL+QQ73rVmxSvwdIwLxpRC5duRk18sGya/jOWeDqAAAiSlhH6sE7
         nFnglFEBYxi++X32L10ICkrfyhXbgxJHzTH+v3+50rHe/9ywSC6yeXbqasVB7zkgAgMp
         RV9sO57cAkhhpPKkIiXIup8goptkH++ADdXkogzFqO18lOTprAj4c/JW1BVj/9fOlenq
         oQ2YtMp2YWXWk9GLmQ3qw5sLfH98xFpeEX2VgjzGdF66oJ4UuqNWaYsNKauTw9ILOJiC
         G4zpmkMMyphbNHNuQSJM8iaC9SiPCdqs1vrWwXYSfR2khNPrle7MyOvrPupA1qbIPAgc
         VhTg==
X-Gm-Message-State: AOJu0Yza2CtYKBFWNj4FOovtM8K8inL5W1/BeQ3JSD4vDbKOstLBdfPz
	/PsEajadVoB2wQm7IllfqJWOVE3qWceL4rWyWvbYpst6KW1YhR+Priv/tpSNZaGgylkiEe8EWPl
	f+Np//mUjY+4ngLCIImVLQDfLD20wZb8AS5ld/g==
X-Google-Smtp-Source: AGHT+IF+L9PTVB8MHEOyy6i7TDS75uBaW3oPuf5e3FKReFyrBN7EJgUy6W+7Mnsv7GMNrDg/cJzljJUDjbjNmfoXCSU=
X-Received: by 2002:a05:6102:1174:b0:46d:1a03:2a34 with SMTP id
 k20-20020a056102117400b0046d1a032a34mr1342624vsg.28.1707224271156; Tue, 06
 Feb 2024 04:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093418.39755-1-brgl@bgdev.pl> <20240205093418.39755-22-brgl@bgdev.pl>
 <ZcDVNA6Id7Bmckt0@smile.fi.intel.com> <CAMRc=MdoGQZKM37kk=j6NpdkUUjDvs3-8YeiZVQO2EpPHRZ7Uw@mail.gmail.com>
 <ZcIlEEgHn5AaTEyz@smile.fi.intel.com>
In-Reply-To: <ZcIlEEgHn5AaTEyz@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 Feb 2024 13:57:39 +0100
Message-ID: <CAMRc=Mcq2UgS4EcVAOghQzFq_jXA83rGMse+pxa5ieK8MXZm-w@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 1:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 05, 2024 at 08:36:39PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Feb 5, 2024 at 1:31=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > >
> > > >  int gpiod_get_direction(struct gpio_desc *desc)
> > > >  {
> > > > -     struct gpio_chip *gc;
> > > >       unsigned long flags;
> > > >       unsigned int offset;
> > > >       int ret;
> > > >
> > > > -     gc =3D gpiod_to_chip(desc);
> > > > +     if (!desc)
> > > > +             /* Sane default is INPUT. */
> > > > +             return 1;
> > >
> > > Hmm... I can't imagine how this value may anyhow be used / useful.
> >
> > What else would you return for an optional (NULL) GPIO?
>
> An error. If somebody asks for direction of the non-existing GPIO, there =
is no
> (valid) answer for that.
>

All other functions return 0 for desc =3D=3D NULL to accommodate
gpiod_get_optional(). I think we should stay consistent here.

Bart

