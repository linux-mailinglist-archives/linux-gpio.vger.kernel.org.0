Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DF42637B2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 22:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729741AbgIIUoj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 16:44:39 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:41980 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbgIIUoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 16:44:38 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 089KhrPK005028; Thu, 10 Sep 2020 05:43:54 +0900
X-Iguazu-Qid: 2wGrblJYEyQjVTLypl
X-Iguazu-QSIG: v=2; s=0; t=1599684233; q=2wGrblJYEyQjVTLypl; m=lK4uwiZ9vlrYjMKrVwSmW6xJ9iwgDZFrNR2G5MnwQtk=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1110) id 089KhojA029418;
        Thu, 10 Sep 2020 05:43:51 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 089KhopS001381;
        Thu, 10 Sep 2020 05:43:50 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 089KhnVg018522;
        Thu, 10 Sep 2020 05:43:50 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v4 0/8] Add Toshiba Visconti ARM64 Platform support
Date:   Thu, 10 Sep 2020 05:43:28 +0900
X-TSB-HOP: ON
Message-Id: <20200909204336.2558-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

dt-bindings: pinctrl: Add bindings for Toshiba Visconti TMPV7700 SoC
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - Fix warning by make dt_binding_check.
    - Use '-pins$' instead of ''^.*$':''.
    - Remove if/then.
    - Add $ref to the common pinctrl schemas.

pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support
  v3 -> v4:
    - Add Reviewed-by tag.
    - Fix comment for spinlock_t.
  v2 -> v3:
    -  Delete SET_BIT and CLR_BIT for easy to read a source.
    -  Add a comment for spinlock_t.
    -  Use DIV_ROUND_CLOSEST().
    -  Use GENMASK with #define.
    -  Fix spelling.
    -  Remove visconti_gpio_request_enable().

  v1 -> v2:
    - No update.

dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - No update.

dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - No update.

arm64: visconti: Add initial support for Toshiba Visconti platform
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - No update.

arm64: dts: visconti: Add device tree for TMPV7708 RM main board
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - Remove always-on property from timer.
    - Add interrputs for GIC.
    - Remove bootargs from chosen.
      stdout-path is not deleted because the boot loader cannot handle it.
      It will be removed in the future.
    - Update dtsi for using new binding of pinctrl.

MAINTAINERS: Add information for Toshiba Visconti ARM SoCs
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - No update.

arm64: defconfig: Enable configs for Toshiba Visconti    
  v3 -> v4:
    - Add Reviewed-by tag.
  v2 -> v3:
    - no update.
  v1 -> v2:
    - No update.
*** BLURB HERE ***

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
 .../pinctrl/toshiba,visconti-pinctrl.yaml     |  92 +++++
 MAINTAINERS                                   |  11 +
 arch/arm64/Kconfig.platforms                  |   7 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/toshiba/Makefile          |   2 +
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  43 ++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 390 ++++++++++++++++++
 .../arm64/boot/dts/toshiba/tmpv7708_pins.dtsi |  93 +++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/visconti/Kconfig              |  14 +
 drivers/pinctrl/visconti/Makefile             |   3 +
 drivers/pinctrl/visconti/pinctrl-common.c     | 305 ++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.h     |  96 +++++
 drivers/pinctrl/visconti/pinctrl-tmpv7700.c   | 355 ++++++++++++++++
 17 files changed, 1437 insertions(+)
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

