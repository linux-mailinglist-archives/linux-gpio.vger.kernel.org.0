Return-Path: <linux-gpio+bounces-5233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE089D97C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 14:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1CDFB2185F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 12:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DAD12E1C8;
	Tue,  9 Apr 2024 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jtKIzC4E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530FF12D777
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712667335; cv=none; b=EeKbd/eY4Y56kYbhhFJ78WqMGJTmMoTAQ4cDJAnWXvN6tE2FPd5tFafkg+kRj3kX27Sx0LXIyaeQWNOSWtcXAuaXc3rUtIBlwBzqsKJv0OvzYgJyR5Dnxj8g3N7LIJHlGhV07MbFJuAg84WfRJbZT4czwHJxza16T9imlqoGflg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712667335; c=relaxed/simple;
	bh=28FvpAkubR7U/YnsKwvZJdGYuQx67JP9jJ7DevI04Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHXXIxecSVnsgXc/W7LslW7lq4CPRaYCQsLAtBCMlv9XRUn8SbmjQE2imlOmkeduwS2uiJTJmJUC57yAfdoCpv+/ws3P8QslIONxInh99xnvt8zBbxjjtlzAv5etcbsokPGepA9/FRSV5QZBz7djVXdFENZC3N85uwqlWfC5k+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jtKIzC4E; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d886dd4f18so27552211fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712667331; x=1713272131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElDlfqr37WkHv45h6Xgla3cstFx6EJxDXR9PqWmhUCY=;
        b=jtKIzC4EmhsRGAK0P45mAs7G0xtcD7TiD1cuzc19o7WQMN0ofEC4v7stbzvS3tnbcj
         cokgJ51myXn3uqv4w31rAYzxBY3x/PT+ovEWu4H6041DSfK/wXxkRtPbNH9WBbny7cMN
         Y7nyKuDV6SESnjVEl4ZIpuLAgp50m5kw0JI7a1ekHoD/1gB1SpRYf/EzmJqrOlAsvgbj
         zWcUqiyxyVtswEC7kqYFi9s+Akv5sxL1OYHUHo7etzuwGq/6fnuQRe+HDu7SB4DVeRQG
         +/XhDHy+SvqAoKanUsn/PCi69dJDoJ7V/0jRcDdbNvmUwSnIL8lk0v2ZI8omunrYREDX
         qFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667331; x=1713272131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElDlfqr37WkHv45h6Xgla3cstFx6EJxDXR9PqWmhUCY=;
        b=s0/JdB/UBUEaKzy9Q3Z5CXxPM+88juA9piB3SGWWgES2qW2hali8Cu14Mlizr67E4p
         NjS41zj7hkITjkYuOkmqalgZ3lgBRzAaND3TeYuuAkVVr6BVcrLjRlFBKt6DEXK2kNZs
         gvTGgSD8GkfKSKdDKnJXkF7F8n7JPIP/x6U8ph2DSp2h+I1zKD9lozMOVpcbH206DCMR
         2lK9V0zYjjZn9AsGXMa8odpoDKrWfpZoU52jNuMtR3jdtbmb88ZBe1EacwvAk9kygNLp
         6+5dwN8kFLBywgdxfqU67necLOeWT5c3+5DpMeNRnT8XfowCcmOS5JG5w1mhQHaSvd/B
         +v3g==
X-Forwarded-Encrypted: i=1; AJvYcCWQnHFMUGCn417/roW31Z0wuzQCSKKqxpsC17z5yPD63g/nsoY0nHKBXNC2a0t2dSPziSQVagGMLVCw7/ipvLIr3oHeckzUUSIjOw==
X-Gm-Message-State: AOJu0Yw4F2yYoRLDQ97ECAEXU/olM6qWItiLwIJUvnqiQ/Zp8JuulzTX
	eoLcvGSrTJyXrazrl9o+t4qNo+wWjgFxrX+q6vmNBW3m6sbeCzwkYLs/pw2gHM+s6T3AwVQZthP
	nukw/0PD4qaAAcwcjKB9D1DZ1xLw71okjvlKwNUcwgrcNrW+A
X-Google-Smtp-Source: AGHT+IElreytHxSdK3MjFouAJM+ZDxBIAatjdrl9atwum0J18I0K0pLO6B4r+Kvm4+ejftK0BHc2qci1wKAPT0U5X2E=
X-Received: by 2002:a2e:2285:0:b0:2d8:2fb1:3d with SMTP id i127-20020a2e2285000000b002d82fb1003dmr6423456lji.22.1712667331365;
 Tue, 09 Apr 2024 05:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf73fFHo83gNvDXGy9BosB1MNz_=8kt56hLA12bPBb8CA@mail.gmail.com> <ZhU5uDJk_M_TtKH2@smile.fi.intel.com>
In-Reply-To: <ZhU5uDJk_M_TtKH2@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 14:55:20 +0200
Message-ID: <CAMRc=Meh6K2zxpVPHvsDcr5vMMeagK7FGhnUPz3bb2rQQCPHJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 2:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 09, 2024 at 11:42:37AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > The GPIO_* flag definitions are *almost* duplicated in two files
> > > (with unmatches OPEN_SOURCE / OPEN_DRAIN). Moreover, some code relies
> > > on one set of definitions while the rest is on the other. Clean up
> > > this mess by providing only one source of the definitions to all.
> > >
> > > Fixes: b424808115cb ("brcm80211: brcmsmac: Move LEDs to GPIO descript=
ors")
> > > Fixes: 5923ea6c2ce6 ("gpio: pass lookup and descriptor flags to reque=
st_own")
> > > Fixes: fed7026adc7c ("gpiolib: Make use of enum gpio_lookup_flags con=
sistent")
> > > Fixes: 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag wit=
h active low/high")
> > > Fixes: 69d301fdd196 ("gpio: add DT bindings for existing consumer fla=
gs")
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/gpio/gpiolib-of.c                     |  5 ++---
> > >  drivers/gpio/gpiolib.c                        |  8 +++-----
> > >  .../broadcom/brcm80211/brcmsmac/led.c         |  2 +-
> > >  include/linux/gpio/driver.h                   |  3 +--
> > >  include/linux/gpio/machine.h                  | 20 +++++------------=
--
> > >  5 files changed, 12 insertions(+), 26 deletions(-)
> >
> > I don't think ./dt-bindings/gpio/gpio.h is the right source of these
> > defines for everyone - including non-OF systems. I would prefer the
> > ones in include/linux/gpio/machine.h be the upstream source but then
> > headers in include/dt-bindings/ cannot include them so my second-best
> > suggestion is to rename the ones in include/linux/gpio/machine.h and
> > treewide too. In general values from ./dt-bindings/gpio/gpio.h should
> > only be used in DTS sources and gpiolib-of code.
>
> Then, please fix that your way. It's quite annoying issue.
>

This is not difficult in itself but it's a tree-wide change so we will
probably have to send it to Torvalds at the end of the merge window in
a separate pull-request.

I don't really have time now, I'll be travelling for 5 weeks in a row.
I'll see closer to the merge window. Or next release cycle.

Bart

