Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A0D285DDE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 13:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgJGLMB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 07:12:01 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2747 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgJGLMA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 07:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602069120; x=1633605120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jTkGXO9V/G30ymkdWTzloF+IoAl5IuZdTB0pP3RMpuQ=;
  b=UnTo5od/BRIVMZgabLe2l2CWMj9pw8Z0/icvEeS+oormHofrUvcoKkAC
   hwnZuSq30V6s8WG6UGwF90Yf7v1IYBBxtBT9dxeSDLmYNI99rqC47SN+O
   imtFpfCFs3fCeuajJB0kpBIDRCtCry2Yw06RBjmAtoQTrYzKa0Qz/rGK6
   Vx8RxybVOi09WRHRGcPCqKTupenUub7WOnWJD+eR5cjvSwbKk9Yzzmom6
   b1JUW4T91/8/3mpGpvRc6IvtsEkBYCgWYREJQ9f84S3BFFOKB6EHFp0Pj
   VPCBCcxuI2SXssL4j/2o51KeuGRJkCr+qn6+Aqld99mvJYOZHCG8y9cQs
   Q==;
IronPort-SDR: UGUDLJpMF5V9CASCPKIQBnN2cBZS8kNuKPxFol3aYwddJK8UiCfi/lH4x7D55UCEyyX2GRY8xK
 TVWgBVZtvqB/u0k6a3Kj/SbJnTpb58/Q6RX1M3W5lpABVyoPdq1/kPYbhvZd6AWdIDu2b/yBQL
 HTOizve7aI89/6JIzYUI6OwiOA7eKfyehlJAkAcHEbU6gCHD06vbxKcw72HhwcGVyfMbXTnIQi
 +3m0wLjt/DGhQ+CX9x9jDrUY30r2UUYocC8KZu9KXvxeGUBDvvehQFf8Ya5O6GldSbjLRkF0Nj
 uMk=
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="89405090"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2020 04:12:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 7 Oct 2020 04:11:42 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 7 Oct 2020 04:11:40 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 0/3] pinctrl: Adding support for Microchip/Microsemi serial GPIO controller
Date:   Wed, 7 Oct 2020 13:11:42 +0200
Message-ID: <20201007111145.2306213-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

The driver now register two separate banks (per instance), one for
input pins (the first) and one for output direction. This eliminates
the need for specifying the direction as part of the gpio
arguments. The (fixed) direction is thus inherent from the gpio
handle.

v4 changes (binding comments from Rob):
- microchip,sgpio-port-ranges changed to uint32-matrix so tuples can
  be represented properly.
- gpio controller node name changed to "gpio@[0-1]"
- whitespace fixes
- DT files updated as per schema changes

v3 changes:
- Renamed all usage of "mchp" abbrevation with "microchip".
- Split the in/output directions into (two) separate banks.
- Eliminated the bindings include file (from above)
- Changed SPDX license to "GPL-2.0-or-later"
- Change -ENOTSUPP to -EOPNOTSUPP
- Minor type/symbol naming changes

v2 changes:
- Adds both in and output modes.
- Use direct adressing of the individual banks (#gpio-cells = <4>),
  also osoleting need for addressing macros in bindings include file.
- Property 'microchip,sgpio-ports' (uint32, bitmask) replaced by
  proper range set (array of [start,end]) 'microchip,sgpio-port-ranges'.
- Fixes whitespace issues in Kconfig file

Lars Povlsen (3):
  dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
  pinctrl: pinctrl-mchp-sgpio: Add pinctrl driver for Microsemi Serial
    GPIO
  arm64: dts: sparx5: Add SGPIO devices

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 140 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  91 +++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 258 +++++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  55 ++
 drivers/pinctrl/Kconfig                       |  18 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 676 ++++++++++++++++++
 9 files changed, 1245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
