Return-Path: <linux-gpio+bounces-7174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F488FCFB4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2671C2400E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C3E188CB3;
	Wed,  5 Jun 2024 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EGnVRj1w";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J8MR58X/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CFB19D892;
	Wed,  5 Jun 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717593980; cv=none; b=QtEiJwcXc/XRgEEbcbWLK09nr2b59ArUsPXtpuYH1uYtZX2SuZUs4TFSbCv3h29zjjJwZe18A1TPabLNFUbUQ9Y6TwW0ii5r8R53iS6ZhP7PZI0bP848acZHzBaMW5sC9eCTuX8pIltTKVBdmMcgsIJSIBNJcFh1zRnVAZlHOqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717593980; c=relaxed/simple;
	bh=ncz+ligIKhEj1oj7jLWdMzG3iPF7E5rmhPWp56cV3VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YupdOITGmnqOPnuQ0mesxEqib+DhkHfKGwEQgN7ecIqli/DYUNVUAEass2XRTpwbeSTMFq8ACyMCNm0uGdRVgVLFDWp8nof1CGWfIBu74ZOvOxzCREScVSa/u2qxKtum8CWI/oQmSbzMOVfSp0WlrK/Mg64PuB05MmIwW/SaHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EGnVRj1w; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J8MR58X/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 5 Jun 2024 15:26:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717593975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BeNik7y353W0nFwxiPZ2Ge3lwhP6PEQ+G3Hoyd4oGzs=;
	b=EGnVRj1wAhnnOCqtNhT/s4mtRcxv5Oj3cqvD0/7t+xFQboXqmiz2+dQZuFNZRGiSDGsPWF
	CM+XGlVP2NXh5yrNxLNdxZj47EMKM5A9A4i3w5uRLFFDDYJLRg637OnMngO88zjEjRc948
	7J6FMmUvWKbUaJRLwKkCHrRJDh+BB48V0+SDLXFRQ2i5LWlfmhGEXJCGwWgnMGPpAaKpS9
	pxSyMjXW/EepDp8oKN+m4jML7cYPDeUAGevzEldIHoJFmtlH3fpFca23p5W7cJ7zS+tCzg
	s4dYScnk4E8w8R1QqfMwxiqtnCsBLSEA7u0C2/3fns/q2rceyCp4+WIpTLA/lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717593975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BeNik7y353W0nFwxiPZ2Ge3lwhP6PEQ+G3Hoyd4oGzs=;
	b=J8MR58X/xrnG0FwDVen1xS5c1UKelfoa+z2TJB4UfWiuCr2y59p/HYCeqOo55Xb0TF5v9W
	eavWpMkMFCJesmAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, linus.walleij@linaro.org,
	didi.debian@cknow.org, efault@gmx.de,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Use
 spin_{lock,unlock}_irq{save,restore}
Message-ID: <20240605132614.LeDWp2GR@linutronix.de>
References: <20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVN3O2O4VYmyXKAsUp=19-1=J8BU2NJ3PLaCYdgV98VyQ@mail.gmail.com>
 <20240605110008.eVmntWev@linutronix.de>
 <CAMuHMdXMnuDSs5fg7iuciqCDSKidJ7hUxo5VxzOaZrUwqSjvog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMnuDSs5fg7iuciqCDSKidJ7hUxo5VxzOaZrUwqSjvog@mail.gmail.com>

On 2024-06-05 13:22:50 [+0200], Geert Uytterhoeven wrote:
> Hi Sebastian,
Hi Geert,

> I have already sent a pull request for it to LinusW, and it is now part
> of pinctrl/for-next.  I assume LinusW will send a PR to Linus(T ;-)
> in time later.

Thanks for the update.

> Gr{oetje,eeting}s,
> 
>                         Geert

Sebastian

