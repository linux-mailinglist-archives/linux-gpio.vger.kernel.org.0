Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C519F245A9F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 04:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgHQCIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 22:08:51 -0400
Received: from mo-csw-fb1114.securemx.jp ([210.130.202.173]:53068 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgHQCIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 22:08:51 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1114) id 07H1l7BS006889; Mon, 17 Aug 2020 10:47:07 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 07H1ki0a024877; Mon, 17 Aug 2020 10:46:44 +0900
X-Iguazu-Qid: 2wGrGhpI0HNoi88eAq
X-Iguazu-QSIG: v=2; s=0; t=1597628804; q=2wGrGhpI0HNoi88eAq; m=cosVoQDNupwSKo8qNjFAm/e9kLJtIY+2/3exkBrGzJk=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 07H1kgG4009533;
        Mon, 17 Aug 2020 10:46:43 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx12.toshiba.co.jp  with ESMTP id 07H1kgVL001549;
        Mon, 17 Aug 2020 10:46:42 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc03.toshiba.co.jp  with ESMTP id 07H1kdHW023560;
        Mon, 17 Aug 2020 10:46:42 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 0/8] Add Toshiba Visconti ARM64 Platform support
Date:   Mon, 17 Aug 2020 10:46:24 +0900
X-TSB-HOP: ON
Message-Id: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Visconti is a series of Toshiba's SoCs targeting image processing
applications[0]. These set of patches adds support for Visconti5 a Arm
v8 based SoC.

The series add minimal support for the Visconti5 SoC and the TMPV7708 RM
main board. Peripherals such as UART, SPI, I2c and timer use Arm's
IP and work with the existing kernel drivers in the tree. The series
includes a pinctrl driver to select appropriate functions on the pins.

NOTE: Because Visconti5 does not have PSCI, it uses spin-table with enable-method.
      And this patch series does not include a clock framework, so it is a
      device-tree file that uses clocks with fixed-clock. This will be replaced by
      the clock driver in the future.

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

Best regards,
  Nobuhiro

Nobuhiro Iwamatsu (8):
  dt-bindings: pinctrl: Add bindings for Toshiba Visconti TMPV7700 SoC
  pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support
  dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
  dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
  arm64: visconti: Add initial support for Toshiba Visconti platform
  arm64: dts: visconti: Add device tree for TMPV7708 RM main board
  MAINTAINERS: Add information for Toshiba Visconti ARM SoCs
  arm64: defconfig: Enable configs for Toshiba Visconti

 .../devicetree/bindings/arm/toshiba.yaml      |  22 +
 .../pinctrl/toshiba,visconti-pinctrl.yaml     |  82 ++++
 MAINTAINERS                                   |  11 +
 arch/arm64/Kconfig.platforms                  |   7 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/toshiba/Makefile          |   2 +
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  44 ++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 390 ++++++++++++++++++
 .../arm64/boot/dts/toshiba/tmpv7708_pins.dtsi |  93 +++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/visconti/Kconfig              |  14 +
 drivers/pinctrl/visconti/Makefile             |   3 +
 drivers/pinctrl/visconti/pinctrl-common.c     | 320 ++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.h     |  96 +++++
 drivers/pinctrl/visconti/pinctrl-tmpv7700.c   | 355 ++++++++++++++++
 17 files changed, 1443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
 create mode 100644 drivers/pinctrl/visconti/Kconfig
 create mode 100644 drivers/pinctrl/visconti/Makefile
 create mode 100644 drivers/pinctrl/visconti/pinctrl-common.c
 create mode 100644 drivers/pinctrl/visconti/pinctrl-common.h
 create mode 100644 drivers/pinctrl/visconti/pinctrl-tmpv7700.c

-- 
2.27.0

