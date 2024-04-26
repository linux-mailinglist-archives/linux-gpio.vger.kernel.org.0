Return-Path: <linux-gpio+bounces-5896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A98B3C8D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 18:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17B80B2692B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 16:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54B1152DED;
	Fri, 26 Apr 2024 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fNojwqBb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66E14EC4C;
	Fri, 26 Apr 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714148028; cv=none; b=DfBAB5Dcog/quTFai6GvPUMm7ZCoU33dzUltkB4l/uho7Cx5Gf1vJHGHyJ7GMrE2PlmphrF5btNrZ0k5DXa0IA2UovjZaExls4TaHHD4qVz6JjkJr3YTYZwFWOxRrhq8+qK2ik90yQYJXjaLYf0o9U6lsxqM/sUL8nVrxv9ZKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714148028; c=relaxed/simple;
	bh=KAubqwrj4NqoRfG/h9VYz+cm7v93zo2oflPFobx0vQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J1AxrKQ92/LFGHvFAI4RTNuNUtMgckfjYZSP9dS07rdNHy/A4h4oCgJhYXjsXg+PEju4+MuGvzzrubPZPor7mGFwTGvYbWhvzj2CsFXQlkh2Ttex4C97f4Ia0H9ecyOa9a2MZmhPoYEkbN9YrNzFQJFjkYMqHL0xttY/SzbGp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fNojwqBb; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 949E120002;
	Fri, 26 Apr 2024 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714148018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHq0a5TYFF7yrLXeX6BIAdFUmvRofAskO9re+BiJUcg=;
	b=fNojwqBbgjVi8+uUgbS7dQ3VT+jboqmKA/OOumXC1o+9UTHoXNi5NIM+IKveAdoe8uVZ/H
	8FNblc7Ig09gQOhAFQmDasKExhFMRaCAruTqEO51OwdvHCCPe8QsiyqqQEKoCNMPj2xAoc
	XEC5yvUoNDkMZ8mXylxxj0vkheELgBQGMRd8uqI0hOCI/Ht+xSIsJrmm2fzSFlUsDELyK7
	wH22z+CBJpLHGhpaiYFfysHrio67/bxr8BHnYcgM9T6JEpza4io6OEGnaEJqEzPgOY/vU9
	9izwgVmU8xG9NCEDX3OncYDEjpODVCEkAxsV0RZYsTFzD8FOcGzklzZS2XmTdA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>,
 soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dan
 Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, Rob
 Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <uwe@kleine-koenig.org>
Subject: Re: [PATCH v7 0/9] Turris Omnia MCU driver
In-Reply-To: <20240424173809.7214-1-kabel@kernel.org>
References: <20240424173809.7214-1-kabel@kernel.org>
Date: Fri, 26 Apr 2024 18:13:32 +0200
Message-ID: <875xw45cgj.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello all,

> Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,
>
> this is v7 of the series adding Turris Omnia MCU driver.
>
> This series depends on the immutable branch between LEDs and locking,
> introducing devm_mutex_init(), see the PR
>   https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/
>
> See also cover letters for v1, v2, v3, v4, v5 and v6:
>   https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.698=
6-1-kabel@kernel.org/
>   https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.168=
18-1-kabel@kernel.org/
>   https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.116=
02-1-kabel@kernel.org/
>   https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.167=
50-1-kabel@kernel.org/
>   https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.216=
42-1-kabel@kernel.org/
>   https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.221=
84-1-kabel@kernel.org/
>
> Changes since v6:
> - moved the DT binding from arm/cznic,turris-omnia-mcu.yaml to
>   firmware/cznic,turris-omnia-mcu.yaml, as suggested by Conor Dooley
>   (patch 1)
> - dropped the devm-helpers.h additions, for the reasons see
>   https://lore.kernel.org/soc/20240423184346.37eb0915@thinkpad/
> - use gpiod_to_irq(gpiochip_get_desc(...)) instead of
>   irq_create_mapping(), as suggested by Andy Shevchenko (patches 6 and
>   7)
> - added a dummy read of TRNG entropy when registering TRNG, in case
>   someone cleared the TRNG interrupt before probing the driver, but did
>   not read the entropy (the MCU won't send a new TRNG interrupt if the
>   entropy is not collected) (patch 6)
> - fixed a bug in TRNG probing, wherein if the=20
>
> Marek Beh=C3=BAn (9):
>   dt-bindings: arm: add cznic,turris-omnia-mcu binding
>   platform: cznic: Add preliminary support for Turris Omnia MCU
>   platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
>   platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
>   platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
>   platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
>   platform: cznic: turris-omnia-mcu: Add support for digital message
>     signing via debugfs

It is still early as there are some comment pending but I wonder who
will responsible of merging all theses patches ?

Arnd ? Hans ? Ilpo ? me ?

Gregory


>   ARM: dts: turris-omnia: Add MCU system-controller node
>   ARM: dts: turris-omnia: Add GPIO key node for front button
>
>  .../ABI/testing/debugfs-turris-omnia-mcu      |   13 +
>  .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  126 ++
>  .../firmware/cznic,turris-omnia-mcu.yaml      |   86 ++
>  MAINTAINERS                                   |    5 +
>  .../dts/marvell/armada-385-turris-omnia.dts   |   35 +-
>  drivers/platform/Kconfig                      |    2 +
>  drivers/platform/Makefile                     |    1 +
>  drivers/platform/cznic/Kconfig                |   51 +
>  drivers/platform/cznic/Makefile               |    9 +
>  .../platform/cznic/turris-omnia-mcu-base.c    |  439 +++++++
>  .../platform/cznic/turris-omnia-mcu-debugfs.c |  216 ++++
>  .../platform/cznic/turris-omnia-mcu-gpio.c    | 1047 +++++++++++++++++
>  .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  258 ++++
>  .../platform/cznic/turris-omnia-mcu-trng.c    |  109 ++
>  .../cznic/turris-omnia-mcu-watchdog.c         |  123 ++
>  drivers/platform/cznic/turris-omnia-mcu.h     |  188 +++
>  include/linux/turris-omnia-mcu-interface.h    |  249 ++++
>  17 files changed, 2956 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-turris-omnia-mcu
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turri=
s-omnia-mcu
>  create mode 100644 Documentation/devicetree/bindings/firmware/cznic,turr=
is-omnia-mcu.yaml
>  create mode 100644 drivers/platform/cznic/Kconfig
>  create mode 100644 drivers/platform/cznic/Makefile
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-debugfs.c
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeu=
p.c
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-trng.c
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
>  create mode 100644 include/linux/turris-omnia-mcu-interface.h
>
> --=20
> 2.43.2

