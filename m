Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0182DFB459
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 16:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfKMPyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 10:54:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54368 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfKMPyV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 10:54:21 -0500
Received: by mail-wm1-f68.google.com with SMTP id z26so2533773wmi.4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tyDT/bb1rljBBaXw+3Daj+8rBckNT5+/uKf9AQWuFWc=;
        b=m8UfgP/6eQTJzy1Traw3PNv3do0I8n04EZJudvFmZ3uKEGalOZBcnscjY49b1icDgA
         /BwfTXOUOjwARzEvXyGHZ4R+KzXzkVxkIgAwTVxx1OkkeucG8E0EfBchdrdchxWVM+Uu
         Rn19muF6JKGxukeSJF5Yr7ZZmhA8rSJHA2iSuDMbQILnd0qLmMMn3vVfNcl5llTsBUcl
         C+j0ySDAwA1qijKLfTW2Lgv+vXZjhPzSj65f2pGYUk5xL4C0Er0XVmrUoTMs73l2+Akc
         4qopi9F2uqD+wVCaGwWt0pQXA+DDD9UfVKdXz9ynnkbNaYmQoOsVQNj/uH+WfkaP6a6I
         LMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tyDT/bb1rljBBaXw+3Daj+8rBckNT5+/uKf9AQWuFWc=;
        b=UsEhgNoGjlP7SklK1Ocpg341nSFVWp+KpCYbKowV/gBPyq+LiYmTNxMd5pZ8e26jBh
         4Rjb0x5sE0iYOFwgDlM0A6ft9Y3lzrBngZc8r1UPqS7SW0UwkGDDSnyHSaziRcbpQ0qi
         0dZCptlOPPVU7/LTyMxryYtCUBXX3Np+/Gy0nqso2SxigZM2wNWOST3HU2UoE5DFQg5t
         oeFPfOHMmL9hExaA/A/PbD+Re15NTbzxITT7H1dZUw+YmzW1qZS4jGQtjYi7YuyDFZUa
         iIddlrs6PHko8mCzJYqF51rPX4IeyaHYncl5lp1FMqPGKaCDiQoF+qCxCXOQb4wCZEjK
         OEWg==
X-Gm-Message-State: APjAAAVTk8TnP8v4u4zMebYFhYJSoniHeE+zt0zCL7kmoXfwIy26QCen
        bkTqsqmqD65x+4LkpfullocY1A==
X-Google-Smtp-Source: APXvYqxO1AuqbTFmHoqw7e6tWWD8IhpEnJOsdBOumaKlGpgZhAfxBpVNqE+aQxsgfZQkQNQm+ieDbg==
X-Received: by 2002:a05:600c:254f:: with SMTP id e15mr3220652wma.37.1573660458066;
        Wed, 13 Nov 2019 07:54:18 -0800 (PST)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id x11sm3280445wro.84.2019.11.13.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 07:54:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.5
Date:   Wed, 13 Nov 2019 16:54:11 +0100
Message-Id: <20191113155411.20068-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

this is my second batch of GPIO updates for v5.5.

The most important feature are the new user-space interfaces from Kent
Gibson. Other than that, there are a few minor changes to various
drivers I picked up. More details are in the signed tag.

Please note that this PR has Greg KH's driver-core-next branch merged in
to satisfy the dependencies of the tegra186 patches from Thierry. This
should still cleanly merge with your for-next branch.

Please pull.

The following changes since commit 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c:

  Revert "gpio: expose pull-up/pull-down line flags to userspace" (2019-11-08 13:37:54 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.5-updates-for-linus-part-2

for you to fetch changes up to 0f67f16a6e88749fc3bf88da7515d3fff472a1cc:

  gpio: mmio: remove untrue leftover comment (2019-11-13 13:49:42 +0100)

----------------------------------------------------------------
gpio: updates for v5.5

- add MODULE_ALIAS() for bd70528 (makes it possible to autoload the
  module from user-space)
- use proper irc_chip names in gpio-em and gpio-rcar
- expose the line bias settings to user-space in the form of new request
  flags
- expose a new ioctl() to user-space which allows to change certain
  proprties of requested lines without releasing them first
- various updates for gpio-tegra186: debounce support, code
  simplification and interrupt routing
- use platform_get_irq() in gpio-em for some code shrinkage
- remove leftovers after recent gpio-mmio changes

----------------------------------------------------------------
Arkadiusz Drabczyk (1):
      firmware: Update pointer to documentation

Bartosz Golaszewski (13):
      drivers: move the early platform device support to arch/sh
      sh: add the sh_ prefix to early platform symbols
      Documentation: devres: add missing entry for devm_platform_ioremap_resource()
      lib: devres: prepare devm_ioremap_resource() for more variants
      lib: devres: provide devm_ioremap_resource_wc()
      drivers: platform: provide devm_platform_ioremap_resource_wc()
      misc: sram: use devm_platform_ioremap_resource_wc()
      drivers: provide devm_platform_ioremap_resource_byname()
      gpio: mvebu: use devm_platform_ioremap_resource_byname()
      gpio: tegra186: use devm_platform_ioremap_resource_byname()
      Merge tag 'v5.4-rc6' into gpio/for-next
      Merge remote-tracking branch 'linusw/for-next' into gpio/for-next
      Merge remote-tracking branch 'driver-core/driver-core-next' into gpio/for-next

Drew DeVault (1):
      firmware loader: log path to loaded firmwares

Drew Fustini (1):
      gpio: expose pull-up/pull-down line flags to userspace

Geert Uytterhoeven (11):
      Documentation: debugfs: Document debugfs helper for unsigned long values
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
      powerpc: pseries: no need to check return value of debugfs_create functions
      debugfs: remove return value of debugfs_create_x8()
      debugfs: remove return value of debugfs_create_atomic_t()
      IB: mlx5: no need to check return value of debugfs_create functions
      media: c8sectpfe: no need to check return value of debugfs_create functions

Kent Gibson (6):
      gpiolib: add support for pull up/down to lineevent_create
      gpiolib: add support for disabling line bias
      gpiolib: add support for biasing output lines
      gpio: mockup: add set_config to support pull up/down
      gpiolib: move validation of line handle flags into helper function
      gpio: add new SET_CONFIG ioctl() to gpio chardev

Linus Walleij (5):
      Merge tag 'gpio-v5.4-rc5-fixes-for-linus' of git://git.kernel.org/.../brgl/linux into fixes
      Revert "gpio: merrifield: Move hardware initialization to callback"
      Revert "gpio: merrifield: Restore use of irq_base"
      Revert "gpio: merrifield: Pass irqchip when adding gpiochip"
      Merge branch 'devel' into for-next

Matti Vaittinen (2):
      gpio: bd70528: Add MODULE ALIAS to autoload module
      gpio: mmio: remove untrue leftover comment

Murali Nalajala (1):
      base: soc: Handle custom soc information sysfs entries

Saravana Kannan (17):
      driver core: Add fwnode_to_dev() to look up device from fwnode
      driver core: Add support for linking devices during device addition
      of: property: Add functional dependency link from DT bindings
      driver core: Add sync_state driver/bus callback
      of/platform: Pause/resume sync state during init and of_platform_populate()
      of: property: Create device links for all child-supplier depencencies
      of: property: Minor code formatting/style clean ups
      driver: core: Improve documentation for fwnode_operations.add_links()
      docs: driver-model: Add documentation for sync_state
      driver core: Add device link support for SYNC_STATE_ONLY flag
      driver core: Allow a device to wait on optional suppliers
      driver core: Allow fwnode_operations.add_links to differentiate errors
      of: property: Make sure child dependencies don't block probing of parent
      of: property: Skip adding device links to suppliers that aren't devices
      of: property: Minor style clean up of of_link_to_phandle()
      of: property: Make it easy to add device links from DT properties
      of: property: Add device link support for iommus, mboxes and io-channels

Shuah Khan (1):
      tools: gpio: Use !building_out_of_srctree to determine srctree

Thierry Reding (3):
      gpio: tegra186: Derive register offsets from bank/port
      gpio: tegra186: Program interrupt route mapping
      gpio: tegra186: Add debounce support

Uwe Kleine-König (1):
      driver core: simplify definitions of platform_get_irq*

 Documentation/admin-guide/kernel-parameters.rst    |   1 +
 Documentation/admin-guide/kernel-parameters.txt    |   6 +
 Documentation/driver-api/device_link.rst           |   3 +-
 Documentation/driver-api/driver-model/devres.rst   |   4 +
 Documentation/driver-api/driver-model/driver.rst   |  43 +++
 Documentation/filesystems/debugfs.txt              |  50 +--
 arch/powerpc/platforms/pseries/dtl.c               |  38 +--
 arch/powerpc/platforms/pseries/hvCall_inst.c       |  12 +-
 arch/powerpc/platforms/pseries/lpar.c              |  15 +-
 arch/sh/drivers/Makefile                           |   2 +-
 arch/sh/drivers/platform_early.c                   | 347 +++++++++++++++++++
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
 drivers/base/core.c                                | 245 +++++++++++++-
 drivers/base/firmware_loader/main.c                |   3 +-
 drivers/base/platform.c                            | 374 ++++-----------------
 drivers/base/soc.c                                 |  30 +-
 drivers/clocksource/sh_cmt.c                       |  13 +-
 drivers/clocksource/sh_mtu2.c                      |  13 +-
 drivers/clocksource/sh_tmu.c                       |  14 +-
 drivers/gpio/gpio-bd70528.c                        |   1 +
 drivers/gpio/gpio-em.c                             |  23 +-
 drivers/gpio/gpio-merrifield.c                     |  33 +-
 drivers/gpio/gpio-mmio.c                           |   1 -
 drivers/gpio/gpio-mockup.c                         |  94 ++++--
 drivers/gpio/gpio-mvebu.c                          |  19 +-
 drivers/gpio/gpio-rcar.c                           |   2 +-
 drivers/gpio/gpio-tegra186.c                       | 283 ++++++++++------
 drivers/gpio/gpiolib.c                             | 213 ++++++++++--
 drivers/gpio/gpiolib.h                             |   1 +
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
 include/linux/debugfs.h                            | 131 ++++----
 include/linux/device.h                             |  33 ++
 include/linux/fwnode.h                             |  41 +++
 include/linux/platform_device.h                    |  70 +---
 include/linux/sys_soc.h                            |   1 +
 include/uapi/linux/gpio.h                          |  24 ++
 lib/devres.c                                       |  62 ++--
 net/mac80211/debugfs_sta.c                         |  17 +-
 tools/gpio/Makefile                                |   6 +-
 81 files changed, 1984 insertions(+), 1006 deletions(-)
 create mode 100644 arch/sh/drivers/platform_early.c
 create mode 100644 arch/sh/include/asm/platform_early.h
