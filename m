Return-Path: <linux-gpio+bounces-28929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962DC75E58
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 19:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97ECE350561
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 18:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081827C84B;
	Thu, 20 Nov 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kyk29MP7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1829B8E8
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763662792; cv=none; b=IZ0g5d2zsFP2vbSH/j29vNkCiJqY1Qkx7T2OzLIVAuTQqmDg+LDFJHVsZw33O55X+H/3cKE36B+vnSCvoL77q/fgiWSvIkkWvVlhn5uVS7bMVG5OIH8gRBfCTt9U9pJ2qPJDNp9K5S7+MWl0p8JdP6FhPHvm5psPwEfve2/SvcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763662792; c=relaxed/simple;
	bh=2frM4ZKJ9sHrFHvhxYMW/pljtv9IlgikwDwgYXbV9+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcGsy2vp3aSakhLt86Px+h2NwRbB6QplRAPKt6aUWh+Irw6YOR7w3DaPlKQu2XS5S3lYPUVX954Yx/nEZo2vJE9/UuBUN/icR9YDyKdcympvJGIU0ERfP9RhhFOQ0uWxl2vitWNZtDr4fecbRZB+Ff2mrLXzrBud0hQZlN5HBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kyk29MP7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959da48139so1196052e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 10:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763662789; x=1764267589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=;
        b=kyk29MP7qKcrUq/lMPOHCAFiP6roy2oouvyrWvJhDLmYAwzVNM2DCq+YQ0glx4YU6H
         wfGraDVQzwEMJjMcGM1wwXpAEuGVByepve5+thh63Hr4ZS0HngBBDCvMTtAWISMl7xIA
         S+gaHIf3P36lFIl9p13wrxL7hTMNlrxYYDNUefUdQmMtf+6CRvN2Ww1lqyYhYS7QE4L4
         exmVTObHgB3Z31J5BcHtgTeQPwRqDfc0se2P9BHElwFYYAixboESwmwh6Pg9f085LpmG
         1fCCEzl5KAbE2C3TaUGu1iMlu9bn+hQWq4LZsgWOMJIgwZp6sefZhg1NLyIRhsstkNmO
         DboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763662789; x=1764267589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=;
        b=f2AtDDGEt7yBWGmoeRiZBQ3jEic3znIERJtFDTgXqRznqNkYmV32JcBR0bfWh3M5bz
         BZxuPkay7EpXATK5rdvA1SYnlPP08V629py6wElzitZdWEjahceCBKi1WJG0/GnUqjF8
         s9LVb731Xr7Avr4zqmLx+UO9lUTHfA9mghcln/3tBC+Y6IQg2YcUNEhP2nouOyxCA7OD
         XJ+5o84K7fVqEOo5Gur4PLZ/43tyNbAkwjLINfXujuFZKuq03Lmx/yE7WDKR6UWx0vcW
         Ydk5GODorIRCJSKkND1ay9FBiVrrwBsEUDSuoNn/T72K8zyziT9MdM+Bmv9dg5DyXkrw
         k2MA==
X-Forwarded-Encrypted: i=1; AJvYcCX54fsKECNe+jvXoxYCDuwFvUibeLebXW00A4J3nV2njKXfM36oc0FmHGTf8d5f0bPNNOfB8V114rxU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4zspTFQ3SL8EeTNyJAPPjWxjEo7N0wDSoPWureRafwfLzO4+
	dSJZoJXzKB2GzI3tOynTYfnXfjmdvHO30Gavt8Vx203IOb0HeE+eUYMLtz1HntO8XFDVFxyMo3U
	qFfcl2Dxw2vK9bliL6ZOVw7KJ/HaDJcqmHCu3iickmg==
