Return-Path: <linux-gpio+bounces-5812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848C8B113A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 19:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB1611C2383B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 17:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FDA16D4D3;
	Wed, 24 Apr 2024 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDG0W1y7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF515B55C;
	Wed, 24 Apr 2024 17:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713980300; cv=none; b=U5JtoKf/DQlYa094Xe7ebmcMmJzpG+lVD+sQmQ4JdTtxwJf6IZDFaEGopbUf94SOTuRotej6dGoQhmRBlsvYwcrAiYaV/zTEggKFxOcQBi1Len2wsFKd2n4i7jn03TTGtxHpqhsA7n5cJCjiZ6/2UkqBtDSE2JilDJV8LdE0WuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713980300; c=relaxed/simple;
	bh=aod6ewur68dhk71qakXSy0qZ7PztmoQeNVY9RZWrBCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FlniCpuocnP6KHl34KnMZZaAiXfxWPoTEOjlpguTXRf1lQq9X/s3ODImOqSEmTHKIhl720nDATQM8FEow+Mylk1pnZ/66mHfyQVJs7aAT4U7ZUYfCjlBS6qXK0irrjNy6quAZKWWm5qmVLSXCUKa71nn5xHdoLFknHAg86VbHHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDG0W1y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AC5C113CD;
	Wed, 24 Apr 2024 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713980299;
	bh=aod6ewur68dhk71qakXSy0qZ7PztmoQeNVY9RZWrBCU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=HDG0W1y7dJs8jROaJ/vATkjVSzyAjoCUm+TErmO1j8gYqoSjV/n+N1UdArZSqTT0S
	 Yy4S0CF2xmBBySJ5CNvdZ4gN3awJ/zPdFTxFL0id+DjOgaHTtdRwFSCFz/SL0Htd84
	 cR15vC+wO9i1c1Gvr1YZpDGGUCRLdwcKC2LkXN88Z/xH+Vc/hgfj6M5ENg24b2sLP5
	 /AFXu7OnXn00jivZ3aB7U3fBOSwmZvYCRVjSPhYRwX92KN8GmI6IHCspwjRa6zJkxu
	 eFS+y3XWM0+Ilq6XsmipaFi6vxXWDliZV6+2RrJQig9WIR8TcR2J+YTwOfFqzWrULK
	 SccO/07dU2yaw==
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
	Herbert Xu <herbert@gondor.apana.org.au>,
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
Subject: [PATCH v7 0/9] Turris Omnia MCU driver
Date: Wed, 24 Apr 2024 19:37:59 +0200
Message-ID: <20240424173809.7214-1-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,

this is v7 of the series adding Turris Omnia MCU driver.

This series depends on the immutable branch between LEDs and locking,
introducing devm_mutex_init(), see the PR
  https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/

See also cover letters for v1, v2, v3, v4, v5 and v6:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/

Changes since v6:
- moved the DT binding from arm/cznic,turris-omnia-mcu.yaml to
  firmware/cznic,turris-omnia-mcu.yaml, as suggested by Conor Dooley
  (patch 1)
- dropped the devm-helpers.h additions, for the reasons see
  https://lore.kernel.org/soc/20240423184346.37eb0915@thinkpad/
- use gpiod_to_irq(gpiochip_get_desc(...)) instead of
  irq_create_mapping(), as suggested by Andy Shevchenko (patches 6 and
  7)
- added a dummy read of TRNG entropy when registering TRNG, in case
  someone cleared the TRNG interrupt before probing the driver, but did
  not read the entropy (the MCU won't send a new TRNG interrupt if the
  entropy is not collected) (patch 6)
- fixed a bug in TRNG probing, wherein if the 

Marek Behún (9):
  dt-bindings: arm: add cznic,turris-omnia-mcu binding
  platform: cznic: Add preliminary support for Turris Omnia MCU
  platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
  platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
  platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
  platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
  platform: cznic: turris-omnia-mcu: Add support for digital message
    signing via debugfs
  ARM: dts: turris-omnia: Add MCU system-controller node
  ARM: dts: turris-omnia: Add GPIO key node for front button

 .../ABI/testing/debugfs-turris-omnia-mcu      |   13 +
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  126 ++
 .../firmware/cznic,turris-omnia-mcu.yaml      |   86 ++
 MAINTAINERS                                   |    5 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   35 +-
 drivers/platform/Kconfig                      |    2 +
 drivers/platform/Makefile                     |    1 +
 drivers/platform/cznic/Kconfig                |   51 +
 drivers/platform/cznic/Makefile               |    9 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  439 +++++++
 .../platform/cznic/turris-omnia-mcu-debugfs.c |  216 ++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1047 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  258 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  109 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  123 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  188 +++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 17 files changed, 2956 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/debugfs-turris-omnia-mcu
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-debugfs.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-trng.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

-- 
2.43.2


