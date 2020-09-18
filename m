Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A12527092E
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Sep 2020 01:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgIRXiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 19:38:16 -0400
Received: from mo-csw-fb1115.securemx.jp ([210.130.202.174]:44376 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgIRXiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Sep 2020 19:38:15 -0400
X-Greylist: delayed 1302 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 19:38:14 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1115) id 08INGYFu031479; Sat, 19 Sep 2020 08:16:34 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 08INFklg007532; Sat, 19 Sep 2020 08:15:47 +0900
X-Iguazu-Qid: 2wHH7Ale9rBtpCzH8K
X-Iguazu-QSIG: v=2; s=0; t=1600470946; q=2wHH7Ale9rBtpCzH8K; m=pasFqGNBbwKkQv2K2MDW7vMXl76P1m3+7vzknSVZneM=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1110) id 08INFhvP033330;
        Sat, 19 Sep 2020 08:15:44 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08INFh1p000841;
        Sat, 19 Sep 2020 08:15:43 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08INFghV027705;
        Sat, 19 Sep 2020 08:15:42 +0900
Date:   Sat, 19 Sep 2020 08:15:41 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     soc@kernel.org
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sudeep.holla@arm.com, maz@misterjones.org
Subject: [GIT PULL] Initial support Visconti SoC for the v5.10 kernel
X-TSB-HOP: ON
Message-ID: <20200918231541.azafr4jspq5lqlyu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This is the first pull request for Toshiba ARM SoC, Visconti5.
Please pull this new SoC patches for the v5.10 kernel cycle.

Best regards,
  Nobuhiro

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-initial-for-5.10

for you to fetch changes up to 974fc359cbd4a16a7c4fdfeddc78f777d4f43828:

  arm64: defconfig: Enable configs for Toshiba Visconti (2020-09-16 16:37:22 +0900)

----------------------------------------------------------------
Visconti5 SoC changes for v5.10

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

 Documentation/devicetree/bindings/arm/toshiba.yaml |  22 ++
 MAINTAINERS                                        |  11 +
 arch/arm64/Kconfig.platforms                       |   7 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/toshiba/Makefile               |   2 +
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |  43 +++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          | 390 +++++++++++++++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi     |  93 +++++
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml
 create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi

