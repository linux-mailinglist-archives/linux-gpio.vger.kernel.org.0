Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A1110D68A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 14:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfK2N7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 08:59:18 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33483 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfK2N7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 08:59:18 -0500
Received: by mail-lf1-f67.google.com with SMTP id d6so22744833lfc.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 05:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=W2P5af099ltrVUAPxfWBA4J6UnuLIYO2S9bAuMh3XmI=;
        b=JLcHtY7eVTRgzZ+llg0nbC/rMMjIJVej57fj341srHdfxPh7XHVN8VIKxDjSRybCJD
         h3TB2NylO7QljBfCb9ZN8GlrTA322LhVmPmoWoozajSJEYgVzdvBevTIM7hpjRJ+sbA6
         3/oWuOr0IddFMoy1EYJueK1zV2g8ROHgh9IecR45iV90FPNoxthDEujqe2q/2KNFAgyQ
         bziJ8n+5dLxsi6UqtDy94USNE3Q/JL6IcLpmzIzMnZ1SGfXxJ9lFpGL1uED+jZKih/CM
         lb0VkrDYwftVnT4DMOLqQ+hg45LtL9+vGv/txnCGCm2xO9UoROGjygkMBje4JBV71Gvi
         2h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=W2P5af099ltrVUAPxfWBA4J6UnuLIYO2S9bAuMh3XmI=;
        b=NjVc/0Jnxu1S1lD2ZKBGjHStnYm8LQpRG+DqKZ+1fQsj/NOF/lojUQDx/EoJT2reA2
         aEtQpdR8vbcdMm6aiFUYn90NIQcbw4GwRQXEC/aLnSapEkgpwW1nFDIciU8ypPKj3tO9
         Fq4alekF2pqwvcUvDSWDoCMDjKAmrg9yPqQvkhKi/TF7QrUKpvMo+kQIZNV2CFOE83Ci
         GC8kpr+4JDaItmojp2pMTff12aYzvsjjqZuvb5GWbpwXu+SGjvaDrWj3z/gIe6Jb9BX4
         i3SYj5BQMh2ldoJRpeAyJ8eDyAMpyr40uUgCVaaBu+rdC7dQyt9O4oHyOkgVl2M7jbJa
         JlpA==
X-Gm-Message-State: APjAAAXBNGP0h4B0lTqHvX3d0oDTEurusWNkSHPd/gUnRjwpBqluGMEA
        T4sAMhECaGPVGQpKU1C9O6332EUZTIR0bGmuCvle7Q==
X-Google-Smtp-Source: APXvYqzwq2ZIh6TDFk+Fl2nz6p4dMvUG2nVwRp0fQ39/HxYM1sscpULAX8aasWvLmAsIjG8Ph7R179n6GqtJ+v9Xkb4=
X-Received: by 2002:a19:f701:: with SMTP id z1mr30364055lfe.133.1575035953786;
 Fri, 29 Nov 2019 05:59:13 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 14:59:02 +0100
Message-ID: <CACRpkdbJxcfj6pK=1qjXxffFn0RUH9VD0HRFXX0RoZJDi=hfRw@mail.gmail.com>
Subject: [GIT PULL] GPIO changes for v5.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the big pull request for the GPIO subsystem for
the v5.5 kernel cycle.

Notices:

At one point the tree became dependent on device core
and Greg simply suggested we pull the HEAD of device
core into the GPIO tree so I did. It had the interesting
side effect of adding a lot of device core cruft to my shortlog
below (possibly there is a way to avoid that, I'm not the
best with git options). If you diff it against your tree or
as a result of pulling it in, it should result in a shorter
shortstat.

After missing an embarrassing problem in the pin control tree
I double-checked that I had builds from zeroday and
the code has sit in linux-next before I compiled this pull
request.

One commit to the DRM subsystem is ACKed by the
DRM maintainers.

One commit to ATA
"ata: ahci-imx: Covert to use GPIO descriptor"  has failed
to get the attention of the maintainers for so long that I just
merged it. I suppose they don't care, also it only
concerns GPIO.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit a99d8080aaf358d5d23581244e5da23b35e340b9=
:

  Linux 5.4-rc6 (2019-11-03 14:07:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.5-1

for you to fetch changes up to 41c4616bb81ff9b2efd981453f2c5d8f57d0c0b8:

  gpio: Add TODO item for regmap helper (2019-11-22 14:46:52 +0100)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v5.5 kernel cycle

Core changes:

- Expose pull up/down flags for the GPIO character device to
  userspace. After clear input from the RaspberryPi and Beagle
  communities, it has been established that prototyping,
  industrial automation and make communities strongly need
  this feature, and as we want people to use the character
  device, we have implemented the simple pull up/down
  interface for GPIO lines. This means we can specify that
  a (chip-specific) pull up/down resistor can be enabled,
  but does not offer fine-grained control such as cases
  where the resistance of the same pull resistor can be
  controlled (yet).

- Introduce devm_fwnode_gpiod_get_index() and start to phase out
  the old symbol devm_fwnode_get_index_gpiod_from_child().

- A bit of documentation clean-up work.

- Introduce a define for GPIO line directions and deploy it
  in all GPIO drivers in the drivers/gpio directory.

- Add a special callback to populate pin ranges when
  cooperating with the pin control subsystem and registering
  ranges as part of adding a gpiolib driver and a
  gpio_irq_chip driver at the same time. This is also
  deployed in the Intel Merrifield driver.

New drivers:

- RDA Micro GPIO controller.

- XGS-iproc GPIO driver.

Driver improvements:

- Wake event and debounce support on the Tegra 186 driver.

- Finalize the Aspeed SGPIO driver.

- MPC8xxx uses a normal IRQ handler rather than a chained
  handler.

----------------------------------------------------------------
Andy Shevchenko (6):
      gpiolib: No need to call gpiochip_remove_pin_ranges() twice
      gpiolib: Introduce ->add_pin_ranges() callback
      gpio: merrifield: Add GPIO <-> pin mapping ranges via callback
      gpio: merrifield: Pass irqchip when adding gpiochip
      MAINTAINERS: Replace my email by one @kernel.org
      gpio: lynxpoint: Setup correct IRQ handlers

Anson Huang (1):
      gpio: mxc: Only get the second IRQ when there is more than one IRQ

Arkadiusz Drabczyk (1):
      firmware: Update pointer to documentation

Bartosz Golaszewski (21):
      gpiolib: sanitize flags before allocating memory in lineevent_create(=
)
      drivers: move the early platform device support to arch/sh
      sh: add the sh_ prefix to early platform symbols
      gpio: xgene: remove redundant error message
      gpio: xgene: use devm_platform_ioremap_resource()
      gpio: em: use devm_platform_ioremap_resource()
      gpio: ath79: use devm_platform_ioremap_resource()
      gpio: htc-egpio: use devm_platform_ioremap_resource()
      gpio: htc-egpio: remove redundant error message
      Documentation: devres: add missing entry for
devm_platform_ioremap_resource()
      lib: devres: prepare devm_ioremap_resource() for more variants
      lib: devres: provide devm_ioremap_resource_wc()
      drivers: platform: provide devm_platform_ioremap_resource_wc()
      misc: sram: use devm_platform_ioremap_resource_wc()
      drivers: provide devm_platform_ioremap_resource_byname()
      gpio: mvebu: use devm_platform_ioremap_resource_byname()
      gpio: tegra186: use devm_platform_ioremap_resource_byname()
      Merge tag 'v5.4-rc6' into gpio/for-next
      Merge remote-tracking branch 'linusw/for-next' into gpio/for-next
      Merge remote-tracking branch 'driver-core/driver-core-next' into
gpio/for-next
      gpiolib: fix coding style in gpiod_hog()

Biju Das (1):
      dt-bindings: gpio: rcar: Add DT binding for r8a774b1

Chris Packham (2):
      dt-bindings: gpio: brcm: Add bindings for xgs-iproc
      gpio: Add xgs-iproc driver

Colin Ian King (1):
      gpio: 104-idi-48e: make array register_offset static, makes object sm=
aller

Daniel W. S. Almeida (1):
      Documentation: gpio: driver.rst: Fix warnings

Dmitry Torokhov (3):
      gpiolib: introduce devm_fwnode_gpiod_get_index()
      gpiolib: introduce fwnode_gpiod_get_index()
      drm/bridge: ti-tfp410: switch to using fwnode_gpiod_get_index()

Drew DeVault (1):
      firmware loader: log path to loaded firmwares

Drew Fustini (2):
      gpio: expose pull-up/pull-down line flags to userspace
      gpio: expose pull-up/pull-down line flags to userspace

Geert Uytterhoeven (13):
      Documentation: debugfs: Document debugfs helper for unsigned long val=
ues
      debugfs: Add debugfs_create_xul() for hexadecimal unsigned long
      mmc: atmel-mci: Fix debugfs on 64-bit platforms
      mmc: atmel-mci: Remove superfluous cast in debugfs_create_u32() call
      mmc: dw_mmc: Fix debugfs on 64-bit platforms
      mmc: dw_mmc: Remove superfluous cast in debugfs_create_u32() call
      mac80211: Use debugfs_create_xul() helper
      net: caif: Fix debugfs on 64-bit platforms
      gpio: em: Use proper irq_chip name
      gpio: rcar: Use proper irq_chip name
      gpio: em: Use platform_get_irq() to obtain interrupts
      gpiolib: Grammar s/manager/managed/
      gpio: of: Fix bogus reference to gpiod_get_count()

Greg Kroah-Hartman (14):
      debugfs: remove return value of debugfs_create_u8()
      debugfs: remove return value of debugfs_create_u16()
      debugfs: remove return value of debugfs_create_u64()
      debugfs: remove return value of debugfs_create_size_t()
      ntb: ntb_pingpong: no need to check the return value of debugfs calls
      debugfs: remove return value of debugfs_create_x16()
      debugfs: remove return value of debugfs_create_x32()
      debugfs: remove return value of debugfs_create_x64()
      Merge 5.4-rc5 into driver-core-next
      powerpc: pseries: no need to check return value of
debugfs_create functions
      debugfs: remove return value of debugfs_create_x8()
      debugfs: remove return value of debugfs_create_atomic_t()
      IB: mlx5: no need to check return value of debugfs_create functions
      media: c8sectpfe: no need to check return value of
debugfs_create functions

Hans de Goede (2):
      gpiolib: acpi: Print pin number on acpi_gpiochip_alloc_event errors
      gpiolib: acpi: Make acpi_gpiochip_alloc_event always return AE_OK

Jonathan Neusch=C3=A4fer (3):
      Documentation: gpio: driver: Format code blocks properly
      docs: driver-api: Move bt8xxgpio to the gpio directory
      docs: driver-api: bt8xxgpio: Revive dead link

Kent Gibson (6):
      gpiolib: add support for pull up/down to lineevent_create
      gpiolib: add support for disabling line bias
      gpiolib: add support for biasing output lines
      gpio: mockup: add set_config to support pull up/down
      gpiolib: move validation of line handle flags into helper function
      gpio: add new SET_CONFIG ioctl() to gpio chardev

Linus Walleij (15):
      gpio: aspeed-sgpio: Rename and add Kconfig/Makefile
      Merge branch 'ib-fwnode-gpiod-get-index' into devel
      Merge tag 'gpio-v5.4-rc5-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-v5.5-updates-for-linus-part-1' of
git://git.kernel.org/.../brgl/linux into devel
      ata: ahci-imx: Covert to use GPIO descriptor
      Revert "gpio: merrifield: Move hardware initialization to callback"
      Revert "gpio: merrifield: Restore use of irq_base"
      Revert "gpio: merrifield: Pass irqchip when adding gpiochip"
      Merge tag 'v5.4-rc6' into devel
      gpiolib: Switch order of valid mask and hw init
      Revert "gpio: expose pull-up/pull-down line flags to userspace"
      Merge branch 'devel' into for-next
      Merge tag 'gpio-v5.5-updates-for-linus-part-2' of
git://git.kernel.org/.../brgl/linux into devel
      Merge tag 'intel-gpio-v5.5-1' of
git://git.kernel.org/.../andy/linux-gpio-intel into devel
      gpio: Add TODO item for regmap helper

Lucas Stach (1):
      gpio: of: don't warn if ignored GPIO flag matches the behavior

Manivannan Sadhasivam (3):
      dt-bindings: gpio: Add devicetree binding for RDA Micro GPIO controll=
er
      gpio: Add RDA Micro GPIO controller support
      MAINTAINERS: Add entry for RDA Micro GPIO driver and binding

Mark Brown (1):
      gpio: xgs-iproc: Fix section mismatch on device tree match table

Matti Vaittinen (4):
      gpio: Add definition for GPIO direction
      gpio: Use new GPIO_LINE_DIRECTION
      gpio: bd70528: Add MODULE ALIAS to autoload module
      gpio: mmio: remove untrue leftover comment

Murali Nalajala (1):
      base: soc: Handle custom soc information sysfs entries

Randy Dunlap (1):
      gpio: fix kernel-doc for of_gpio_need_valid_mask()

Russell King (1):
      gpio/mpc8xxx: fix qoriq GPIO reading

Saravana Kannan (17):
      driver core: Add fwnode_to_dev() to look up device from fwnode
      driver core: Add support for linking devices during device addition
      of: property: Add functional dependency link from DT bindings
      driver core: Add sync_state driver/bus callback
      of/platform: Pause/resume sync state during init and
of_platform_populate()
      of: property: Create device links for all child-supplier depencencies
      of: property: Minor code formatting/style clean ups
      driver: core: Improve documentation for fwnode_operations.add_links()
      docs: driver-model: Add documentation for sync_state
      driver core: Add device link support for SYNC_STATE_ONLY flag
      driver core: Allow a device to wait on optional suppliers
      driver core: Allow fwnode_operations.add_links to differentiate error=
s
      of: property: Make sure child dependencies don't block probing of par=
ent
      of: property: Skip adding device links to suppliers that aren't devic=
es
      of: property: Minor style clean up of of_link_to_phandle()
      of: property: Make it easy to add device links from DT properties
      of: property: Add device link support for iommus, mboxes and io-chann=
els

Shuah Khan (1):
      tools: gpio: Use !building_out_of_srctree to determine srctree

Song Hui (1):
      gpio/mpc8xxx: change irq handler from chained to normal

Thierry Reding (5):
      gpio: max77620: Do not allocate IRQs upfront
      gpio: tegra186: Implement wake event support
      gpio: tegra186: Derive register offsets from bank/port
      gpio: tegra186: Program interrupt route mapping
      gpio: tegra186: Add debounce support

Timo Alho (1):
      gpio: max77620: Fix interrupt handling

Uwe Kleine-K=C3=B6nig (1):
      driver core: simplify definitions of platform_get_irq*

Vladimir Oltean (1):
      gpio: mpc8xxx: Don't overwrite default irq_set_type callback

YueHaibing (1):
      gpio: xgs-iproc: Fix platform_no_drv_owner.cocci warnings

 Documentation/admin-guide/kernel-parameters.rst    |   1 +
 Documentation/admin-guide/kernel-parameters.txt    |   6 +
 .../bindings/gpio/brcm,xgs-iproc-gpio.yaml         |  70 ++++
 .../devicetree/bindings/gpio/gpio-rda.yaml         |  50 +++
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   1 +
 Documentation/driver-api/device_link.rst           |   3 +-
 Documentation/driver-api/driver-model/devres.rst   |   4 +
 Documentation/driver-api/driver-model/driver.rst   |  43 +++
 Documentation/driver-api/{ =3D> gpio}/bt8xxgpio.rst  |   2 +-
 Documentation/driver-api/gpio/driver.rst           |  25 +-
 Documentation/driver-api/gpio/index.rst            |   1 +
 Documentation/driver-api/index.rst                 |   1 -
 Documentation/filesystems/debugfs.txt              |  50 +--
 MAINTAINERS                                        |   6 +-
 arch/powerpc/platforms/pseries/dtl.c               |  38 +-
 arch/powerpc/platforms/pseries/hvCall_inst.c       |  12 +-
 arch/powerpc/platforms/pseries/lpar.c              |  15 +-
 arch/sh/drivers/Makefile                           |   2 +-
 arch/sh/drivers/platform_early.c                   | 347 +++++++++++++++++=
++
 arch/sh/include/asm/platform_early.h               |  61 ++++
 arch/sh/kernel/cpu/sh2/setup-sh7619.c              |   3 +-
 arch/sh/kernel/cpu/sh2a/setup-mxg.c                |   3 +-
 arch/sh/kernel/cpu/sh2a/setup-sh7201.c             |   3 +-
 arch/sh/kernel/cpu/sh2a/setup-sh7203.c             |   3 +-
 arch/sh/kernel/cpu/sh2a/setup-sh7206.c             |   3 +-
 arch/sh/kernel/cpu/sh2a/setup-sh7264.c             |   3 +-
 arch/sh/kernel/cpu/sh2a/setup-sh7269.c             |   3 +-
 arch/sh/kernel/cpu/sh3/setup-sh3.c                 |   1 +
 arch/sh/kernel/cpu/sh3/setup-sh7705.c              |   3 +-
 arch/sh/kernel/cpu/sh3/setup-sh770x.c              |   3 +-
 arch/sh/kernel/cpu/sh3/setup-sh7710.c              |   3 +-
 arch/sh/kernel/cpu/sh3/setup-sh7720.c              |   3 +-
 arch/sh/kernel/cpu/sh4/setup-sh4-202.c             |   3 +-
 arch/sh/kernel/cpu/sh4/setup-sh7750.c              |   9 +-
 arch/sh/kernel/cpu/sh4/setup-sh7760.c              |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7343.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7366.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7722.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7723.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7724.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7734.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7757.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7763.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7770.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7780.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7785.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7786.c             |   3 +-
 arch/sh/kernel/cpu/sh4a/setup-shx3.c               |   3 +-
 arch/sh/kernel/cpu/sh5/setup-sh5.c                 |   3 +-
 arch/sh/kernel/setup.c                             |   3 +-
 arch/sh/kernel/time.c                              |   5 +-
 drivers/ata/ahci_imx.c                             |  25 +-
 drivers/base/core.c                                | 245 ++++++++++++-
 drivers/base/firmware_loader/main.c                |   3 +-
 drivers/base/platform.c                            | 374 ++++-------------=
---
 drivers/base/soc.c                                 |  30 +-
 drivers/clocksource/sh_cmt.c                       |  13 +-
 drivers/clocksource/sh_mtu2.c                      |  13 +-
 drivers/clocksource/sh_tmu.c                       |  14 +-
 drivers/gpio/Kconfig                               |  29 +-
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/TODO                                  |   4 +
 drivers/gpio/gpio-104-dio-48e.c                    |   5 +-
 drivers/gpio/gpio-104-idi-48.c                     |   4 +-
 drivers/gpio/gpio-104-idio-16.c                    |   4 +-
 drivers/gpio/gpio-74xx-mmio.c                      |   5 +-
 drivers/gpio/gpio-amd-fch.c                        |   2 +-
 .../gpio/{sgpio-aspeed.c =3D> gpio-aspeed-sgpio.c}   |   0
 drivers/gpio/gpio-aspeed.c                         |   7 +-
 drivers/gpio/gpio-ath79.c                          |  10 +-
 drivers/gpio/gpio-bcm-kona.c                       |   6 +-
 drivers/gpio/gpio-bd70528.c                        |   9 +-
 drivers/gpio/gpio-bd9571mwv.c                      |   4 +-
 drivers/gpio/gpio-dln2.c                           |   6 +-
 drivers/gpio/gpio-em.c                             |  39 +--
 drivers/gpio/gpio-exar.c                           |   5 +-
 drivers/gpio/gpio-f7188x.c                         |   5 +-
 drivers/gpio/gpio-gpio-mm.c                        |   5 +-
 drivers/gpio/gpio-htc-egpio.c                      |  42 +--
 drivers/gpio/gpio-ich.c                            |   5 +-
 drivers/gpio/gpio-kempld.c                         |   5 +-
 drivers/gpio/gpio-lp873x.c                         |   2 +-
 drivers/gpio/gpio-lp87565.c                        |   5 +-
 drivers/gpio/gpio-lynxpoint.c                      |   6 +
 drivers/gpio/gpio-madera.c                         |   5 +-
 drivers/gpio/gpio-max3191x.c                       |   2 +-
 drivers/gpio/gpio-max77620.c                       | 231 +++++++------
 drivers/gpio/gpio-merrifield.c                     |  50 +--
 drivers/gpio/gpio-mmio.c                           |  22 +-
 drivers/gpio/gpio-mockup.c                         | 105 +++---
 drivers/gpio/gpio-moxtet.c                         |   4 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  36 +-
 drivers/gpio/gpio-mvebu.c                          |  24 +-
 drivers/gpio/gpio-mxc.c                            |  13 +-
 drivers/gpio/gpio-mxs.c                            |   5 +-
 drivers/gpio/gpio-omap.c                           |   6 +-
 drivers/gpio/gpio-pca953x.c                        |   5 +-
 drivers/gpio/gpio-pci-idio-16.c                    |   4 +-
 drivers/gpio/gpio-pcie-idio-24.c                   |   9 +-
 drivers/gpio/gpio-pisosr.c                         |   2 +-
 drivers/gpio/gpio-pl061.c                          |   5 +-
 drivers/gpio/gpio-raspberrypi-exp.c                |   5 +-
 drivers/gpio/gpio-rcar.c                           |   7 +-
 drivers/gpio/gpio-rda.c                            | 294 ++++++++++++++++
 drivers/gpio/gpio-reg.c                            |   3 +-
 drivers/gpio/gpio-sa1100.c                         |   5 +-
 drivers/gpio/gpio-sama5d2-piobu.c                  |   7 +-
 drivers/gpio/gpio-sch.c                            |   5 +-
 drivers/gpio/gpio-sch311x.c                        |   5 +-
 drivers/gpio/gpio-siox.c                           |   4 +-
 drivers/gpio/gpio-stmpe.c                          |   5 +-
 drivers/gpio/gpio-tc3589x.c                        |   5 +-
 drivers/gpio/gpio-tegra.c                          |   5 +-
 drivers/gpio/gpio-tegra186.c                       | 384 ++++++++++++++---=
----
 drivers/gpio/gpio-thunderx.c                       |   5 +-
 drivers/gpio/gpio-tpic2810.c                       |   2 +-
 drivers/gpio/gpio-tps65086.c                       |   2 +-
 drivers/gpio/gpio-tps65912.c                       |   4 +-
 drivers/gpio/gpio-tps68470.c                       |   6 +-
 drivers/gpio/gpio-tqmx86.c                         |   5 +-
 drivers/gpio/gpio-ts4900.c                         |   5 +-
 drivers/gpio/gpio-twl4030.c                        |  10 +-
 drivers/gpio/gpio-twl6040.c                        |   3 +-
 drivers/gpio/gpio-uniphier.c                       |   5 +-
 drivers/gpio/gpio-wcove.c                          |   7 +-
 drivers/gpio/gpio-ws16c48.c                        |   5 +-
 drivers/gpio/gpio-xgene.c                          |  32 +-
 drivers/gpio/gpio-xgs-iproc.c                      | 320 +++++++++++++++++
 drivers/gpio/gpio-xra1403.c                        |   5 +-
 drivers/gpio/gpio-xtensa.c                         |   4 +-
 drivers/gpio/gpio-zynq.c                           |   7 +-
 drivers/gpio/gpiolib-acpi.c                        |  17 +-
 drivers/gpio/gpiolib-devres.c                      |  33 +-
 drivers/gpio/gpiolib-of.c                          |  18 +-
 drivers/gpio/gpiolib.c                             | 330 ++++++++++++++---=
-
 drivers/gpio/gpiolib.h                             |   1 +
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   4 +-
 drivers/infiniband/hw/mlx5/main.c                  |  62 +---
 drivers/infiniband/hw/mlx5/mlx5_ib.h               |   9 +-
 .../platform/sti/c8sectpfe/c8sectpfe-debugfs.c     |  26 +-
 drivers/misc/sram.c                                |  28 +-
 drivers/mmc/host/atmel-mci.c                       |  10 +-
 drivers/mmc/host/dw_mmc.c                          |  10 +-
 drivers/net/caif/caif_serial.c                     |   4 +-
 drivers/ntb/test/ntb_pingpong.c                    |   5 +-
 drivers/of/platform.c                              |  12 +
 drivers/of/property.c                              | 298 ++++++++++++++++
 drivers/tty/serial/sh-sci.c                        |  11 +-
 fs/debugfs/file.c                                  |  87 ++---
 include/linux/debugfs.h                            | 131 ++++---
 include/linux/device.h                             |  33 ++
 include/linux/fwnode.h                             |  41 +++
 include/linux/gpio/consumer.h                      |  54 ++-
 include/linux/gpio/driver.h                        |   8 +
 include/linux/platform_device.h                    |  70 +---
 include/linux/sys_soc.h                            |   1 +
 include/uapi/linux/gpio.h                          |  24 ++
 lib/devres.c                                       |  62 ++--
 net/mac80211/debugfs_sta.c                         |  17 +-
 tools/gpio/Makefile                                |   6 +-
 160 files changed, 3443 insertions(+), 1429 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rda.yaml
 rename Documentation/driver-api/{ =3D> gpio}/bt8xxgpio.rst (98%)
 create mode 100644 arch/sh/drivers/platform_early.c
 create mode 100644 arch/sh/include/asm/platform_early.h
 rename drivers/gpio/{sgpio-aspeed.c =3D> gpio-aspeed-sgpio.c} (100%)
 create mode 100644 drivers/gpio/gpio-rda.c
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c
