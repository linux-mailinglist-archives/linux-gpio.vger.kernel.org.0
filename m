Return-Path: <linux-gpio+bounces-5444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076328A3673
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 21:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0C4283872
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 19:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA282150986;
	Fri, 12 Apr 2024 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o1XEbJT4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02186446BD
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712951044; cv=none; b=e2qF6XOLIRUX0HrfzlOJwP2vIL2dojIYCSKAtIjmW1a9MgibdGXshzb/vVv5rXIj0kle/5ZJT8TeamxwXqz3SFKJdqS/PH9i7DrAwsB3QFC+Ou+TkZ/KerMuUrHr/RlvsRMaSYTn9PjrMpDnrKjD4yVj6RpHu/bi8p7WSV5saTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712951044; c=relaxed/simple;
	bh=IoHqwPR/3f4QWQcrX8xBsgDz0K3wdj+JCIyUfWJkskQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQ4peKZEwg0MeetPj7yLNY5LBUuDnJyNGCMrAVr4MPB6uG+LKquJxmkCPoA9Sbo7faPCPX1ebmW2ygN7G2iqzcq7XoxY7U134Ah9W6B2r64ZNkDq9NGDFG1fsjHy2bUCvWDQt8JEb9u9ear9pLJLozSDoVqSdD6IZ1x1t9LXFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o1XEbJT4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso15417571fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712951041; x=1713555841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoHqwPR/3f4QWQcrX8xBsgDz0K3wdj+JCIyUfWJkskQ=;
        b=o1XEbJT4Cmt4ccmKqmqOe0yb9OeSKxSXA697Tx2X0tLZnxWnUBkxqvwOSlgj8neIgH
         MM/NWit0lbN0ulumwtrtQmEDOEnt3+FxdjkD0ZKa3ZYmGDS+OPxv23ctSp+A1oAJ9DTv
         1lyJROZI1WK4z4tbE7ycYX0aWYS7vkrjaK8VzwxQzHyUxphN9TtiDEFYyGCYtVf8H2SC
         hY4vFV6OnC7SgQo6D1LvBu+L3hOLnAbVaoq2d1D3MRgcPbiwJhXEoBuixNIUKWg5fOfJ
         8wP21uNnQqxSiH49RxIOgsm3jhatq6HQn7quAL8nuua/G8Kcg7fts4PHhf29R86R/Z2+
         Cymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712951041; x=1713555841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoHqwPR/3f4QWQcrX8xBsgDz0K3wdj+JCIyUfWJkskQ=;
        b=BzVz3SzEU/vMI9+U9xOzPSxtihcTOiV+BNxMEKVDOIUSwsYZkJhBWB9pgslRzV7uqg
         1G8eJJ7oRoVfYaCcQKX4MwfNO8/slJL+j25x5Rj6tQUcYdDsuv2e4SPTeysHRV3RlqFa
         ERazttkASmOZjbgSJUbNlkkD/WsQfLM5S0hHVYULKHPHKCoiUQN0n6sJV3rmr6wzXbS8
         j1eP8HUAUwU0HcyVuUE9S52mhYwzQ0jnBKth4L31OqIctsad1CublIjPR20/H1dh5r2T
         KC2xMVdoXdW04NK9r57fUn0T9NxFaOGNQ3GFrk2xLwKJjYcxhxjRjU9zvhQ3l7gnpZt7
         WtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwXO9PSsBGUdR0Mwq5P9a2mOlxSq69zKZDz6QobxYdmOVi81AsAuacV8OzVzPIJMkzBi8Y08idUxVO1ydfDlOx03XMmL3D1ft0YQ==
X-Gm-Message-State: AOJu0Yx61gbpWFlBxgGzvcHVmawjbom/KtefYAl6FBZkYzebTxib7NP3
	4mQkgEHX2biWU6pUbb1ThdtPwoSrZiZUpK7KiSD5QP40by1K1hxlAbqkzUXH088+2k8558H9v7V
	m/jN5814V6h4WU+ICV9ZDbOrlW0/2ahPdSfbnzg==
X-Google-Smtp-Source: AGHT+IHDFaXNrNG2VuRajk4e/f9G/kVH1bAxuITsKhrhrInNpB6M6fKmkwCUyUP9OKMFBkar1WsP6Ai0nTF3XOH1wOg=
X-Received: by 2002:a2e:a370:0:b0:2d8:8b7:76e3 with SMTP id
 i16-20020a2ea370000000b002d808b776e3mr2331884ljn.11.1712951041199; Fri, 12
 Apr 2024 12:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com> <ZhlSaFWlbE6OS7om@smile.fi.intel.com>
In-Reply-To: <ZhlSaFWlbE6OS7om@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Apr 2024 21:43:50 +0200
Message-ID: <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 5:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Apr 12, 2024 at 10:20:24AM +0200, Linus Walleij wrote:
> > On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
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
> >
> > The way the line lookup flags ("lflags") were conceived was through
> > support for non-DT systems using descriptor tables, and that is how
> > enum gpio_lookup_flags came to be.
> >
> > When OF support was added it was bolted on on the side, in essence
> > assuming that the DT/OF ABI was completely separate (and they/we
> > sure like to think about it that way...) and thus needed translation fr=
om
> > OF flags to kernel-internal enum gpio_lookup_flags.
> >
> > The way *I* thought about this when writing it was certainly that the
> > DT bindings was a separate thing (<dt-bindings/*.h> didn't even exist
> > at the time I think) and that translation from OF to kernel-internal
> > lflags would happen in *one* place.
> >
> > The main reasoning still holds: the OF define is an ABI, so it can
> > *never* be changed, but the enum gpio_lookup_flags is subject to
> > Documentation/process/stable-api-nonsense.rst and that means
> > that if we want to swap around the order of the definitions we can.
> >
> > But admittedly this is a bit over-belief in process and separation of
> > concerns and practical matters may be something else...
>
> Got it. But we have a name clash and the mess added to the users.
> I can redo this to separate these entities.
>
> Note, that there is code in the kernel that *does* use
> #include <dt-bindings/*.h>
> for Linux internals.
>

Well, then they are wrong. We should convert them to using
linux/gpio/machine.h first. Or even put these defines elsewhere
depending on what these drivers are using it for in general. Maybe
machine.h is not the right place. Then once that's figured out, we can
start renaming the constants.

IIUC include/dt-bindings/ headers should only be used by DT sources
and code that parses the OF properties.

But it seems to me that we need to inspect these users, we cannot just
automatically convert them at once, this is asking for trouble IMO.

Bart

