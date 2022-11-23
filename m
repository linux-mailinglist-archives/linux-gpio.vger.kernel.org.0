Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531C4634F9F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 06:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbiKWFgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 00:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKWFf7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 00:35:59 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AB982233;
        Tue, 22 Nov 2022 21:35:58 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZZnr093934;
        Tue, 22 Nov 2022 23:35:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669181735;
        bh=HRUVEW1J10nUGyiZYAFBBzOycKc14vOPd2IPySe5Pw4=;
        h=From:To:CC:Subject:Date;
        b=AEYvuyVBLediJMMHGlXQhaZCcC9Co1fkIv6G2kzzm/2RH3ADOxU5lL4bXXRT6Xbh4
         nDdbMpbHUwMvPnlTi7cM7uo9+Ah3sz7OZ/rbk+77tYVncp9fIEmVaa/wK+Zzf/l5sl
         czyhGau3cKB16/5rw+OT7WuejxHPCBNKFh+Gwarg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN5ZZC7002620
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Nov 2022 23:35:35 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 23:35:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 23:35:35 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZWbS011255;
        Tue, 22 Nov 2022 23:35:34 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <michael@walle.cc>, <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v5 0/4] mfd: add tps6594 support for Jacinto platforms
Date:   Tue, 22 Nov 2022 21:35:08 -0800
Message-ID: <20221123053512.1195309-1-mranostay@ti.com>
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

This patchset series adds support for the TPS6594 PMIC along with
initial support for its RTC + GPIO interface, and poweroff sequence.

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

Changes from v4:
* Corrected commit messages for device tree documentation
* Added TPS6954 datasheet PDF to devicetree documentation
* Renamed all references, including filenames + configuration options,
  from tps6594x to tps6594 dropping the unneeded wildcard

Keerthy (2):
  mfd: tps6594: Add support for TPS6594 PMIC devices
  rtc: rtc-tps6594: Add support for TPS6594 PMIC RTC

Matt Ranostay (2):
  dt-bindings: mfd: ti,tps6594: add TPS6594 PMIC support
  gpio: gpio-tps6594: add GPIO support for TPS6594 PMIC

 .../devicetree/bindings/mfd/ti,tps6594.yaml   |  69 ++++++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-tps6594.c                   |  78 +++++++++
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/tps6594.c                         | 113 +++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-tps6594.c                     | 155 ++++++++++++++++++
 include/linux/mfd/tps6594.h                   |  88 ++++++++++
 11 files changed, 539 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
 create mode 100644 drivers/gpio/gpio-tps6594.c
 create mode 100644 drivers/mfd/tps6594.c
 create mode 100644 drivers/rtc/rtc-tps6594.c
 create mode 100644 include/linux/mfd/tps6594.h

-- 
2.38.GIT

