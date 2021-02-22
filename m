Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E876321BAB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Feb 2021 16:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhBVPiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Feb 2021 10:38:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbhBVPiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2021 10:38:06 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C21CC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2021 07:37:22 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l12so19546035wry.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2021 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vin7O05u8KUmJaYcuCS5ZchFMqzvO90r/qOds8lH6l0=;
        b=UGeeIUalA/oQN+VeK+TcUvW9zCEoNcm9z+ekdeEd2lf+MIr4vnSYXxLjifgEm6kghi
         KDHCCaPi65uDzdrVnQLqDkcZYW9qTKFLBVEOmho62JHdTf7j1gLJ4MufidLtWlcra2NJ
         oe/D0gGI6ebzu36dcdzWMhxU3eAwau4LS4s/NMABJOuktDYHGKC7XFgGw0RDseviRy7H
         3jyQrIrAbDQGQ8mIey9E+47RTwHhBKqLWChvyhyhF9F8+ybppnQ4nN2MeWpvtcbqFzHY
         aQjM9Sc4ioRmHsc4LiyqX7QuSsCveIRpzJcZLJ9F+T2gakUvWzV4t1WWuAkUOX58XprN
         X5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vin7O05u8KUmJaYcuCS5ZchFMqzvO90r/qOds8lH6l0=;
        b=jUamJl5WifAthi4+Y5RD1sytEULHQtmPYUK6yKOfINBv8D/+jewIKAnhGk6lawdKdj
         VLvHoSg+X6kziwYd/ltl2PhOt2shjiS8Cx/MTyuGARgPIBB9LiSbFRCXHlCPLhPiDoKs
         xxy7fD8uzO+rsibnVbHgqR0fgAKK8hY4CezIIbM06FKJmo7AT2uQrCsrDy6LKqc7KhVV
         15HoXKkPmZaSpe9hZ7FobYFIgxnyF23gkkgCQoUk9esidWNpCcZuXlUhJhRcLY0l6CSf
         tORyPP4XEA4et5CnQGdxwG0pygw3MVw8g34n1+Fs0p93Ndd9qlkgiqGydHk3Vlsru0Fw
         RVvw==
X-Gm-Message-State: AOAM532YoZkeld8owGs34HkH2AkTOmkT7s18ycpSW4ppumu6yNRCQdLJ
        b6JKdm1/tFUlQAS6PXS4em5AAw==
X-Google-Smtp-Source: ABdhPJyRoPZWdsORNqxl+3Iuu9xnzkwI00A/L61+LPfjLcl90RpgWY40nzcORIfruDgxHPXlAGyOlw==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr4409857wrv.402.1614008241026;
        Mon, 22 Feb 2021 07:37:21 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v6sm30195781wrx.32.2021.02.22.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:37:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.12
Date:   Mon, 22 Feb 2021 16:37:14 +0100
Message-Id: <20210222153714.4961-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

This is the pull request from the GPIO subsystem for this merge window. It's
been a relatively calm release cycle and we're actually removing more code
than we're adding. All patches have been in next with most having spent several
weeks there. The PR is rebased on top of v5.11 because certain bug fixes on
which patches for v5.12 depend were only merged after v5.11-rc7. Details are in
the signed tag. Please pull!

Best Regards,
Bartosz Golaszewski

