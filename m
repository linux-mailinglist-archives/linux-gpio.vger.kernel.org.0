Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FECE3BBA2B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 11:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhGEJb3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jul 2021 05:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhGEJb3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jul 2021 05:31:29 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6609C061574
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jul 2021 02:28:51 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a8so9556688wrp.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jul 2021 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSo23r4HMhlRmv8GkSD5TaY3U4mSIRQESnluxSVgcTM=;
        b=OJ99P33OuNVLmRaoRJ1rhppy7rZIJFWT7uf+bonGJUs413ismqSaKVRJle0n5qKVfJ
         fvD2kOzOUJJsTmrs3Dje0uphJvkVltOZGKyi6Te3TkoKPrqrMAE9dCtv/+H6mBUtbf3q
         q4AoNRRQE7foT5ZrLiVxt3/jq0excT+XtbTt9je8mdNwiWmgIU5IMSAMZyFVrCWHY/+m
         LgFOzcgKHWBn2w49vh5iz/fvcNmV5VZ2KrcBWcJOE9cpK9JRHXXpBR/+qYog3rLhTW5T
         QWX/2ImBPmj3A5AAtE+t4eXxs5i9x3nU6cghFbG3UXKExRXzODNYdUvoGAFcF0dmrciV
         cpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSo23r4HMhlRmv8GkSD5TaY3U4mSIRQESnluxSVgcTM=;
        b=Jn+s9nWAFDYihnqrp0O5rEsjk63cqgDU5sVJEjHRVnPHrNDn4w5Dy1K8ST2YRHseq/
         Wd0lS14/c68QaA/+1Bimtk7XcKUrgtUBxuTvCsMrJdNqEeQKUeCp/z9jd8BXeadFaeZg
         3n1jVtlOTLkWxbS5rq0FEletQnaRknmnNNsZ0MhEg9XFaiKSGOXSabdW6yhoNnNkFooR
         /gWH1q59mOb0714gBpVaAdgCmxz8R41er6YEU/3WemgtupeK1Hn7LvBUKOrOwrZhtZQq
         txQxNjkT3jhMhbxsrbKR9oNGcPCtzuIZKncADa+1XbVmmrGUgimeoBB5m42moYkoRHJM
         TPkQ==
X-Gm-Message-State: AOAM532wbk7QbYooDdRM3WQUDGnvQeUdQKBkX6wE9wExGOj17XZ5nhZm
        ahtYL6JtFDgovJf+6X96OGsCyQ==
X-Google-Smtp-Source: ABdhPJwQ20dqTNEDAOnkpM9p7zghGOE4JcK7bdZdI9J7lYKTdGeFkRCFGX7azvRPriyiM/HwejFunQ==
X-Received: by 2002:a05:6000:12cf:: with SMTP id l15mr14536814wrx.24.1625477330164;
        Mon, 05 Jul 2021 02:28:50 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id r13sm2072969wrt.38.2021.07.05.02.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 02:28:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: updates for v5.14
Date:   Mon,  5 Jul 2021 11:28:48 +0200
Message-Id: <20210705092848.14495-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following patches for the v5.14 merge window. We have one new
driver, support for new models in existing ones, dt-bindings conversions for
several modules and improvements all over the place.

Details are in the signed tag.

Best Regards,
Bartosz Golaszewski

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.14

for you to fetch changes up to c34c1228fc1cfe83aed909995f5b82e0ab7cb977:

  docs: driver-api: gpio: using-gpio.rst: avoid using ReST :doc:`foo` markup (2021-06-25 12:36:54 +0200)

----------------------------------------------------------------
gpio: updates for v5.14

- new driver for the IDT 79RC3243x GPIO controller
- device tree bindings coversion to YAML for the following drivers:
  gpio-rk3328-grf, gpio-omap, gpio-davinci, gpio-zynq, gpio-stp, gpio-pcf857x
- cleanup of probe functions in many drivers from Alexandru Ardelean, mostly
  dropping unnecessary calls to platform_set_drvdata() and removing error
  messages where none are needed (handled by the subsystem already)
- several improvements to the core gpiolib and the sysfs interface code from
  Andy Shevchenko
- conversion of the gpio-xilinx driver to using the bitmap API + improvements
  of suspend/resume handling + minor tweaks
- convert the gpio-stmpe to using devres helpers exclusively in probe for
  improved robustness
