Return-Path: <linux-gpio+bounces-6884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38C8D3D2E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 19:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DFB61C21376
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 17:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5F015B559;
	Wed, 29 May 2024 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pe7ryYxe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983231591FC
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717002174; cv=none; b=CHcvMOdC5k4tT6V6HXaR7LPJVj8wV/QaUrGnyEXbP6q0x1Iu05FsjqRuAeAuQP7pplaw9FXgc/XZ8Z9J2nDfjlx2+8DkMU2vGaSpkLlVxZtXxQ7I/S7mn5ACZJnTzOYrNKN0n3qT0Ygwtj3DN87fRpLsHaPFz2Wx45P2fRtKXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717002174; c=relaxed/simple;
	bh=yso4DYrEah/Rv0x0bfNLq31tpGpqSOL8WNY+uGf+GgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvdAGtFweYIr8JjoY2l6kgNj4qtZeow9Td/eXy32NBRLLBTwa/Lw6Ti41/BQfEUvms0hxWoUvMAGchkoLCr75BH1RpXlv4DHUMp4JLwauTVXIWwHayXMCW0/FuY+N4+CHt/JDTkzZMRh926L02qa4lzmZNMprcemj+RfwFw/iQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pe7ryYxe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f47784a2adso16650445ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717002172; x=1717606972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ11yAE1AZ/NGiwg3bOvn6m5bmAMX+k6Wgxg3rUKKyE=;
        b=pe7ryYxectMmG4Y8xlPO6pX0e+9YXxZPnbkVOYbBzZTC/DbyeO1T9tnNlaZGI6NZb+
         sAG58TmKgYWdMRFNB6on1AyP2OuMfNwjPr67zTTA348nnecTDuVJevuZ4OP7fNbxXq9T
         Xc+u+VdRYniHq6mbj8vntEc/8oo9VKGG6hzuMOimxSbqIXj+IZSd9RCbTvKYRz3mf2Sf
         ojWziHoJm79K4AOSdZHv7EmDA3YoYEEfRahh6roSpqTVVEk9agthg2AlhuCh9GuH3BVa
         0ZTSGs0gbtI7kVeE4+6emplX6x1i4XEivnhstdHI5XnW87griKIIM6mue4gPVnmPFUcz
         7quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717002172; x=1717606972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ11yAE1AZ/NGiwg3bOvn6m5bmAMX+k6Wgxg3rUKKyE=;
        b=NIhEmatnuRC3aI6OVhvLRfobfC7aWYVVWF36byZGzPHf89IuvhiT6snLowKPC5PEnA
         KIgyIMnpJwnGxPC3uxpqzT0gKH4qTy3wSjhxtyn+mc3AELR4v8U3fDUaSljtTeTYL+k9
         l44OABfi8RpAcrZqQi9RrNenAAnvu4Rn9X7p32AZWQtrIzgQrU8vYqxVQqSBO6RZDPxn
         +oR4RDSiEW1e884WLFA8PuUMSeoMKCCqWQ/2ooXyMHP76ShYHjSkhzJlNm4hQN89BVIf
         z5Hw5b3vv6DXc0t04Z+CqvLCaMnojjiUJrAC4VCv8rHvzEfpW7FSCjDIjPb8jd1iAryw
         BN2g==
X-Forwarded-Encrypted: i=1; AJvYcCWpzMl+BS/gsOsMQNRCFvsHv8aQIc7QNei8PgRDH+NFwxokvuTHKND4B/ijQkBnnVXv+LPctCCtOmJua7OoFGFMrAuhBMRElTJdDQ==
X-Gm-Message-State: AOJu0Yx4DkzR/Kyj8WMznGtnrMb67715s+SuZAeBPdX7TnviNgCuNjS4
	kkzvss6vullsL3tMuFQnqF98jIHXihLptFJ1R/LHUL5vnC0bgr90ZfAp2zqHJreCE2I6TxHJHqg
	ehG1r7JifbmYn3dhdyieyISlQ5Kwq/oWyCrwrS8dMFmkdCiE6
