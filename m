Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964872C1CCE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgKXEhd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:37:33 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49765 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKXEhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192652; x=1637728652;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rVPzZ0fjLQkdg3mQrO9XGRTGd6aJnP0ZSaxgARJBgc8=;
  b=Z0xAPpQAuT5E5uxyUzM2239QF3A6g5+Ng8Lkg5C3iEpx0OQscgA850Ft
   W4z/CxYEWMqqbJiB0nOj2k8jLCpVxO0j+JRmdngEu10uc7r5MzOXzJ8q+
   FkA3pooq4LmjU+Dgmeco42Thzn1yZ+GcnmLX9bzCayMMMBqsMSzkVbzmy
   T1k8y8OEhoJoiOnpJ4AcM7S61Ys8wTrEBDAsnf+zIw8Q84CSCGbn4ITa5
   LTcAUNvKFmN7zzKsipt0q+sryMW1tfE/COgs5BeK5mJYtDior9H/ePiYp
   otuELeD8WnC88MGU1bsXmdal1eUjHXfVYFjil8GNNp76W+tKIh2WftcAG
   A==;
IronPort-SDR: AtQelxTOvIo7c+rAiZsAcd+yTvLoTDZW5tNfAFc7MYwe/htjynRkg2oX7QCuvV17HVztgdWbWo
 73up9YFdEq4INdzN/V61kU+xMIkblUvnpHyt+mrzzpV1iJVMefydS15Or+nMG1jt+hp+llTbPE
 xFa/ldSAwy8HRqymIaNZ1c+DVyVsLUQeu1d6seFvvcaAiGKTfhR6kMScNDkz/tWoiyTn530MP6
 nYMWDK24JW+izcy/Sp4z52FWSx8HHQh/f4kMwGT+vuAlqpyI8lR7IXkb9RZTjHhfJT8pDKhRjY
 rUY=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498144"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:32 +0800
IronPort-SDR: aK/VD+/K+w0PT6vMtS7G56GMF5HtWQPo38nbSRm8FqV34/SStHFMx3MflZVP7ITfUsvrsXyGdC
 Dg2dDyLLeSI6XMu/UhEVbOkiMJrrgurDc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:15 -0800
IronPort-SDR: hjxFysibKgoYdhDu0tPHAI/6HON/X8/DuC03iesKED51lFdkezWcrts3I7FBCRRLZwKJGuW//b
 KYx7/jHOdwMA==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:29 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 00/21] RISC-V Kendryte K210 support improvements
Date:   Tue, 24 Nov 2020 13:37:07 +0900
Message-Id: <20201124043728.199852-1-damien.lemoal@wdc.com>
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
drivers. These drivers implementation is provided in patches 11, 12 and
13, respectively implementing the SoC clock driver, SOC pin function
control and reset controller.

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
https://github.com/damien-lemoal/linux, k210-sysctl-v15 branch.
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
  dt-binding: Document canaan,k210-clk bindings
  dt-bindings: Document canaan,k210-rst bindings
  dt-bindings: Document canaan,k210-fpioa bindings
  dt-binding: Document canaan,k210-sysctl bindings
  riscv: Add Canaan Kendryte K210 clock driver
  riscv: Add Canaan Kendryte K210 FPIOA driver
  riscv: Add Canaan Kendryte K210 reset controller
  riscv: Update Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../bindings/clock/canaan,k210-clk.yaml       |  55 +
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   | 165 +++
 .../bindings/reset/canaan,k210-rst.yaml       |  40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
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
 arch/riscv/configs/nommu_k210_defconfig       |  36 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |  90 ++
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
 drivers/pinctrl/pinctrl-k210.c                | 997 ++++++++++++++++++
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-k210.c                    | 150 +++
 drivers/soc/Kconfig                           |   2 +-
 drivers/soc/Makefile                          |   2 +-
 drivers/soc/canaan/Kconfig                    |   9 +
 drivers/soc/canaan/Makefile                   |   3 +
 drivers/soc/canaan/k210-sysctl.c              |  89 ++
 drivers/soc/kendryte/Kconfig                  |  14 -
 drivers/soc/kendryte/Makefile                 |   3 -
 drivers/soc/kendryte/k210-sysctl.c            | 260 -----
 drivers/tty/serial/sifive.c                   |   1 +
 include/dt-bindings/clock/k210-clk.h          |  61 +-
 include/dt-bindings/pinctrl/k210-fpioa.h      | 276 +++++
 include/dt-bindings/reset/k210-rst.h          |  42 +
 include/soc/canaan/k210-sysctl.h              |  43 +
 48 files changed, 4944 insertions(+), 530 deletions(-)
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

