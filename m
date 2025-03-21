Return-Path: <linux-gpio+bounces-17856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E208EA6BB03
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DDF119C23E6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AAF229B23;
	Fri, 21 Mar 2025 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wO5AaSot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A86227B9A
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561160; cv=none; b=FoFuU+p137MsMfjY6kuD/aXC7xHk+vMAbcH15esxoWi77cYN8lLkxYN9UUZjenLPdQBDEv6SChtyBSGAw6gTBluu5R+W07lG+LhF2xN8n2ggWgrkUmm+7OnmzEqBPeuoQgF0NH5aPd4iR1QhC6k82jA367eRyubeLo7nxGhEgls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561160; c=relaxed/simple;
	bh=rVbPmfobgBzLFSx5RwagW+NbVBkdJc5TVz/04CHvonE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTL+q/HDS6cV73A5/ZokxXzDjJkSeqSJ5ylbSDqi/K3LlttLTg9+deiMLdNqr27hjFmihachsJhpSEQCHqN8SO3m2ZgTIWL03IK6t/C3m6vPK76XfRLEm0TRoEcC5V2nzae/qgMnk57+JNVZQVxExIC/Huduj1G4pIxtbZDN5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wO5AaSot; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2496111e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742561156; x=1743165956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqD2D7X0Q5YWp4Gn8ZhVPpadUUq2vuMoovY1umXMvsE=;
        b=wO5AaSot45pohHMFr1cEkfmMyqXBYeU6J0zFEIuJ2jmUpYwIWTi0vJbERxxjTIHr82
         //sPjmLAM0PibEQ3UXBCf5oIjFQ6nsLlsg6hfmCEhsQXIV/YXjkoci9rYIh2Ptk1R6i3
         jXvHhC4rDu843ccT5XniWjEaXsXl1fRYb0Ch8PVa0F/jpw9n+jCyD9BIfTfFm49TXP/p
         ikmvIEteVTX421dR441talFFETId60w+093PMSrxpZtXTPn/mVZb94w5sLWwz2hILLUO
         NxrGspae6y4nm2+cyNocQPxAlSU4zdWkfSgr1/kK//4xQLiUfE6w6Iuz4UN6wldyYEA4
         xk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742561156; x=1743165956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqD2D7X0Q5YWp4Gn8ZhVPpadUUq2vuMoovY1umXMvsE=;
        b=oc+Oq4h1ze5WCBNX36YI4sKlUHymnvG4CliL4EgKwaN2g67gs2Ur89H8rK4ulFFYnb
         1erfsXFlUCvif3XDmtfdMG2upuIbZspHFfHEiQej1HcymSQ+94KnfgFY7LSDAIBo6naQ
         PWKAynC9H9oE2cL7bDazeLcN72/NHbPxAzSyO74ThylK+W2amAH/bY4Y8kfdRZoPSJlA
         yjpFAXlwiCT5c6CYnnJxbIuo54oxEUyA+4y57Bdd1OSkvj1JhrAHNSvH6uP6la396uDD
         POOndVRUFnaGabrfNPg8L3QZlPgKBDt8OTslX0Wmtl7zN2bdVTE022X6y7W3QGMmSvS6
         ctLA==
X-Gm-Message-State: AOJu0YwT1IU7RmgfGApEWg68ky9xfiS1aE8pv51aIpyy5uV7MCmQjLHm
	Ei9IHl3bV/q0uGDvn1k1iG9QMH4iRiZ2Qt5DjTgGsem8zNkmvuKCcCQS8FdaZrSkkf7JOPSmzKa
	aGcnR+aRu9WuwTS80jSWPDec4yYcIQNWVNQJxng==
X-Gm-Gg: ASbGncvyd4bBFaDCR9QCK1X9vfyLMi54mVK9u2mu8mNS1EaxMfbU9yPtKcqcFSqJwog
	nsjRxkSEnXjqdioTrcPDkFt5nMooXlRIukNjUC64ua93NwVSrPVCq10CdLVLKdP0n5X7GGaIDBX
	rU52T8QkR6T/ShJhFDbeJyXsbbNjqoUb6rpUbqqex/yLBRuEmoapnFRD8D2abGUkWMyT/W
X-Google-Smtp-Source: AGHT+IEG9tebTayf89WpcozBzTNv7wq2f1Si46p3xya/sWWSXKR+Oy3FJ9lG3sfOHwILBBPAxnoTdvICnQQZHAHA3tw=
X-Received: by 2002:a05:6512:ba5:b0:54a:c4af:18 with SMTP id
 2adb3069b0e04-54ad6486711mr1129943e87.22.1742561156319; Fri, 21 Mar 2025
 05:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-4-koichiro.den@canonical.com> <CAMRc=Md8nB1U--qcZxpcKVzxTcON2hi-pmsUKFn+aBEqHuBzcQ@mail.gmail.com>
 <llbybv6dpkfrtir75dveqnphrj6nuephvkoyywy6tx6vfbunl2@ft5io3thby6v>
 <CAMRc=Mcng+jW2WrAREOf-GC1mCbGEyAiMP_Ms9B3BzXnCoFGFQ@mail.gmail.com> <t4lng24vhim7pid6c5gafdk3mawnvcit36hqsa64qoe2gozdz3@jcjsh5b7c3bx>
In-Reply-To: <t4lng24vhim7pid6c5gafdk3mawnvcit36hqsa64qoe2gozdz3@jcjsh5b7c3bx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 13:45:45 +0100
X-Gm-Features: AQ5f1JoyjHcegehj_K1ndllhV8-dMTJEpXbqZ-ctRSYFKwZ55v4Z_VOE5SZKsSs
Message-ID: <CAMRc=MeLkqM_Fhfdvi_aQp411WEJagP8GSwpFaKNa-s9BJbrCg@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 1:41=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> > >
> > > Thanks for the review. Should I send v7 for this change?
> > >
> >
> > You should send one anyway once v6.15-rc1 is tagged.
>
> Alright. Please let me confirm:
> - After gpio-updates-for-v6.15-rc1, will something like
>   gpio-updates-for-v6.15-rc2 follow?

No. I'm not sure if I made myself clear. This series *will not* make
v6.15. The merge window for v6.15 starts next week. I'll send my PR
tagged as gpio-updates-for-v6.15-rc1 during the merge window. Once
it's closed, Linus will tag v6.15-rc1 and we'll start a new
development cycle gathering patches for v6.16 in my gpio/for-next
branch. This is where your series will go and I'll send it upstream
for v6.16.

Only send v7 in three weeks, after Linus tags RC1.

> - If yes, after v6.15-rc1 is tagged, I'll _quickly_ send v7 rebased onto
>   gpio-updates-for-v6.15-rc1, right?
>

No, you'll send your series rebases on top of v6.15-rc1 tag from
Torvalds' master branch.

Bart

