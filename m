Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EE0402537
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 10:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241555AbhIGIhy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 04:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242795AbhIGIhY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 04:37:24 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E3AC06175F
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 01:36:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v10so13221644wrd.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Do8X31vMuXsGoFDxl1UrBFMJCYmyJorVQ5Hu9AvrSbM=;
        b=QouHOwrVpDnRBwbpPUu3YfsPvMiNd0VINkUYEM/2+nkR5DRBuo9bqjeLocysTHbYcH
         anSaF1CtXoU4u8WoSjfmdiXsoOvf7wCJB9I2iJrtniEzGrXSkndkmb11av/Dx29VL1xB
         0RoVoDK204HKnxhvjIeNFrgIPdSb8M7fvefEkgsNJHcGw+CPBHCEZeqVPSg0/saUSYKR
         L+wm9KsymFhxcKngCc5tSpuMNrGQycwFBGGjrrNDgn/Alyy8D+LfqjVarYt0E16qXAju
         GpiqY52YJG1R9wYauh2UkCvafG6MgB/7nV5wet2rTGqcR1MmmY3sA98cMU9qqgGqUn1w
         /9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Do8X31vMuXsGoFDxl1UrBFMJCYmyJorVQ5Hu9AvrSbM=;
        b=sOXgt2DzdOfmxyRWqsaMLCbNESzORsswg5Tbvq/DOe+HnPX+rGOkcC1V+AZSjKgz7n
         hKuBYcCocwq8dZqrhanNe4vNbBDnGUuASQkpOzNqg3c0n4B3SpdbwLqqTqahpCleDNFH
         ZI53bfINgvqE2cavq3p3/sc1VrTqdzj6t5y9MGDrU+XnJDksFe/FbYIluTPRm+slWVAp
         4HCSB1Y7As8K5bzz0XL49T5PQdVmkk1cP0wnMaOT3f9D574w0AzwadvEoq7guqKhlC8C
         YZNa6wEbgK8LmCtmkk4vL9VFhi2oMpBoiCSVibYURDDe6/8Cf8I15u2KPnhXFHloNOk8
         VQbA==
X-Gm-Message-State: AOAM530ZvMTpJzolXYprN5ss/M6ZsCYlW2U/Q0t/ziz1XUidY0+D9QoS
        C79S6sBKZkcLvoDTB6oyUeaw1A==
X-Google-Smtp-Source: ABdhPJxo6JNP8VyHDw7Fev5ySPRkS+PStXpkA8Hd3bmhjnBAi4cqH3xN/dQgJiXn+KtRtoJ2+RBp2A==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr17167557wrc.158.1631003776355;
        Tue, 07 Sep 2021 01:36:16 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id u2sm1738068wmj.29.2021.09.07.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:36:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: updates for v5.15
Date:   Tue,  7 Sep 2021 10:36:13 +0200
Message-Id: <20210907083613.31268-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Here's the pull-request for this cycle from the GPIO subsystem. We mostly
have various improvements and refactoring all over the place but also some
interesting new features - like the virtio GPIO driver that allows guest VMs
to use host's GPIOs. We also have a new/old GPIO driver for rockchip - this
one has been split out of the pinctrl driver, hence the pull from the
pinctrl tree you can see in my branch. Another merge in the tree is from Andy
for the intel drivers. Details are in the signed tag.

Please pull!
Bartosz

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.15

for you to fetch changes up to 889a1b3f35db6ba5ba6a0c23a3a55594570b6a17:

  gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and avoid a leak (2021-08-31 12:10:24 +0200)

----------------------------------------------------------------
gpio updates for v5.15

- new driver: gpio-virtio allowing a guest VM running linux to access
  GPIO lines provided by the host
- split the GPIO driver out of the rockchip pin control driver
- add support for a new model to gpio-aspeed-sgpio, refactor the driver
  and use generic device property interfaces, improve property sanitization
- add ACPI support to gpio-tegra186
- improve the code setting the line names to support multiple GPIO banks
  per device
- constify a bunch of OF functions in the core GPIO code and make the
  declaration for one of the core OF functions we use consistent within its
  header
- use software nodes in intel_quark_i2c_gpio
- add support for the gpio-line-names property in gpio-mt7621
- use the standard GPIO function for setting the GPIO names in gpio-brcmstb
- fix a bunch of leaks and other bugs in gpio-mpc8xxx
- use generic pm callbacks in gpio-ml-ioh
- improve resource management and PM handling in gpio-mlxbf2
- modernize and improve the gpio-dwapb driver
- coding style improvements in gpio-rcar
- documentation fixes and improvements
- update the MAINTAINERS entry for gpio-zynq
- minor tweaks in several drivers

----------------------------------------------------------------
Akhil R (1):
      gpio: tegra186: Add ACPI support

Alexandru Ardelean (1):
      gpio: viperboard: remove platform_set_drvdata() call in probe

