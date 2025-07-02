Return-Path: <linux-gpio+bounces-22598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4716EAF115B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 450BC1C2496F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 10:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41A24A07A;
	Wed,  2 Jul 2025 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQLsAQ9T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654ADF42;
	Wed,  2 Jul 2025 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451145; cv=none; b=JuYVVwJA01MNL2yhRV/kyiNt9kBlYJyJUCxBF0SZDr+vuPSgstnAra1kIFEiPlNktBzuFSnYelZG4FyDd5Rc/hmkqmwxwlo10ondLVs8VOZR+D/Y+/JXW8swcbjL1HoNyjZ5JFXkt9aA6zyPZtXefU6TTqPUfvlj+ymrA1jwebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451145; c=relaxed/simple;
	bh=JQTO+UOM/QWolB7pSFU7RNeEKcoIknujotB62whEi3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKGtUNpIi5Y5I11O0IXftnxhGVCldTWgtpIJtPn7Kt91cw8WK7I6LnCmO/iZflWQfobar/LDw1XtlcsrPPWvuyaQtALiALwLr7hG4ejQ2Q5sn1MdBYYUMKc+Y4+xXijzfBO2NEP9jDztB9oJVMxA7+cs7cGhhRiXlOE1BORDGbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQLsAQ9T; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235e1d710d8so78593215ad.1;
        Wed, 02 Jul 2025 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751451143; x=1752055943; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eW4eCP7VTxRFLhKK4Kf4ed+TI/vlcwvs/Q6OEwxNNys=;
        b=TQLsAQ9TAavIuhhC20ZlQxTNvLXtqmKXYZHzA2qPdXNZSMrETvlw7QOFNf1KwKLU0o
         3SLZkKIji35Cs8XDdR+Vkzzuu9DQlngDyDZhYFIMEgO4jNcMP16Fz0KoKEGp3o1WatQv
         R8MwffrVtCdoCHFzKHz517T7NI/gG1k2m2CwP4wpDVy5rlq+IDNNy3VqmueLga7zGCsf
         QPb2uiiReOJNzlaT2Z2zAoLUCGZFJ+d9od3+DuWSNqA19FAXu5m/IjDlJSgJNfNrcfCH
         fIL425hTaIAeU5zI1RN9QwOkoHgi2KMS6PU4M9SHTS+fWqH6fTzizBrI1Cq1k+Mn0eTg
         /dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451143; x=1752055943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eW4eCP7VTxRFLhKK4Kf4ed+TI/vlcwvs/Q6OEwxNNys=;
        b=lsPgo6A7+RH0ZiTsE+QMztcnJ9fQXpxbTx+X/G4IpuPEai1fV9ytKhibS+axVYD8rs
         qBWC4NtkkeUlrlcbFxel4ZNl/57KetF29c88bxYWAOuyGwglTuo3sX5Lf0GydEfrTZot
         F910WxkVd8qpupRUvBO9V8/RxqXsN/8xiOE+ehwuQuGyCCqcCSy2oZohP61CImFJwH9Y
         tz2/TQ9G2/GcvrlKmRK3Bz7DtD0Ph8/BkClBVhSvrwIqHyHchx0BxBIrqen+7zHvlLpz
         5J3z3hGVq1VdPYwqe1gdXS5BvaxrupweFaLX8Dv0DO8/iPfrzzFTarMq/l1QDGVuR9mc
         /avw==
X-Forwarded-Encrypted: i=1; AJvYcCUkOZPDKKu0sSHrR09kMty3Vs2nhrYJrr+cn5hn1O/hVNX1Vhwu8l5/cFqYIGNGougI0hln0qBdECfLEJni@vger.kernel.org, AJvYcCV/SDWjgo0f1PP2ljz+BZlEALuXRrUawivway32c1K5wG0uFVN1PBl/rsTDcFw+S0dqqVCAc48qEZ7S@vger.kernel.org
X-Gm-Message-State: AOJu0YwALEkLH/Gvyk+5EGIMN0eNjgHzIj8WjxIKe/cZlfoCX3AQSKXg
	+DIKBy0vtngmVGFBhv3LWHMXQAPqETeU2dHDDqheBG9XBbrBqOY1AGKy
