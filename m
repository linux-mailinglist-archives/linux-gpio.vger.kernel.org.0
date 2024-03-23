Return-Path: <linux-gpio+bounces-4573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFB887974
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Mar 2024 17:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120B81C20B7F
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Mar 2024 16:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC0547F7A;
	Sat, 23 Mar 2024 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSpS9Eg/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235747483;
	Sat, 23 Mar 2024 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711212247; cv=none; b=bz4da+t3XFa5+t3/yuscuMBkvTzhljJMpDDuO1E4i+XvlYeOENqOeVOqfZsGMzhgihdi5OnYwf/wF8ZO9eHljfLOZv4yyuABuyDdHpwceU5YKrQIMkJToFqjdqxeOoMi20v/+q5A6WMQQmIM35zgzes48zzaAQA903e/41bn/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711212247; c=relaxed/simple;
	bh=6kri9cAqdeLQSwynoX/Mgs7Zl64zCLiK2ixhjODz/Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EbzVuUUQbH+ql94A7C30/jYNA3s0iUUggBPbZAredasR2ksQUXCAt8hSS0OokgclHLvpWb152jbKcksQrEjn0t1jtQe701DFG8sWtMvjDs/Yy+3joYI7L6HAnNkiSpvRybBKIXl0WTYqMwLVSB/H+O7DrI7nQwYw3lOS87xmGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSpS9Eg/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F63C433F1;
	Sat, 23 Mar 2024 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711212246;
	bh=6kri9cAqdeLQSwynoX/Mgs7Zl64zCLiK2ixhjODz/Ms=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=BSpS9Eg/l+jRAko4Tz+ZMN4JCRwHeQdIYDpwIFJvgc226TRfGH4lO7KFm0HfyEk4N
	 QHc+jaFbJbeJiqblewqW6zH8z311yjUlRYbc8QwrovBl8/iHMp/qfBAYHeRk7oLhdP
	 5IiBfQzDjXjsCXYQrG9kf7QF/htVTR19FxpQSkB9Zsw3c0mmpSEwLMczirzljbgrWx
	 sPhY3/3j56aA886Q3ykqgJ3Hga9PU8kyd1Q+FxjDo58YxSUGjuV+z8109u6Ddplcyi
	 ks2EQegxrXkJvon8ZBFpuoQRquk4cyc/ytK6z0WZ+MvxZ8zzfZeB1se0xXW/QShgFv
	 f7tmL5+5HfinQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	soc@kernel.org,
	arm@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
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
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v5 00/11] Turris Omnia MCU driver
Date: Sat, 23 Mar 2024 17:43:48 +0100
Message-ID: <20240323164359.21642-1-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andy, Linus, Arnd, Gregory, and others,

I am sending v5 of the series adding Turris Omnia MCU driver.
See the cover letters for v1, v2, v3 and v4:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/

Changes since v4:
- added new patches
    06/11 devm-helpers: Add resource managed version of irq_create_mapping()
    07/11 platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
    08/11 devm-helpers: Add resource managed version of debugfs directory create
          function
    09/11 platform: cznic: turris-omnia-mcu: Add support for digital message
          signing via debugfs
- for changes specific to patches which were also sent in previous versions see
  the notes in those patches

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
 drivers/crypto/caam/ctrl.c                    |   16 +-
 drivers/crypto/caam/jr.c                      |    8 +-
 drivers/gpio/gpio-mockup.c                    |   11 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   13 +-
 drivers/hwmon/hp-wmi-sensors.c                |   15 +-
 drivers/hwmon/mr75203.c                       |   15 +-
 drivers/hwmon/pmbus/pmbus_core.c              |   16 +-
 drivers/platform/Kconfig                      |    2 +
 drivers/platform/Makefile                     |    1 +
 drivers/platform/cznic/Kconfig                |   51 +
 drivers/platform/cznic/Makefile               |   10 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  406 +++++++
 .../platform/cznic/turris-omnia-mcu-debugfs.c |  216 ++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1056 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  258 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |   89 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  122 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  214 ++++
 include/linux/devm-helpers.h                  |   94 ++
 include/linux/turris-omnia-mcu-interface.h    |  238 ++++
 25 files changed, 3044 insertions(+), 72 deletions(-)
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


