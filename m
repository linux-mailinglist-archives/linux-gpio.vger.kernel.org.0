Return-Path: <linux-gpio+bounces-23199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C35B03433
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 03:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A148B3B6564
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 01:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200F918C031;
	Mon, 14 Jul 2025 01:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCiDyx0h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE722E630;
	Mon, 14 Jul 2025 01:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752457102; cv=none; b=hQiAcTULYQHoCmaCJ6MJoTsqrO0FYMzG1TonZwCJwMEoZJKPmuHcxFwbfPFS5Ko0GTTWHukHSs1kf+AHwKMHCe09ur+M6UwtwLLZGDTgokKfWkJkChOIeMzYUQqxEmfTe9+fsxR+6lVDqocmqA0SEDuUHAan+26bPYU2rKlQDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752457102; c=relaxed/simple;
	bh=DHusJ3vyligIBarK8AcXZdKTmRrphxVq4ktA+nGAWI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfG/VxMGCwXfZ6Mfko6mm9MLcxPeX8xpJK31rngQlYeYeDpjHz5+YEqC4zTq3TueIkPH7buyOkgFmqmYw6LsMaXWj3i8bM3jlwZljf7ufEQA4GEDxQ7HgtEx1eQH3QAkiq+P9Ndo17NXi++WdCfCgd1uv4y8yJodlrqD/qZBMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCiDyx0h; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234d3261631so29370745ad.1;
        Sun, 13 Jul 2025 18:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752457101; x=1753061901; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtcreD6AJjdJvbgPMY2aPGi0VXiodaMP38me0CGQ908=;
        b=UCiDyx0hIAWjLBzVlTfe74nwQ81doQqiVMy+C4HEHTL3Bo5UN36pNq2lkGcCV8W9K/
         5DVyqwNGZ5JGkeTXc5cVvPnUHdq41BEQckWmnECHdk2SUCHvl8JJctFOn55sBsvyJus0
         g+sD1tForp0JEBMFUvBdI4WFg2BG7XXl8i6EDeO7KndHf5o9ioM9RNubMB6YQfgcSZKB
         NoeLB3AVs7dkaahBQZ2s8QQNbhHNvq+CPeqRNIABpnjUUAvzwNRSKmNN+4+o8wGZ0X9W
         EXqUQS7CA/hjefQIFAu/IW5eLKSsK2xczx/+0RzRUPbjToTZfCGXOoJotYXd74vXICVU
         mSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752457101; x=1753061901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtcreD6AJjdJvbgPMY2aPGi0VXiodaMP38me0CGQ908=;
        b=Oljyz5Sc8/1BtZWdbSJk3SDBEOzQIuv7Dxso4KG9vMEAJ0+r5nX7fjPbuld7Wb4jpz
         iBBQJs9kAwpz2sEe8xpx9J9qdlkbR+FiyOopQVon+HdAhKKvmBfK0FX5cdpBM8yf1YRd
         Zhav7pNj89CN7m84FEvUUOMZHBu7MG969/e1paKhYBv+2LsXiWg827+5NJ/h4Bllu5Tm
         X8fJOGGpqzu5AK5IqWZMXJhUV+9ur4zYC+BkmRqiAU5+nTZMSFE34U3VH4d7SACkaJes
         8CChA3ap2mGiTjhwV0c7roKR8tLPA4lzpMw3otGu2ZUh6+s4fqyhYOWRcwbs1xlLMe8x
         GImw==
X-Forwarded-Encrypted: i=1; AJvYcCVD5RJ2Il201ODSWong10sd7w3T0/hJ+guJfJMW8OGG4Nrtpa7ZMSPe6JqO5qxkIFdbtw/p8ztUJyiS@vger.kernel.org, AJvYcCXzursX3SkkLX7VOzNMcprQ9bER3yJWHFlzHI+0B1y6oN3sWD/UfXMs7gzfRBPn6EMX0Olsvg64uXIF5lqq@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqXlctAAUkRmqXea8q8GGlCSMb2HYTVqRmYbxg3VSN6KDkswa
	SM2vL3wLhDBMsgvWe7fda8d0KprTGa88QD9asVDtenPJRTQG8a+mrCqx
