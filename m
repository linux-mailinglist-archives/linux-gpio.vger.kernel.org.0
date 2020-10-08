Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA4F2874CE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 15:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgJHNFZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 09:05:25 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:31763 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730154AbgJHNFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 09:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602162324; x=1633698324;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9GFFb9L2XzgUgsFOeudZEQsFIoN33NW0oarxi224QDE=;
  b=xEFnJJMjkneKnmjf/Ou8pXEPhbSV/K9tsdn4r4aFzwLNVBT/6u6wfFwe
   iW39XSwLUkqPmr/BTN2CY0xMR9C4+XJRnjCdl71aO+50UDgX5j1R9hVX7
   x3kQ2YayKhCX3NWe6E1ogfa94dkV2nXzqIngAfQH5eBzJu1axz9PGNPs3
   RW5ykr4EvO6xyjozWOYSw/TjhyflfqXdm57UvLraBd1hUJS/TnF8BHdH1
   OOoLkKxUyLn1KCsTgFvGyVrION3uiPcyJyEwKrl1bllbmgAY/9LY2uSNs
   gOwnUuPfygtZc7ChKRLHG4Uh+TyCvuS291xPzzZ/Mn4peKRWdYnlGHCOb
   A==;
IronPort-SDR: ThkiY8+hMWSka3fMBOvGwsQzUna2DkYVJukGXpP+7HVh30aLLBAbw3dTQhmY6UzxaztEjwKKM1
 wn0AI6nwad1GLz2a9L6pCT+XhXwuiQJgQzCzCE4ntKgm8D3jttAMbiZTTUg+nIWuHrA+v/XU4O
 fDTzbLWd7qdE5sCcBPNdkajASuYNKOBkI9Ggkb4l2Ul8/XtHaV7l4DKOeyRtHBHHLsf0S+4PET
 mAqYgggIDbyYb76yi7jYRxJIKGJIo2Zcijpx4KdzaDHMAwyXkC+ogppx24SvmC6pLoCPhgJB+o
 CRs=
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="93868367"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Oct 2020 06:05:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 8 Oct 2020 06:04:57 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 8 Oct 2020 06:05:21 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v5 0/3] pinctrl: Adding support for Microchip/Microsemi serial GPIO controller
Date:   Thu, 8 Oct 2020 15:05:12 +0200
Message-ID: <20201008130515.2385825-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

v5 changes (driver comments from Linus):
- Collect bank data in sgpio_bank struct
- Add is_input boolean to sgpio_bank struct
- Use single-bit bitmasks in sgpio_output_set() and sgpio_output_get()
- Eliminate superfluous struct pinctrl_dev *pctl_dev in bank data
- Fix wrong ngpio consistency check

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
  dt-bindings: pinctrl: Add bindings for pinctrl-microchip-sgpio driver
  pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi
    Serial GPIO
  arm64: dts: sparx5: Add SGPIO devices

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 140 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  91 +++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 258 +++++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  55 ++
 drivers/pinctrl/Kconfig                       |  18 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 665 ++++++++++++++++++
 9 files changed, 1234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
