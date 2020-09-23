Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC022753B1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 10:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIWIxK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 04:53:10 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:37686 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWIxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 04:53:10 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 08N8qf0A011709; Wed, 23 Sep 2020 17:52:41 +0900
X-Iguazu-Qid: 34trRpZzTvUKx62MeD
X-Iguazu-QSIG: v=2; s=0; t=1600851160; q=34trRpZzTvUKx62MeD; m=FoeEqvgkbzloI0PWEQ80MBPC6Oa6KTLcETPQBEE/oj0=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 08N8qcDR005328;
        Wed, 23 Sep 2020 17:52:38 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08N8qcnT017248;
        Wed, 23 Sep 2020 17:52:38 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08N8qbna004432;
        Wed, 23 Sep 2020 17:52:37 +0900
Date:   Wed, 23 Sep 2020 17:52:36 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, punit1.agrawal@toshiba.co.jp,
        arnd@arndb.de, catalin.marinas@arm.com, linus.walleij@linaro.org,
        yuji2.ishikawa@toshiba.co.jp, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org, maz@misterjones.org, sudeep.holla@arm.com,
        olof@lixom.net, will@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject:  [GIT PULL] Initial support Visconti SoC for v5.10 kernel (take two)
X-TSB-HOP: ON
Message-ID: <20200923085236.4hu53gmnnmqkttuy@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This is the first pull request for Toshiba ARM SoC, Visconti5.
Please pull this new SoC patches for v5.10 kernel cycle.

Best regards,
  Nobuhiro

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
tags/visconti-initial-for-5.10-tag2

for you to fetch changes up to c29900d50f4445e25a8e70dbd794bcc51d531639:

  arm64: defconfig: Enable configs for Toshiba Visconti (2020-09-23
17:09:17 +0900)

----------------------------------------------------------------
Visconti5 SoC changes for v5.10 (take two)

- Add dt-bindings for Toshiba Visconti ARM SoCs
- Add dt-bindings for the TMPV7708 RM main board
- Add initial support for Toshiba Visconti platform
- Add device tree for TMPV7708 RM main board
- Add information for Toshiba Visconti ARM SoCs to MAINTAINERS
- Enable configs for Toshiba Visconti to arm64's defconfig

----------------------------------------------------------------
Nobuhiro Iwamatsu (6):
      dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
      dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
      arm64: visconti: Add initial support for Toshiba Visconti platform
      arm64: dts: visconti: Add device tree for TMPV7708 RM main board
      MAINTAINERS: Add information for Toshiba Visconti ARM SoCs
      arm64: defconfig: Enable configs for Toshiba Visconti

 Documentation/devicetree/bindings/arm/toshiba.yaml |  22 ++++++++++
 MAINTAINERS                                        |  11 +++++
 arch/arm64/Kconfig.platforms                       |   7 ++++
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/toshiba/Makefile               |   2 +
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |  43 +++++++++++++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          | 390
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi     |  93
+++++++++++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml
 create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi

