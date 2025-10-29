Return-Path: <linux-gpio+bounces-27834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F51C1B62F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDAE45A9673
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2EE1B4257;
	Wed, 29 Oct 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GD9m+TSD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE719F115
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747203; cv=none; b=Mk/Pa9L0j1NLbzZ0t0IGVcx4T8BKCJA79ZrVog+j76fRfVjtMAx7QfRWKE6iXjrwqH/RSWjwXvFi8CPtYUy/0UcelqKVpDUUYckzneL2Jo51HXA104riMWiiN3C31bziJj4kW+wcm27aAvF9279isrQpDhtWaenFm1NF4ZyEYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747203; c=relaxed/simple;
	bh=fprySnGFG5CPJcDu1tJYNwz1wUtSQ1AJO2YyUJxgZhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAW/+ESx9sr6mSknq6yrJ6A3RHVlockMvlgyGrjH5b5Qk7Dekf0nhD5Eqp5zfwnKCWiEc5nGZxiZffAoHv0BBRFydllizUQqAC3NYDDdlawqKtKQsHKs7yOmxn2OR35fg9XflVyvK705ArWydpfNzUdRYS2cSxpbypygXFb2mTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GD9m+TSD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so1622364e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747200; x=1762352000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4v0cJRmSCnSgMMu1WdLtnYLEr1pOeV1u124uY+kAGI=;
        b=GD9m+TSDPzXzwAb4Qph25O27mF53/U1R/K5BP4I7pZ8Nn9fyEAPIoBO2ppcatb6Ns5
         xULHcJXJvPsRm0ro9FNzQ9x8wz0kOQp1v+zwRqzVBhtl7B/9R3QULpWE3/J+n9F1OAeX
         iTQKGIOEUXMOca95IO7drBg+wK9PY8mSaweWvkhsMOxAWQsoUizml6KUreYjLsvptPr/
         OPDbjUvhmr03fJw/jwY2XYqz3Y+tMhK76M2ElA3Esa1IVK14MlRyFhe8YsgRFfNjwn/u
         LfBAVVziy4FbWTQPXcrkHdprYzepgcMxG5RhFivqqHEi/9hrxChhrWKg+tgFoMsBLU8Y
         rNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747200; x=1762352000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4v0cJRmSCnSgMMu1WdLtnYLEr1pOeV1u124uY+kAGI=;
        b=avYucEiLXToODStY3XKTrZyrpFg9RfqwO2ECfkBprA8lwHbnY4vII9UfkhSM4qxW+o
         XS60gRske3lZtjNrCFWYxB71GmKyZv3uTEICs8ugMy/u7ESdpXvx4iUWdmBTQiVh0IUd
         ZV6Gjbo3M7TGhrmJ9K14N3ZRCE5F/1BZm71bEgb7cZH37BIteDGnLBV23cqkByBJaSet
         fXTFw1qxgE1p3GXoWpxAgSOODuD7CxafAqui3h36fbjCLQLvYgkih/ZC3C2iXKKnozpl
         f+up9bdjtadbGl/GQ5ge2ftGBuAuLwXpnvirweU2tsfb64IgkJ/jioKcq+jm8ZSznesI
         7q7g==
X-Forwarded-Encrypted: i=1; AJvYcCU610YQep74i5uo4j/Kn77cVq63VrPtlMuOcszgmiTrXc/7v2KxbnlLR6oDDgICpI/mMZmA6u2+RzlO@vger.kernel.org
X-Gm-Message-State: AOJu0YylF5zRqE/y7yYv+6/hY0s0A4UOhI52ltPauLPjErw8mhz1Id6p
	ynCB/zu4hHLBbqpi6D3zqTfR5TBk8ZuBg5kso4jJAqqOCekGMIutL+FvOCKthlo6Bc7CEtw/w2R
	wriUhpkODpbudbhAPwwL5HVRQwNZBbZBnTz81i1tpxw==
X-Gm-Gg: ASbGncvDIBuVV6ZRQJeMalo42n4BOeOk+WV6It9ANrr29xCr4eZ/jUXg8YHJ4r2Ks5b
	fy83SNzyjBvLE8IJzNLsCPmZ7NRanKZcs2Dj70ihHuSkHMIGo5zKSEPEgG1zollHO1XXi2HqGTd
	WMPWOkNIRd2SoC20TeBhMdFJ9k1W+i/vWjJbVS3SP1VO2Gzi6kjA4BmmIBX+11tOx0W6VwtSprt
	FBDAfW69p2G23h41PMJNnK9Zx/UBdHXGApYHLS4ujCa/yBC4WV2CNa8dIxOVnuuJITuffY=
X-Google-Smtp-Source: AGHT+IGFvyOOIZISMRY/ZCAuIO7S1nmZlWQtEjRjxLEx8BDnt7A+8Sw76smNCHKXXeWzoMh/qrLJz/WWz20lOINjxhk=
X-Received: by 2002:a05:6512:1194:b0:57a:8eb7:1ea2 with SMTP id
 2adb3069b0e04-59412cc6575mr976030e87.27.1761747199742; Wed, 29 Oct 2025
 07:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027104746.282351-1-bigunclemax@gmail.com>
 <aP9cSArwCdvPZff3@smile.fi.intel.com> <CALHCpMjy=J7PNuDBPGOWzf35pmTAzw846DabGuHjN8nn3CftCA@mail.gmail.com>
In-Reply-To: <CALHCpMjy=J7PNuDBPGOWzf35pmTAzw846DabGuHjN8nn3CftCA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:13:08 +0100
X-Gm-Features: AWmQ_bme3lzZeAedX0mxAYZZgObVCGCm0Re2pV_I9K4FbHXpwbD7OrxP25GnG0U
Message-ID: <CACRpkdZ8hoqk2UT4=ZWLn01Zw03nbz57vKMwRKU9quNEPzejbw@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: mcp23s08: init reg_defaults from HW at probe
 and switch cache type
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	akaessens@gmail.com, arturas.moskvinas@gmail.com, e.shatokhin@yadro.com, 
	linux-kernel@vger.kernel.org, mastichi@gmail.com, mike.looijmans@topic.nl, 
	radim.pavlik@tbs-biometrics.com, u.kleine-koenig@pengutronix.de, 
	zou_wei@huawei.com, Sander Vanheule <sander@svanheule.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 1:04=E2=80=AFPM Maxim Kiselev <bigunclemax@gmail.co=
m> wrote:

> Changelog:
> v3:
>  - changed cache type from REGCACHE_FLAT to REGCACHE_MAPLE
>  - added .num_reg_defaults_raw to init regs cache from HW at probe
>
> v2:
>  - rollback v1 changes
>  - dropped .reg_defaults of mcp23x regmaps
>  - dropped reset all pins to input at probe (commit 3ede3f8b4b4b)

It'd be great if I could get some ACKs/R-Bs and/or Tested-by:s on
this patch.

Is this fixes (for-v6.18) material or is v6.19 fine?

I'm good with putting it in queue for v6.19 but for fixes I would
really like a few tested-by:s given how widely this driver is used.

Yours,
Linus Walleij

