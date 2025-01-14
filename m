Return-Path: <linux-gpio+bounces-14795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1293CA11143
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 20:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22BAE164531
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C0F20551A;
	Tue, 14 Jan 2025 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWnyiyJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78777202C41;
	Tue, 14 Jan 2025 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883545; cv=none; b=fkxi4GwiuBH0QK5hZ8a7c/Hw4ch67IzH2B4sbyqWR/S3APtBhmQAvKDjdyceuIV9XwZDqjipF3xz50MJvbfrxY462M/6jhr5J+krjP2g+NYR+m28QUT94IWaG5hSo3pXMLew9dZqOitSuEb46iNojl1oSPdIPSZO178TM+f2zkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883545; c=relaxed/simple;
	bh=SvjhFkZ5JDAX452mdJcA/v29Qpr6Qp4g/a566g7672Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCPWcxy9l2CUQ94SUjTpWaPQsbdPy0yiRiJVEeoqhJXc7jhxr6bb6/DaIdbK1uJCidu6Cv3hxnK4ONaPlvYFmMtNqQGz5avPa9ZBUbfZmZllpUEUSZQuShKpL+jZ27mbaVFb+ng7ABK+Cg7Z2SFn6zWW8qlL8a8jNzaYQlRexrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWnyiyJb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso1135342566b.2;
        Tue, 14 Jan 2025 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736883542; x=1737488342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=;
        b=WWnyiyJb2VteNHXeop2PRQ2Azh75s/lrJdoYRLzL+2aqVcqpejYipcmxwek1byFaCV
         5wLh4KMFHBKfnX1PFDphYN/TCp2rCjckNIqVTBGlR9cGyNzYY+xi22fhKYvqqoithXpp
         UL74fs8nUKMuK84n6yeBoULF0FFZPvazVNnwq/D+P8VBdxS80+wxhiv6KpolDpbXaHkG
         HS1q/vJtlqhDNZsJIzKjLMAdmj6HA3qq9HhBLaI+qvQp+puab+h9PCV5iN4WJM3BUOID
         aiITLDmMm2AK/iTL8o/UuXaHnsfhts5CYFNzlUjJ1IlaDhspZ13dKIkUlCHXYc7dWjrH
         gAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883542; x=1737488342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=;
        b=NAm0IeLhtD5AJiq0XQBebtrlhzzraRfnzEhPNIVaxGqTgJ5zlePW97ZGWRPLqlpl8Q
         xMAdt/hP9KGMqpa9acKz709py8+Qf+Pi8ecCZmOlAw6z+YkwSExtA4ohHzWZSx/hCR0m
         sqqTJOPJIch4sifkwk5fEKZy8eJUCLstqiH+220wSZUghnIEdF8jFD6Ue4fSCx7AOBvu
         daIA1KaJPFbBetBCgxuRD+xcm+RUBgzXw+yymnHLXSm38IrO4nzlHVTDSlsTRw5/C8rF
         WS7QRHvuOPivEndecWCNeQMP8ulIZGz1gap/CGH+Ay6lyHDooo7LlJ3lrDHe4FEIBaXu
         Tk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGkRliehNiy6tIsGkJU3TWsKAY40aobATaQvpEbcdRyM947hzdbxBhGkIfh6foqYr7pklspirdJfFH@vger.kernel.org, AJvYcCWp/dcp7Fzn6nlGS67G0oCG6nIS47dGaOtkm4ktYRg628VyBX4+uXZBDjooZIg6ZtTUhBgGMh7mclxpymGX@vger.kernel.org
X-Gm-Message-State: AOJu0YzzanqocYOaeXp3JgZFye3hZ6q/hibtSAjtl+TQudOkOD4c1n/z
	6qrFwMR938z0+7lq/NEiisR9dtPjJmAXxdwdJJR/QcxG28fNbTMEZsFc7PVHTfbhcCubBdbmCPZ
	QvewEHB3J0t1g4jNYdkhxme6ZOjs=
X-Gm-Gg: ASbGnctyB1AH3OAOAhBsAwPYROo0++gYxIVKmd12G45kdkRc456AtqSTjkWfuPmDZE9
	atajeqXEkjlwj9v5umavxiZ7Sy0Wb/I80NYcn+LIs
X-Google-Smtp-Source: AGHT+IGVObRTXkJgLmP+wm2jP1YHrpOKzkqy6VxBJmEYGfuoYeicXpLRBMTRDYNPxmMcfQYiic3FDlwA+bhaVFvq/20=
X-Received: by 2002:a17:907:7e91:b0:ab3:f88:b54e with SMTP id
 a640c23a62f3a-ab30f88b5d5mr877315766b.31.1736883541610; Tue, 14 Jan 2025
 11:39:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com> <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
In-Reply-To: <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 21:38:25 +0200
X-Gm-Features: AbW1kvafmnO2knYXImFWgVHzWQ-97My7fO0qROrQj8PrD4sC6j0CFR5lpTEhMPY
Message-ID: <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:06=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
> On 14.01.25 10:49, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:20=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> Some drivers have had deterministic GPIO numbering for most of
> >> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> >> ("gpio/mxc: specify gpio base for device tree probe"), more than
> >> 12 years ago.
> >>
> >> Reverting this to dynamically numbered will break existing setups in
> >> the worst manner possible: The build will succeed, the kernel will not
> >> print warnings, but users will find their devices essentially toggling
> >> GPIOs at random with the potential of permanent damage.
> >>
> >> As these concerns won't go away until the sysfs interface is removed,
> >> let's add a new struct gpio_chip::legacy_static_base member that can b=
e
> >> used by existing drivers that have been grandfathered in to suppress
> >> the warning currently being printed:
> >>
> >>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >>   use dynamic allocation.
> >
> > Warning is harmless and still a good reminder for the stuff that needs
> > more love.
> > NAK.
>
> A warning is a call-to-action and it's counterproductive to keep tricking
> people into removing the static base and breaking other users' scripts.

Are you prepared to say the same when the entire GPIO SYSFS will be
removed? Because that's exactly what I referred to in the reply to the
cover letter as an impediment to move forward.

> I don't understand what love you think this will spawn with regards
> to the i.MX GPIO driver. Can you explain?

To fix the bugs you found. If it's not the GPIO driver a culprit, we
need to find the real one and fix that.

--=20
With Best Regards,
Andy Shevchenko

