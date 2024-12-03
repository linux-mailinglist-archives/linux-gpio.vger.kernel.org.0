Return-Path: <linux-gpio+bounces-13466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5C9E2CD6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 21:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9DD028C9D5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 20:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EA21FAC5A;
	Tue,  3 Dec 2024 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="G+Y2E7VY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE991AA1EB
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733256790; cv=none; b=fSlrBfYPCTihHZsldtynkyXdWvZXY4Edn5WdNzZlONcqJ/asRcxt9meg6Qrih4a8FpaCBXPFm/yjwWpLd2+xqQKUW+r3IICxpXX1az98nO3jUR4Pn1dqx6viBmdMjpIt98ZXrmpDHlMpjaeOm/TTdRMxVCAUvTRkYduY1rqaTvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733256790; c=relaxed/simple;
	bh=50skitvp8WVyqTze4sEFS4FFiqTk/zTCwqwu4w3JFsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxE8OykYdexTztS7ZunWD2cV7ocgswecQ4tK4O2388wGr2fAYpNYCUvrmfFW0XbUHd3GpYOWUe3K8Bt/6EPh1+Q/3eC21I5JsEMiztbq1tyLTllMa5UIS+rhTKDMZ1w0a8Ysz+bPF1XmnQLcp49BeBdjbh52fP8v0ZyHnjLL2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=G+Y2E7VY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HZ1LPy3NSmQy+SzwaDXLdVo0s70qu25XnuFjTAFswfQ=; b=G+Y2E7VYchXEsKpwtA1eYmyyOg
	O5BZO2GXie/+araqCIqTstXa39SVmWYI9F6QQObQOOpEaXkoSM/35WKrOhXIaEBhK9CA87celvjxE
	+lNpVOnfLxXmBrtq3ALkaTGIlHlSVf8seCbljMm4N90Gs3miQ1TAXIYoX5q+el5+7jEQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIZGW-00F7xL-5i; Tue, 03 Dec 2024 21:13:00 +0100
Date: Tue, 3 Dec 2024 21:13:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when
 compile-testing
Message-ID: <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>

On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.

Sorry for being dumb, but i don't actually see what is wrong here.

There are 4 GPIO drivers which have

	def_bool y

COMPILE_TEST is about building as much as possible, in order to find
build bugs. So i don't get what you mean by additional
functionality. No additional functionality within the MVEBU driver
gets enabled by COMPILE_TEST.

	Andrew

