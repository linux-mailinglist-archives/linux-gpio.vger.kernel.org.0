Return-Path: <linux-gpio+bounces-6232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC48BFB04
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 12:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1445AB22F0A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 10:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFA881727;
	Wed,  8 May 2024 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGTUv4qd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04D33CD2;
	Wed,  8 May 2024 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715164287; cv=none; b=rbwofM8Nl+2VYrlCu7vzzkfS0Naef23bzaVEjeOZ2Lc/ck/5NEg5xk/GEu9lyMvGhSYjqFKID8Yw6UAUsduFrurGWUOQNzWCoScDGewSJxboCXwCDmfT2w6zNOJljKVG5yH6c/5tyCdLtUpFaWSZH+CUMlgIvMfVoAO5GTDmrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715164287; c=relaxed/simple;
	bh=ElHEynA8rsJ2bTq8jeNso8DeLwGwXvebWz8OvwP/J3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I3zCy3kVJ0Bt1CE/y2XeczaRrsU1L3VW4SxBpUNaLk+oXKN4XCWQBL0RlqNSW99El74JK1P0R+qQvGV1YEw0x61LCille3Rmw+PLJI8v0ymJVtKeTj9pLKA0oKrh5szvdUGV6N9X8TAKAwtz7OOF6pW+dDepByU4bAgUVLdJCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGTUv4qd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2A0C113CC;
	Wed,  8 May 2024 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715164287;
	bh=ElHEynA8rsJ2bTq8jeNso8DeLwGwXvebWz8OvwP/J3c=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=dGTUv4qdc5MbZfI1fVgooTtxxj058JZWli/4uOAVHvSOOjlN69blvBBEkTJD46zCv
	 Fe6/S1nPyKEJHz9MhA3Y6r9b3vzLfsE6vq6KC8+0fpAWmPiTjjGSI2+4C4nWVIIRwz
	 g0LTtMn9+XX7mPsf8yTGn/g6iddzDT909bOHaUGS4VufIWje7qqZ3dc7dSTrVo/+Os
	 whXV2rvO1ron6LBqHha1OUqGmwvA+dd4EvEq4iVvNbCt4qNjUwKg0x9I3WFLR2Nj+F
	 9S7JynCRzb1cG741Ju86dZYJGkSiTOGdE0TpakBehlqzwnV8qwrjTxCS9W5OqLiZk9
	 QWrHgNbs0FpvA==
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
Subject: [PATCH v9 0/9] Turris Omnia MCU driver
Date: Wed,  8 May 2024 12:31:09 +0200
Message-ID: <20240508103118.23345-1-kabel@kernel.org>
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

this is v9 of the series adding Turris Omnia MCU driver.

This series still depends on the immutable branch between LEDs and
locking, introducing devm_mutex_init(), see the PR
  https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/

See also cover letters for v1, v2, v3, v4, v5, v6, v7 and v8:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240424173809.7214-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240430115111.3453-1-kabel@kernel.org/

Changes since v8:
- removed the MACH_ARMADA_38X || COMPILE_TEST dependency for the
  CZNIC_PLATFORMS Kconfig option in the Kconfig file, as suggested
  by Andy (patch 2)
- fixed the issues in the global header turris-omnia-mcu-interface.h
  pointed out by Andy and Ilpo: added the "OMNIA_" prefix to all
  enumerator entries, added trailing commas, converted to use
  FIELD_PREP_CONST() (patches 2-7)
- added comment why we can't use ether_addr_copy(), as requested by
  Andy (patch 2)
- rewritten the error message for when the MCU does not support
  reporting features, requested by Andy (patch 2)
- changed how the nul-byte is assigned to the end of bin2hex() result,
  requested by Andy (patch 2)
- made the omnia_cmd_write_read() function final in patch 2, instead of
  updating it in subsequent patches, requested by Andy
- in order to be more consistent, changed the omnia_cmd_read_u8() and
  omnia_cmd_read_u16() functions to return zero on success and the read
  value is passed into a pointer, and then added a new function
  omnia_cmd_read_u32(), as requested by Ilpo (he did not like the
  inconsistency in omnia_mcu_read_features(), where the
  omnia_cmd_read_u16() hid the le16_to_cpu() call, but then we did an
  explicit call to le32_to_cpu() when reading 32-bit features) (patch 2)
- some other minor tweaks (changed the version type from u8[] to char[],
  changed len type from size_t to unsigned int in omnia_cmd_write())
  (patches 2 & 3)
- dropped the "gpio%u." prefix from GPIO line names, Andy pointed out
  why this is wrong (patch 3)
- decoupled GPIOs information struct definition and assignment and put
  filling macros before the assignment, requested by Andy (patch 3)
- moved return value check into the guarded scope, suggested by Andy
  (patch 3)
- put some assignments into the definition lines, suggested by Andy
  (patch 3)
- fixed some typos (patches 2 & 3)
- refactored the reply length computation into a new function
  omnia_compute_reply_length(), as requested by Andy (patch 3)

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
 drivers/platform/cznic/Kconfig                |   50 +
 drivers/platform/cznic/Makefile               |    9 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  451 +++++++
 .../platform/cznic/turris-omnia-mcu-debugfs.c |  207 ++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1040 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  258 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  103 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  127 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  210 ++++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 17 files changed, 2971 insertions(+), 1 deletion(-)
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


