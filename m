Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0546F62F107
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241256AbiKRJWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbiKRJWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:22:47 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A032A1B5;
        Fri, 18 Nov 2022 01:22:46 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9MNF4076880;
        Fri, 18 Nov 2022 03:22:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668763343;
        bh=vwNaGwz0+unEw3DnW8QS+x9gcVkdP39aX2pv4R8/ADE=;
        h=From:To:CC:Subject:Date;
        b=XKBt65PdawPeqn6iNbZMM9IQwgHW0z0BbAERjsON8FyIxIc9pj666RdAuoPIGhuMq
         7zi2Vfs4k2Z1RsAnkEmRDlHGqpl15c66KtOSC7tDbGSuE+OYO/VxxAXoXNLP9288f+
         hHCTqbBTmmYg1TrqY8Nx6gAS/9b8E57FQhJ0UKVY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AI9MNHU029850
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Nov 2022 03:22:23 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 18
 Nov 2022 03:22:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 18 Nov 2022 03:22:23 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9MKKx083116;
        Fri, 18 Nov 2022 03:22:22 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v4 0/4] mfd: add tps6594x support for Jacinto platforms
Date:   Fri, 18 Nov 2022 01:22:14 -0800
Message-ID: <20221118092218.480147-1-mranostay@ti.com>
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

Changes from v3:
* Refactoring gpio driver to use regmap gpio helpers
* Changing rtc driver to use more of device resource management 
* Minor code changes related to error messages that aren't useful
  being dropped
* Dropped wildcard in device-tree compatible, and i2c device id
* Dropped device tree changes from the series; since these should
  be in their own series later

Keerthy (2):
  MFD: TPS6594x: Add new PMIC device driver for TPS6594x chips
  rtc: rtc-tps6594x: Add support for TPS6594X PMIC RTC

Matt Ranostay (2):
  Documentation: ti,tps6594: Add DT bindings for the TPS6594x PMIC
  gpio: gpio-tps6594x: add GPIO support for TPS6594x PMIC

 .../devicetree/bindings/mfd/ti,tps6594.yaml   |  65 ++++++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-tps6594x.c                  |  78 +++++++++
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/tps6594x.c                        | 113 +++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-tps6594x.c                    | 155 ++++++++++++++++++
 include/linux/mfd/tps6594x.h                  |  88 ++++++++++
 11 files changed, 535 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
 create mode 100644 drivers/gpio/gpio-tps6594x.c
 create mode 100644 drivers/mfd/tps6594x.c
 create mode 100644 drivers/rtc/rtc-tps6594x.c
 create mode 100644 include/linux/mfd/tps6594x.h

-- 
2.38.GIT

