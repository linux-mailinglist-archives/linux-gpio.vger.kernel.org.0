Return-Path: <linux-gpio+bounces-3643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD285FA01
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 14:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE1B288630
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 13:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB707134CC2;
	Thu, 22 Feb 2024 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dh2PNbIT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C112FB02
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708609181; cv=none; b=XpRETgR0vZ2Yvds6iN91rbFPtcht++PbD55F5QyO/V4gmhhZYk90LcIVf7oDl4oOAwYmaSRctiELLfSyaeh3C4ovJ61Thwgodr+F0hEMqZmC/rNj8oe1tdiLgGR42rSo3mowl6cx5dgXR7IWoOvia3Q9Ph7lZnZbbgIqTbOHqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708609181; c=relaxed/simple;
	bh=oaWLKIrohEVVRK2LX/y7Gl/HoUox13AjUtmbGu+WWps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sflX0puuBrFitAlBrzaRCXbM4C5aUma43XE24lwtIhRK6BMBS16zgh8nTCBWc5NSNop7/ByoviNPFJOrwWroz3GP7rD652Qu2aQ6z3MRpVJQnJq37cCDW+T2gmVaNIXmUqJVOwyIZo4axObA3no/q1DnmYZMym9VSeDbdXIRsMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dh2PNbIT; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d698a8d93cso5405747241.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708609179; x=1709213979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot075bt4dL2yU2q8AQheh13hrjTH3TbPeTjQMwROOT0=;
        b=dh2PNbITvOlCh9aX19lIYLO9JAk/axqVeyXFXO++DyiUUG5ulm6vNcfJGJ1PNIbm9p
         uaKM0Ey9ix0u0D5zYzawaOBbIPhuhMFrYlb1wx2j9uPUuAgii9W4bVK4NmaUGQv9F8Wz
         b2khnGKllKl54ti2b5vIRPgP0it6+TsBOucMvtLhZLHprCaEhP8+xWkpvzcI7fRL/3+g
         0+ZrIbyY/iw1jwh5q9Dmmc1VWIafZwGP6tSk9Xk2b+m7egI3iUhuZeAvgZ9SDXt3afnY
         05rtubUVOetijS8auoxAv/fOwROh4zhQNLAuknufdeffqkSa3ZaAzpC3TqJBPY5xGJBa
         rrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609179; x=1709213979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot075bt4dL2yU2q8AQheh13hrjTH3TbPeTjQMwROOT0=;
        b=jf8P1lPXR/EVCbawmNBnfcT5QXhO5S3dKAkhR3m36mh40ivIIrAT7lGct815LzoilM
         qCyRlWzp0M3TalGIvHTQDueDnJD900RCBOV6t3HzFXp3OaRR4PzhS1Q0RQFoXMMpXQZ0
         O91R0AJy971CzQrar4bTFj32IPp8WpQLBalqrOGsW/X6dzYHZrBISYhH1kDYb3kIQYuE
         GYmWyj4NMBnfOXCln1yeQzUU1H5zdQ8RKWYzZHoVfGlNzPC7SRBpJfD+aIRTnsCDcNTO
         KN9hqC2CK3ypCRPLgaSMH6TR8gs3vvlW8Tc0wAQ3iI7KGtHg0+TNCPZ6xqZwW+eJmRJy
         Uf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUl7eoaAIPq8bcsY0BZej9gU7C8pMcg8Js1PuMG8lV5Q1TTNOJbNAdrKBloRFj08L6SjPT2YgcjI6ZfOhZREU1b9/dEsVpMqGm9ZA==
X-Gm-Message-State: AOJu0YzyxTYZV5IcKa0bj8EG9g3jW58H0YGO1MBoVIsc2NOI+o4YV7R1
	+P/P8jDLplRd/Nc3CFIfzXaONqUy2S1MNjGA/qTSdFgk1KqOx9QrEDKw5FpOUjlbXGeuae/YYmR
	knmNlAZs7GjCGITlhTXnLr7IXhy1lTi8g30NOfmWcr9nCJ4fI
X-Google-Smtp-Source: AGHT+IFZtozQgLnZSq/aH8P23J7/6o8CVysT8RBQdne/QMOV9qfinq79EPXNSg0bnQRk8ybAJeKCRCfKp2wiRCw5cxc=
X-Received: by 2002:a05:6102:1989:b0:470:5648:7070 with SMTP id
 jm9-20020a056102198900b0047056487070mr10593189vsb.21.1708609179138; Thu, 22
 Feb 2024 05:39:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221192846.4156888-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdvYdx6x=gSiOZ3SXAdJORnqhsNW79G2c7wABofWARwFw@mail.gmail.com>
 <ZddLRAqxFr7v3Zqs@smile.fi.intel.com> <CAMRc=Mdxtx-wh3HGu+SNrCwfSq0PEm3fG7hK_6wPAk2uzk8xpA@mail.gmail.com>
 <ZddOKTP73ja6ejTc@smile.fi.intel.com>
In-Reply-To: <ZddOKTP73ja6ejTc@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 14:39:28 +0100
Message-ID: <CAMRc=Mf_w_E4B7c_Uj1WV3zv9DbmJ22oFvJJwtd-+3oUDVcvXA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Fix the error path order in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 22, 2024 at 05:33:59AM -0800, Bartosz Golaszewski wrote:
> > On Thu, 22 Feb 2024 14:25:24 +0100, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> > > On Thu, Feb 22, 2024 at 10:37:06AM +0100, Bartosz Golaszewski wrote:
> > >> On Wed, Feb 21, 2024 at 8:28=E2=80=AFPM Andy Shevchenko
> > >> <andriy.shevchenko@linux.intel.com> wrote:
> > >> >
> > >> > After shuffling the code, error path wasn't updated correctly.
> > >> > Fix it here.
> > >> >         gpiochip_irqchip_free_valid_mask(gc);
> > >> >  err_remove_acpi_chip:
> > >> >         acpi_gpiochip_remove(gc);
> > >> > +       gpiochip_remove_pin_ranges(gc);
> > >> >  err_remove_of_chip:
> > >> >         gpiochip_free_hogs(gc);
> > >> >         of_gpiochip_remove(gc);
> > >>
> > >> This undoes machine_gpiochip_add() and I think it also needs to be
> > >> moved before acpi_gpiochip_remove().
> > >
> > > You mean it should be like
> > >
> > >        gpiochip_irqchip_free_valid_mask(gc);
>
> > >        gpiochip_free_hogs(gc);
>
> But should it be here...
>
> > > err_remove_acpi_chip:
>
> ...or here?
>
> I'm sorry I really need more (morning) coffee, maybe you can simply updat=
e
> yourself or submit a correct fix?

Ok, I'll apply this and send a fix on top of it.

Bart

