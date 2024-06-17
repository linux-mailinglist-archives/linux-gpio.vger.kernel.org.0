Return-Path: <linux-gpio+bounces-7508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64790B788
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 19:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28363B3034C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9BA1D9508;
	Mon, 17 Jun 2024 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2oiHeLT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193AE1D950A;
	Mon, 17 Jun 2024 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637976; cv=none; b=AcyOvRJd50lvIDRlqG7sTo9/I5Y+hwb+jXrBwfwS4w0e3w+v+sOB1RbpZeMhwZ5Y/Cyvq/Wd8tS8FzGJlb2kQKTuzNM4yc73B252EAzhETJ5De0aEDhm84PcCAw8OL8fPDgtgYG0la7R7pIHSX+TGSKKEeeiEqLE3zEZbjUZips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637976; c=relaxed/simple;
	bh=oTLnHaJiK0vL379Jvi0C5I8jRbSEsC+C/G9nLiN/JrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WLeQBhlFlwIkaEGZ9yk+Bp3Dm0O9P/MtNzfQYC62tTTyikrbS/pSTqcUsOdfGfBBCmpBF2a8NeVViT4gPFV0D3/sqxFU/7mgpfb+6Fm26VCNfHZAlSCSpiae3+D9q1KsXgRiLH1hIu32NLpNhTIUviT9+5CskoHwUkOLllb034Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2oiHeLT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F42C4AF1D;
	Mon, 17 Jun 2024 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637975;
	bh=oTLnHaJiK0vL379Jvi0C5I8jRbSEsC+C/G9nLiN/JrU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=t2oiHeLTMzGOLktbuoAtTLfTMFQnFcXpJpK8aeHYSXd0xYrRiHyM0wUqsTX+pe49V
	 8JcpnNSXsZuwoL/BDt1Oibr1eU9Hlr5WX4gHrATBfkfF3CA0qKQ2sW06Krivhf4Ycq
	 ec2fA3q/6YtwuIGE6f80bijoFepLOOpGYMSkOIsArx4ypDq0sHCKBrcACoHw7uY7pe
	 n+MoZYZVWvF1Mifp9pUMxnCEXkrbq0qj8Z1bK+3j4QhzaWJoPpJETsEqe0KZq/A2au
	 M+SCsU4eLAbLmITuMXPPAxw92K2hoa38bdAA9kTdjpkNoUHlqiuBTLjozzMfNuivkb
	 JQ+n+KXGofBXw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH v12 0/8] Turris Omnia MCU driver
Date: Mon, 17 Jun 2024 17:25:58 +0200
Message-ID: <20240617152606.26191-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,

this is v12 of the series adding Turris Omnia MCU driver.

Changes since v11:
- fixed some includes, suggested by Andy
- moved #include <linux/turris-omnia-mcu-interface.h> after the other
  includes, since it is domain specific, suggested by Andy
- in patch 2, use sizeof() of dest buffer in memcpy call, instead of
  ETH_ALEN constant, as suggested by Andy
- in patch 3, dropped the .has_int member of omnia GPIO definition
  structure, and added is_int_bit_valid() function instead, as suggested
  by Andy
- in patch 3, changed int to unsigned int where appropriate, as
  suggested by Andy
- in patch 3, fixed docstring indentation, suggested by Andy
- in patch 4 dropped #include <linux/rtc.h>, and instead declared struct
  rtc_device, it is only used as a pointer, suggested by Andy
- in patch 5, renamed the completion from trng_completion to
  trng_entropy_available
- in patch 5, use gpio_device_get_desc() instead of gpiochip_get_desc()
  when mapping IRQ (as discussed with Andy and Bart)
- in patch 5, dropped setting the priv member of hwrng, and instead use
  container_of() to get the driver private structure, suggested by
  Herbert

Links to previous cover letters (v1 to v11):
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240424173809.7214-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240430115111.3453-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240508103118.23345-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240510101819.13551-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240605161851.13911-1-kabel@kernel.org/

Marek Behún (8):
  dt-bindings: firmware: add cznic,turris-omnia-mcu binding
  platform: cznic: Add preliminary support for Turris Omnia MCU
  platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
  platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
  platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
  platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
  ARM: dts: turris-omnia: Add MCU system-controller node
  ARM: dts: turris-omnia: Add GPIO key node for front button

 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  113 ++
 .../firmware/cznic,turris-omnia-mcu.yaml      |   86 ++
 MAINTAINERS                                   |    4 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   35 +-
 drivers/platform/Kconfig                      |    2 +
 drivers/platform/Makefile                     |    1 +
 drivers/platform/cznic/Kconfig                |   48 +
 drivers/platform/cznic/Makefile               |    8 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  408 +++++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1088 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  260 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  103 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  130 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  194 +++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 15 files changed, 2728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-trng.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

-- 
2.44.2


