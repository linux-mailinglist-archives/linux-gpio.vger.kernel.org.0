Return-Path: <linux-gpio+bounces-6194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 696FD8BE65D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 16:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 259A8288539
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 14:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4FB15FD04;
	Tue,  7 May 2024 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PCHoPc57"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0B015F32E
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093299; cv=none; b=c2lIsxRXNxeGPNMpqdkrOVyV8xJW5OY19WFlpSbLT0yejvDm9XKAXEZbECNu0zbxACYyyAy1fWjDtH6k+YgUKYxvldliOjZML2i5esfTWaN0Gxal2x+G3tcjkGZmlVOSIYhsn+nYFCEfBwjcKH8GJlKnowdZEK+4BusfvhRjLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093299; c=relaxed/simple;
	bh=O9U7eifATy8AucP2fwKsqv2Qi7a/NxF2S8DlLhQxBOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EomIPQ9YDNVdMdwmYVjE1cavpHoFlqydeKrFrAqAlsEYkuYYsXCzXRu13Ai2foJRjhptSXMnC/dwsJ3Tmb/s2OIre5o2FtlEJaLoD8YWDRE5zqwuBm2HRmTTzXHUUhs5qBKwy9SppcD7IlNhgagINJfUKRegjHTBa66IV9jV6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PCHoPc57; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2db17e8767cso40755101fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715093296; x=1715698096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E2tOH2LZeelmKHGCVRYEwTjym6Omr1xato4eYpOm4E=;
        b=PCHoPc57NicYWeCbCLKQYtSzZ48TuQrqMCrl8LMUNj1+cWv5FFlocjDP5Ngpw3Xj6A
         /8O3ynUZRCUQnO7z8PJfGkD+AeDrPLCEzEk+AVONMHcEneXGaArld6X6WA3Ruc4aj1WE
         QfrZoxDS293sasejpLyGJFGL2JMNrQX12NRBu7NYcqFpg1z3v+qkf5VzNZksenEbbrbl
         mPBFHb0dDbkWG6ec0QgMx4EmflB1wo8dJhXIfllZD7DgxIXEY787uqhvgD0BCJ80uBTh
         5svbzqg8tseNOdKKzNBkyFi//p++C6BnsSiQOKXVWfpljM8AO/a7vaBdlSwR0wW1MIyX
         ttVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715093296; x=1715698096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6E2tOH2LZeelmKHGCVRYEwTjym6Omr1xato4eYpOm4E=;
        b=l+CKs8fS+cRrVryRqYzob/zQ6AvWxUgbEHDRQE2JMcOGO290bFtUPvSF3Jvwx00d5Q
         Sc/eDgmAKXC8F580tMjD+9ggx7LmgardShM0xt8UYF+QOPkRFxCyUBjD+lmRLW1aGM3I
         lQgAwA53bydHihEf6hUdpNbDf0jPL3A9OjsOfulWbDDXVfY+4ed/nK5IF+niOJwAh8iT
         wemFSCWq6Vcq5mcRCbr/2d39LF4EuzwAZb/Z/xmeUzs+jHymE+8yA6Owx29PBCslr07n
         PsJAs6HeeJkFwC8BXMHG6Zio9m50q/kAGIQVEe3VbrsvYnDrinOWT1DVhtl1dSAfN5AA
         K+aA==
X-Forwarded-Encrypted: i=1; AJvYcCX5taiECjSZpGyDcUSlCT6buzdrf5JS6ZNI/FHp3QR3CPqOijBWKUqC0Cc74KCGsHe/I5QZJmWi3HeYJ4iU6fn1S/qtVFt9PljqnA==
X-Gm-Message-State: AOJu0YwgfxoLOxbUBMvdCzNq6bCxa/I5ooMWR9UNFcJvDJxhCfe+4BmY
	NPsch13Z/1fgYuKnGdMZVDnOO8YphDACWt7P62WXTX3pXoEu4YYDzvHpTxSPF59eF3q4WE1R6f5
	8liBILmoYl8NVVPoGd56XJTxcHJ5u+eQdePuv3g==
X-Google-Smtp-Source: AGHT+IEWf5bz0gIK/ChOYdDJ2AEL/N1lGY6OKBycVzHc97pVufGbuietFwGdydp8PqHnPhjEha+mXPz4acp5wASwKDE=
X-Received: by 2002:a2e:b0d5:0:b0:2e1:d94a:773f with SMTP id
 g21-20020a2eb0d5000000b002e1d94a773fmr8924737ljl.11.1715093295962; Tue, 07
 May 2024 07:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507121346.16969-1-brgl@bgdev.pl> <597f5da2-71be-4144-a570-fdc4f06c4cc6@paulmck-laptop>
In-Reply-To: <597f5da2-71be-4144-a570-fdc4f06c4cc6@paulmck-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 May 2024 16:48:04 +0200
Message-ID: <CAMRc=MexihBpLBcY-8aX06buUYmtE07ZpkMq0Ho3jrHb6VE7Sw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with SRCU
To: paulmck@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 4:24=E2=80=AFPM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Tue, May 07, 2024 at 02:13:46PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> > caused a massive drop in performance of requesting GPIO lines due to th=
e
> > call to synchronize_srcu() on each label change. Rework the code to not
> > wait until all read-only users are done with reading the label but
> > instead atomically replace the label pointer and schedule its release
> > after all read-only critical sections are done.
> >
> > To that end wrap the descriptor label in a struct that also contains th=
e
> > rcu_head struct required for deferring tasks using call_srcu() and stop
> > using kstrdup_const() as we're required to allocate memory anyway. Just
> > allocate enough for the label string and rcu_head in one go.
> >
> > Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Closes: https://lore.kernel.org/linux-gpio/CAMRc=3DMfig2oooDQYTqo23W3PX=
SdzhVO4p=3DG4+P8y1ppBOrkrJQ@mail.gmail.com/
> > Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Looks good to me!
>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
>
> One semi-related question...  Why the per-descriptor srcu_struct?
>
> If the srcu_struct was shared among all of these, you could just do one
> synchronize_srcu() and one cleanup_srcu_struct() instead of needing to
> do one per gdev->desc[] entry.
>
> You might be able to go further and have one srcu_struct for all the
> gpio devices.
>
> Or did you guys run tests and find some performance problem with sharing
> srcu_struct structures?   (I wouldn't expect one, but sometimes the
> hardware has a better imagination than I do.)
>

I guess my goal was not to make synchronize_srcu() for descriptor X
wait for read-only operations on descriptor Y. But with that gone, I
suppose you're right, we can improve this patch further by switching
to a single SRCU descriptor.

I'll send a v2.

Bart

