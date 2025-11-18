Return-Path: <linux-gpio+bounces-28705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A3C6BCDC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 86926292A6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F93D2F99BC;
	Tue, 18 Nov 2025 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="k+MokbRh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144BF29C343;
	Tue, 18 Nov 2025 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503458; cv=none; b=uWS0SAUIXoiiT6ieC5tlDfwTtUQ25H6L14RChCA1qlAfGGLwA13ET8SQd0I8Z5/2QjCkCNMCfx+84RDn+ZF86YrroD12NxPKfu9ZHtcaGU97dRf7/Gs7Pv3cVH2vrNTJzB/TTxJo4h0hWf7tmhOdSaxhmJ/x1B3COivYm71GS14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503458; c=relaxed/simple;
	bh=wA7xapN4wn55TAXjCx/XtytYfW/c1kqwNEm55jTd8j4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HCQ7VfVmzF8M35jK/fxaJPN5Jgr//AEFurdStxMGHjTejnWKZYe0v1FgBRlMJ8NehQLryi0nrD4PGs+wRqXEs266IwyyG6PA0SHL9MxR6JmsGEURzQFuQnMU0FOpoHcO5qCSg5fp4mc7WyMz8KaJhDwRnQHJft9NRsg503VFQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=k+MokbRh; arc=none smtp.client-ip=212.27.42.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:ec95:b1d9:10ea:943d])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id EB86FB0055E;
	Tue, 18 Nov 2025 23:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1763503447;
	bh=wA7xapN4wn55TAXjCx/XtytYfW/c1kqwNEm55jTd8j4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k+MokbRhkgwcsNI0tp5xAlYiPRulfdlAz6xLIzd/wMar+D8P8zrCPv235UaJL+LUE
	 +xLqP/W4qlRxZUPr6/PB4tUfkVSHOlQ2hDlrxGnB3d2g4hL6uLYVicBhBRRFI9aBB4
	 NdB3dbh9wZDbXxFZJ4s9WpzmPDFFSyjPiQEhEPRz3Fmla6UmxqbVcPKmJ16Xv+8A/A
	 rm/KjL9H6Pwsq7TFHe/VgckcBnEJAIcWNAJTCOqBVvlpLjfnO8iKDHnPzrp2jpwBzP
	 nCkVH4UlygAGCc8UAgwVnNzhgmI3w5oC5o1y+l0Dfc0ogMtJ6rDLr1SaKDz/BteBn9
	 TtxnSIfHmSV6A==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,  Doug Berger <opendmb@gmail.com>,
  Florian Fainelli <florian.fainelli@broadcom.com>,
  bcm-kernel-feedback-list@broadcom.com,  Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>,  Hoan
 Tran <hoan@os.amperecomputing.com>,  Andy Shevchenko <andy@kernel.org>,
  Daniel Palmer <daniel@thingy.jp>,  Romain Perier
 <romain.perier@gmail.com>,  Grygorii Strashko <grygorii.strashko@ti.com>,
  Santosh Shilimkar <ssantosh@kernel.org>,  Kevin Hilman
 <khilman@kernel.org>,  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
  Masami Hiramatsu <mhiramat@kernel.org>,  Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>,  Srinivas Neeli <srinivas.neeli@amd.com>,
  Michal Simek <michal.simek@amd.com>,  linux-gpio@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
In-Reply-To: <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
	(Andy Shevchenko's message of "Tue, 18 Nov 2025 14:06:34 +0200")
References: <20251118003229.26636-1-jszhang@kernel.org>
	<20251118003229.26636-6-jszhang@kernel.org>
	<CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Tue, 18 Nov 2025 23:03:41 +0100
Message-ID: <m2ecpvm20y.fsf@free.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang=20
> <jszhang@kernel.org> wrote:
>>
>> Use the modern PM macros for the suspend and resume functions=20
>> to be
>> automatically dropped by the compiler when CONFIG_PM or
>> CONFIG_PM_SLEEP are disabled, without having to use #ifdef=20
>> guards.
...zip...
>
>> -#ifdef CONFIG_PM
>>         unsigned long   saved_gplr;
>>         unsigned long   saved_gpdr;
>>         unsigned long   saved_grer;
>>         unsigned long   saved_gfer;
>> -#endif

Actually this is not equivalent to what was there before.

With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to=20
the
structure. You might thing today, 16 bytes is nothing. True, but=20
on a
64MB RAM devices, it's something.

That might not be a reason to reject the patch, but it's not only=20
a
"modernisation patch".

Cheers.

--
Robert

