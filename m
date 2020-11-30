Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392452C9308
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388260AbgK3Xtl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:49:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7846 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387812AbgK3Xtl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780572; x=1638316572;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fnmKSjO+7e/ctbTEIGBkQ41kSawchDGA3iHH6aL3+wU=;
  b=FvuvG7DLS3LceSnowuJrd09b1hiUqZzVY/wsirYr4Ry3zNQ7N2zJVNsd
   0VNC8oQkckDVCFKYZU1wgCscE23FkLXdrRjLqMnxwyZkt5VPRijJ9HeOS
   8VKYx/jbN1OKF3A8vkx9ODsgtAJ6aDtF+uTa/SYdkUOkkEcvQitgjl74B
   FPkVMxbIC1EyC7TR+JpW7dnOWfPBzvXOL6IqwspyunrN6DM5oh5YSbCAV
   /XkZMWOHte+tHq8yIE1qSXSsHNee/w9Guw7h/muHmmZSH2VIJIPrue9d+
   V9ug7SxOoKb8LyEIZkRpD3LDSv/mbwi8Ziju/TnXik7HXRyVynTXus06N
   A==;
IronPort-SDR: R9Fdl6duHHzMPuQkNTzAUtcl6KJnT2xZtldUSwEEOL3drw8hfoVfA3DLZQzxYdlLOPe6dYDnd9
 ZBZaYp/GxK/cHgHFDmkczHSNbJnbDtyuD14jIQHVHUTJuSqOQmwgJO4IiZx3d1OVW0/H1mTPTS
 ppYrHdq5t0XMXrClA+Mb/zLXXGrLlz8HKhEaUveGcE7qi9uKdau8rKbZN0w5UcbMfuaytd8G0d
 ZTWjVqdqAob0L4ZbUVbyk8gmvlytdKY5wzVRAvjvQeCcsKzYydAIQJmv1sfDapSnZwVCPmUusl
 t3c=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538286"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:54:33 +0800
IronPort-SDR: kh+L2LBTls258WIzPwqqURcwS/VprKdjsmeW2VWJUu0oaKPY3Ol8JaTiilXqPbuTk0Z8C0KWMJ
 XDuR2tZp4hASaszjAk8Cxm/24ov4sTzEQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:32:48 -0800
IronPort-SDR: gX7wqsfLsXH8OS+a8zwznwDPffjp7OcaoygGKVar8NCVT27U3ItDrN8hSCTJuTJDgkAW2vwtsw
 Lr5AdwG1soTA==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:32 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 00/21] RISC-V Kendryte K210 support improvements
Date:   Tue,  1 Dec 2020 08:48:08 +0900
Message-Id: <20201130234829.118298-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series of patches improves support for boards based on the Kendryte
K210 RISC-V dual core SoC. Minimal support for this SoC is already
included in the kernel. These patches complete it, enabling support for
most peripherals present on the SoC as well as introducing device trees
for the various K210 boards available on the market today from SiPeed
and Kendryte.

Pathes 1 to 4 are various fixes for riscv arch code and riscv
dependent devices. Of note here is patch 3 which fix system calls
execution in the no MMU case, and patch 4 which simplifies DTB builtin
handling.

Patch 5 fixes naming of directories and configuration options to use the
K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).

The following patches 6 to 10 document device tree bindings for the SoC
drivers. The implementation of these drivers is provided in patches 11,
12 and 13, respectively implementing the SoC clock driver, SOC pin
function control and reset controller.

Patches 14 to 19 update the existing K210 device tree and add new
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
https://github.com/damien-lemoal/linux, k210-sysctl-v16 branch.
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

Damien Le Moal (21):
  riscv: Fix kernel time_init()
  riscv: Fix sifive serial driver
  riscv: Enable interrupts during syscalls with M-Mode
  riscv: Fix builtin DTB handling
  riscv: Use vendor name for K210 SoC support
  dt-bindings: Add Canaan vendor prefix
  dt-binding: clock: Document canaan,k210-clk bindings
  dt-bindings: reset: Document canaan,k210-rst bindings
  dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
  dt-binding: mfd: Document canaan,k210-sysctl bindings
  riscv: Add Canaan Kendryte K210 clock driver
  riscv: Add Canaan Kendryte K210 FPIOA driver
  riscv: Add Canaan Kendryte K210 reset controller
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../bindings/clock/canaan,k210-clk.yaml       |  55 +
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 +++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   | 171 +++
 .../bindings/reset/canaan,k210-rst.yaml       |  40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  16 +
 arch/riscv/Kconfig.socs                       |  38 +-
 arch/riscv/Makefile                           |   2 +-
 arch/riscv/boot/dts/Makefile                  |   2 +-
 arch/riscv/boot/dts/canaan/Makefile           |   5 +
 arch/riscv/boot/dts/canaan/k210.dtsi          | 625 +++++++++++
 arch/riscv/boot/dts/canaan/k210_generic.dts   |  46 +
 arch/riscv/boot/dts/canaan/k210_kd233.dts     | 178 ++++
 arch/riscv/boot/dts/canaan/k210_maix_bit.dts  | 227 ++++
 arch/riscv/boot/dts/canaan/k210_maix_dock.dts | 229 ++++
 arch/riscv/boot/dts/canaan/k210_maix_go.dts   | 237 +++++
 arch/riscv/boot/dts/canaan/k210_maixduino.dts | 201 ++++
 arch/riscv/boot/dts/kendryte/Makefile         |   4 -
 arch/riscv/boot/dts/kendryte/k210.dts         |  23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi        | 125 ---
 arch/riscv/configs/nommu_k210_defconfig       |  39 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |  93 ++
 arch/riscv/include/asm/soc.h                  |  38 -
 arch/riscv/kernel/entry.S                     |   9 +
 arch/riscv/kernel/soc.c                       |  27 -
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/mm/init.c                          |   6 +-
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-k210.c                        | 959 +++++++++++++++++
 drivers/pinctrl/Kconfig                       |  13 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-k210.c                | 984 ++++++++++++++++++
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-k210.c                    | 141 +++
 drivers/soc/Kconfig                           |   2 +-
 drivers/soc/Makefile                          |   2 +-
 drivers/soc/canaan/Kconfig                    |   9 +
 drivers/soc/canaan/Makefile                   |   3 +
 drivers/soc/canaan/k210-sysctl.c              |  79 ++
 drivers/soc/kendryte/Kconfig                  |  14 -
 drivers/soc/kendryte/Makefile                 |   3 -
 drivers/soc/kendryte/k210-sysctl.c            | 260 -----
 drivers/tty/serial/sifive.c                   |   1 +
 include/dt-bindings/clock/k210-clk.h          |  61 +-
 include/dt-bindings/pinctrl/k210-fpioa.h      | 276 +++++
 include/dt-bindings/reset/k210-rst.h          |  42 +
 include/soc/canaan/k210-sysctl.h              |  43 +
 49 files changed, 4939 insertions(+), 531 deletions(-)
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
2.28.0

