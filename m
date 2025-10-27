Return-Path: <linux-gpio+bounces-27661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C7C0D623
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39BDA1890E3C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0104B2EC57C;
	Mon, 27 Oct 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+QgGaWi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5EE136E37
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566681; cv=none; b=AJFvQPc5aQlYAzC1I3CU0F2TahnUadax+KOW+7YBhQkXtr67AJ8yvMZdh3OXGRf6STq0P22r8uMA4kWq07TvXIsGApV4lHdOcMmvgT0fG5DVA/GqJnVWibFCcMP2mLFiRdTADJVEf6ExGkPFtJhLKRSEvecKVf58BSP/yNScuj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566681; c=relaxed/simple;
	bh=16kcW1vwy0bkn+TiQg3w/ZY6ygpWEmFvU/+qcKQlcXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFZmUcdtSHdBEovGejw3q1/tB3enytP4j49Gck1SxAyXaasGjbIgvjmaSsfsLCoueuS3T9g2o+stU4V2s7F9eMxLZuMEUxw6sfr/tRVL7gg9V5sjHd3wkt+HubXPxMQ6hCbC5M/OOKyHxWj/Du79xAGgElD1YWR3ni8iNwLxN5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+QgGaWi; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3637d6e9923so44440451fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761566678; x=1762171478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g9H7PF7mEVi0u1u3dpEiWwxRgH9FFCM/t0Z2Ioht4U=;
        b=U+QgGaWipwhSDSZBaLqk+vinjEjElxpsH/gfesBUraYOl3hsB0YNSebfzZvXaAshFc
         +SzmQPZ1B25zm5cNnE0huWuSNjMFtPQ2JlLtyQq2++FCCnjqGpIxHA9yljFxNiunOZdT
         G2T4ByRqrx6VS3Ucn82WqIQJuWjW4lK1kkGpAx0olL0iB3jaiVzamKdcics4tUDkCpqA
         dlBSufPWH65FQnnx3EvAem69l3Y3Kbe6ttTuZcO1S4L3hJGUpmQrP1KY9jOzJ01UoHSU
         ITLsqnNbRQd/bvggZv25sytrUE1p2fjgDJsx8+tW5lIdLTigswG4cE1hmTgsgBsT8hRe
         HUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566678; x=1762171478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g9H7PF7mEVi0u1u3dpEiWwxRgH9FFCM/t0Z2Ioht4U=;
        b=bOteURbjkRNlCpY2oJ9fGCc6M6StAQQrfdpdkmjA7A5eHGNGuTniMpRvqdWZMciYBx
         P6CHSG6QnZXAcXR4mI4KKIoA2xSMKKizg2wCFF0rlyAHlz7msoWwEz73qU+dc+WvTWgD
         O8hihjSRkfDDHrRRyocHxPD/9tC/QFv7l1BirKzYc5N2WHvKoBi4ho7SDW7tV0GDt6PP
         pG/Uq0D+fGf8JcYrwX98sssmSJOzeqeDKLR4vwuwE4IsrYPkM2IAigQbgMKxccUa+KHz
         lT4DQSDuWTnv6Xzb30lNAmYRREFa28deVSUhqpXVFWVzdPtb8UhK+p1z78lg6BR0Bxxr
         ojNg==
X-Gm-Message-State: AOJu0YzcRIZBumXm9D9MAyuuv59hKLwb7MkqhcVQlEVXToGlr7NpLVtr
	odiffA24IAt7Ro5tTk64qEjnJxJXaIjN+y7ni5kGnE8H1RKZjNleBVoKuwnRp5cejk3abeXp0v7
	fRtltpWYBAA2CuAVVy/cRnOgnSVtCzAw=
