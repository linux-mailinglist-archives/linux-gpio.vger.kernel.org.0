Return-Path: <linux-gpio+bounces-7159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B78FC996
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4142E1C20F60
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 11:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435CB1922E8;
	Wed,  5 Jun 2024 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xHSOesiq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L0C7kOgM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3221667C1;
	Wed,  5 Jun 2024 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585213; cv=none; b=nkU/pFiMKdJStv97l8QBYIA9FbcUZN3XWSQJXIofmZ18UWfmnyiRjZhGv10mz4p3sSgmJD0Ua3HAUvk6g0+FrpnjmIhwJ/9/mzI5Au0i3RObUMSaFdPk87YMHLZrX8dfq1N8nKC0ZkKIDXLbjDsyWeKaU+q4Tgi6ypSoWM45wvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585213; c=relaxed/simple;
	bh=bd3v6EC7mcYbykyVz6OMdz0AiLcrLYlMwBDIjED2aus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTOWpMhooYeU+zecSo/nmk77MBLnfa2Z8Hus359eQsV+ug+iock7kTdv1tAhuuCUIVS7L5ZteqomRpg+A6UDXvS0h2osqHx/dzympIcOcOtN2ICdcjihEoh0019cvz5cfZvjUS7+axkyB7PuOCG+oanLm2nIn11sIBShtvi7Afc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xHSOesiq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L0C7kOgM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 5 Jun 2024 13:00:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717585209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NqTuE0c+VKAmFKrrAaC0p/RgZMNYCxwd4o/1OpeT8qI=;
	b=xHSOesiqOmJG4tkiB1Szv40vFjYQ8D3AgSA1GkZj5OkYToHe2yBk3DJQUEDw6YYjboxQdQ
	gFp/k98sdNfMuIijvAcSM/j7MYBgBB2TFlAna9yWoUDqOeYUW/epQDFDzLV+RyuP13UZGJ
	znqnCm84iNhHzVOt7PqAG+SXHq6TymLREdF6lC3dpKd3ETKjO1HA7k/nJh6R+rbRhtBaPV
	W0/7OqLcgs+Ygkox5CEMQR09SI18iP7O59ED3uL7VG4p//oQqUNbvhY1xs6NmPMnId665g
	g91BZoeYrNZLT+zkWi5WvmevMH9KxrhnN78K8NwK3rXXdrMcN9Qxb7mQ5WX6kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717585209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NqTuE0c+VKAmFKrrAaC0p/RgZMNYCxwd4o/1OpeT8qI=;
	b=L0C7kOgMMhhsZpR7QIWIugXR80k48V63NwKcYzJ7XNdtVzL6MdF1SCyEj2RcDMR21uw7CT
	+3mSqoa3uzoa11CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, linus.walleij@linaro.org,
	didi.debian@cknow.org, efault@gmx.de,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Use
 spin_{lock,unlock}_irq{save,restore}
Message-ID: <20240605110008.eVmntWev@linutronix.de>
References: <20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVN3O2O4VYmyXKAsUp=19-1=J8BU2NJ3PLaCYdgV98VyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVN3O2O4VYmyXKAsUp=19-1=J8BU2NJ3PLaCYdgV98VyQ@mail.gmail.com>

On 2024-05-22 11:27:55 [+0200], Geert Uytterhoeven wrote:
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl-fixes for v6.10.

I picked this up for RT and see that it is not part of v6.10-rc2. I
assume that this will be applied within the v6.10 cycle once you have
more in your tree, right?

> Gr{oetje,eeting}s,
> 
>                         Geert

Sebastian

