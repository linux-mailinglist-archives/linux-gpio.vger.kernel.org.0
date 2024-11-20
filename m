Return-Path: <linux-gpio+bounces-13140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB319D342D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 08:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE8E283831
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 07:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1027C158DD8;
	Wed, 20 Nov 2024 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gube/4re"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01753156676
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732088152; cv=none; b=MhMf//ra+rRnstaXoZSOal4YN3z60cB0V2sZBlHmFEyrkOBoHLoZ60K065fanv9QX2yFXKiQPDRsfbYvUVgoF0C+5r4DEjT92GzlEb0cKMksQjCI3zj19kP8S1QDAsiT9zT7cu115omNGzNbD5kRokFvQsK1u9yWYg+Bm5AdIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732088152; c=relaxed/simple;
	bh=JKSJqxGDbiLgwxdlepXXqCf3WXM9QgPafwIjc7kN2GQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8jltImKbuqEe27bWC7Zb3f5Hr8dyYkhRi3xx1zgMZxaSEdHSpkNIlyWzxWnIayLXccPZXw2FoL4T+2G3Zlv3qzCxibNGp/7EbkW1SkTJncu8fk9IyPBIKHHOwOU1cMshrWfsaQ10uQH3YH4jzn+gIDVeTZI7SIVYBHkRKbYP58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gube/4re; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53a007743e7so5793476e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 23:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732088149; x=1732692949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVdt7me2BL/1fsMZfkqd2rx53sv6P4dXB86USYdpOEM=;
        b=gube/4rer9PLcsI6AmV14GR7H9ocmCXp6NwZTNkJ9YtGQjZF0dQihvM57EvBm0ffQa
         4BBnE/XmlsL1aNr28zHT+lTtS/YJfjHfCUbpTx5f1IAoNXkWYUpk8Df5HgT5E4GGrWZ5
         MAOuU1RMB7H2rxGU9oRqC+ezW/dx49PG6CkyOHM0wULAefGQP/yBsuRmjyBBGTSQEWpM
         F/+6BuR3GjaN0EVlX2iJrrW5BVvyGcn+hTo+HiZo9G4Fz41r7MvByo2P2SVe56r3gE/a
         eyYBcP1e/o3S2U4uM1msILRXh1zynRJ5dlz97GTSRJ1mDOs90Sj58pI1O75o211UJ1UH
         WrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732088149; x=1732692949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVdt7me2BL/1fsMZfkqd2rx53sv6P4dXB86USYdpOEM=;
        b=ENwO/Vw4+5xBR5L23d2knm+zH8IcjL4DaMeHAoqIx9336deu8fzEUXMiNvjUsHVCJG
         YigrkXTT73gia3X1/hm5Vmjpyf+hkUfPOrgB6BisE7Rpr/ZeimMJsmcStD4HM23z0RYP
         PRnKnBwrmG++9jw7ceEGCrXJrCikOsAczEItjTxZwOhXCw6sXq2MH1vTAZD1xEyGZfZh
         fOYUkozyFjrNIKRky6NaTnUwP5F4NFZ7N8OS9vS1/CFdHG4l8EF46WtFA2g1B0Nl7ZB+
         3tWQWNXk45BWL9IUybebmGkxe71LxXnZ62+f8Sz4YOUcfEzlNjTGnJiT4ROphTQcaPpj
         vTUA==
X-Forwarded-Encrypted: i=1; AJvYcCW4xEZphmtsVuLWu3oo+qeQgNGI+5N8Pqbk35Cku3fQb0g1GoHh8QoPhVKhDZ8GpuI/dUZDPurv4v1A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7J9H/wZoXlwUy/6ZR69Cow+yy4dq8uPtcZ65iG1vSRg2J1L1O
	dsRkAUBBSObYJuS/QebJjIkexCYgRX+m2S+Dbs5fQBBlsHg0z9Or3BNwjnBX8hR0+LTMmI3XEnp
	QJzFmRfK/dZRTzZ9BDT9KK66vsRv8Eyu1ZApONA==
X-Google-Smtp-Source: AGHT+IFhQwU+3f9jL5bp/lYeAYqWZlBwDx6zgv89CNCtOeVal/X2CJMoACyYoC+2s8VaM4/eB5xVe1ULuCvFi6rF4uM=
X-Received: by 2002:a05:6512:118c:b0:539:f1ce:5fa8 with SMTP id
 2adb3069b0e04-53dc136debcmr552235e87.49.1732088149001; Tue, 19 Nov 2024
 23:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120053055.225195-1-00107082@163.com>
In-Reply-To: <20241120053055.225195-1-00107082@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Nov 2024 08:35:38 +0100
Message-ID: <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>
Subject: Re: [PATCH] Fix a potential abuse of seq_printf() format string in drivers
To: David Wang <00107082@163.com>, Kees Cook <kees@kernel.org>
Cc: brgl@bgdev.pl, tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 6:31=E2=80=AFAM David Wang <00107082@163.com> wrote=
:

> Using device name as format string of seq_printf() is proned to
> "Format string attack", opens possibility for exploitation.
> Seq_puts() is safer and more efficient.
>
> Signed-off-by: David Wang <00107082@163.com>

Okay better get Kees' eye on this, he looks after string vulnerabilities.
(But I think you're right.)

>  drivers/gpio/gpio-aspeed-sgpio.c            | 2 +-
>  drivers/gpio/gpio-aspeed.c                  | 2 +-
>  drivers/gpio/gpio-ep93xx.c                  | 2 +-
>  drivers/gpio/gpio-hlwd.c                    | 2 +-
>  drivers/gpio/gpio-mlxbf2.c                  | 2 +-
>  drivers/gpio/gpio-omap.c                    | 2 +-
>  drivers/gpio/gpio-pca953x.c                 | 2 +-
>  drivers/gpio/gpio-pl061.c                   | 2 +-
>  drivers/gpio/gpio-tegra.c                   | 2 +-
>  drivers/gpio/gpio-tegra186.c                | 2 +-
>  drivers/gpio/gpio-tqmx86.c                  | 2 +-
>  drivers/gpio/gpio-visconti.c                | 2 +-
>  drivers/gpio/gpio-xgs-iproc.c               | 2 +-
>  drivers/irqchip/irq-gic.c                   | 2 +-
>  drivers/irqchip/irq-mvebu-pic.c             | 2 +-
>  drivers/irqchip/irq-versatile-fpga.c        | 2 +-
>  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
>  drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
>  drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
>  drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-

Can you split this in three patches per-subsystem?
One for gpio, one for irqchip and one for pinctrl?

Then send to each subsystem maintainer and CC kees on
each.

I'm just the pinctrl maintainer. The rest can be found with
scripts/get_maintainer.pl.

Yours,
Linus Walleij

