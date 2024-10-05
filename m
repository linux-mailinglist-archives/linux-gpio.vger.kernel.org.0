Return-Path: <linux-gpio+bounces-10878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AF9919A6
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 20:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B28BB21B8D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 18:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE1215D5DA;
	Sat,  5 Oct 2024 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TadXrn3J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3523E1369BC
	for <linux-gpio@vger.kernel.org>; Sat,  5 Oct 2024 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153934; cv=none; b=hvH6b9wp+kVUQ6kyM6SjsCzaE9V7r7dZ14Fvlqx2DEZmkeTHuEqSY5m9FSU5ulmL0AggZUZb4alAPSzlFccjlrq730CHtr/Jk9al5SeeobN/o2sEpUX0V0t6R9ccJX8fSIovqSyl23p+6OjunnGUH0oruvvBQS+QKTKxZngN7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153934; c=relaxed/simple;
	bh=HOdDjGKqcbcvwIsTYH23uTTuSmjIqRUfDGehMvTmMcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBr+l9zmtHTkpPyImzZ5WCLFjdG6mK9YFpwuMOnzfPi3YNSfCAVyBd4F5qvdCxu8CEkVMZ/ZopB5/vKuyWoaa1Br1OUR0nzl4pvKB06lvmqBNBeREIrXkmcn/mKN2iRDBmOqr3IXQcFgd7ST0Ufmu4P3fKRxQ5MBPsSM5Cyc8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TadXrn3J; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso45089411fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2024 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728153929; x=1728758729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoQzVzuaL63fPFP4K0DBbZPOqq3uWtuZvKxrZ3goDWE=;
        b=TadXrn3JJFgWZ3zNXF6DaGzQjXzL1F1Dw+JnsxtRYI2vomQ8mhj4zzs4V4rRqDMPra
         uGUoJcSrrgJaPPFxYAFUFPgo+HVoxlKOywRTUNa4bLGg1r3rmE0AbS4k9K3jAWVkCAi1
         8f16sn5BLJ0/TXO85OGxNd4p8uzvdG13gbeAmy9l+GeivrORtwHqOhxP0H15Ql3376UL
         zcOYUrN9yYFFZvP6yEQy5pOEmN0QERkjg6I4l9kLdePKCu8rvljome+od+qsxpV/hwr8
         XfD7bL14py4BD48HvXEn85nQ+nVTy56vwk6YgWjncNHJLUh5DHIlU4GUeBXNp9gSXiCo
         sJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728153929; x=1728758729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoQzVzuaL63fPFP4K0DBbZPOqq3uWtuZvKxrZ3goDWE=;
        b=J/GbzCa4NOC39BhJuM5HwLW76G1V9xCf/MzOD/3W4C11zSckdhV5SEenIfq8VbOguc
         KoN/da6atMINXSxnvuIaP2DVm2ir9kLGi7+JXPknaSEGdZ/ZdgnKNS6YQqDf18A9058/
         x7iuPdVH2pNTE7Pj4HhTSwXdp6kFkXpWbsKFqTb+xAlSctjFk/aPRzbc76buTGJNsI/r
         703QJ4RV7Xdhr36xZBBSnPvCrJ5mxtzY+S5QdXKAtrQWxHPIx6K7Ay4OpmkSZGeTOs+d
         xfSyb65C4gkBkqy8a6upyaZpuucoMMS4GGqMjJqzVsVNhXWY5hbF51D+v3aolownpvPO
         F7sg==
X-Forwarded-Encrypted: i=1; AJvYcCUyHzfAIdSHtpZSVcoKaOq6RnBkAgJRhhqNh8DYkgXOFXkOv+vzcX6dizbjRMhTmn504UnYHnbv0+jx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx845jhjTP7VBVq+FHyLQBLcFB9X+mOwOKbyKbTGp3xpFbPlu1z
	BjDZKMqbOdaD6MOOwtoIkgqIcOycU77wReU1lgY3X84pDUV4CimLTtawdjYXJNLSxxdp56ONEOx
	V5I0Q12dYhXVFH9tuB4cK1m7safUVV2csPwq+pQ==
X-Google-Smtp-Source: AGHT+IGglef8byL7QK3ivt4MgoILkf6jP5/2cVElgA0WSr3IjY2Klszw3U5bFgkEDpcLNHmdS/sVuJxBFnfd2zWjJ8k=
X-Received: by 2002:a05:651c:2110:b0:2fa:d75b:2ef5 with SMTP id
 38308e7fff4ca-2faf3d70252mr44045391fa.32.1728153928963; Sat, 05 Oct 2024
 11:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-5-8ac29e1df4fe@linaro.org>
 <20241005074635.GA174602@rigel> <CAMRc=MdU5+AC4PyPjuXuG_S7R59OJ-DaaCdX2fZfoCcs5BveJg@mail.gmail.com>
 <20241005095436.GB238189@rigel>
In-Reply-To: <20241005095436.GB238189@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 5 Oct 2024 20:45:17 +0200
Message-ID: <CAMRc=MesxXkwQtDHX4vuE+W3KAboM0PNWy6ezScrc_i10=x2=g@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpiolib: notify user-space about in-kernel line state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 11:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sat, Oct 05, 2024 at 11:42:34AM +0200, Bartosz Golaszewski wrote:
> > On Sat, Oct 5, 2024 at 9:46=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > > On Fri, Oct 04, 2024 at 04:43:26PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > There is a problem with gpiod_direction_output/input(), namely the =
fact
> > > > that they can be called both from sleeping as well as atomic contex=
t. We
> > > > cannot call the blocking notifier from atomic and we cannot switch =
to
> > > > atomic notifier because the pinctrl functions we call higher up the=
 stack
> > > > take a mutex. Let's instead use a workqueue and schedule a task to =
emit
> > > > the event from process context on the unbound system queue for mini=
mal
> > > > latencies.
> > > >
> > >
> > > So now there is a race between the state of the desc changing and the
> > > notified reading it?
> > >
> >
> > Theoretically? Well, yes... In practice I don't think this would
> > matter. But I understand the concern and won't insist if it's a
> > deal-breaker for you.
> >
>
> I don't like that correctness depends on timing, so this is a deal
> breaker for me as it stands.  I would like to see the relevant state pass=
ed
> via the notifier chain, rather than assuming it can be pulled from the de=
sc
> when the notifier is eventually called.
>

We could potentially still use the workqueue but atomically allocate
the work_struct in any context, store the descriptor data, timestamp
etc. (except the info from pinctrl which is rarely modified and would
be retrieved just before emitting the event in process context) in it
and pass it to the workqueue which would then put the data into the
kfifo and free the work_struct. We can enforce ordering of work
execution so we wouldn't mangle them, userspace would still see the
events with correct timestamps and in the right order. Does this sound
like something viable?

Bart

