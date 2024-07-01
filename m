Return-Path: <linux-gpio+bounces-7853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F791DE32
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 13:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98D8D1C20DD2
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 11:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BC01422D6;
	Mon,  1 Jul 2024 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9MVcZ5A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61973BBED;
	Mon,  1 Jul 2024 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719833910; cv=none; b=S84zX7nKMdnDVHaV7fYODCsuI9YVz7j4W3WSAto8d7D/2M9MNar2ylbKLhoYEiQ2efHgWMKMufJB9uYZbrUiP7Re8CT+pk8zOcPeq6ifsZTkMl/SC+FbWJtwPXCRmnLI1NzNcNUR4VM155MMkE+JOP+0Ijl5C2TD49dHKZm/aAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719833910; c=relaxed/simple;
	bh=bHOqgyma+zpO2MbWNympnDKo29K7Cl31NJv3Wl7N7Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HB0CSqWgAejf4Hgj3P1l/ulbWnfD215nr+BNQKNUDPM1QBV6q/i5bv+UPMAI+3LCGx3z7MtjcOfzjz7uaSdlzBwpnAzAbO/grEdKMZp8F+wk/p3T+DGw6J0ysdZso/1tk1f5uJ6XA0aUkK6UJaELY9F9C2BPJXmQfLvxeRfhv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9MVcZ5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD215C116B1;
	Mon,  1 Jul 2024 11:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719833910;
	bh=bHOqgyma+zpO2MbWNympnDKo29K7Cl31NJv3Wl7N7Ls=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=d9MVcZ5AeL+425pje4XMZ6l6YpWd1CNiLok9QRR+ekiNWmELFXkzbZMcs/q/9zn7p
	 /F0EgE81q02J8q9PIVONMS58R+QfbDfrHbhQd8bYGvyS58OPVT1EIo10mD0SZafIF3
	 pGi7riOC8oX3DrD593mh6cIz9XoFc07qtScKf5g8sKvuIhmXuJocD0MFlF5AhCtDFm
	 TX3QYaG4jLgxTyRusplRJKKC95ZnYz24bmr8fSjJgolit68VApDzS4i4N6SlwDNM8M
	 vwaZE4hyeYChyhxLXXuyrA4cNwdROXAc/lGUnqxMCC0f6k4rgBAnqHk6firwxeYBUx
	 Zj4FJmaqFTTBg==
Date: Mon, 1 Jul 2024 13:38:21 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dan
 Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, Rob
 Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v12 0/8] Turris Omnia MCU driver
Message-ID: <20240701133821.059576fd@dellmb>
In-Reply-To: <nznz6bdxcin3srtf2le34gxbyrmhwquym3xdowoognqaswrjgg@ujvaoaydzj6f>
References: <20240617152606.26191-1-kabel@kernel.org>
	<nznz6bdxcin3srtf2le34gxbyrmhwquym3xdowoognqaswrjgg@ujvaoaydzj6f>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Jul 2024 10:41:15 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Hi Arnd,
>=20
> will you be merging this series?

Just to clear up, I wanted to ask whether you will be merging or
someone else should take stuff to drivers/platform.

Anyway, I sent v13 with one more cosmetic change, requested by Bart.

Marek

