Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757AE2AFD0D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 02:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbgKLBcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 20:32:19 -0500
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:56862 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgKKXmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 18:42:19 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0ABNg6XI010993; Thu, 12 Nov 2020 08:42:06 +0900
X-Iguazu-Qid: 34treOZZE3LXD5VUw6
X-Iguazu-QSIG: v=2; s=0; t=1605138126; q=34treOZZE3LXD5VUw6; m=8iSl3CzsGk7z8gybTMgzP7sPlqhzerHJH3xjuyEO0Po=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1512) id 0ABNg5RC009502;
        Thu, 12 Nov 2020 08:42:05 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0ABNg5Dw002645;
        Thu, 12 Nov 2020 08:42:05 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0ABNg48Q007923;
        Thu, 12 Nov 2020 08:42:04 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 0/4] gpio: visoconti: Add Toshiba Visconti GPIO support
Date:   Thu, 12 Nov 2020 17:40:53 +0900
X-TSB-HOP: ON
Message-Id: <20201112084057.1399983-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
  v1 -> v2: Fix typo.

gpio: visoconti: Add Toshiba Visconti GPIO support:
  v1 -> v2: No update.

MAINTAINERS: Add entries for Toshiba Visconti GPIO controller:
  v1 -> v2: No update.

arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver:
  v1 -> v2: No update.

Nobuhiro Iwamatsu (4):
  dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
  gpio: visoconti: Add Toshiba Visconti GPIO support
  MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
  arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

 .../bindings/gpio/toshiba,gpio-visconti.yaml  |  85 ++++++
 MAINTAINERS                                   |   2 +
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |   4 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     |  27 ++
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-visconti.c                  | 287 ++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c     |  23 ++
 8 files changed, 437 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 create mode 100644 drivers/gpio/gpio-visconti.c

-- 
2.29.2

