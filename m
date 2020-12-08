Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194C92D246A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgLHHfH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:35:07 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58664 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgLHHfH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607412906; x=1638948906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/uqgEb/NPBMNThUBI4i0Wk8STP6eDudez1y5NQ4iU10=;
  b=bbfTetp79kOz1riFRZHIbQk68YQM01pycp1TC/EcQsMFDjUs1VHMyzyv
   CPmYkZGDHc2JoNWzml/RgXOc75WDbst/27gFobUvwxaPdIsWBIpIjFX6k
   D7YZttir2NoLJXF+ohxaOgkMbg56mvpA9XGJD4ovE94ebljPhbTaidJ88
   2e0tkZ/cnL10w/Xy9Rg//VwEQVe8on/gDhRqZ9FC46/XvmFs775dX4GqU
   zb1KZfMgbo0HO1ajQ4LAhTPxVhsLaK3PH+vfgRJ+mDz32ln5qnhpx5kLy
   aDwGJWgnLXCDLANwVNiy+sPghHV1pbLpVUgZyA1ft+jXnP2QcujyLKo1C
   w==;
IronPort-SDR: LtEomZRKDD7HVwJODPW/xA3k5WeRfqi1kPiCIhTYG5PlYJ5Yeg0lIIV0+9IpE3br2dy0J12azA
 OGcAWLzyBiVo1XvfYO3sdxaYaTHRyHYJgrOBHj7NIwcxCCRA7sjwTXFV+wksu5+etaB2HeiBdB
 Oy0CQWzXIXxOgT/nLyrSGJCII4PSwX4QJnf/P4FSpgW4jqyGQHTnXI6JdUW7ey6KSHiAZWJjxj
 7rLYQkaC5rsoKWuAzFfgleOo48SzpggUR5vow5Vq87fxrNJ+K/ZasgfRd21nRHJjVLU/jUuiq9
 2B0=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876620"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:01 +0800
IronPort-SDR: 6fgyAOXgZuYr8fSL0Cg/mprqcDIj91g85dsyQFLJXetnPJFMtsW8IlbXN0ZAlf4l6gPhHjmC09
 MbFgg7pNdehqK/YTBlas0lB6myE5kUflg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:01 -0800
IronPort-SDR: hcnL93hF7iNkjh6FPcVb0nDQjyhrg1OgD/B7ihK2M5I39Mv3BA+U7YFs/yTr/ZdEFWAqbXv4BH
 467CstusGiPA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:33:59 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 00/21] RISC-V Kendryte K210 support improvements
Date:   Tue,  8 Dec 2020 16:33:34 +0900
Message-Id: <20201208073355.40828-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
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
https://github.com/damien-lemoal/linux, k210-sysctl-v19 branch.
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
 .../bindings/mfd/canaan,k210-sysctl.yaml      |  116 ++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  171 +++
 .../bindings/reset/canaan,k210-rst.yaml       |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   23 +
 arch/riscv/Kconfig.socs                       |   33 +-
 arch/riscv/Makefile                           |    2 +-
 arch/riscv/boot/dts/Makefile                  |    2 +-
 arch/riscv/boot/dts/canaan/Makefile           |    5 +
 arch/riscv/boot/dts/canaan/k210.dtsi          |  622 ++++++++++
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
 drivers/pinctrl/pinctrl-k210.c                |  984 ++++++++++++++++
 drivers/reset/Kconfig                         |   10 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-k210.c                    |  134 +++
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
 49 files changed, 4972 insertions(+), 531 deletions(-)
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

