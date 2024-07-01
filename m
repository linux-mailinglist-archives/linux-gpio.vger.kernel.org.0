Return-Path: <linux-gpio+bounces-7844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20791DA38
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 10:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92412812D1
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 08:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F9484D37;
	Mon,  1 Jul 2024 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/2LyLVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA731824B1;
	Mon,  1 Jul 2024 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823284; cv=none; b=LG5/NjwgU4UvnOk0IiiZrV3BA1l7h0uDFLXdRfD0jp8KgEOCGQC6PC5PZkbf08zsBUJVxZ/ThJiMegwxCsmMsxGrzKmV7ZuvbSH2fURZD7xemIiCPRa+me5+WJDe05VrfjWeRAdC0rZ1thquHv68vIZvigOE34iYoHiRLecKz/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823284; c=relaxed/simple;
	bh=g3cEDjTf4Xom5tTS1ZIFBi+XCHV0H0zZFGlwlfVVvdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiFsjvxVGtjqimBPtutPaU5SaqSJHeekMY8XQfd2o+3Ko+sN2JE6bQg0moHcf8jswf/RZrWV06vl9EPMzmVNP/+aT6FKbMZ3Rnb5QfTRsVJHHRfEeJc1PIAOL3nzjL1ex/rvMAvyk0KCJ/9VT9n5MA6I3SVpK/1RuKmO3MWQ1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/2LyLVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ADFC116B1;
	Mon,  1 Jul 2024 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719823283;
	bh=g3cEDjTf4Xom5tTS1ZIFBi+XCHV0H0zZFGlwlfVVvdo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=H/2LyLVwImlaN2jXGEZ0HbL4nmNHcbFgx+PD4v0/EwgvbhHRJ+cKOPJllW0V9pSF+
	 EU15kOgymSOcIDPZhRzNRbj5qNLtREXGenlh6sF7iEgz9pTP2i5UEog3CMUtqOAmmy
	 3rK0fiijeIJE94LaR1AK/zVOrYNpoqsIpjVCsZTB750PfUySn21lB61v0RMEmYlde8
	 cFSVlwCwGxonNsmypAgoHKWRQEz2Eigy4EwdqV/+m84ZpKBDQK3cibu7Zlbpl1HsBA
	 0cOaXG+xyceUdMOreCxlVXkbt8keggqRedo6kjJhMOvwx+hxNN8mGqdaFpjqS1ul3n
	 0U5XgR7YdbAZw==
Date: Mon, 1 Jul 2024 10:41:15 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, 
	Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v12 0/8] Turris Omnia MCU driver
Message-ID: <nznz6bdxcin3srtf2le34gxbyrmhwquym3xdowoognqaswrjgg@ujvaoaydzj6f>
References: <20240617152606.26191-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617152606.26191-1-kabel@kernel.org>

Hi Arnd,

will you be merging this series?

Thanks.

Marek

