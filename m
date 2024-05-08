Return-Path: <linux-gpio+bounces-6250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E008C03C2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 19:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06AF31F21E79
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 17:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614CF12AAF9;
	Wed,  8 May 2024 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZGi2A4T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA728BEE;
	Wed,  8 May 2024 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190703; cv=none; b=EHR0HD8isDprBaDsDquqxanj5oGQnVdLgYhdULcF9PrA6k1s44xJ+T51lQFrokngRUa73tLK2ovA6fycpk8nZXIWFRb/Zagtn+I8RuQ0BJkeGBhECINFJKhzILdSNgGR6SnOrwJjsBoqD0ob4Nrgx+QhX67+ueHTSlImKwoMYO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190703; c=relaxed/simple;
	bh=6BoXTjno+NyYSgI8Dc+giUYFLUmA8bHJfXR+Wn6NEzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szblAnsNAsC/9DPnWSyTMFn9W+8qQGzwq6WRxaBfxgz/yBq3pg7iGD/jyQp6jo7dWFR0YaOK7ywkbdd0u7Wjc8x8Vz1qMvrCYxZkFaqjoX6LxdC9JZK9PI1IgHCzuLlnnxWkH/w3cedFntPEgb0dLIZG4u1tO8LxVAiqgcM7dgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZGi2A4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69EFC113CC;
	Wed,  8 May 2024 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715190702;
	bh=6BoXTjno+NyYSgI8Dc+giUYFLUmA8bHJfXR+Wn6NEzA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=OZGi2A4TNpGcY+C687v7tFZX8EX7YlwtJSk47SHRcAamTYNiq/NWWyXieV/jNX/yR
	 a6KPaTu7Uw6/tPk7e6KdcAVRAooRQeie107vVWvp9eNyktIzqr5HVmYLYkq/52fUJU
	 0Ce0XXzHrKH62z3H+sWbAAGJd1H9osUP35KWDGu5bRSEhw2BZ5zYaN1swEr39KMIir
	 lDAVgb7TC1bq8PVov4YOwj7Vn9uodBfR55Sa94Pq2SjoM3LZ5Afs97sBMTZ61n9xGg
	 dYZKP0aBd229t2pqrWY0ilqmEUwNfViBiCgu9lhtpfyNsuVLg7DLh3kajcZTtYEg7k
	 Q6j/Oy9rp55Mg==
Date: Wed, 8 May 2024 19:50:55 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v9 0/9] Turris Omnia MCU driver
Message-ID: <20240508175055.he4zsuvkj3bojnem@kandell>
References: <20240508103118.23345-1-kabel@kernel.org>
 <ZjtfRIykefGlqRF9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjtfRIykefGlqRF9@smile.fi.intel.com>

On Wed, May 08, 2024 at 02:17:24PM +0300, Andy Shevchenko wrote:
> On Wed, May 08, 2024 at 12:31:09PM +0200, Marek Behún wrote:
> > Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,
> > 
> > this is v9 of the series adding Turris Omnia MCU driver.
> > 
> > This series still depends on the immutable branch between LEDs and
> > locking, introducing devm_mutex_init(), see the PR
> >   https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/
> > 
> > See also cover letters for v1, v2, v3, v4, v5, v6, v7 and v8:
> >   https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20240424173809.7214-1-kabel@kernel.org/
> >   https://patchwork.kernel.org/project/linux-soc/cover/20240430115111.3453-1-kabel@kernel.org/
> 
> From GPIO implementation perspective, it's good enough in my opinion. The rest
> can be amended later on.

I will send v10 tomorrow with these issues fixed. We'll see if Arnd will
be willing to take this for 6.10, and if not, 6.11 will it be.

Marek