Andy Shevchenko (9):
      gpiolib: Deduplicate forward declaration in the consumer.h header
      gpio: dwapb: Unify ACPI enumeration checks in get_irq() and configure_irqs()
      gpio: dwapb: Read GPIO base from gpio-base property
      mfd: intel_quark_i2c_gpio: Convert GPIO to use software nodes
      gpio: dwapb: Get rid of legacy platform data
      gpio: mlxbf2: Convert to device PM ops
      gpio: mlxbf2: Drop wrong use of ACPI_PTR()
      gpio: mlxbf2: Use devm_platform_ioremap_resource()
      gpio: mlxbf2: Use DEFINE_RES_MEM_NAMED() helper macro

Bartosz Golaszewski (2):
      Merge tag 'intel-gpio-v5.15-1' of gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next
      Merge branch 'ib-rockchip' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into gpio/for-next

Christophe JAILLET (3):
      gpio: mpc8xxx: Fix a resources leak in the error handling path of 'mpc8xxx_probe()'
      gpio: mpc8xxx: Fix a potential double iounmap call in 'mpc8xxx_probe()'
      gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and avoid a leak

Geert Uytterhoeven (1):
      gpio: rcar: Always use local variable dev in gpio_rcar_probe()

Hannu Hartikainen (1):
      docs: gpio: explain GPIOD_OUT_* values and toggling active low

Jianqun Xu (9):
      pinctrl/rockchip: always enable clock for gpio controller
      pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
      pinctrl/rockchip: add pinctrl device to gpio bank struct
      dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
      gpio/rockchip: add driver for rockchip gpio
      gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
      gpio/rockchip: support next version gpio controller
      gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
      pinctrl/rockchip: drop the gpio related codes

Krzysztof Kozlowski (3):
      of: unify of_count_phandle_with_args() arguments with !CONFIG_OF
      gpiolib: constify passed device_node pointer
      gpiolib: of: constify few local device_node variables

Linus Walleij (1):
      gpio: max730x: Use the right include

Lukas Bulwahn (1):
      gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions

Mauro Carvalho Chehab (1):
      MAINTAINERS: update gpio-zynq.yaml reference

Sergio Paracuellos (3):
      gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip banks per device
      gpio: mt7621: support gpio-line-names property
      gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'

Steven Lee (5):
      gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
      gpio: gpio-aspeed-sgpio: Add set_config function
      gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
      gpio: gpio-aspeed-sgpio: Use generic device property APIs
      gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.

Vaibhav Gupta (1):
      gpio: ml-ioh: Convert to dev_pm_ops

Vincent Pelletier (1):
      Documentation: gpio: driver.rst: Remove gpiochip_irqchip_add mention

Viresh Kumar (3):
      gpio: Add virtio-gpio driver
      gpio: virtio: Fix sparse warnings
      gpio: virtio: Add missing mailings lists in MAINTAINERS entry

 .../bindings/gpio/rockchip,gpio-bank.yaml          |   5 +-
 Documentation/driver-api/gpio/consumer.rst         |  10 +-
 Documentation/driver-api/gpio/driver.rst           |  11 +-
 MAINTAINERS                                        |  11 +-
 drivers/gpio/Kconfig                               |  23 +-
 drivers/gpio/Makefile                              |   3 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   | 178 ++--
 drivers/gpio/gpio-brcmstb.c                        |  45 +-
 drivers/gpio/gpio-dwapb.c                          |  56 +-
 drivers/gpio/gpio-mc9s08dz60.c                     | 112 ---
 drivers/gpio/gpio-ml-ioh.c                         |  49 +-
 drivers/gpio/gpio-mlxbf2.c                         |  43 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  13 +-
 drivers/gpio/gpio-mt7621.c                         |   1 +
 drivers/gpio/gpio-rcar.c                           |   4 +-
 drivers/gpio/gpio-rockchip.c                       | 771 +++++++++++++++++
 drivers/gpio/gpio-tegra186.c                       |  30 +-
 drivers/gpio/gpio-viperboard.c                     |  14 +-
 drivers/gpio/gpio-virtio.c                         | 374 +++++++++
 drivers/gpio/gpiolib-devres.c                      |   2 +-
 drivers/gpio/gpiolib-of.c                          |  16 +-
 drivers/gpio/gpiolib.c                             |  32 +-
 drivers/mfd/intel_quark_i2c_gpio.c                 |  71 +-
 drivers/pinctrl/pinctrl-rockchip.c                 | 909 +--------------------
 drivers/pinctrl/pinctrl-rockchip.h                 | 287 +++++++
 include/linux/gpio/consumer.h                      |  14 +-
 include/linux/gpio/driver.h                        |   4 +
 include/linux/of.h                                 |   2 +-
 include/linux/of_gpio.h                            |  15 +-
 include/linux/platform_data/gpio-dwapb.h           |  25 -
 include/linux/spi/max7301.h                        |   2 +-
 include/uapi/linux/virtio_gpio.h                   |  47 ++
 include/uapi/linux/virtio_ids.h                    |   1 +
 33 files changed, 1841 insertions(+), 1339 deletions(-)
 delete mode 100644 drivers/gpio/gpio-mc9s08dz60.c
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
 delete mode 100644 include/linux/platform_data/gpio-dwapb.h
 create mode 100644 include/uapi/linux/virtio_gpio.h