X-Google-Smtp-Source: AGHT+IGrfB/he0jCbHbbJ6A2q9OhGyPALOwpt53PatulLMy5CE4gNOXTAQDaCb7V6WYHo14fNTd8drOUSt1bZ59pNNQ=
X-Received: by 2002:a17:902:c40c:b0:1f3:1200:ceb3 with SMTP id
 d9443c01a7336-1f4494f2e70mr173493005ad.51.1717002171704; Wed, 29 May 2024
 10:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <CAMRc=MeN+QzzSy1BwiD57Y3vTF9Ups=6dtWuFbPmxzOxic=arQ@mail.gmail.com> <ad4dee46c4e0e508c54dd79bab7f45060099ef9b.camel@ew.tq-group.com>
In-Reply-To: <ad4dee46c4e0e508c54dd79bab7f45060099ef9b.camel@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 May 2024 19:02:38 +0200
Message-ID: <CAMRc=Mfrcx1nPwoN8YJ+Hp_Z33oWDTsSHhOyOSdqjzy3RLcPLQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio-tqmx86 fixes
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Gregor Herburger <gregor.herburger@tq-group.com>, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 2:55=E2=80=AFPM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> On Wed, 2024-05-29 at 14:08 +0200, Bartosz Golaszewski wrote:
> > On Wed, May 29, 2024 at 9:46=E2=80=AFAM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > >
> > > This is the first series of improvements to the tqmx86 GPIO driver,
> > > which fixes some long-standing bugs - in particular, IRQ_TYPE_EDGE_BO=
TH
> > > can never have worked correctly.
> > >
> > > Other patches in the series are code cleanup, which is included as it
> > > makes the actual fixes much nicer. I have included the same Fixes tag=
 in
> > > all commits, as they will need to be cherry-picked together.
> > >
> > > A second series with new features (changing GPIO directions, support
> > > more GPIOs on SMARC TQMx86 modules) will be submitted when the fixes
> > > have been reviewed and merged.
> > >
> > > Gregor Herburger (1):
> > >   gpio: tqmx86: fix typo in Kconfig label
> > >
> > > Matthias Schiffer (7):
> > >   gpio: tqmx86: introduce shadow register for GPIO output value
> > >   gpio: tqmx86: change tqmx86_gpio_write() order of arguments to matc=
h
> > >     regmap API
> > >   gpio: tqmx86: introduce _tqmx86_gpio_update_bits() helper
> > >   gpio: tqmx86: add macros for interrupt configuration
> > >   gpio: tqmx86: store IRQ triggers without offsetting index
> > >   gpio: tqmx86: store IRQ trigger type and unmask status separately
> > >   gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
> > >
> > >  drivers/gpio/Kconfig       |   2 +-
> > >  drivers/gpio/gpio-tqmx86.c | 151 ++++++++++++++++++++++++++---------=
--
> > >  2 files changed, 106 insertions(+), 47 deletions(-)
> > >
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > https://www.tq-group.com/
> > >
> >
> > Hi Matthias!
> >
> > Not all patches in this series are fixes (as in: warrant being sent
> > upstream outside of the merge window). Please split the series into
> > two with the first one containing actual fixes to real bugs and the
> > second for any refactoring and improvements.
> >
> > Bart
>
>
> Hi Bartosz,
>
> as explained in the cover letter, I've found that the fixes become much n=
icer to implement (and to
> review) if they are based on the refactoring. I can leave out _tqmx86_gpi=
o_update_bits for now, but
> removing "add macros for interrupt configuration" and "store IRQ triggers=
 without offsetting index"
> does make the actual fixes "store IRQ trigger type and unmask status sepa=
rately" and "fix broken
> IRQ_TYPE_EDGE_BOTH interrupt type" somewhat uglier.
>
> That being said, you're the maintainer, and I will structure this series =
in any way you prefer. I
> can remove the mentioned refactoring, even though it makes the fixes less=
 pleasant. Another option
> would be that I can submit just the refactoring for -next for now, and le=
ave the fixes for a future
> series. Let me know how you want to proceed.
>
> Thanks,
> Matthias

The question is: do you want these fixes to be backported into stable
branches? Because if not then it's true that the ordering doesn't
matter. But if you do, then it makes more sense to put fixes first,
send them to Torvalds, get them backported and then add refactoring
changes on top.

Bart

