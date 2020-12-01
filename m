Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C462C9C6F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 10:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390523AbgLAJSK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 04:18:10 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:34400 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390506AbgLAJSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 04:18:05 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0B19Fwxw003761; Tue, 1 Dec 2020 18:15:59 +0900
X-Iguazu-Qid: 34trnO8aDoHi8rwigd
X-Iguazu-QSIG: v=2; s=0; t=1606814158; q=34trnO8aDoHi8rwigd; m=CQIFhqIeZ/1OaGN+K0KBw/hoFYRMv2SIsojsKTfpIuc=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 0B19FwwH036934;
        Tue, 1 Dec 2020 18:15:58 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0B19FvRW024694;
        Tue, 1 Dec 2020 18:15:57 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0B19Fv1N031159;
        Tue, 1 Dec 2020 18:15:57 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 0/4] gpio: visconti: Add Toshiba Visconti GPIO support
Date:   Wed,  2 Dec 2020 03:14:02 +0900
X-TSB-HOP: ON
Message-Id: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series is the GPIO driver for Toshiba's ARM SoC, Visconti[0].
This provides DT binding documentation, device driver, MAINTAINER files, and updates to DT files.

Update:

  dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller:
    v2 -> v3: Fix dtschema/dtc warnings.
      dtschema/dtc warnings/errors:
        Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.example.dt.yaml: gpio@28020000: interrupts: [[0, 24, 4], [0, 25, 4], [0, 26, 4], [0, 27, 4], [0, 28, 4], [0, 29, 4], [0, 30, 4], [0, 31, 4], [0, 32, 4], [0, 33, 4], [0, 34, 4], [0, 35, 4], [0, 36, 4], [0, 37, 4], [0, 38, 4], [0, 39, 4]] is too short
	  From schema: Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
    v1 -> v2: Fix typo.

  gpio: visoconti: Add Toshiba Visconti GPIO support:
    v2 -> v3: Add select GPIO_GENERIC
              Use genric MMIO GPIO library
              Use bgpio_init() as initialized the generic helpers.
              Use irqchip template instead of gpiochip_irqchip_add().
    v1 -> v2: No update

  MAINTAINERS: Add entries for Toshiba Visconti GPIO controller:
    v2 -> v3: No update
    v1 -> v2: No update

  arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver:
    v2 -> v3: Fix compatible string.
    v1 -> v2: No update

Best regards,
  Nobuhiro

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

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
 drivers/gpio/gpio-visconti.c                  | 232 ++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c     |  23 ++
 8 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 create mode 100644 drivers/gpio/gpio-visconti.c

-- 
2.29.2
