Return-Path: <linux-gpio+bounces-13469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051A9E2DBD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 22:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34C6282B9A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 21:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7AA207A2C;
	Tue,  3 Dec 2024 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dZwZxKuM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B7205E31
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 21:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733259604; cv=none; b=X0AKuR/8BZnWr3AsB+LWzq3givmSg26hRppcJL9fOe24vwQZmce1fN0pEeFBNcjuqSXz15xQ6n6Z+ZwjFXTDyTN8NYj9K6ZTBWwAzJeIgDlRLHS2MfawjlftV8u8G105JN18IDm5vggOIGIK13/QSLzOxeCkWDiI6gnhE8PhW8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733259604; c=relaxed/simple;
	bh=Rg2ii97vZYH2OapEVkdslFHj0KartodFJ/NB1nSQZvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gdyx1bMWSpvf26a9RkGga808pOow5oHz+bhr8Y9qDKyQLYTAwBiBeWvOnMfQZNzPXc/pkGqiJ05lShPXFa/AL1MLOSLoCB1nn8/UbAydrh+VtLNzutMZADuTotqsGipTMCtQZdwoIqLhYHDVtrD51jPPTYtBH66loQIAS9XgREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dZwZxKuM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=HOE+GL2RYQwSxGLRhynIRvYFvV8pa/FyZRyb22lYOio=; b=dZ
	wZxKuMdDCaqU7yBCFPkoBbgx2n0hhuLvqxbhD2ofciMC2XyeFKHwXZgeE7los0PWA8cJdm8u6qI84
	gpb3zsTqBSSv4m6+BdIZ5QXuaIgm7QQCoCuhcd6qgs/tTEsTefhsELchO4HubH5NREOKt2PDUC/IW
	ZpXngVenO9qsYCU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIZzw-00F8O6-OJ; Tue, 03 Dec 2024 21:59:56 +0100
Date: Tue, 3 Dec 2024 21:59:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when
 compile-testing
Message-ID: <44126f2f-92ce-412b-ad9d-e0e0ea28d36d@lunn.ch>
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
 <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
 <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>

On Tue, Dec 03, 2024 at 09:29:02PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 3, 2024 at 9:13 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> > > Merely enabling compile-testing should not enable additional
> > > functionality.
> >
> > Sorry for being dumb, but i don't actually see what is wrong here.
> >
> > There are 4 GPIO drivers which have
> >
> >         def_bool y
> >
> > COMPILE_TEST is about building as much as possible, in order to find
> > build bugs. So i don't get what you mean by additional
> > functionality. No additional functionality within the MVEBU driver
> > gets enabled by COMPILE_TEST.
> >
> >         Andrew
> 
> No, Geert is right. I have been yelled at by Linus Torvalds already
> for too eagerly enabling too many options. COMPILE_TEST is really
> about making it possible to build more things with make allmodconfig,
> not necessarily defaulting to y for everything.

So are you saying COMPILE_TEST should allow something to be enabled,
but should not actually enable it?

	Andrew

