Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADE22D8D60
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbgLMNwH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:52:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:1980 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbgLMNwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867525; x=1639403525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FGKm1Qsi+PWrGidQ/IF49t45nHp6Ozn40HZc64VFdp4=;
  b=UnF3x7Vyd/hBbWP7N3JUBGSr1ov+BGLPoBa2bpZ+Zd3CGRyCkpnFPCTu
   1U0mbg2PP8LUnYsxWPfNIoreYVWFpSQUVbbx8268MHkDKvm/V2HJP8GzA
   ILJWqCZ6CuUzafbjNY3FD/SUvyCPhutNxiPSodwd8RPTxmAK5GA08UOkC
   NX7iNNmZ7w06eByZOO0f5lTRoRV0olyaSvjB2+Epqk332wk8JHPLA7bRi
   bW2/2d5M/6XmsUjNdJ2dng6aoeCCCBGPfrKunX64m6LJ9ZZx4vwLMvfW8
   JqPTh0+O1U3oN8xsLCuWzIO6+De9mQ4hWpyl9jhI4Y2cspNHytGoC7tCb
   g==;
IronPort-SDR: ERHjG0EHK4cYOIluoUHT2d2jhs1d5PQG2GGvABdhFnRV1o/1IrFY4mqOg7s8FA5J4QlY84XT+M
 AHiZAlhwKv3WBEgu7XMQIWAkhYCFszHF+/UCIuE6F82DFbdvWieJW66jpTQQR4/OerpMz0eeQv
 RCkoNjyYI6xGN1j010Ga/AsGwlyzYrH160/vqNyoS5aWZrmXce2EeDyNdQ+xySe7ZZFgdg26RM
 6kXKThYkwpky8/IAwqu+n7V37AayVPj8p/zlhW3rKRjH8NvdF5Bc/n0ElWzQSo4GkJAQrehNxC
 BF0=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494568"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:00 +0800
IronPort-SDR: qF4UdL+fCct4oayKFb8gqx4ggfx7ILEY/L8GR/yWWlCClOTJVc2AlK6C+JM1fvwR7sjsho+ZD5
 Z2nLzaKxa+JufCrC/07TvT6BLCK4EfwV6qquCz4MyzU49QPAA6wF0A6rvbwKHz6CxN4x6pBBa3
 FekZdcmMcl6lbOLEKgEn33ChdXQixo+PeYZppvl8XaedReHOfM4521oJaiUcNYrXk9s6Ze69NG
 8eam/YWJq9X5d7pfseTQn5wA8pYshg5lsXlP6uEKRxd6R8BHOfb0P780J2OKbhis3SzH5nggOF
 BeGbXcDY5JZ6TkqBzaonpWj4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:34:45 -0800
IronPort-SDR: GKzb5VNoL3F4GiPF71igddccbN8pgvs8vwl0r2dnRFZoNNK5TXIn5WBgSD9EeaGmJNUObN9jf4
 x5LZ1JV7wggWhDu8kY7ZXUAxJhNDtkC7+/LX8qoyWCMZeceWKoExM1EN5hT3G2x5XumomlxjPD
 4OIsLMPGkWCzCgJJFzc4w/j1jfK6tQx0z5XIO7I4oLrX3xNmXJIrhwNGbSsC1j1XZbf0TYhFiH
 K/1cyrkwuTH6DgsrDFuwXvsAIcm76rNzX0tLUw3u6XYmIVFZtzXyzztS95YOUmflzlwST8tCFd
 m/g=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:50:58 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Date:   Sun, 13 Dec 2020 22:50:33 +0900
Message-Id: <20201213135056.24446-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series of patches improves support for boards based on the Canaan
Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
already included in the kernel. These patches complete it, enabling
support for most peripherals present on the SoC as well as introducing
device trees for the various K210 boards available on the market today
from SiPeed and Kendryte.

Pathes 1 to 4 are various fixes for riscv arch code and riscv
dependent devices. Of note here is patch 3 which fix system calls
execution in the no MMU case, and patch 4 which simplifies DTB builtin
handling.

Patch 5 fixes naming of directories and configuration options to use the
K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).

Patch 6 is a preparatory patch cleaning up the K210 system controller
driver to facilitate introducing the SoC clock driver.

