Return-Path: <linux-gpio+bounces-28930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB08C763B2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 21:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C19DE291AB
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 20:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0F0305940;
	Thu, 20 Nov 2025 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="twhSn7yF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108412F6931;
	Thu, 20 Nov 2025 20:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671747; cv=none; b=eMrpox1sBVyMqhPM4AI5hGHoRnMuZUFkgps9DrD7uXaZY8lOdPEghkGRLhvRIDkNt+jiWXVE0ebXqgGaMwZg+sVg2Vv+ZH9LrN/JXQJle5MYaEyM7S8pljq1XwpL6fOJqA2O8rYVGsnJA8fu19QBns50HkwCo+7QXc/TTKq7jqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671747; c=relaxed/simple;
	bh=QKCTW//ReohcZBVlaY/hR/6GYCdQgcMLzosE3RgI0Hs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UmeU5rnj2DyblJcJl5b+pmRRcEt9pILJZ2KNVx9+dYhbX1oct4BDdez290ljq65BSgjxz1xQwpKos7WxrcEMKsN57r3Lqg9XEl2RoxWgAQSq6A4X0GuiQlOdiQHg6Edp7yp595D2RPOdu5/J2O0Cw9rfd93FrO83C/X9IayF0rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=twhSn7yF; arc=none smtp.client-ip=212.27.42.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:ec95:b1d9:10ea:943d])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4C59FB00535;
	Thu, 20 Nov 2025 21:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1763671736;
	bh=QKCTW//ReohcZBVlaY/hR/6GYCdQgcMLzosE3RgI0Hs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=twhSn7yFBv9qGLTnY2s92RCC2TWLLtNaMbxhv3qLARNVnkE+G5kEHxQq6Q1dnhMRG
	 ZIEnR9W9psvHteZIj30wYzw+HWQEz/J391fjkbEQL9Vi+8UoFeCicyQKZYK+qg+PP1
	 a9S2PgquCN8QgovK6AOR8x0+FBZxb2GjW/mshzNdPLiFSepUW+MnPhpcT/Az8izkET
	 EVGhukO0rHRV/txB6lz3f4aVUEgok4c1GmtIbGP/sDIbC9g34J2uasBXUCBOmaPUjR
	 lwo7uYnbTO41wtP0+kwAMY/P3RBtMcxA6lQ2p27mPNZgdKq1VhjeItR/aqEeXLEopN
	 cwv8LYklQcslQ==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,  Doug Berger
 <opendmb@gmail.com>,  Florian Fainelli <florian.fainelli@broadcom.com>,
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
In-Reply-To: <aR22decsE0DYDUnS@xhacker> (Jisheng Zhang's message of "Wed, 19
	Nov 2025 20:22:13 +0800")
References: <20251118003229.26636-1-jszhang@kernel.org>
	<20251118003229.26636-6-jszhang@kernel.org>
	<CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
	<m2ecpvm20y.fsf@free.fr> <aR22decsE0DYDUnS@xhacker>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Thu, 20 Nov 2025 21:48:30 +0100
Message-ID: <m28qg0mnvl.fsf@free.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed

Jisheng Zhang <jszhang@kernel.org> writes:

> On Tue, Nov 18, 2025 at 11:03:41PM +0100, Robert Jarzmik wrote:
>
> hmm, each controller adds 16bytes, then even on 100 controller 
> platforms
> 1600bytes. 1600 Bytes/64MB ~= 0.238%. it's trival. And is there 
> such platform?
Yes, actually most of them have around 64MB, at least the pxa25x 
and pxa27x.
The pxa3xx might have more (thing 128MB, maybe 256MB).
There are very old platforms, we're in 2003/2004 there ...

> From another side, recently UP support is removed from the core 
> sched,
> that removing adds more .text and .data overhead, so if the 
> users really
> care about this kind of 16bytes, it means he(she) can't afford 
> even the
> 16Bytes overhead, then I bet he(she) the always SMP in core 
> sched, so
> why not stick with the old kernel? What do you think?
I think I would go with Andy's proposal, decouple the changes :
 - keep your changes in the PM callbaks
 - remove your change (put back the ifdef) in the data structure

Cheers.

--
Robert

