Return-Path: <linux-gpio+bounces-31528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDj1AfPgiWkKDQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:28:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3310FB0B
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A67433023DE6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 13:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967F0378D65;
	Mon,  9 Feb 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBOIE+S+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C153378819
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643516; cv=pass; b=YAcGL+4gTQ/V6m7c+ZXEqlMHNtXVUBpcwtLoH6vVoHIqU3S46uI99guheC9TqCFL8kachHLyKmMw3uh/D3f6QJ539U7KBuom0WRIyvvlr0qZCPSoomMWttDRX6DUPqzBifMX1GdiZyEq7ThDkh2oEQxkGoQxMJ6YZKg8U4Y75ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643516; c=relaxed/simple;
	bh=I0kT/5gQP7hegeGg5e5RlenRbFh1Bxpc+bwQQS5s/UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNBAthG5sfzsfxFzbYvKk+u2eNUOpF8a/JW2u4msFs7YkegXV1nQF982dyYXio63lXWCgf2/8OVRR1TmFOu2eBo1HA91X3KlK8wy842uIoUszocmkE8VjwOB1kZEn565DRvIp+BZPvsyoX/6rJ1sviOCqihJjG1G2kmxl4cNrno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBOIE+S+; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8838339fc6so384926966b.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 05:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770643514; cv=none;
        d=google.com; s=arc-20240605;
        b=YNDFWisp67QKAfc6MkSzo0p6cnR09/w2QYte77dTmTxgfMur5X5Fpn16/cBoG3tbAb
         j6bTB1afNxDLdhnog9m0fSRpT6RS+d97JrDi6OvDrSfQwEAzEBqYQRmpvNttsBSrhH6N
         Ptn/nML9ogUAzcpbzH3AUeB42W7cWH56gm4FZzaWusmUPnZ8FbPm9eRv0pUPznenBa7y
         Nyrhx92GGtZ82q/hwlnp1raARpmqAuAWcmRDOFOHoX4jXLOIAkoYbWNmnfDzarono4T1
         Qpx1stkgh2Wv/v8Kj2pR/UN1sS8uXRgpbQG1mTdLoHf+hygkSIYXwV7tH1znwWZBB0Vi
         444w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I0kT/5gQP7hegeGg5e5RlenRbFh1Bxpc+bwQQS5s/UM=;
        fh=WPlJc2tW1cWPEv6Zkc04dCIiC1sW8epWoCvSFjexitk=;
        b=KQUfex20JT4WsynXvUXDoxs7JHL5cxweEZOoR48sML5A4cmQHZOgZk+Rc7Q+VVGyU0
         voH2OzqZ3135gXqCMyNpg/yWKL/FF3T6MT4o+vi2DkzYoequp9TtTiTG3kNm+i0OfKbu
         p+OLQuVopIm3ylRPYcMfJ+jnLe+w7A3qUE6xfiKTH+RNtb3Hugtq3hDTtTn+1LwtXHnD
         iscEclPzHULzYrmvjs0KkwFlywxFlFLkpuivyIIbqthVblgMJ4EfXAY+EV4y5Wf3dVjt
         VJL7YJ1y7XwlqO9wO4G+N2r34XxU5e+HA8vAwVQ4kuonHWdr2IMP1oPNsdnMcRiExiYi
         fcAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770643514; x=1771248314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0kT/5gQP7hegeGg5e5RlenRbFh1Bxpc+bwQQS5s/UM=;
        b=QBOIE+S+s1+sWKDWzOHhHkg9e3xrmsYj7FJOP+KUgqbVr8CRu45AmiXcOXqvqyDuQm
         3RBNsmN+d5RdWyILA4+UQ0MLmIumDsobyc0s7AzikNJBAbe8jDvuxpuA8hjXqJJ9gDjp
         3tVOo9085E2/lAR9bo3krK679EgG+hkh2xUBzIUV/feNUCrf/4hzLQ/psv0+ry4ybGSU
         hZp5mI7Gx7e/HKrzFFGU0Q1hDzUFtn7azlhpDOrsfJazaKFBP7yJ0iLOKRYANIIHejNW
         2QF8BBHkxM1/2ANEZzXoUhX5cOHg0Jj70hRPQPbeg6g3uTn9rTwfaxdAbb3bVZ8gJgZk
         CAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643514; x=1771248314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I0kT/5gQP7hegeGg5e5RlenRbFh1Bxpc+bwQQS5s/UM=;
        b=pUzYaIPbpDQ0RlgAYWtoZiVVMsOSfmEkiwQhDJrl/WH8nYE52Veej6c03MWTCz4sFp
         YvQzH1b1Z7rPCARSpfo/launjRVzQusqXRqlkCKrQj0lyj2YYxQb7I8/F/52hNv/0tBK
         8aFw9E1OQCkjlkLw7A9IktBh6IH9sph7M63p0BEe44DS3+Y+gwfSEu6hgby97x84kx0E
         QlruY2/W6anykQyLhId9MoTBXRxDeGDhUbeYP0htTVCJ6NfoGHZDSEN8x0nLrZHOvPM9
         jfyalzvD0BvnSRYbtp9z9UziR6JAH2CITeeLdKpavnA+ZHtafh3Ez+NST5ksmaGeuCWF
         qOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCNJNvq+TUhGRauMq6gXcREIgXiYULKLJQ6+gjY+JDRhHKDdBDW2BpYw2iSau3We5QItupy/WCzEex@vger.kernel.org
X-Gm-Message-State: AOJu0YxQhtscfz2jlueV1gX6YJZBWShndUjvYHvYqGCZrglZIN+uipkW
	hyh5itg5HZG58K1Xzs5CSsryOUnzNLO265E1CquEgOQXxjyp/9vEiAcMCfjlWT6IpW8YBSDTjpr
	ZuyOnVuv4BfA/Duzh9vUGwbqp29K8kQU=
