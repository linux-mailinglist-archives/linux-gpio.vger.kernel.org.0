Return-Path: <linux-gpio+bounces-568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA337FB8F2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 12:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1C61C21345
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 11:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289B84D5AD;
	Tue, 28 Nov 2023 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIpXhSl9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF581B9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 03:05:52 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso4659700276.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701169551; x=1701774351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9inmBgzQikrIBqD62bA4GvIfc5wuvS30+/1Cdpqiy0=;
        b=nIpXhSl9KBcJW7tvpKLxte0gkogqbhV8icLBwt4epYfMmbdLCBfhOa8MT4xaI+cNI8
         DEDaGFLPDPpo3aKarPQdZ6U8BAmD/pK231sW6uzJK6Q8bLZ4l9j8KQNd8nCAHyBgfrws
         EgNNEnswOfUG3VpkN1ISFEIiHva/kV46xJXVMKEPeaAB/u2rIgN7OahyuLJ49yB5fwlu
         ooxKJS3eBN6oVGCwawUXBPrFwGoB4o9HirppCnc/zccRg5ROcabFf9p0cZRSuog1X1jN
         akYWC6QTGjqVdrjCHz/bPzxEVuRhROFhavUaLvO4+RhGx8GxYCMpz9irohvGddeRRsCF
         3wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169551; x=1701774351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9inmBgzQikrIBqD62bA4GvIfc5wuvS30+/1Cdpqiy0=;
        b=bz3RkCvTTgHLuZLpMFYuj7G4cpcMPCyqyhizshz2a+2xOzeZ9SG47mRr0KqjMVlNcm
         xH/QtFb7XWxiVvzAIomPcss9Fu7CkakBylgjyMWEzYLH76g1Ky+4UFKvMT2yxY1uSMWq
         CU8Je4/++G1p93d0uUui3/i469Hu/dUQIWVe80pUlY5+kgzxZUCmmgPu8yy1t+YwwVee
         upNRx5L/q+fvOQzVKOXfDeekBBj+zWRGLIkgThW/1S5BMTOMfVj3Sww9/JfHfjcoP8YG
         1egjoei8RR77ylPAtETFhOv114BGnRz8cB4NBZje2H3djQssb9gCW/5ZHHx0hDL33EWH
         oqRQ==
X-Gm-Message-State: AOJu0YzIdgw9i4kEjtXUHeb+yzJfUtYi3fN9/+I0UrfKvz0kWk6fzjdQ
	rtflPZdP60wk3OY9QY3RuESqxnQWJ8WPDxwIc5VdnJ1P2E/o4NDs
X-Google-Smtp-Source: AGHT+IEZvyidjntu4ojOKHmrkKCzrECWjgwlGKk9oulRa0Yie+OfySdBc5P9Y7mtKQ9nLUxirLJGflojlySjY2GpDaY=
X-Received: by 2002:a05:690c:368e:b0:5cd:f107:970d with SMTP id
 fu14-20020a05690c368e00b005cdf107970dmr8684820ywb.47.1701169551422; Tue, 28
 Nov 2023 03:05:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
In-Reply-To: <ZWKL4r9DREwYjnyo@rigel>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 12:05:39 +0100
Message-ID: <CACRpkdY1+n0LOnEOpAe0vhzhjAv_P_mKu8eKsiZ3+hUg0xo4Zg@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 1:06=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:

> So why allow the usage of non-requested descriptors?

Mostly boardfiles in arch/arm and arch/mips do this thing, by way of
the old API using global numbers (that get translated into descriptors).

You can't even blame them: when some of the code was written,
there was no gpio_request() even. David Brownell added that in a
generic way 2008.

We are doing away with it, one driver at a time, one board at a time.

I think I finally purged it from all OMAP boards in v6.7-rc1!

Yours,
Linus Walleij

