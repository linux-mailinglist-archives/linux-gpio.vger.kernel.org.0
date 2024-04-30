Return-Path: <linux-gpio+bounces-5938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 574098B74DB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 13:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D4D1F22733
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 11:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE2013D244;
	Tue, 30 Apr 2024 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMotWVD+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46691311B0;
	Tue, 30 Apr 2024 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477881; cv=none; b=na3uTiXUcqArIW5vGtnH0oovOIx2+sTCzZqxDRrP71aofxQqSbCwCicroJRmcVqDiSzV29Rm51ROawB9hOnzSs6sQstQKScrThcwttX55M9lV5FWEGLs3RZWROU5JjfPuxUbVois38lZl0jeFhuDkQizrmcmrvOF+t+06i5ukRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477881; c=relaxed/simple;
	bh=vBMSAoS4FslXBKMp6Bl0M5x8r+e0FbC1+oCjbaWlU+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Veq64Z2g6VZ8yaZtUdsSWhHyFmhXGaYocvbq1droZ/zZNL0NxWUsQ6XOYKh0+h4Hm9Hm10r005QoeuzTDk5PgNY1/hpTTbIOoIjZA9vNmo/hH1BiJgOpdjljuf43/RlKfnX5tjZLj4RjHCl/nRRAIEHZhmbD7sHfY0mOrh9rsLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMotWVD+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58150C2BBFC;
	Tue, 30 Apr 2024 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714477881;
	bh=vBMSAoS4FslXBKMp6Bl0M5x8r+e0FbC1+oCjbaWlU+U=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=gMotWVD+CJA+GM/SxYj9XE7Mk8Hco1CyjfuSrPqdU4hoQhynWYHtQIf0WOOfdbiSU
	 lU++GicjvEdHyvtJ/8558SA6RYJnUoN63kWFqctUrcB7K3zk6sGEgwtD97p87r32UU
	 bkzxDigyd5GNgegCk/2QZdxTAtFYahWogTFfgVxh86MKfx6FkmyV1PQPc4VyyNtenw
	 CLmUjK9nDlCymDKeaptNcIMJi3bKb05F/yTrnkzPo0rGMK1ooGAhbovsZIsSUdgL5J
	 n76Xq8hcCI/tuQIThcly+VDWJj5hmkXapZ88+F+emQBPlrTjdemHej3Mk/lC3n0TS1
	 /Ll+rmIzu0bHQ==
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
Subject: [PATCH v8 0/9] Turris Omnia MCU driver
Date: Tue, 30 Apr 2024 13:51:02 +0200
Message-ID: <20240430115111.3453-1-kabel@kernel.org>
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

this is v8 of the series adding Turris Omnia MCU driver.

This series depends on the immutable branch between LEDs and locking,
introducing devm_mutex_init(), see the PR
  https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/

See also cover letters for v1, v2, v3, v4, v5, v6 and v7:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240424173809.7214-1-kabel@kernel.org/

Changes since v7:
- fixed wrong $id path in DT binding (patch 1)
- removed resource managed IRQ mapping disposal, which is not needed, as
  pointed out by Andy (patches 6, 7)
- added some more #includes (for linux/device.h, linux/interrupt.h,
  linux/hw_random.h) (patches 3, 6, 7)
- dropped the Fixes tags from the DT changes (patches 8, 9), with an
  explanation of this added into the commit message of patch 8, as
  suggested by Andrew

Marek Behún (9):
  dt-bindings: firmware: add cznic,turris-omnia-mcu binding
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
 .../platform/cznic/turris-omnia-mcu-debugfs.c |  207 ++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1048 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  258 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  101 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  123 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  188 +++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 17 files changed, 2940 insertions(+), 1 deletion(-)
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


