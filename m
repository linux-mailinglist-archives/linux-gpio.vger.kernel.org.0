Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C905284D94
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 16:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgJFOZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 10:25:44 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:61308 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFOZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 10:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601994343; x=1633530343;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=piCMffCqgDvqxBLu6OvrQGya1ZdRTDuoxFoRit67Um4=;
  b=Ke6i5n6u/W0DCdpEDlaD7pgvGAA0+Gzprl1+Y6tqnSWIqdXWGsfoulpA
   6cd6RDNsI1LF68vM8cHewzTjRDx88l/SrAwjzQ5xXQIkp1mMnNI5B27dT
   Ss0VXXci+hnIWDFI5Qxjr5ka6SVnNGq8ppVyhVLgSqVSeGeyvjdsfQOQZ
   qLAHEfFMm7dzL7opJFV3iCpDOOc6kb+yya37G5GWkcDco9JsUPndG0xh0
   /9EBHlYnGk9Y4HUF6mkt5jVOGcWRqmpw0UvBGKPiCShHuIb9vsoBBZtmU
   P2DZESSafQ1d+VBEjnZdK6gYAU2Az//Q984N1qe52rzLTbwKmTx3QzrE5
   g==;
IronPort-SDR: JJpepf66G2coFgPizfHi1RJZM7sy5/50YwlQwFnsejh7kIFiyFN5T+XvTD7nHB5uye8AHRDItx
 GpNIPzGW7lgIIvbBu8xv2xkgHSLFaM69JBTJLAOEo+MdWwKOLp9C1W5x4hLoWeIdLOf+u7tWSr
 1myEps6/zrexaQIXl5GCTPA6/qIjfRW9zK6/15SYrzaMFmtEfNBfjM12ojm+wZ5XxSTA3XpR0r
 vBMyko/086x0tKxcbiIFezshickDmk3PG5PX7iBctIv2wlL/XDxiBf45mMIjqIoatjtrUuZUT0
 0MQ=
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="89278213"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Oct 2020 07:25:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 6 Oct 2020 07:25:31 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 6 Oct 2020 07:25:30 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [RESEND PATCH v3 0/3] pinctrl: Adding support for Microchip/Microsemi serial GPIO controller
Date:   Tue, 6 Oct 2020 16:25:29 +0200
Message-ID: <20201006142532.2247515-1-lars.povlsen@microchip.com>
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

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 127 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  91 +++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 262 +++++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  57 ++
 drivers/pinctrl/Kconfig                       |  18 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 676 ++++++++++++++++++
 9 files changed, 1238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