- updates for the generic gpio-regmap driver
- updates for the gpio-dwapb driver
- support for a new model in gpio-pca953x
- cleanups in gpio-tegra186, gpio-104-idio-16, gpio-mxs & gpio-xgene
- slight code refactoring of the gpio-zynq driver
- documentation fixes from Mauro Carvalho Chehab
- a bunch of minor tweaks and improvements all over the place

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      dt-bindings: gpio: stp: convert to json-schema

Alexandru Ardelean (23):
      gpio: stmpe: fully use convert probe to device-managed
      gpio: da9055: remove platform_set_drvdata() + cleanup probe
      gpio: visconti: remove platform_set_drvdata() + cleanup probe
      gpio: adp5520: cleanup probe error path + remove platform_set_drvdata()
      gpio: altera-a10sr: remove platform_set_drvdata() + cleanup probe
      gpio: bd9571mwv: remove platform_set_drvdata() + cleanup probe
      gpio: tps68470: remove platform_set_drvdata() + cleanup probe
      gpio: xgene: simplify probe, return devm_gpiochip_add_data() directly
      gpio: da9052: remove platform_set_drvdata() + cleanup probe
      gpio: gpio-tegra186: remove empty remove hook
      gpio: gpio-tegra186: remove platform_set_drvdata() + cleanup probe
      gpio: tps6586x: remove platform_set_drvdata() + cleanup probe
      gpio: tc3589x: emove platform_set_drvdata() + cleanup probe
      gpio: tps65218: remove platform_set_drvdata() + cleanup probe
      gpio: tps65912: remove platform_set_drvdata() + cleanup probe
      gpio: ath79: remove platform_set_drvdata() + cleanup probe
      gpio: spear-spics: remove platform_set_drvdata() + cleanup probe
      gpio: sprd: remove platform_set_drvdata() + cleanup probe
      gpio: sta2x11: remove platform_set_drvdata() + cleanup probe
      gpio: tps65910: remove platform_set_drvdata() + cleanup probe
      gpio: wm831x: remove platform_set_drvdata() + cleanup probe
      gpio: wm8994: remove platform_set_drvdata() + cleanup probe
      gpio: wm8350: remove platform_set_drvdata() + cleanup probe

Andy Shevchenko (13):
      gpio: mockup: Switch to use gpiochip_get_desc()
      gpiolib: Drop duplicate offset check in gpiochip_is_requested()
      bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
      gpio: xilinx: Introduce xgpio_read_chan() / xgpio_write_chan()
      gpio: xilinx: Switch to use bitmap APIs
      gpio: xilinx: No need to disable IRQs in the handler
      gpiolib: Make use of assign_bit() API (part 2)
      gpiolib: Use sysfs_emit() in "show" functions
      gpiolib: Split fastpath array to two
      gpiolib: Switch to bitmap_alloc()
      gpio: dwapb: Drop redundant check in dwapb_irq_set_type()
      gpio: dwapb: Switch to use fwnode_irq_get()
      gpio-dwapb: Drop unused headers and sort the rest

Aswath Govindraju (1):
      dt-bindings: gpio: gpio-davinci: Convert to json-schema

Geert Uytterhoeven (1):
      dt-bindings: gpio: pcf857x: Convert to json-schema

Grygorii Strashko (1):
      dt-bindings: gpio: omap: Convert to json-schema

Jinchao Wang (1):
      gpio: mxs: Prefer unsigned int to bare use of unsigned

Johan Jonker (1):
      dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML

Matti Vaittinen (1):
      gpio: gpio-regmap: Use devm_add_action_or_reset()

Mauro Carvalho Chehab (2):
      MAINTAINERS: update ti,omap-gpio.yaml reference
      docs: driver-api: gpio: using-gpio.rst: avoid using ReST :doc:`foo` markup

Michael Walle (1):
      gpio: regmap: move drvdata to config data

Navin Sankar Velliangiri (1):
      gpio: 104-idio-16: Fix coding style issues

Nobuhiro Iwamatsu (1):
      dt-bindings: gpio: zynq: convert bindings to YAML

Peter Robinson (1):
      gpio: pca953x: Add support for the On Semi pca9655

Srinivas Neeli (4):
      gpio: zynq: use module_platform_driver to simplify the code
      gpio: zynq: Check return value of pm_runtime_get_sync
      gpio: zynq: Check return value of irq_get_irq_data
      gpio: gpio-xilinx: update on suspend and resume calls

