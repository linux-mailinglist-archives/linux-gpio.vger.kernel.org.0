Return-Path: <linux-gpio+bounces-5662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5E8A9987
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 14:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD23282317
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 12:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ABB15F407;
	Thu, 18 Apr 2024 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrDUH59m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7B15DBD6;
	Thu, 18 Apr 2024 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713442286; cv=none; b=Vh92bWZnv1LzSP7idl/j6/GZSZA+XWg/1JZvCcdZH0zIU7BaIomcWVFt1B4thBCypvP/xWzGVyZh0bW6jsIHgxbJGd9DVyMjQYvIG64zJDpTy+PsVH/QK9qc0LCbWPetjmEKalJwkuf+6WNd2jgYNBwUOX03eh2PyM+EHoiNMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713442286; c=relaxed/simple;
	bh=b5J5aNlAuhkKaRFLEKNaYcnFOnkIAx+ioPr3QdH9v5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oj2ufepvpYw5wRExON6itG3EtE2ezi2hvTzgOroaOMJopE2SOUoAubhvJOsY74zhVoIeD6QNiOsLbIgKJigvNQ9f2Z503cdeDsYkZPH3fkj1i7JooXaB+pvTQ+zVq7hsjLycdLh3HqRwcK0Ym1rY97iVPowbRm8CHFYhxEG82fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrDUH59m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF167C113CC;
	Thu, 18 Apr 2024 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713442286;
	bh=b5J5aNlAuhkKaRFLEKNaYcnFOnkIAx+ioPr3QdH9v5A=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=XrDUH59m5budXj01S9zfuQA4aaVYhENvFECekzgwmrq77aKyEuIu6q47o3D4nAAcN
	 p5l07WUO0fo9Ry4QkaShPbPpzAdJn2ZVMKU/RtsWepp6onq8RaMKkwRNApK1Rkg9LZ
	 xYw23Vd/NOfHmU8wHdl5Pvf+rR6wPpkGVAfRf0TO8NUPOeYboNd+hfQ68mCoR069GA
	 rIbqLn7lgfrb9x5qHcZbUjFztpom0uwEKA/bmntKowHzHMaZDzN6OiiYclP1Unm+um
	 1ak2bM14r+JDc2OzclHiOrz9RsPavHcWfIXBof23vS46Jw026vBaL3h6A/V7AyWUe5
	 BdNSpSyuCIynQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH v6 00/11] Turris Omnia MCU driver
Date: Thu, 18 Apr 2024 14:11:05 +0200
Message-ID: <20240418121116.22184-1-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andy, Dan, Linus, Arnd, Gregory, and others,

I am sending v6 of the series adding Turris Omnia MCU driver.

This series depends on the immutable branch between LEDs and locking,
introducing devm_mutex_init(), see the PR
  https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/

See the cover letters for v1, v2, v3, v4 and v5:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/

Changes since v5:
- use dev_get_drvdata(dev) instead of
  i2c_get_clientdata(to_i2c_client(dev))
- uses devm_mutex_init() from the above mentioned branch
- addressed Andy's suggestions for patch 2 (excluding the one suggesting
  100 column lines, I still prefer 80 columns)
- addressed Dan's suggestion for devm_irq_create_mapping() (return
  -ENXIO if mapping could not be created, not 0 as irq_create_mapping()
  does)
- I threw away the changes for other drivers that came with the new
  devm_ helpers, notably conversion to devm_debugfs_create_dir(), as
  there were some problems

Marek Behún (11):
  dt-bindings: arm: add cznic,turris-omnia-mcu binding
  platform: cznic: Add preliminary support for Turris Omnia MCU
  platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
  platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
  platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
  devm-helpers: Add resource managed version of irq_create_mapping()
  platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
  devm-helpers: Add resource managed version of debugfs directory create
    function
  platform: cznic: turris-omnia-mcu: Add support for digital message
    signing via debugfs
  ARM: dts: turris-omnia: Add MCU system-controller node
  ARM: dts: turris-omnia: Add GPIO key node for front button

 .../ABI/testing/debugfs-turris-omnia-mcu      |   13 +
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  126 ++
 .../bindings/arm/cznic,turris-omnia-mcu.yaml  |   86 ++
 MAINTAINERS                                   |    5 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   35 +-
 drivers/platform/Kconfig                      |    2 +
 drivers/platform/Makefile                     |    1 +
 drivers/platform/cznic/Kconfig                |   51 +
 drivers/platform/cznic/Makefile               |    9 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  439 +++++++
 .../platform/cznic/turris-omnia-mcu-debugfs.c |  209 ++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1047 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  258 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |   89 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  123 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  188 +++
 include/linux/devm-helpers.h                  |   94 ++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 18 files changed, 3023 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/debugfs-turris-omnia-mcu
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
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