The following changes since commit f40ddce88593482919761f74910f42f4b84c004b:

  Linux 5.11 (2021-02-14 14:32:24 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.12

for you to fetch changes up to a8002a35935aaefcd6a42ad3289f62bab947f2ca:

  gpio: pcf857x: Fix missing first interrupt (2021-02-18 15:52:44 +0100)

----------------------------------------------------------------
gpio updates for v5.12

- new driver for the Toshiba Visconti platform
- rework of interrupt handling in gpio-tegra
- updates for GPIO selftests: we're now using the character device to perform
  the subsystem checks
- support for a new rcar variant + some code refactoring
- refactoring of gpio-ep93xx
- SPDX License identifier has been updated in the uapi header so that userspace
  programs bundling it can become fully REUSE-compliant
- improvements to pwm handling in gpio-mvebu
- support for interrupt handling and power management for gpio-xilinx as well
  as some code refactoring
- support for a new chip variant in gpio-pca953x
- removal of drivers: zte xs & intel-mid and removal of leftovers from
  intel-msic
- impovements to intel drivers pulled from Andy Shevchenko
- improvements to the gpio-aggregator virtual GPIO driver
- and several minor tweaks and fixes to code and documentation all over the
  place

----------------------------------------------------------------
Andy Shevchenko (13):
      gpio: merrifield: Make bias configuration available for GPIOs
      lib/cmdline_kunit: add a new test case for get_options()
      lib/cmdline: Update documentation to reflect behaviour
      lib/cmdline: Allow get_options() to take 0 to validate the input
      gpio: aggregator: Replace isrange() by using get_options()
      gpio: aggregator: Use compound literal from the header
      gpio: aggregator: Remove trailing comma in terminator entries
      gpio: msic: Remove driver for deprecated platform
      gpio: intel-mid: Remove driver for deprecated platform
      gpio: wcove: Get rid of error prone casting in IRQ handler
      gpio: wcove: Switch to use regmap_set_bits(), regmap_clear_bits()
      gpio: wcove: Split out to_ireg() helper and deduplicate the code
      gpio: msic: Drop driver from Makefile

Arnd Bergmann (1):
      gpio: remove zte zx driver

Aswath Govindraju (1):
      dt-bindings: gpio: Add compatible string for AM64 SoC

Bartosz Golaszewski (3):
      gpio: bd7xxxx: use helper variable for pdev->dev
      gpio: mockup: tweak the Kconfig help text
      gpio: uapi: use the preferred SPDX license identifier

Baruch Siach (6):
      gpio: mvebu: improve pwm period calculation accuracy
      gpio: mvebu: make pwm .get_state closer to idempotent
      gpio: mvebu: don't limit pwm period/duty_cycle to UINT_MAX
      gpio: mvebu: improve handling of pwm zero on/off values
      gpio: mvebu: add pwm support for Armada 8K/7K
      dt-bindings: ap806: document gpio marvell,pwm-offset property

Colin Ian King (1):
      gpio: fix spelling mistake in Kconfig "supprot" -> "support"

Dmitry Osipenko (6):
      gpio: tegra: Fix wake interrupt
      gpio: tegra: Improve formatting of the code
      gpio: tegra: Use debugfs_create_devm_seqfile()
      gpio: tegra: Clean up whitespaces in tegra_gpio_driver
      gpio: tegra: Support building driver as a loadable module
      gpio: tegra: Fix irq_set_affinity

Geert Uytterhoeven (3):
      dt-bindings: gpio: rcar: Add r8a779a0 support
      gpio: rcar: Optimize GPIO pin state read on R-Car Gen3
      gpio: rcar: Add R-Car V3U (R8A779A0) support

Jonathan Neuschäfer (2):
      docs: gpio: Fix formatting in description of gpiod_*_array_* functions
      docs: gpio: intro: Improve HTML formatting

Kent Gibson (8):
      selftests: gpio: rework and simplify test implementation
      selftests: gpio: remove obsolete gpio-mockup-chardev.c
      selftests: remove obsolete build restriction for gpio
      selftests: remove obsolete gpio references from kselftest_deps.sh
      tools: gpio: remove uAPI v1 code no longer used by selftests
      selftests: gpio: port to GPIO uAPI v2
      selftests: gpio: add CONFIG_GPIO_CDEV to config
      gpio: uapi: fix line info flags description

Lad Prabhakar (2):
      gpio: rcar: Remove redundant compatible values
      gpio: Kconfig: Update help description for GPIO_RCAR config

Matti Vaittinen (1):
      gpio: bd7xxxx: Do not depend on parent driver data

Maxim Kiselev (1):
      gpio: pcf857x: Fix missing first interrupt

Nikita Shubin (5):
      gpio: ep93xx: Fix wrong irq numbers in port F
      gpio: ep93xx: drop to_irq binding
      gpio: ep93xx: Fix typo s/hierarchial/hierarchical
      gpio: ep93xx: refactor ep93xx_gpio_add_bank
      gpio: ep93xx: refactor base IRQ number

Nobuhiro Iwamatsu (4):
      dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
      gpio: visconti: Add Toshiba Visconti GPIO support
      MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
      arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

Srinivas Neeli (5):
      gpio: gpio-xilinx: Simplify with dev_err_probe()
      gpio: gpio-xilinx: Reduce spinlock array to array
      gpio: gpio-xilinx: Add interrupt support
      gpio: gpio-xilinx: Add support for suspend and resume
      gpio: gpio-xilinx: Add check if width exceeds 32

Thierry Reding (1):
      gpio: tegra: Convert to gpio_irq_chip

Uwe Kleine-König (3):
      gpio: pca953x: Add support for pca9506
      dt-bindings: gpio: pca953x: Document new supported chip pca9506
      dt-bindings: gpio: pca953x: Increase allowed length for gpio-line-names

Zheng Yongjun (5):
      gpio: sl28cpld: convert comma to semicolon
      gpio: max77620: convert comma to semicolon
      gpio: tegra186: convert comma to semicolon
      gpio: vx855: convert comma to semicolon
      gpio: wcove: convert comma to semicolon

 .../arm/marvell/ap80x-system-controller.txt        |   8 +
 .../devicetree/bindings/gpio/gpio-davinci.txt      |   1 +
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |   3 +-
 .../bindings/gpio/renesas,rcar-gpio.yaml           |   3 +
 .../bindings/gpio/toshiba,gpio-visconti.yaml       |  70 +++
 .../devicetree/bindings/gpio/zx296702-gpio.txt     |  24 -
 Documentation/driver-api/gpio/consumer.rst         |   5 +-
 Documentation/driver-api/gpio/intro.rst            |   8 +-
 MAINTAINERS                                        |   4 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |   4 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          |  11 +
 drivers/gpio/Kconfig                               |  44 +-
 drivers/gpio/Makefile                              |   4 +-
 drivers/gpio/TODO                                  |   2 +-
 drivers/gpio/gpio-aggregator.c                     |  40 +-
 drivers/gpio/gpio-bd70528.c                        |  59 ++-
 drivers/gpio/gpio-bd71828.c                        |  39 +-
 drivers/gpio/gpio-ep93xx.c                         |  28 +-
 drivers/gpio/gpio-intel-mid.c                      | 414 -----------------
 drivers/gpio/gpio-max77620.c                       |   2 +-
 drivers/gpio/gpio-merrifield.c                     |   5 +
 drivers/gpio/gpio-msic.c                           | 314 -------------
 drivers/gpio/gpio-mvebu.c                          | 148 +++---
 drivers/gpio/gpio-pca953x.c                        |   2 +
 drivers/gpio/gpio-pcf857x.c                        |   2 +-
 drivers/gpio/gpio-rcar.c                           |  85 ++--
 drivers/gpio/gpio-sl28cpld.c                       |   4 +-
 drivers/gpio/gpio-tegra.c                          | 263 +++++++----
 drivers/gpio/gpio-tegra186.c                       |   2 +-
 drivers/gpio/gpio-visconti.c                       | 218 +++++++++
 drivers/gpio/gpio-vx855.c                          |   2 +-
 drivers/gpio/gpio-wcove.c                          |  65 +--
 drivers/gpio/gpio-xilinx.c                         | 369 ++++++++++++++-
 drivers/gpio/gpio-zx.c                             | 289 ------------
 drivers/pinctrl/visconti/pinctrl-common.c          |  23 +
 include/linux/gpio/machine.h                       |   4 +-
 include/uapi/linux/gpio.h                          |   4 +-
 lib/cmdline.c                                      |  21 +-
 lib/cmdline_kunit.c                                |  56 +++
 tools/gpio/gpio-utils.c                            |  89 ----
 tools/gpio/gpio-utils.h                            |   6 -
 tools/testing/selftests/Makefile                   |   9 -
 tools/testing/selftests/gpio/Makefile              |  26 +-
 tools/testing/selftests/gpio/config                |   1 +
 tools/testing/selftests/gpio/gpio-mockup-cdev.c    | 198 ++++++++
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 323 -------------
 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh  | 168 +++----
 tools/testing/selftests/gpio/gpio-mockup.sh        | 497 ++++++++++++++-------
 tools/testing/selftests/kselftest_deps.sh          |   4 +-
 49 files changed, 1827 insertions(+), 2143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
 delete mode 100644 drivers/gpio/gpio-intel-mid.c
 delete mode 100644 drivers/gpio/gpio-msic.c
 create mode 100644 drivers/gpio/gpio-visconti.c
 delete mode 100644 drivers/gpio/gpio-zx.c
 create mode 100644 tools/testing/selftests/gpio/gpio-mockup-cdev.c
 delete mode 100644 tools/testing/selftests/gpio/gpio-mockup-chardev.c
