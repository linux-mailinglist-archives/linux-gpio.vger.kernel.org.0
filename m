Return-Path: <linux-gpio+bounces-6288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731738C21DE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 12:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84D001C21354
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 10:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EE216C443;
	Fri, 10 May 2024 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWHAMRwr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748742233B;
	Fri, 10 May 2024 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336309; cv=none; b=anGATSEBw/74KeAUNEFdj1w7J1fAIA4tJAXcn44tsEsz7RphsQ5yfd8T9b/Gkqq0/k97GTK49n2HjBNBjTTYSlyyaOOdf4/mqL8yxeEaAw238e5IxLNvymttXiufVKQvr9Ha23JTE/v0FLzaCs1xdsPHKL2G/Xe7D6oqpZDQPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336309; c=relaxed/simple;
	bh=3mgk/qKH2ybFNCBiVS1cLaPC0sYDQzDSpjzoyqxz4Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NMiRXoZ+RUrzFfjivfbimRkA3RFGV1hoq2jc0NMazdhm2ZchsYuP99wzNa+34Us6NgUQT1WROCMwNK4uq+z3TF4NnisEmNeRY5p1yav1wfh9Av2fUW66Nz4jatKEkF7L2PsWogupiAIslW8HVOlF08dOsy6umfWtOgs/HV+PTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWHAMRwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AFEC113CC;
	Fri, 10 May 2024 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715336309;
	bh=3mgk/qKH2ybFNCBiVS1cLaPC0sYDQzDSpjzoyqxz4Ms=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=QWHAMRwr0i2LHX4GA+obVtqai9FuSYUCoEERqCgeRrsZLQo14dQ13OXCz5dZwvUQK
	 yIOv22lSKzIOMaVB0zGZsNYv0+r2pSm/TpsEkbhoSua8Ej00UfYLpQQL2AwFbu/Fki
	 IktGBBQt5xtio0h8Clb522ehSoCvb1LA+eAGF3bXbCSclCmfdxQdUKQXPgZbV1H6Lr
	 pVbIZVimzk3PLj8FtcU5dBCxhQ6E8GvzQrRk3KJqsVrFVTFbUmGWEk905XWpQChpiV
	 uW8Oh1m8VwvHdUd1BQunByGx4JfS7YtxY3JT98/sd3qR+ZGAD8mrhRp7lTk0p2jsOu
	 Zbmyi0CMPD3og==
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
Subject: [PATCH v10 0/9] Turris Omnia MCU driver
Date: Fri, 10 May 2024 12:18:10 +0200
Message-ID: <20240510101819.13551-1-kabel@kernel.org>
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

this is v10 of the series adding Turris Omnia MCU driver.

This series still depends on the immutable branch between LEDs and
locking, introducing devm_mutex_init(), see the PR
  https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/

See also cover letters for v1 to v9:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240424173809.7214-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240430115111.3453-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240508103118.23345-1-kabel@kernel.org/

Changes since v9:
- in functions where mcu->client is referred to multiple times added
  a helper variable client = mcu->client, suggested by Andy
- changed instances of
    if (!err)
      do_something;
    return err;
  patterns to the more traditional pattern
    if (err)
      return err;
    do_something;
    return 0;
  as suggested by Andy
- fixed some typos reported by Andy
- changed crc32_be(0xffffffff, ...) to crc32_be(~0, ...), as suggested
  by Andy
- changed to use the DECI unit macro from units.h instead of hardcoded
  10, as suggested by Andy
- changed -EINTR to -ERESTARTSYS in trng read and signature read
- changed the mutex lock in signature read to interruptible mutex lock,
  as pointed out by Andy

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
 .../platform/cznic/turris-omnia-mcu-base.c    |  450 +++++++
 .../platform/cznic/turris-omnia-mcu-debugfs.c |  208 ++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1039 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  257 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  103 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  128 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  216 ++++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 17 files changed, 2976 insertions(+), 1 deletion(-)
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