Thomas Bogendoerfer (2):
      gpio: Add support for IDT 79RC3243x GPIO controller
      dt-bindings: gpio: Add devicetree binding for IDT 79RC32434 GPIO controller

Wei Yongjun (1):
      gpio: idt3243x: Fix return value check in idt_gpio_probe()

Zhen Lei (1):
      gpio: logicvc: Remove redundant error printing in logicvc_gpio_probe()

 .../devicetree/bindings/gpio/gpio-davinci.txt      | 167 ---------
 .../devicetree/bindings/gpio/gpio-davinci.yaml     | 185 ++++++++++
 .../devicetree/bindings/gpio/gpio-omap.txt         |  45 ---
 .../devicetree/bindings/gpio/gpio-pcf857x.txt      |  69 ----
 .../devicetree/bindings/gpio/gpio-stp-xway.txt     |  42 ---
 .../devicetree/bindings/gpio/gpio-stp-xway.yaml    |  99 ++++++
 .../devicetree/bindings/gpio/gpio-zynq.txt         |  36 --
 .../devicetree/bindings/gpio/gpio-zynq.yaml        |  59 ++++
 .../devicetree/bindings/gpio/idt,32434-gpio.yaml   |  67 ++++
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml      | 103 ++++++
 .../bindings/gpio/rockchip,rk3328-grf-gpio.txt     |  32 --
 .../bindings/gpio/rockchip,rk3328-grf-gpio.yaml    |  50 +++
 .../devicetree/bindings/gpio/ti,omap-gpio.yaml     | 108 ++++++
 Documentation/driver-api/gpio/using-gpio.rst       |   4 +-
 MAINTAINERS                                        |   4 +-
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-104-idio-16.c                    |  23 +-
 drivers/gpio/gpio-adp5520.c                        |  18 +-
 drivers/gpio/gpio-altera-a10sr.c                   |  11 +-
 drivers/gpio/gpio-ath79.c                          |   9 +-
 drivers/gpio/gpio-bd9571mwv.c                      |  11 +-
 drivers/gpio/gpio-da9052.c                         |  11 +-
 drivers/gpio/gpio-da9055.c                         |  11 +-
 drivers/gpio/gpio-dwapb.c                          |  23 +-
 drivers/gpio/gpio-idt3243x.c                       | 206 +++++++++++
 drivers/gpio/gpio-logicvc.c                        |   4 +-
 drivers/gpio/gpio-mockup.c                         |   9 +-
 drivers/gpio/gpio-mxs.c                            |   4 +-
 drivers/gpio/gpio-pca953x.c                        |   1 +
 drivers/gpio/gpio-regmap.c                         |  32 +-
 drivers/gpio/gpio-spear-spics.c                    |  12 +-
 drivers/gpio/gpio-sprd.c                           |  10 +-
 drivers/gpio/gpio-sta2x11.c                        |  10 +-
 drivers/gpio/gpio-stmpe.c                          |  32 +-
 drivers/gpio/gpio-tc3589x.c                        |  11 +-
 drivers/gpio/gpio-tegra186.c                       |  14 +-
 drivers/gpio/gpio-tps65218.c                       |  13 +-
 drivers/gpio/gpio-tps6586x.c                       |  13 +-
 drivers/gpio/gpio-tps65910.c                       |  12 +-
 drivers/gpio/gpio-tps65912.c                       |  12 +-
 drivers/gpio/gpio-tps68470.c                       |  12 +-
 drivers/gpio/gpio-visconti.c                       |  10 +-
 drivers/gpio/gpio-wm831x.c                         |  12 +-
 drivers/gpio/gpio-wm8350.c                         |  12 +-
 drivers/gpio/gpio-wm8994.c                         |  13 +-
 drivers/gpio/gpio-xgene.c                          |  11 +-
 drivers/gpio/gpio-xilinx.c                         | 391 +++++++++++----------
 drivers/gpio/gpio-zynq.c                           |  32 +-
 drivers/gpio/gpiolib-sysfs.c                       |  34 +-
 drivers/gpio/gpiolib.c                             |  59 ++--
 include/linux/gpio/regmap.h                        |   6 +-
 lib/bitmap.c                                       |   5 +-
 53 files changed, 1245 insertions(+), 947 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-omap.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml
 create mode 100644 drivers/gpio/gpio-idt3243x.c
