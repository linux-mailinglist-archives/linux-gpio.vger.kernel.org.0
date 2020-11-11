Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B742AEC15
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgKKIdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:33:54 -0500
Received: from mo-csw-fb1516.securemx.jp ([210.130.202.172]:41864 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgKKIdx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:33:53 -0500
X-Greylist: delayed 394 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Nov 2020 03:33:52 EST
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 0AB8RIhs029486; Wed, 11 Nov 2020 17:27:18 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 0AB8R3SH006157; Wed, 11 Nov 2020 17:27:03 +0900
X-Iguazu-Qid: 34trMeFKDGTR1d4FxM
X-Iguazu-QSIG: v=2; s=0; t=1605083222; q=34trMeFKDGTR1d4FxM; m=nGIKsNDb0eac6blomvebqsRAl1gvq1tLrxpLBZMFhSQ=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 0AB8R2Bs021318;
        Wed, 11 Nov 2020 17:27:02 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0AB8R1FN017627;
        Wed, 11 Nov 2020 17:27:01 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0AB8R1MS026367;
        Wed, 11 Nov 2020 17:27:01 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 0/4] gpio: visoconti: Add Toshiba Visconti GPIO support
Date:   Thu, 12 Nov 2020 02:25:49 +0900
X-TSB-HOP: ON
Message-Id: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series is the GPIO driver for Toshiba's ARM SoC, Visconti[0].
This includes DT binding documentation, device driver, MAINTAINER files, and updates to DT files.

Best regards,
  Nobuhiro

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

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