X-Gm-Gg: AZuq6aJ9K6dMtGWxjVeqC8XxKY8hWhqb6860r8gWnEf5pQnlnObYU23OQQz4JcRECPb
	4BfvBaCcNAOCArvyb9YELA1AufP8OB4OjBsQINHgauFLtPjjSDYnPwXZIUAJhJmiSLB+/cXhgon
	s1WfUWpGwwB+NiHzXI2+lY2+n1Y9XXcdP/EZCbCYiCl6EdpJSzROOms6dQ37tdzR4FLprnR4TM3
	yg2w7m1GARajXGSJ2GnZZdfo/HAmYT34nP5zXUIeFuo2xnewbD963SHVkic4D0qAWVbTE4NYAU8
	4nx575s=
X-Received: by 2002:a17:907:3cc2:b0:b8e:d4ed:5ed8 with SMTP id
 a640c23a62f3a-b8edb9adc12mr649043966b.19.1770643514004; Mon, 09 Feb 2026
 05:25:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org>
 <aRyf7qDdHKABppP8@opensource.cirrus.com> <CAMRc=MfD7ZbwU4akkCJNgmRPwgSOqSVi2-L2dJDOBHrfdD-yZw@mail.gmail.com>
 <aRy31U8EQA1DO/R6@opensource.cirrus.com> <CAMRc=MfNf+WMtSW=Wag0QHAaYzcRe9igrbOeRZiY92KmOH70oQ@mail.gmail.com>
 <CAMRc=MdKN4Uj4RZk=3L82c0-0Z0CihbAfzVK0zMBb9Tsjh3BqQ@mail.gmail.com>
 <CAMRc=MeYEoiXWCdYNSmmbquMwmt99vPgzW+0gmX22Of9o127+A@mail.gmail.com>
 <aYmBYlEcbVJ2ELZ_@google.com> <CAMRc=McVrhxA2WuUDxn+dWziug-GyJkazYZyDJ6qFkj7o9xdEQ@mail.gmail.com>
In-Reply-To: <CAMRc=McVrhxA2WuUDxn+dWziug-GyJkazYZyDJ6qFkj7o9xdEQ@mail.gmail.com>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Mon, 9 Feb 2026 15:25:02 +0200
X-Gm-Features: AZwV_Qi65eUt9PrDI6DGksyux3YxGvBaXIykhTNQbqZXW_sIubyYDEhQoM67reY
Message-ID: <CAKWEGV5_u-kysd0S+CN_TtwHg_Ekp+jue87d4R+QuYzJKssTxw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31528-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jekhor@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,opensource.cirrus.com,linaro.org,linux.intel.com,linuxfoundation.org,kernel.org,pengutronix.de,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 88A3310FB0B
X-Rspamd-Action: no action

=D0=BF=D0=BD, 9 =D1=84=D0=B5=D0=B2=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 14:38=
, Bartosz Golaszewski <brgl@kernel.org>:
>
> On Mon, Feb 9, 2026 at 7:44=E2=80=AFAM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Nov 19, 2025 at 10:13:30AM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 19, 2025 at 9:41=E2=80=AFAM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> > > >
> > > > On Wed, Nov 19, 2025 at 9:35=E2=80=AFAM Bartosz Golaszewski <brgl@b=
gdev.pl> wrote:
> > > > >
> > > > > I have an idea for fixing it, let me cook up a patch. It'll still=
 be a
> > > > > bit hacky but will at least create a true link.
> > > > >
> > > >
> > > > Scratch that, I didn't notice before but we register both devices f=
rom
> > > > MFD core. We can just set up software nodes there.
> > > >
> > >
> > > Here you go: https://lore.kernel.org/all/20251119-cs42l43-gpio-swnode=
s-v1-1-25996afebd97@linaro.org/
> > >
> > > Please give it a try. This is independent from this series and should
> > > probably be backported to stable.
> >
> > So think breaks more drivers:
> >
> > https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> >
> > I think it may also break:
> >
> > arch/arm/mach-omap1/board-nokia770.c
> > arch/arm/mach-pxa/devices.c
> > arch/arm/mach-pxa/devices.h
> > arch/arm/mach-pxa/gumstix.c
> > arch/arm/mach-pxa/pxa25x.c
> > arch/arm/mach-pxa/pxa27x.c
> > arch/arm/mach-pxa/spitz.c
> > arch/arm/mach-tegra/board-paz00.c
>
> Most of them seem to use software nodes correctly. Nokia 770 could
> potentially break depending on the timing but the lookup uses the
> right string.
>
> > arch/x86/platform/geode/geode-common.c
>
> Looks like a correct case of referencing the software node to me.
>
> > drivers/platform/x86/barco-p50-gpio.c
> > drivers/platform/x86/pcengines-apuv2.c
> >
>
> Same here. Nothing here seems to depend on a label and there are real
> links between the GPIO chip's and consumer's software nodes.
>
> The problem we triggered here was caused by a GPIO consumer who would
> create a bogus software node locally without any real link to the
> provider. It would then depend on the provider being named a certain
> way to look up its GPIO. That doesn't seem to be the case in the above
> files.

The driver drivers/platform/x86/x86-android-tablets/core.c also
creates fake gpiochip software nodes
to use them in PROPERTY_ENTRY_GPIO definitions (see
drivers/platform/x86/x86-android-tablets/lenovo.c for examples).

I use the same approach for rt5677 gpiochip in my changes for Lenovo
YB1-X90 tablet (not mainlined yet) and this is broken also now.


--=20
Yauhen Kharuzhy