X-Gm-Gg: ASbGncuG1NzXHN8ze7C1+yAPIF+90OqkZ2UhosWS2bNFMuXZ9oN2yQNaRLKC5206sir
	AFeSkCx2LaJjMLB9By4jRHRdjf+MthYFdT8V+iLfp12+3j2lfmOjHVViRu5GlFqqoAHZjyY6IGT
	3x4Rm0TTtvYAKdfO7nBt4faZxkBvL6MghBQuG7+nmEoZ+pwaH82NZqckBgtedbXq+IZ3lrq+wC8
	DCKxdvtVc8MzKcZBe612Xqoz3sWFC+q7SVPrWmqyLmbJKpgs3W3kRIvMky2EfVRBPToNSQJF6pd
	2pQ7KYpT/NTGEbQqfzk+KYaqSgtJA+F3ii3M
X-Google-Smtp-Source: AGHT+IFJUK59m9cV2hdaMboMdwCuLYZSd6vorsTLduT0KYUQfG8bYza6yPNSkEBgztU1V5kaircoAsMSf6iO5hTasWc=
X-Received: by 2002:a05:6512:b01:b0:594:34b9:a7f4 with SMTP id
 2adb3069b0e04-5969e2f421cmr1562911e87.29.1763662788999; Thu, 20 Nov 2025
 10:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120163252.34760-1-p.zabel@pengutronix.de>
In-Reply-To: <20251120163252.34760-1-p.zabel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 19:19:36 +0100
X-Gm-Features: AWmQ_bkWVGFSZn3FalnS_qvDgjI51sEMsJrOYvZkmui2vXqgrMxEN-ruhSsnp2s
Message-ID: <CAMRc=Mfzzgx2JcBa1iG9L9ztF+S55cSNHgNurubPBsDteoLraQ@mail.gmail.com>
Subject: Re: [GIT PULL] Reset/GPIO/swnode changes for v6.19
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 5:33=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Dear arm-soc maintainers,
>
> The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a=
7c:
>
>   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
>
> are available in the Git repository at:
>
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-gpio-for-v6.19
>
> for you to fetch changes up to 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:
>
>   reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16=
:51:49 +0100)
>
> This tag is separated from reset-for-v6.19 because it may also be merged
> into the driver core, GPIO or SPI trees, if needed.
> It contains a single series [1] with changes to swnode, gpio, and reset
> code.
> It is based on v6.18-rc5, which includes the prerequisite commit
> e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the key for
> GPIO lookup").
>
> [1] https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493=
a0f4b@linaro.org/
>
> ----------------------------------------------------------------
> Reset/GPIO/swnode changes for v6.19
>
> * Extend software node implementation, allowing its properties to referen=
ce
>   existing firmware nodes.
> * Update the GPIO property interface to use reworked swnode macros.
> * Rework reset-gpio code to use GPIO lookup via swnode.
> * Fix spi-cs42l43 driver to work with swnode changes.
>
> ----------------------------------------------------------------
> Bartosz Golaszewski (8):
>       software node: read the reference args via the fwnode API
>       software node: increase the reference of the swnode by its fwnode
>       software node: allow referencing firmware nodes
>       gpio: swnode: allow referencing GPIO chips by firmware nodes
>       reset: order includes alphabetically in reset/core.c
>       reset: make the provider of reset-gpios the parent of the reset dev=
ice
>       reset: gpio: convert the driver to using the auxiliary bus
>       reset: gpio: use software nodes to setup the GPIO lookup
>
> Charles Keepax (1):
>       spi: cs42l43: Use actual ACPI firmware node for chip selects
>
>  drivers/base/swnode.c         |  30 +++++++--
>  drivers/gpio/gpiolib-swnode.c |   3 +-
>  drivers/reset/Kconfig         |   1 +
>  drivers/reset/core.c          | 146 ++++++++++++++++++++++++------------=
------
>  drivers/reset/reset-gpio.c    |  19 +++---
>  drivers/spi/spi-cs42l43.c     |  40 +++---------
>  include/linux/property.h      |  13 +++-
>  7 files changed, 141 insertions(+), 111 deletions(-)

Pulled into the GPIO tree. Thanks everyone for reviews and patience!

Bartosz

