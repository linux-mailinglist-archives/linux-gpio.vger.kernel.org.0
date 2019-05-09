Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284AF18753
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEII7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:59:16 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:11718 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726097AbfEII7Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:59:16 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x498wcEH026185;
        Thu, 9 May 2019 10:59:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=jUe2d3C91CwaYKqFGnAmdOypdhWz5JbvmAKgwZA/OlQ=;
 b=IXSVdGuovITH732k0nWd9IpIc83HnodlMz1kxeIO2z3CmXJ+HGzdPWvha29wt4d9mPtL
 eUj2iMcQRdWbnBN8WebuytEzZeRNuqnz9SndIwd6vCZ1uPkAQ6GcUIJujGCj9RVRQmB0
 PyNhigQGzoFbXntPtbN2yMXZ2/paULZRvdRPt3oJ0/qxssxBgPpyBuh8ZWojO5KOofku
 lFNA/HjLlClQCR5HhWwlfZ0A2/6WEsVd/1UgtlOUqAAnYaFvIg63DPw4crNtkpOqVyEP
 no3QdgoMNTGKdkyNQGejipGQrGCQKqA4phN/QMFZ8Xxu2yHkcwXrlTUsIrwAWw/j3e3Z Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sc9s4a9k6-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 09 May 2019 10:59:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D72831;
        Thu,  9 May 2019 08:59:04 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D0B5153D;
        Thu,  9 May 2019 08:59:04 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 9 May 2019
 10:59:04 +0200
Received: from localhost (10.201.20.5) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 May 2019 10:59:03 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v6 0/9] Introduce STMFX I2C Multi-Function eXpander
Date:   Thu, 9 May 2019 10:58:47 +0200
Message-ID: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds support for STMicroelectronics Multi-Function eXpander
(STMFX), used on some STM32 discovery and evaluation boards.

STMFX is an STM32L152 slave controller whose firmware embeds the following
features:
- I/O expander (16 GPIOs + 8 extra if the other features are not enabled),
- resistive touchscreen controller,
- IDD measurement.

I2C stuff and chip initialization is based on an MFD parent driver, which
registers STMFX features MFD children.

---
Changes in v6:
- mfd: go with Lee's suggestion about vdd regulator management (but
initialize ret with PTR_ERR_OR_ZERO to use it in if/else if and error log),
also remove backup/restore helpers and move the code in suspend/
resume
Changes in v5:
- mfd: fix Lee's comments (reorder struct declaration, drop mfd cells
  platform data initialization, typos)
- pinctrl: get stmfx struct through dev_get_drvdata(pdev->dev.parent)
  instead of dev_get_platdata(&pdev->dev);
Changes in v4:
- mfd: move registers #define into the header
- mfd: merge stmfx and stmfx_ddata structures into one stmfx structure
- mfd: change stmfx_chip_init/exit and stmfx_irq_init/exit args: use
  i2c_client struct and i2c_get_clientdata
- mfd: fix typos
- mfd: add MFD cells for IDD and TS features
- pinctrl: rework registers #define
- dts: add STMFX support on stm32mp157c-ev1
Changes in v3:
- fix MFD interrupt bindings
- fix drivers/mfd/stmfx.c:103:8: warning: 'mask' may be used uninitialized
  in this function
Changes in v2:
- move to MFD parent driver for i2c stuff and chip initialization
- improve regmap configuration
- take advantage of the use of gpio-ranges

Amelie Delaunay (9):
  dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
  mfd: Add ST Multi-Function eXpander (STMFX) core driver
  dt-bindings: pinctrl: document the STMFX pinctrl bindings
  pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
  ARM: dts: stm32: add STMFX support on stm32746g-eval
  ARM: dts: stm32: add joystick support on stm32746g-eval
  ARM: dts: stm32: add orange and blue leds on stm32746g-eval
  ARM: dts: stm32: add STMFX support on stm32mp157c-ev1
  ARM: dts: stm32: add joystick support on stm32mp157c-ev1

 Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
 arch/arm/boot/dts/stm32746g-eval.dts               |  66 ++
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |  60 ++
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   2 +-
 drivers/mfd/stmfx.c                                | 545 ++++++++++++++
 drivers/pinctrl/Kconfig                            |  12 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-stmfx.c                    | 820 +++++++++++++++++++++
 include/linux/mfd/stmfx.h                          | 123 ++++
 11 files changed, 1785 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
 create mode 100644 drivers/mfd/stmfx.c
 create mode 100644 drivers/pinctrl/pinctrl-stmfx.c
 create mode 100644 include/linux/mfd/stmfx.h

-- 
2.7.4

