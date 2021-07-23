Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1829D3D3B22
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbhGWMsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:06 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51406 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235074AbhGWMsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:03 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDBteQ019257;
        Fri, 23 Jul 2021 15:28:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=MUAtxLw5YE6dxhI6YPXFTUgkT/7ZSF+QpIC31xJ048M=;
 b=RLamMOpv+5yovFlYJcwJNIqn1euAt0ebyf4j7MXv2WTu7xA78xe+dQYFNYmxnQvnFJ63
 So+YpV6PX9fxp+cAN3AIldO7aiI3pl+L4S7rNyVjqjhjcfHd/Y+GNgKE9rXqgDbfALq/
 HBvQ3Gvs0G0incbijACKeO6uxytvv22lLKEiHXplBxXoKc4u0bCShky/e1yejM9SzJIL
 QoCXQ6uizuiwvVU7Sy/wMboxkIXk7EQh3whZ3MYDeiuPNSWEIJXZ0+YFSiWDZicmLM/B
 EIU1Hvy+NEhCSfTkVExjKmiayejOX0OCce2WZI5D+WDroBAFJg2GRxvQk9d2AiHY6JP7 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39ypq8jp07-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F164A10002A;
        Fri, 23 Jul 2021 15:28:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBDA7221783;
        Fri, 23 Jul 2021 15:28:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:12
 +0200
From:   Alexandre Torgue <alexandre.torgue@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 0/7] Add STM32MP13 SoCs and discovery board support
Date:   Fri, 23 Jul 2021 15:28:03 +0200
Message-ID: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_05:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series enhance the STM32 MPU family by adding STM32MP13 SoCs support.
It adds machine support and device tree diversity to support the whole
stm32mp13 family (STM32MP131/STM32MP133/STM32MP135, plus security feature
diversity).

Basically STM32MP13 SoCs embeds one Cortex A7, storage (SD/MMC/SDIO, QSPI FMC),
network (ETH, CAN), display (DCMIPP, LTDC, ...), audio(SAI, DFSDM, SPDIFRX),
com (USB EHCI/OHCI, USB OTG, I2C, SPI/I2S, U(S)ART).

This series also adds STM32MP135F Discovery board support (stm32mp135f-dk). It
embeds a STM32MP135f SOC with 512 MB of DDR3. Several connections are available
on this board:
 - 4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...

Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.

Note that file stm32mp135.dtsi doesn't define nodes but I add it now to ease adding
of new nodes in a (close) future.

regards
Alex

Alexandre Torgue (7):
  dt-bindings: pinctrl: stm32: add new compatible for STM32MP135 SoC
  pinctrl: stm32: Add STM32MP135 SoC support
  docs: arm: stm32: introduce STM32MP13 SoCs
  ARM: stm32: add initial support for STM32MP13 family
  ARM: dts: stm32: add STM32MP13 SoCs support
  dt-bindings: stm32: document stm32mp135f-dk board
  ARM: dts: stm32: add initial support of stm32mp135f-dk board

 Documentation/arm/index.rst                   |    1 +
 .../arm/stm32/stm32mp13-overview.rst          |   37 +
 .../devicetree/bindings/arm/stm32/stm32.yaml  |    4 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |    1 +
 arch/arm/boot/dts/Makefile                    |    1 +
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi      |   64 +
 arch/arm/boot/dts/stm32mp131.dtsi             |  283 +++
 arch/arm/boot/dts/stm32mp133.dtsi             |   37 +
 arch/arm/boot/dts/stm32mp135.dtsi             |   12 +
 arch/arm/boot/dts/stm32mp135f-dk.dts          |   56 +
 arch/arm/boot/dts/stm32mp13xc.dtsi            |   17 +
 arch/arm/boot/dts/stm32mp13xf.dtsi            |   17 +
 arch/arm/mach-stm32/Kconfig                   |    8 +
 arch/arm/mach-stm32/board-dt.c                |    3 +
 drivers/pinctrl/stm32/Kconfig                 |    6 +
 drivers/pinctrl/stm32/Makefile                |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp135.c    | 1679 +++++++++++++++++
 17 files changed, 2227 insertions(+)
 create mode 100644 Documentation/arm/stm32/stm32mp13-overview.rst
 create mode 100644 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp131.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp133.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp135.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp135f-dk.dts
 create mode 100644 arch/arm/boot/dts/stm32mp13xc.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp13xf.dtsi
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp135.c

-- 
2.17.1

