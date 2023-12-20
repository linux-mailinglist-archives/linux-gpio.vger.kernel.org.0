Return-Path: <linux-gpio+bounces-1729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A302A819FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 14:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57825286503
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3E82577A;
	Wed, 20 Dec 2023 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F7tvtQqt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACC42CCB8
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cc02edee3eso531693241.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 05:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703078388; x=1703683188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLKg3nDYNDhgDa/lRgqaq6E+lqNB893L7oACvFRmhmE=;
        b=F7tvtQqtxq51xVFqY8PLXj334RueJYYx+d0Gxgxrg7E4u1c0/kq+3+HAQO5fq/sl7R
         evu+r5/2zJx6gUhq24Rm3APBaLB70TFr7aDflSt2r0Vlm+IrldZQ9ynY4VzETkpPTBKy
         1fdY+i4XnCYZeT1kBswwGtkawAUJytY6pDl/c0D8Rlduo7VCsFlYAyHAuHCW4YTp8sRg
         bTzHG62/QeShlKQiJF0V0hya5dvNfoZPOn2cNscS/kcY153y3TVfgT0TUtQYpDhl+hDs
         6Fbo8HIek4BKQLGhQMxEnFZr9DxJgXPAnMw1wertlTO81vVQukb9DyluCpf035upZWi6
         Jjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703078388; x=1703683188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLKg3nDYNDhgDa/lRgqaq6E+lqNB893L7oACvFRmhmE=;
        b=pLctFidCU+2fQLdN39nWZ2h8bxDOc38x25j2jmLc4c0L6I0iDUSYxNA8iFOsrXv0Ie
         4QPW3rzS1RxsvFPgjvfoTUMKBW+UadpCpNg+w4aGTw7RE7+rG4+eYHkkXIaNT+UsZkHV
         wvjXM3DSen8wOoe6b5Z1xxCU6Hsoip7dJfpIkvxOCm42R6rmvNx+/rF6ljYfkOVoGE2Q
         fLStqXylPY/U4Ze84nMSA2R1ISFpotiJMkulNdHN2sfrIidkqO6n8ROaq7yzSgbUjjaL
         ozHumphTSON1JigZ969LTOlr7Tjn6y4WZYzs2m7QdhLrlkYZm4hvbpxvJgICWo/iUTm3
         3hrw==
X-Gm-Message-State: AOJu0YzDmd8iGfnnsex6sa1bD2+DeoSwW05AWHxt+siflb+OqcqCnCqE
	3aByiZn5Hnw7fI3j/qbwjeGfC3Lal5GuVRXrGApj4w==
X-Google-Smtp-Source: AGHT+IGIB5aI0uYoJYDLFagrGqmf+3e1V03MmYT/bfRuAPMdXSWoESouyLV2hwI87r8PBgK0O/K9tpIIi+IdQm4c8Fc=
X-Received: by 2002:ac5:cdce:0:b0:4b6:daba:e9c4 with SMTP id
 u14-20020ac5cdce000000b004b6dabae9c4mr2270749vkn.18.1703078388192; Wed, 20
 Dec 2023 05:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220015106.16732-1-warthog618@gmail.com> <20231220015106.16732-5-warthog618@gmail.com>
 <CACRpkdZ5HzOxtbexQNE-A-bKhiUW1nHjvJQA_CCnmVXf+R6dbg@mail.gmail.com>
 <CAMRc=MfvKzOxPrmz1wmgWMwYUbNhWAjqoKOmcaggQntcDprLmQ@mail.gmail.com>
 <ZYLaayENrvL1Nh6H@rigel> <CAMRc=MfyCBpZ07SYfxMtug6FVYiKA0MRgvjMTOAzKiVLGdPM+w@mail.gmail.com>
 <ZYLczeiVDjd2cWQF@rigel> <CAMRc=MeXa5g6iQNYF4W+vGL+kgRTyVjFB-yXE_UBpuTnn2ZKng@mail.gmail.com>
 <ZYLjuqxXylKPYeYP@rigel>
In-Reply-To: <ZYLjuqxXylKPYeYP@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Dec 2023 14:19:37 +0100
Message-ID: <CAMRc=McNMLmiUsGj8HmCqiwv-9K6EbMrmHpHMaMeFHx9BFX8gQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpiolib: cdev: replace locking wrappers for
 gpio_device with guards
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 1:53=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 20, 2023 at 01:30:57PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Dec 20, 2023 at 1:23=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > >
> > >
> > > It would be read and write guards for the gpio_device.
> > > cdev would only be using the read flavour.
> > > And possibly named something other than read/write as the purpose is =
to
> > > prevent (read) or allow (write) object removal.
> > >
> > > I though that would be clearer than having to reference gpiolib.h to =
see
> > > what gdev->sem covers, and allow you to change the locking
> > > mechanism later and not have to update cdev.
> > >
> >
> > I still prefer open-coded guards here for clarity. I hope that with
> > SRCU in gpiolib.c, we'll get rid of locking in cdev entirely anyway.
> >
>
> Ok, it is your object so I should use it the way you want it used.
>
> Btw, before I go pushing out a v2, do you have an answer on whether
> gpio_ioctl() requires a guard, as mentioned in the cover letter?
> Is the fact there is an active ioctl on the chardev sufficient in
> itself to keep the gpio_device alive?
>

AFAICT: no. I think it's a bug (good catch!). Can you extend your
series with a backportable bugfix that would come first?

Bartosz

> Cheers,
> Kent.