X-Gm-Gg: ASbGnctXbtU9yl+k/VfDBs9j3quca1CymZQ9EY43eW8x8UO7afKdqEBw6NR/Olne0kA
	Lmwf9uCj7v3WpWyI6aLjKd4IRFPJ8gQdajHUfg3S2N+5u63WJbH2qa5Wa0KKZTA8qeNcnkIxxMC
	pGUijC89wkUZshe1u/tzA3wnWirdhGH/FSFHatmmGTcYlt9XxlUUGxDJHKrw4qVjAAHCx/FeyPE
	1Jpj2kfQR26Ok9vA18/rk2b/i3ZmIc3Qve8Buq8fM9ZCP8VlzlGr7fYz3uqiDJ+CG71w6UboOnk
	Ll3ftjEU0WdqTe+0cfKW48Ac6gH83C4oHKyCDG0Otl28RZub8ReDZZFfrEq1hKv9ZmtiWlgP1tM
	xIlA=
X-Google-Smtp-Source: AGHT+IF3ur8T5TTo9e5Hv2ILk9E/xYfEj/MBxH3RqihGdYMLYMtVbHA61Nvl4xjspllEAwBawx28Qg==
X-Received: by 2002:a17:902:f682:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23c6e4e1723mr28573325ad.7.1751451142711;
        Wed, 02 Jul 2025 03:12:22 -0700 (PDT)
Received: from rigel (61-68-193-107.tpgi.com.au. [61.68.193.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e21b2sm136943885ad.43.2025.07.02.03.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:12:22 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:12:12 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <20250702101212.GA47772@rigel>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
 <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>

On Wed, Jul 02, 2025 at 11:45:02AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jul 2, 2025 at 5:54 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Jul 01, 2025 at 05:05:10PM +0300, Andy Shevchenko wrote:
> > >
> > > It seems I never expressed my overall opinion about this. I think the poking
> > > sysfs and making it working with a new schema won't solve the issues that
> > > character device was developed to target. If so, doing this just brings yet
> > > another broken interface. I would be happy to be mistaken!
> > >
> > > If I am mistaken, I would like to see a summary here that explains that clearly
> > > that the new sysfs approach does not inherit design flaws of the original
> > > implementation.
> > >
>
> You cut out the link to the discussion that preceded this series where
> a good summary is in the very first email. Anyway: the gist is: people
> need to do some basic GPIO fiddling early on from initramfs that may
> not have any tools other than basic shell utils from busybox. This
> series is not about improving or extending the sysfs interface - it's
> about removing its reliance on global GPIO numbers. And that's about
> it. We don't add any new features really, just move the GPIO line
> groups into their respective chip directories and make exporting use
> the hardware offsets, not global numbers.
>

And that is the problem I have with it - it is just removing the global
numbering, while keeping all the other sysfs baggage.
Instead I think it should be thought of as adding a new minimal sysfs
alternative to cdev, based on the old sysfs.

> >
> > Indeed.  I've already expressed my reservations about supporting the whole
> > of the existing sysfs capabilties, but I've otherwise tried to remain out
> > of the discussion.
> >
> > To reiterate my position:
> > While I am all for maintaining sysfs in some form to cater for those
> > rare cases where cdev is too heavyweight, IMHO it is a mistake to
> > support the existing sysfs capabilities in toto.  Take the opportunity to
> > remove the parts of the sysfs interface that don't work well.
>
> Doesn't the last patch do it? We cannot remove it without giving
> user-space some time to switch. This series does everything in a
> backward compatible way and then isolates the old bits under ifdefs so
> that when the time comes it's just a matter of removing everything
> guarded by them.
>

Not suggesting any changes to the existing sysfs here, only your new.

> > The new sysfs should only provide the features required by those rare use
> > cases, which IIUC would be basic sets and gets, and exclude those features
> > not required, particularly warts like edges.
> >
> > If you need more advanced features then use cdev.
> > If all you need is basic sets and gets then sysfs is probably fine.
> >
> > If that isn't the case then there should be some explanation as to why those
> > sysfs features are being maintained.  Treat this as a new interface.
> >
>
> I tend to not interpret it as adding new features. We really just
> *move* what exists under a slightly different path when you think
> about it.
>
> So what are you suggesting, remove the `edge` attribute and polling
> features from the new `value` attribute?
>

Exactly. I'm not suggesting ANY changes to the old sysfs, only your new
non-global numbering version.  The idea being don't port everything over
from the old sysfs - just the core feature set that non-cdev users need.

Cheers,
Kent.

