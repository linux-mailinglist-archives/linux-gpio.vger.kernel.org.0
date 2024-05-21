Return-Path: <linux-gpio+bounces-6518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2179C8CB052
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 16:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A5B1F24470
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 14:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3E912FF6E;
	Tue, 21 May 2024 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FDsC2F5o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hluSej/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539212EBEE;
	Tue, 21 May 2024 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716301386; cv=none; b=cTOomSXBAy9i6QTqMi97YcunQ+Vl3d6KwN3k/i+iuHA4HTePGbDWIarJtXft98TZ86xdORPFbA7c1ZkbST1+JTK2DS1l8I8c86mmXy9VD+yQqrHX9PSTUrGdTCpHqe8MHZQR79Ps1whtBGt8lQnXkSt36tfS5CisEC2Dy15rk4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716301386; c=relaxed/simple;
	bh=PC2VzjdE9pOS7qDKBe4Km1hSRdFZqxdUgECUk1pKFzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Slx3ZNLTnyFCODrjcTDQIHXE3YXudue5N2aXNcmyFVyPBXU/xxc/n4+SzqID1TiUnlo34mPDt/hihfJ441ETdkO7pkV+V3uauA49b/cJJfVv23NWqPZehCP1l2s/rhsT1QImIBCUjUk3mQ1xiKfSHBG4rkdvwAU9ROO2/kBRd6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FDsC2F5o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hluSej/x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 21 May 2024 16:22:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716301381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UKsg7qQvlG77Y7q+ZHUhtxz8eupkMhNXaXZZpb8kN8=;
	b=FDsC2F5oI6AuYvrT9NOQp/6JLwEshM6R1b/Hody5w598azHds13+S7na12ycfSGFLSg1p3
	XLR7t8H985ILRAq87I33A1J3NyfKipFvCnztSSrLJRkPnNnMUt65N/hBC56TTGKOKaomcW
	uDXaAC4/0/Q1yTimdqFT4sdFgY45+xhLx2aiTNGWh2kc3Fwt0WYAepRVUDvB3H58d1iLzp
	w3TRabN2I8PXEbh7Mau4MFDiGpJZpEUmDD1wTTgPePKAYo91ZgCoJvyFbXuaAjrCWl0E9/
	OE+B3aeXzd0b/7p2+kOllTT2bO2xYtdYeIdZYXOGeJe6nLPkc/BX6gj5pxxEWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716301381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UKsg7qQvlG77Y7q+ZHUhtxz8eupkMhNXaXZZpb8kN8=;
	b=hluSej/xipmQweXuZ8G5wzxwRmRlDLhkaQQUVK20vJyruBc4o0BFGgNvckm/+SFKp8u+Cf
	yRErcUTmNtFg8ADQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org,
	didi.debian@cknow.org, efault@gmx.de,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: use
 spin_{lock,unlock}_irq{save,restore}
Message-ID: <20240521142259.Pm56N8P-@linutronix.de>
References: <20240520072033.228049-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240520072033.228049-1-claudiu.beznea.uj@bp.renesas.com>

On 2024-05-20 10:20:33 [+0300], Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On PREEMPT_RT kernels the spinlock_t maps to an rtmutex. Using
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() on
> &pctrl->lock.rlock breaks the PREEMPT_RT builds. To fix this use
> spin_lock_irqsave()/spin_unlock_irqrestore() on &pctrl->lock.
> 
> Fixes: e1fd1f9f457b ("pinctrl: renesas: rzg2l: Configure the interrupt type on resume")

02cd2d3be1c31 ("pinctrl: renesas: rzg2l: Configure the interrupt type on resume")

> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Closes: https://lore.kernel.org/all/131999629.KQPSlr0Zke@bagend
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Sebastian

