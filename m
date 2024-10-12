Return-Path: <linux-gpio+bounces-11235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468899B4CF
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 14:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D422F2834B9
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 12:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CE5170A2E;
	Sat, 12 Oct 2024 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1mnqTPr0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5031547EC;
	Sat, 12 Oct 2024 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728736040; cv=none; b=sJ6hsZEAN3hZakEzj/aHG61T9zJLWXO/V2EP8d/UhZZimZaza77W33u9SvfX0A5rXtndY6S9V7rADtszeOwRPXreN5PG+qlJESMZqm91hh439KEAKwGgufKsfuddT4zP/7FPnvk5N7VyMikPNPnyASDpCX1Ym8LJRP7LCeSonHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728736040; c=relaxed/simple;
	bh=AW3dEJfXkbvZDC5i5vXpP3e1g5C6PDrzUBF9uv7oO34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkPA6HhOpGmBpfgf1z9twGB0dHVaYTkllUmY869AxTwfe9Xrv4Dxo+xXt8l6DF9ckZNeH24WHxguYc3IfXP4O+5y1YiscNKyXyNxMZs8Vf9Ad4srYVJ5WITdSN5skpOjpQLmRC63I8lBccPWE3lECP4MFGI5wdUvN49sT34LvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1mnqTPr0; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4ouJYdrPCXF2NJQrf7iMXlQZzT4n+FtO70LbtnE4RZU=; b=1mnqTPr0eBEi3IeJWGox1VV5/1
	inNkaoFOaWMs96HyZ2kcGkhbzo32MQCaV9GLJESuvPKnN8KZ2gbhmOovzeSMblWibDR/MZG/xkHwa
	9/BCRYDBkY3gTtPGyivmAT4lCVk6HhimUy9kcfNoUa+eApDA9OofreMMjYlEdy0MO2zEjrB72oes3
	uReUcx4lhaAYTiM7C3tm9ODy3+M0b7UGI9yOITXzKa3mzXBH/L2uQWpfhE6w2IBJJKOnCXCk1ti1w
	xGjvoLshLjrdCPbUAQj/X/XaK2lQOrZpr0++0OMN6a606W5dND76raZ3Q8FDviwDS1/MgeLVPfIJS
	hlxmkWng==;
Date: Sat, 12 Oct 2024 14:27:05 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Judith Mendez <jm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman
 <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Bin Liu
 <b-liu@ti.com>, <linux-serial@vger.kernel.org>
Subject: Re: [PATCH RESEND 2/2] serial: 8250: omap: Move pm_runtime_get_sync
Message-ID: <20241012142705.45948f7d@akair>
In-Reply-To: <20241011173356.870883-3-jm@ti.com>
References: <20241011173356.870883-1-jm@ti.com>
	<20241011173356.870883-3-jm@ti.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 11 Oct 2024 12:33:56 -0500
schrieb Judith Mendez <jm@ti.com>:

> Currently in omap_8250_shutdown, the dma->rx_running
> flag is set to zero in omap_8250_rx_dma_flush. Next
> pm_runtime_get_sync is called, which is a runtime
> resume call stack which can re-set the flag. When the
> call omap_8250_shutdown returns, the flag is expected
> to be UN-SET, but this is not the case. This is causing
> issues the next time UART is re-opened and omap_8250_rx_dma
> is called. Fix by moving pm_runtime_get_sync before the
> omap_8250_rx_dma_flush.
> 
> Signed-off-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>

Is this a theorectical problem or some real practical problem?
So you are running a system with runtime pm enabled on serial
console.
How did you come across this issue?
I could run the serial console/getty with runtime pm autosuspend enabled
without issues all the years.

Regards,
Andreas

