Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAB3622437
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 07:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiKIG4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 01:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiKIG4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 01:56:15 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492E81DA4C;
        Tue,  8 Nov 2022 22:56:14 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A96trZe095390;
        Wed, 9 Nov 2022 00:55:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1667976953;
        bh=tDvioJ6iiI0tv7VoTdxAcDlnVrvRcK7hIBA96PsZ+cs=;
        h=From:To:CC:Subject:Date;
        b=KpoirP9im9w7oTlX3cAC7MJlhAzvwUAQ++DSqdMYEuci3UyU6dhVmPgnJ31AtEnH4
         5C3ODzCEnYjDcHcoXT8I3QZ9bqyPeJp+1Z62VbK3QDgQBw8eyiFsCjlCScMXny41rS
         oNhaAcei6Iiblg6OBkoaVGDpBI7sgIiIxrijYw/o=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A96trdb091499
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Nov 2022 00:55:53 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 00:55:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 00:55:52 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A96tnsV024888;
        Wed, 9 Nov 2022 00:55:51 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <brgl@bgdev.pl>, <lee@kernel.org>, <linus.walleij@linaro.org>,
        <kristo@kernel.org>, <alexandre.belloni@bootlin.com>,
        <a.zummo@towertech.it>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh@kernel.org>, <vigneshr@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v3 0/7] mfd: add tps6594x support for Jacinto platforms
Date:   Tue, 8 Nov 2022 22:55:39 -0800
Message-ID: <20221109065546.24912-1-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset series adds support for the TPS6594x PMIC along with
initial support for its RTC + GPIO interface, and poweroff sequence.

Additionally, add usage of the PMIC for the various Jacintor platforms
devicetree's.

Changes from v1:
* Corrected devicetree documentation issues found with dt-schema
* Changed MFD references to PMIC reflecting the more valid use of driver
* Cleaning up variable naming and ordering within functions
* Adding gpio + regulator cells for upcoming driver support 
* Switching from .probe to .probe_new API
* Revising comments within drivers to be more concise
* Adding device tree nodes for j721s2 and j721e platforms

Changes from v2:
* Adding gpio-tps6594x driver support
* Enabling gpio cell in MFD driver
* Adding device tree nodes for k3-*dts platforms

Keerthy (3):
  MFD: TPS6594x: Add new PMIC device driver for TPS6594x chips
  rtc: rtc-tps6594x: Add support for TPS6594X PMIC RTC
  arm64: dts: ti: k3-j7200-common-proc-board: Add TPS6594x PMIC node

Matt Ranostay (4):
  Documentation: tps6594x: Add DT bindings for the TPS6594x PMIC
  gpio: tps6594x: add GPIO support for TPS6594x PMIC
  arm64: dts: ti: k3-j721e-common-proc-board: Add TPS6594x PMIC node
  arm64: dts: ti: k3-j721s2-common-proc-board: Add TPS6594x PMIC node

 .../devicetree/bindings/mfd/ti,tps6594x.yaml  |  67 +++++++
 .../dts/ti/k3-j7200-common-proc-board.dts     |  17 ++
 .../dts/ti/k3-j721e-common-proc-board.dts     |  17 ++
 .../dts/ti/k3-j721s2-common-proc-board.dts    |  17 ++
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-tps6594x.c                  | 142 ++++++++++++++
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/tps6594x.c                        | 120 ++++++++++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-tps6594x.c                    | 181 ++++++++++++++++++
 include/linux/mfd/tps6594x.h                  |  90 +++++++++
 14 files changed, 685 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml
 create mode 100644 drivers/gpio/gpio-tps6594x.c
 create mode 100644 drivers/mfd/tps6594x.c
 create mode 100644 drivers/rtc/rtc-tps6594x.c
 create mode 100644 include/linux/mfd/tps6594x.h

-- 
2.38.GIT