The following patches 7 to 11 document device tree bindings for the SoC
drivers. The implementation of these drivers is provided in patches 12,
13 and 14, respectively implementing the SoC clock driver, reset
controller and SOC pin function control.

Patches 15 to 20 update the existing K210 device tree and add new
device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
board from Canaan.

Finally the last two patches updates the k210 nommu defconfig to include
the newly implemented drivers and provide a new default configuration
file enabling SD card support.

A lot of the work on the device tree and on the K210 drivers come from
the work by Sean Anderson for the U-Boot project support of the K210
SoC. Sean also helped with debugging many aspects of this series.

A tree with all patches applied is available here:
https://github.com/damien-lemoal/linux, k210-sysctl-v22 branch.
A demonstration of this series used on a SiPeed MAIX Dock
board together with an I2C servo controller can be seen here:
https://damien-lemoal.github.io/linux-robot-arm/#example

This tree was used to build userspace busybox environment image that is
then copied onto an SD card formatted with ext2:
https://github.com/damien-lemoal/buildroot
Of note is that running this userspace environment requires a revert of
commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
5.9 development cycle. Without this revert, execution of the init
process fails. A problem with the riscv port of elf2flt is suspected but
not confirmed. I am now starting to investigate this problem.

Reviews and comments are as always much welcome.

Changes from v9:
* Added patch 6 to avoid DTS compilation errors after patch 9 is
  applied and until patch 16 is applied.

Changes from v8:
* Addressed Rob's comments on the sysctl driver bindings documentation
* Fixed a typo in the fpios driver bindings documentation

Changes from v7:
* Removed the __init annotation for the drivers reset, pinctrl and
  sysctl drivers probe functions as suggested by Geert. Also removed
  the __refdata annotation for the struct platform_driver variables of
  these drivers.

Changes from v6:
* Annotate struct platform_driver variables with __refdata to avoid
  section mismatch compilation errors
* Add empty sentinel entry to of_device_id tables of the sysctl, reset
  and pinctrl drivers.

Changes from v5:
* Addressed Philipp's comment on the reset controller driver
* Added patch 6 to reduce the size of the clock driver patch
  (now patch 12).

Changes from v4:
* Simplified reset controller driver using of_xlate callback as
  suggested by Philipp
* Fixed compilation error when using other configs than one of the
  nommu_k210 defconfigs.
* Addressed most clock driver comments from Stephen.
* Removed CONFIG_GPIO_SYSFS from defconfigs
* Rebased on 5.10-rc7

Changes from V3:
* Add one entry per driver in MAINTAINERS file

Changes from V2:
* Add MAINTAINERS file entry for the SoC support, listing myself as
  maintainer.
* Removed use of postcore_initcall() for declaring the drivers, using
  the regular builtin_platform_driver() instead.
* Fixed fpio pinctrl driver bindings documentation as commented by
  Geert: removed input-schmitt and added input-schmitt-disable, fixed
  typo and added input-disable and output-disable.
* Fixed device tree to have cs-gpios active low, as per the default, as
  active high necessity was an artifact of the gpio level double
  inversion bug fixed recently.
* Removed CONFIG_VT from defconfigs to reduce the kernel image size as
  suggested by Geert.

Changes from v1:
* Improved DT bindings documentation
* SPI and GPIO patches removed from this series (and being processed
  directly through the relevant subsystems directly)
* Improved device trees
* Various cleanup and improvments of the drivers

Damien Le Moal (22):
  riscv: Fix kernel time_init()
  riscv: Fix sifive serial driver
  riscv: Enable interrupts during syscalls with M-Mode
  riscv: Fix builtin DTB handling
  riscv: Use vendor name for K210 SoC support
  riscv: cleanup Canaan Kendryte K210 sysctl driver
  dt-bindings: Add Canaan vendor prefix
  dt-binding: clock: Document canaan,k210-clk bindings
  dt-bindings: reset: Document canaan,k210-rst bindings
  dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
  dt-binding: mfd: Document canaan,k210-sysctl bindings
  riscv: Add Canaan Kendryte K210 clock driver
  riscv: Add Canaan Kendryte K210 reset controller
  riscv: Add Canaan Kendryte K210 FPIOA driver
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

Damien Le Moal (23):
  riscv: Fix kernel time_init()
  riscv: Fix sifive serial driver
  riscv: Enable interrupts during syscalls with M-Mode
  riscv: Fix builtin DTB handling
  riscv: Use vendor name for K210 SoC support
  riscv: Fix Canaan Kendryte K210 device tree
  riscv: cleanup Canaan Kendryte K210 sysctl driver
  dt-bindings: Add Canaan vendor prefix
  dt-binding: clock: Document canaan,k210-clk bindings
  dt-bindings: reset: Document canaan,k210-rst bindings
  dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
  dt-binding: mfd: Document canaan,k210-sysctl bindings
  riscv: Add Canaan Kendryte K210 clock driver
  riscv: Add Canaan Kendryte K210 reset controller
  riscv: Add Canaan Kendryte K210 FPIOA driver
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../bindings/clock/canaan,k210-clk.yaml       |   54 +
 .../bindings/mfd/canaan,k210-sysctl.yaml      |  109 ++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  171 +++
 .../bindings/reset/canaan,k210-rst.yaml       |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   23 +
 arch/riscv/Kconfig.socs                       |   33 +-
 arch/riscv/Makefile                           |    2 +-
 arch/riscv/boot/dts/Makefile                  |    2 +-
 arch/riscv/boot/dts/canaan/Makefile           |    5 +
 arch/riscv/boot/dts/canaan/k210.dtsi          |  621 ++++++++++
 arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
 arch/riscv/boot/dts/canaan/k210_kd233.dts     |  178 +++
 arch/riscv/boot/dts/canaan/k210_maix_bit.dts  |  227 ++++
 arch/riscv/boot/dts/canaan/k210_maix_dock.dts |  229 ++++
 arch/riscv/boot/dts/canaan/k210_maix_go.dts   |  237 ++++
 arch/riscv/boot/dts/canaan/k210_maixduino.dts |  201 ++++
 arch/riscv/boot/dts/kendryte/Makefile         |    4 -
 arch/riscv/boot/dts/kendryte/k210.dts         |   23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi        |  125 --
 arch/riscv/configs/nommu_k210_defconfig       |   39 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |   93 ++
 arch/riscv/include/asm/soc.h                  |   38 -
 arch/riscv/kernel/entry.S                     |    9 +
 arch/riscv/kernel/soc.c                       |   27 -
 arch/riscv/kernel/time.c                      |    3 +
 arch/riscv/mm/init.c                          |    6 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
 drivers/reset/Kconfig                         |   10 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-k210.c                    |  131 +++
 drivers/soc/Kconfig                           |    2 +-
 drivers/soc/Makefile                          |    2 +-
 drivers/soc/canaan/Kconfig                    |   12 +
 drivers/soc/canaan/Makefile                   |    3 +
 drivers/soc/canaan/k210-sysctl.c              |   78 ++
 drivers/soc/kendryte/Kconfig                  |   14 -
 drivers/soc/kendryte/Makefile                 |    3 -
 drivers/soc/kendryte/k210-sysctl.c            |  260 -----
 drivers/tty/serial/sifive.c                   |    1 +
 include/dt-bindings/clock/k210-clk.h          |   55 +-
 include/dt-bindings/pinctrl/k210-fpioa.h      |  276 +++++
 include/dt-bindings/reset/k210-rst.h          |   42 +
 include/soc/canaan/k210-sysctl.h              |   43 +
 49 files changed, 4962 insertions(+), 531 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/Makefile
 create mode 100644 arch/riscv/boot/dts/canaan/k210.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts
 delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
 create mode 100644 drivers/clk/clk-k210.c
 create mode 100644 drivers/pinctrl/pinctrl-k210.c
 create mode 100644 drivers/reset/reset-k210.c
 create mode 100644 drivers/soc/canaan/Kconfig
 create mode 100644 drivers/soc/canaan/Makefile
 create mode 100644 drivers/soc/canaan/k210-sysctl.c
 delete mode 100644 drivers/soc/kendryte/Kconfig
 delete mode 100644 drivers/soc/kendryte/Makefile
 delete mode 100644 drivers/soc/kendryte/k210-sysctl.c
 create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
 create mode 100644 include/dt-bindings/reset/k210-rst.h
 create mode 100644 include/soc/canaan/k210-sysctl.h

-- 
2.29.2

