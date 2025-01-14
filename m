Return-Path: <linux-gpio+bounces-14796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ACBA1114F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 20:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335F6164D50
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 19:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9C02066EA;
	Tue, 14 Jan 2025 19:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA8biULj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5176204590;
	Tue, 14 Jan 2025 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883822; cv=none; b=Lr9dmy/SG74mBF6WIvdYVcD2KPG5bQIJhvWLeuJzrUu2I7RXn+w0/7PlgadH20lHh5S/6kwOKvNThnHWkEFJYTZIK5l3p03rqWigzvIxMtDDa6OA3Tyj2hcehG3DCAcGqwu/VJc1YWNEiUuOxgziJds1GYeAnug4QGkDj8hhZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883822; c=relaxed/simple;
	bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iX5pe55tUhDTHTMTJh3H4QmYWFzZWfUZI4YRGnLrAmXb6Qo/j5Ip10AW4LEsBaAb9Jz8Fd7GzJHqmC+Jq5NOYmXzzK7uScRmYRoyNZj5SAC9OjdfRHSCuiTtvJxEJT2pOyyXC+MIZV3IoqYF0rHIHW1xnVMG1hvxEAXK6gBQQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA8biULj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1068688666b.2;
        Tue, 14 Jan 2025 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736883819; x=1737488619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
        b=OA8biULj8Xh92vQPIxt6rP4vt//UpKRjM4dXK/42fxTuZxR5r+YRggA0KICa3EFE2l
         H69niFTTr7esfJ3izRi5cBMpQV7Yt4rJJBzOqwZxtnhJJr2KWiJYYWTgJIGMQ770dxbz
         Syzi7gWrnX1bb4vfHg6Jds9GQ1va8aOGHTumZ4dxN9dJbpdFZcdv6Gthgi6wGTGSkrGb
         mM84PuWASPQyVXFbeLrKHx6kyieK0jSteKZa8h+UxakvOxQbDtaIB7ezLg64mmlJb3yk
         odibwIgRly47kRap/s1V9A+Jhk91ZXPxoGDGEEcvSAt0eTUelLls9yn9kup1KfmkbPAF
         DVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883819; x=1737488619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
        b=KNq5aP5eg8lLI8v9BXV2qZUUo61SpFEggVyYrfkJvZ3On1um2TeoDqi5CZIFhnbECN
         Dsdk6wzc1SSGfy6OGOPp7hVWWAywHW3EMtJu3fzNepVvV4CCTaat7wzgXUVfcvl2nAGe
         j4yV57FzyXxNAYkmp2bLVK2cerNfRkPeAswdajWsYk8Yp1iR6/LQfYPmU7PRH7xp9J8H
         xBSvKBk44ds4r48YnriqDs5/koxv9vOOxI/PHiRM8BhMPJxeSkDEsnmnNaMHNkwZ3WYp
         psAuba+Bkt/2hIWglM/Ojk/JkMOQ/pV9sHEjlrvPSMBZq3AYIgRXPVgV2521cOOdi6mG
         gBaw==
X-Forwarded-Encrypted: i=1; AJvYcCUNm4SfWjOvGdaeQyANlK5fOEP09auyDL6dfc/KMM3elzKsFm0sFDin4U8ffHYevQYoCjAYltUINgvPHahr@vger.kernel.org, AJvYcCVOE6jztFoa6eTZCN4aH+kG10VyRXXwZRLTETHl5UUvkawBE8rtONSJCfSS9Nq4Za6Ftn3fr3nR3oh8@vger.kernel.org
X-Gm-Message-State: AOJu0YxXepBlf+Hhp6LhXNHg3ewD7mOvpPYpAZ5I26+qin0JI/cMXKlD
	OsTgSaomdm2P9CTAfBSsIZBWx6fV7pY30wjVlgbSf5Hj+yV2RKtI5XH2KVO4sYzk6Nu2/kH17Vg
	oKkyxpuWYYmkOu9JvWLyKwkXhAEQ=
X-Gm-Gg: ASbGncuhwZJdeOeGmHWoKTMrs356V3xQAjlbR9kpvy6rmAIsfxwEeYMK7b66oBSi8TU
	Q24EGgwc1Ux4T9+qTp55o3y28Hh32YVshkjLPQaqS
X-Google-Smtp-Source: AGHT+IE4RbVs71/smgDj/TU9UMPWxR9g62d8TumLSWo8W/n9+Z0nM2yXhOXr7N7e9uaINKsYnz0zeibsE5WgKYib+Ro=
X-Received: by 2002:a17:907:9410:b0:aae:8495:e064 with SMTP id
 a640c23a62f3a-ab2abc78b52mr2090164566b.40.1736883818809; Tue, 14 Jan 2025
 11:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com> <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
In-Reply-To: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 21:43:02 +0200
X-Gm-Features: AbW1kvZ6R2e3yRjumlny6gUuJSkRGD__NmZWUskaVnb9oMxLZs0nWXPBoBuMPXA
Message-ID: <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
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

On Tue, Jan 14, 2025 at 11:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
> On 14.01.25 10:46, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >> for more than 12 years.
> >>
> >> Reverting this to dynamically numbered will break existing setups in t=
he
> >> worst manner possible: The build will succeed, the kernel will not pri=
nt
> >> warnings, but users will find their devices essentially toggling GPIOs
> >> at random with the potential of permanent damage. We thus want to keep
> >> the numbering as-is until the SysFS API is removed and script fail
> >> instead of toggling GPIOs dependent on probe order.
> >
> > While I understand the issue this tends to get never fixed until the
> > entire support of iMX boards will be dropped.
>
> i.MX is an actively developed and widely used platform. Why should suppor=
t
> be dropped?

Exactly, Which means "tend to get never fixed".

> > Personally I do not like
> > this series at all. Rather let's try to go the hard way and understand
> > what's going on to fix the current issues.
>
> /sys/class/gpio is deprecated and when it is finally removed, this series=
 can
> be reverted again. The alternatives are either do nothing and live with 6=
 kernel
> warnings cluttering every boot or show users the finger as described in
> the cover letter.
>
> Do you see a different path forward?

Yes, try to write your scripts based on the libgpiod or the tools
provided by the project. I.o.w. follow the warning that SYSFS will be
removed at some point and prepare yourself for that. If some kernel
work needs to be done, contribute.

--=20
With Best Regards,
Andy Shevchenko

