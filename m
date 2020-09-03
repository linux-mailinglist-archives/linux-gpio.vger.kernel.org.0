Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAAD425C3F6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbgICPBo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 11:01:44 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:40555 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgICOFq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 10:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1599141945; x=1630677945;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O+rEFbhk8/OIwaun0Fe+GDqjEHwvlb6VwpK36XQynHs=;
  b=QVZ5G7z4R5gu0puNaf61OBQWQwnEMi77gzMR9UPquk+7042BusV8jIPt
   PJkoChLf70BvGR4JHnrsrvZmQmAxonP47UxXykkmopmXkl/2ckTy9wXwX
   w3snvxIlvmFZfc7Ck+Jbkl8D8T19sQnIHpRGHVHQktZ2S8AgIgA42QRji
   wrFKSTCtyrj5N8FjsMo4lbT93oKRywitLbaTMC8lMtVdkjZ16xiEBlwYA
   XfbYWx2jhZrj+QFlHgZD5+2oqhhRCIHnnNJeq5WbjRes3aI1Ec9TGPDEf
   VI+reIG9t2O8m/VFyQXIPZ147LvYZZze8vatrc82mbUaC2YKZ157aOITq
   g==;
IronPort-SDR: j/VebqZTxI83hsfvRtHeNxv+/3YMHexVxm17Wv8NcB38a4HKuRZORuoO36hdK8OimRZLL49crm
 AfLxiWLjx49goicAyAjFAFsPiwKGNOahPWsMaaP/x46dzddb2NldYxNot5+yg3iMgl9W2dyUqA
 nUau2tgZPjY4I2Kgr3cnxIzNwRJTG8l4SQ120hKVeMEMkbbWNahP43M5BxZtRse0ccv8yETdbr
 YSdq9YytQMfcPbc8EZndZBZJ9Kdp7gaxy4XF0h0juabwNVfNBUu95hwO/Lrlle1hPXAdCq8Axq
 rTs=
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="90391121"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Sep 2020 06:35:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Sep 2020 06:34:57 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 3 Sep 2020 06:34:53 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 0/3] pinctrl: Adding support for Microchip/Microsemi serial GPIO controller
Date:   Thu, 3 Sep 2020 15:35:25 +0200
Message-ID: <20200903133528.8595-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

This is the second revision of the patch series.

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

 .../pinctrl/microchip,sparx5-sgpio.yaml       |  88 +++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  52 ++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    |   5 +
 .../dts/microchip/sparx5_pcb135_board.dtsi    |   5 +
 drivers/pinctrl/Kconfig                       |  17 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-mchp-sgpio.c          | 642 ++++++++++++++++++
 include/dt-bindings/gpio/mchp-sgpio.h         |  19 +
 10 files changed, 835 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-mchp-sgpio.c
 create mode 100644 include/dt-bindings/gpio/mchp-sgpio.h

--
2.27.0
