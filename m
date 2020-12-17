Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364B32DCC32
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 06:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgLQFsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 00:48:11 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:47074 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgLQFsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 00:48:06 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0BH5jf9k001855; Thu, 17 Dec 2020 14:45:42 +0900
X-Iguazu-Qid: 34tMRegmucT75bpbPB
X-Iguazu-QSIG: v=2; s=0; t=1608183941; q=34tMRegmucT75bpbPB; m=EKL2NyHRI7vjiZb9lcz5yf1H/8ympR15SI6IPMJWisc=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 0BH5je9X038766;
        Thu, 17 Dec 2020 14:45:41 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0BH5jetT028756;
        Thu, 17 Dec 2020 14:45:40 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0BH5jeON027843;
        Thu, 17 Dec 2020 14:45:40 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v5 0/4] gpio: visconti: Add Toshiba Visconti GPIO support
Date:   Thu, 17 Dec 2020 23:43:34 +0900
X-TSB-HOP: ON
Message-Id: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series is the GPIO driver for Toshiba's ARM SoC, Visconti[0].
This provides DT binding documentation, device driver, MAINTAINER files, and updates to DT files.

Best regards,
  Nobuhiro

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller:
  v4 -> v5: Drop interrupts property.
            Add interrupts-parrent property.
  v3 -> v4: Add Reviewed-by tag.
  v2 -> v3: Fix dtschema/dtc warnings.
    dtschema/dtc warnings/errors:
      Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.example.dt.yaml: gpio@28020000: interrupts: [[0, 24, 4], [0, 25, 4], [0, 26, 4], [0, 27, 4], [0, 28, 4], [0, 29, 4], [0, 30, 4], [0, 31, 4], [0, 32, 4], [0, 33, 4], [0, 34, 4], [0, 35, 4], [0, 36, 4], [0, 37, 4], [0, 38, 4], [0, 39, 4]] is too short
	From schema: Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
  v1 -> v2: Fix typo.

gpio: visoconti: Add Toshiba Visconti GPIO support:
  v4 -> v5: Add IRQ_DOMAIN_HIERARCH to Kconfig
            Updated for using hierarchical irqs.
  v3 -> v4: Drop VISCONTI_GPIO_NR.
            Fix return code of platform_irq_count.
            Fix coprytight header.
            Add Reviewed-by tag.
  v2 -> v3: Add select GPIO_GENERIC
            Use genric MMIO GPIO library
            Use bgpio_init() as initialized the generic helpers.
            Use irqchip template instead of gpiochip_irqchip_add().
  v1 -> v2: No update

MAINTAINERS: Add entries for Toshiba Visconti GPIO controller:
  v4 -> v5: No update
  v3 -> v4: No update
  v2 -> v3: No update
  v1 -> v2: No update

arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver:
  v4 -> v5: Drop interrupts property.
            Add interrupts-parrent property.
  v3 -> v4: Add Reviewed-by tag.
  v2 -> v3: Fix compatible string.
  v1 -> v2: No update

Nobuhiro Iwamatsu (4):
  dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
  gpio: visconti: Add Toshiba Visconti GPIO support
  MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
  arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

 .../bindings/gpio/toshiba,gpio-visconti.yaml  |  70 ++++++
 MAINTAINERS                                   |   2 +
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |   4 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     |  11 +
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-visconti.c                  | 218 ++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c     |  23 ++
 8 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 create mode 100644 drivers/gpio/gpio-visconti.c

-- 
2.29.2