X-Gm-Gg: ASbGncvaHn1tfNgP5LsrMW9/c/2hn74KWcpDucOMWpcl6LqtO/OeXXszs2+20RdaXHt
	bipMFx81fy3QSDLN/+O8Y0JObJsKehc770gUZW7aEYdC6FiL3Bi/QqOVonS6050bGAoUuG0t6Ra
	HVo4GY4eWKeV6iK1u6vmzY6D4yr9ZxXyZ6rwfnLYx7SHPCnmw4J+L5dlxdKeMG9bYHqby4AZl7c
	0qBX3jW7q5EasuwUPOWZ9XBmrGknj314T8BCFBzf+JelP/RLc+vv16rMpAX
X-Google-Smtp-Source: AGHT+IHeM6o+1NeH7y9elXAOqGuDEbIOBj2Dz9Q7y4BEyDykBU6XK3Lhc7JnFNNSaJY5YrPw3A/CGhC8oI8H4vQXi+k=
X-Received: by 2002:a05:651c:983:b0:337:e697:c9aa with SMTP id
 38308e7fff4ca-378d6cc598dmr38773831fa.15.1761566677862; Mon, 27 Oct 2025
 05:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027104746.282351-1-bigunclemax@gmail.com> <aP9cSArwCdvPZff3@smile.fi.intel.com>
In-Reply-To: <aP9cSArwCdvPZff3@smile.fi.intel.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 27 Oct 2025 15:04:25 +0300
X-Gm-Features: AWmQ_blw3uLCth3OfrIpO6fLuc77YQYKuRcZ3MAWpV9Ij1-dgaYnXNaj9BJMSfk
Message-ID: <CALHCpMjy=J7PNuDBPGOWzf35pmTAzw846DabGuHjN8nn3CftCA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: mcp23s08: init reg_defaults from HW at probe
 and switch cache type
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, akaessens@gmail.com, 
	arturas.moskvinas@gmail.com, e.shatokhin@yadro.com, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org, mastichi@gmail.com, mike.looijmans@topic.nl, 
	radim.pavlik@tbs-biometrics.com, u.kleine-koenig@pengutronix.de, 
	zou_wei@huawei.com, Sander Vanheule <sander@svanheule.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi !

=D0=BF=D0=BD, 27 =D0=BE=D0=BA=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 14:49, And=
y Shevchenko
<andriy.shevchenko@linux.intel.com>:
>
> On Mon, Oct 27, 2025 at 01:46:26PM +0300, bigunclemax@gmail.com wrote:
> >
> > The probe function does not guarantee that chip registers are in their
> > default state. Thus using reg_defaults for regmap is incorrect.
> >
> > For example, the chip may have already been configured by the bootloade=
r
> > before the Linux driver loads, or the mcp might not have a reset at all
> > and not reset a state between reboots.
> >
> > In such cases, using reg_defaults leads to the cache values diverging
> > from the actual registers values in the chip.
> >
> > Previous attempts to fix consequences of this issue were made in
> > 'commit 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at
> > probe")', but this is insufficient. The OLAT register reset is also
> > required. And there's still potential for new issues arising due to cac=
he
> > desynchronization of other registers.
> >
> > Therefore, remove reg_defaults and provide num_reg_defaults_raw. In tha=
t
> > case the cache defaults being initialized from hardware.
> >
> > Also switch cache type to REGCACHE_MAPLE, which is aware of (in)valid
> > cache entries.
> >
> > And remove the force reset all pins to input at probe as it is no longe=
r
> > required.
>
> > ---
>
> No changelog? No need to resend, just reply with the missing piece.

Sorry, my bad.

Changelog:
v3:
 - changed cache type from REGCACHE_FLAT to REGCACHE_MAPLE
 - added .num_reg_defaults_raw to init regs cache from HW at probe

v2:
 - rollback v1 changes
 - dropped .reg_defaults of mcp23x regmaps
 - dropped reset all pins to input at probe (commit 3ede3f8b4b4b)


>
> >  drivers/pinctrl/pinctrl-mcp23s08.c | 40 +++---------------------------
> >  1 file changed, 4 insertions(+), 36 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