X-Gm-Gg: ASbGncsGD3cT1sf0n96BuOYU7vbGStSeXP3kGZitsaAnuzfaIG3VMez+D5pt6jeLssQ
	cQYkabotRG82qtLhW1IlPii8Lb5Bc8wl4pUQHvEiOo+H/UfugEsDtr7oCG83hOF+0dnT2DweMC8
	0BC370TqGWMxO0AWO75Ods6z81dQxONKO6NAHGJ82Ka9sd6gxkSpughIc3lJ5nAzfmg41mybza4
	fZn9fslllG74yWHiwfbn3zg9aH1bGRwzYftV0ic8ZI3WUGhruiZEyCc8jC8T0Aiz+lGxvX4LM1f
	nCUxYzJeOiWBaoHPVvldZRgaO6zZWdq9p+obuMCON60RdTrp27jf+GPzYxA64la4Y8lrFm6jFyA
	TBSmolviat+46GCbckvqi7gv50e0W1dx+dkfBM5XtVi+clER1wQ==
X-Google-Smtp-Source: AGHT+IEIRUYRqdI+zg7zKmJp6H3n+T7xR/d9+UN+LenXlPemYbXlm4SkmvEEau4mVAJEmnAi/H+H7A==
X-Received: by 2002:a17:903:46cd:b0:235:655:11aa with SMTP id d9443c01a7336-23dede92f44mr173918115ad.39.1752457100589;
        Sun, 13 Jul 2025 18:38:20 -0700 (PDT)
Received: from rigel (61-68-193-107.tpgi.com.au. [61.68.193.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359b6fsm81283295ad.212.2025.07.13.18.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:38:19 -0700 (PDT)
Date: Mon, 14 Jul 2025 09:38:13 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <20250714013813.GA12284@rigel>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
 <CAMRc=Mc7HaVjchDWN_oWUuqgVZbj3ZVYvU-bwiA+ZUH+0gEXSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc7HaVjchDWN_oWUuqgVZbj3ZVYvU-bwiA+ZUH+0gEXSQ@mail.gmail.com>

On Sun, Jul 13, 2025 at 10:48:03AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 4, 2025 at 2:58 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Following our discussion[1], here's a proposal for extending the sysfs
> > interface with attributes not referring to GPIO lines by their global
> > numbers in a backward compatible way.
> >
> > Long story short: there is now a new class device for each GPIO chip.
> > It's called chipX where X is the ID of the device as per the driver
> > model and it lives next to the old gpiochipABC where ABC is the GPIO
> > base. Each new chip class device has a pair of export/unexport
> > attributes which work similarly to the global ones under /sys/class/gpio
> > but take hardware offsets within the chip as input, instead of the
> > global numbers. Finally, each exported line appears at the same time as
> > the global /sys/class/gpio/gpioABC as well as per-chip
> > /sys/class/gpio/chipX/gpioY sysfs group except that the latter only
> > implements a minimal subset of the functionality of the former, namely:
> > only the 'direction' and 'value' attributes and it doesn't support event
> > polling.
> >
> > The series contains the implementation of a parallel GPIO chip entry not
> > containing the base GPIO number in the name and the corresponding sysfs
> > attribute group for each exported line that lives under the new chip
> > class device as well as a way to allow to compile out the legacy parts
> > leaving only the new elements of the sysfs ABI.
> >
> > This series passes the compatibility tests I wrote while working on the
> > user-space compatibility layer for sysfs[2].
> >
> > [1] https://lore.kernel.org/all/CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com/
> > [2] https://github.com/brgl/gpio-sysfs-compat-tests
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> 
> Alright, so what are we doing about this? Should I queue these patches
> for v6.17? Kent, any additional comments?

Nothing beyond what I've already said.

Cheers,
Kent.

