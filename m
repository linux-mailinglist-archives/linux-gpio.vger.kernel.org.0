Return-Path: <linux-gpio+bounces-7870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3B923997
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 11:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94E35B218F4
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 09:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE91B15444E;
	Tue,  2 Jul 2024 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AFxtDJq1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228F61552E7
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911725; cv=none; b=lW12s1McEhRz9dIr6XzV6vFSRd44aUxzvGYO4QYjE3nhpV28NJUgiTC6Xc3I28NXaU37HMG+q16eixvSckt7+kP8RCtd/gJ8/qWJ/QKQWx7eZsVkWg1LfaQktR3JKjcgz3AevYfTmTiPrWRRjhTnp5E0Q5Sbl8lBb3gSXOTu6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911725; c=relaxed/simple;
	bh=EQTNOpJrJJVRsl3E4CvRl2aPBB2nXhPLCAIkUakjP1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3+rh2WtxFjcd9nRok/+XNJxqf5D5VeNY/NJVH64xPQi5Ya7B75AXzOCaGieEUHEElHvK4n90n+OCbv3M3a6WwPQaXw7Ti86yu59EBOWF2Se5L5eoAKxbqL3draFp1KblRNrhHlt8RqnIJr5RiVuuGdbLYxi9tzZO0OchpBCHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AFxtDJq1; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so4487561fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jul 2024 02:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719911722; x=1720516522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQTNOpJrJJVRsl3E4CvRl2aPBB2nXhPLCAIkUakjP1Q=;
        b=AFxtDJq1wUjC5o5XqPn3fITamHS0zi8lUjd8NqakqNmypJvJYQCx6xZehjAg3VxazO
         89wvXAiDhUcWbBsC8TonNtcj3wqeB2yh0jr0BqsYbnvgFm8bEZPV4jPYo2o/KEdX5v/U
         MWS/uzkyYGZQVy4zl9noencXtmoxU/P/L3ymsV32Or54+meH9zZ4xgZpPKNqWM3V1int
         LoR3OH+bUoudRxzHnaxSDGEiYQGo6ra5xVdmm1IcX0GRvTWCcpBtzFkI7L/tV5X1z2ND
         h6/QoL5rbGR9rw3JQcwBJEQfqCBctF6pCiS1uaZl9+sWqpCACSD/W0LIKKu7TKX1aHH0
         QcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719911722; x=1720516522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQTNOpJrJJVRsl3E4CvRl2aPBB2nXhPLCAIkUakjP1Q=;
        b=CxW0M0HphvVdeEF1DKL8PX0Jjelyzwep045FkSuoZkDYCV78gKE8nt1OuVLTNeCnYC
         MncUUO/vNuhvUqJTaB+DWkQSDx8PDVvnsVLxOlJCs8nx9AWbJkeGHSqCw6YRkH8sj+Zd
         k6J6XH/18lI6QYclNXg6UMZux4yt+iH2hao8MVE6IpfwYOPnU3o9NutadjY/urfy0Lsz
         ot47PyrKIfLq8Ewql23QQl67i9ahvahfzL8jufAAO0b7jfweuZyTqWf8HRXMwFj+ZeWa
         tmIbFwcI7tcOHEWWvIzHsCgIqQpnyqk+OEg1WIPF923RbjTdSKH2LrbGioFj2QZvg4Ya
         Sp2g==
X-Forwarded-Encrypted: i=1; AJvYcCW3LqSQCASFr+eCAovs8woUwmnQVmBPkS0vdNqxIzBhhURAq8ofAoYEhqzZKP0npLHJe3lrhMK4J31G9a/j7al44P4utAE7onRWqQ==
X-Gm-Message-State: AOJu0YwblakKpdNUMz0l0KtoJmqj8OhLRoCqawDp5ooLreB9dOxJSe9q
	vqt/jUIMVARpuIHWn75knd2Kaez05hTv3EhcaeDjUKFefbX1O675NoSaQ9sDXVEKsPghfqWGelY
	TGnCNxGydN4zkPSdEQ1pwksqLlc2kROHk5mpgXg==
X-Google-Smtp-Source: AGHT+IEWD8lBHqBYl5FfKm9rF2oY5zuAJnApcXXEx/4rQ/+6+BQ9xPlxwq5yCdZ3Dz7kL01rfNkMTEV/tOwzc1I8vak=
X-Received: by 2002:a2e:854a:0:b0:2ec:597f:664 with SMTP id
 38308e7fff4ca-2ee5e37ff87mr57830101fa.2.1719911722158; Tue, 02 Jul 2024
 02:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org> <1917470.LkxdtWsSYb@tjmaciei-mobl5>
 <93346bfc3647d24f1512e79088b26f804fbc228b.camel@siemens.com> <1867994.25eIC5XRat@tjmaciei-mobl5>
In-Reply-To: <1867994.25eIC5XRat@tjmaciei-mobl5>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 11:15:11 +0200
Message-ID: <CAMRc=McaFTy+csg+1McRjMNDkYond74VSrJsQ3mETp7dJoNtnQ@mail.gmail.com>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
To: Thiago Macieira <thiago@kde.org>
Cc: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, 
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "warthog618@gmail.com" <warthog618@gmail.com>, 
	"erik.schilling@linaro.org" <erik.schilling@linaro.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"dbus@lists.freedesktop.org" <dbus@lists.freedesktop.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "phil@gadgetoid.com" <phil@gadgetoid.com>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 11:06=E2=80=AFAM Thiago Macieira <thiago@kde.org> wr=
ote:
>
> On Tuesday 2 July 2024 08:48:43 CEST Sverdlin, Alexander wrote:
> > > What's the point of this property? It looks racy, as the user (whiche=
ver
> > > it
> > > is) can stop using it soon after a true read, or the line can become =
used
> > > right after a false read? The latter could lead to TOCTOU problems.
> > >
> > > Wouldn't it be better to force users to RequestLine and get an error =
if
> > > the
> > > line is busy? Because if it wasn't busy, now the calling application =
knows
> > > nothing else can grab it.
> >
> > this approach would make the inspection itself racy, isn't it?
> > I'm thinking about two instances of "gpiocli info" running in parallel,=
 they
> > would display GPIO lines randomly "busy" even in case none of them actu=
ally
> > is?
>
> Correct, but the race time would be very small. The status application ne=
ed
> not keep the line requested for long, only enough to get the current stat=
e.
>
> In any case, my argument is for everything *except* for the status / info
> application. That's an outlier application, of which there's likely to be=
 a
> single one in the system. However, there will likely be multiple applicat=
ions
> that need lines for actual uses. The argument is that the presence of the
> property can lead application authors to check before RequestLine in orde=
r to
> present a message to their users, possibly because their code is simpler =
for
> reading a property than dealing with an error.
>
> Therefore, my advice is to not have the API that can lead to TOCTOU, even=
 if
> by accident.

Unfortunately there's one issue with the above: requesting a line
(even as input) may result in the kernel driver triggering a physical
change in hardware which may be undesirable. Inspecting the "Used"
property only results in fetching a flag from the kernel and will
never make the driver act upon HW.

Bartosz

