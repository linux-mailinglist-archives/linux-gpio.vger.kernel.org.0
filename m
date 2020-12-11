Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810572D6CB3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 01:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394591AbgLKAqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 19:46:51 -0500
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:40648 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394575AbgLKAqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 19:46:12 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0BB0hUaa025283; Fri, 11 Dec 2020 09:43:30 +0900
X-Iguazu-Qid: 34trFI5eCgE29BTwGI
X-Iguazu-QSIG: v=2; s=0; t=1607647410; q=34trFI5eCgE29BTwGI; m=wTL7SZWr6fhQQkLpghlrUj5qJit10vHQyCjhaHyUZeo=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1512) id 0BB0hT76018316;
        Fri, 11 Dec 2020 09:43:29 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0BB0hTuG025293;
        Fri, 11 Dec 2020 09:43:29 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0BB0hSNQ023191;
        Fri, 11 Dec 2020 09:43:29 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v4 0/4] gpio: visconti: Add Toshiba Visconti GPIO support
Date:   Fri, 11 Dec 2020 18:41:34 +0900
X-TSB-HOP: ON
Message-Id: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
  v3 -> v4: Add Reviewed-by tag.
  v2 -> v3: Fix dtschema/dtc warnings.
    dtschema/dtc warnings/errors:
      Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.example.dt.yaml: gpio@28020000: interrupts: [[0, 24, 4], [0, 25, 4], [0, 26, 4], [0, 27, 4], [0, 28, 4], [0, 29, 4], [0, 30, 4], [0, 31, 4], [0, 32, 4], [0, 33, 4], [0, 34, 4], [0, 35, 4], [0, 36, 4], [0, 37, 4], [0, 38, 4], [0, 39, 4]] is too short
	From schema: Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
  v1 -> v2: Fix typo.

gpio: visoconti: Add Toshiba Visconti GPIO support:
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
  v3 -> v4: No update
  v2 -> v3: No update
  v1 -> v2: No update

arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver:
  v3 -> v4: Add Reviewed-by tag.
  v2 -> v3: Fix compatible string.
  v1 -> v2: No update

Nobuhiro Iwamatsu (4):
  dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
  gpio: visconti: Add Toshiba Visconti GPIO support
  MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
  arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

 .../bindings/gpio/toshiba,gpio-visconti.yaml  |  85 +++++++
 MAINTAINERS                                   |   2 +
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |   4 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     |  27 ++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-visconti.c                  | 230 ++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c     |  23 ++
 8 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 create mode 100644 drivers/gpio/gpio-visconti.c

-- 
2.29.2

