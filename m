Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F2029ED22
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 14:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJ2Nkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 09:40:43 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:33536 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgJ2Nkm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 09:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1603978842; x=1635514842;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uj31RIUPMHB2663+cdl+eyLqGnnK0YFqnxVMboDH4s0=;
  b=VnckbwS74ZEuqlvvFGMxu2J8FcKqyE8hqZ2xyjNT0W861DhXPl+38dum
   6R2eSNnLvwB1sakZ4A4zJIEFkM3JhYjbvE8UgU78catN8aJh/HY3uksbV
   VYH+dtWgXp54Cf4wdg5wHzboBnDbnpF3Nkp7yZGoD/waOOt3iNZyaobix
   UsLdA9YLHF+ev2adWMAAIyLrhzVc4Hk7+MwP61MyB1JWLpVZ/ql17+t2e
   MXL7tTbVnEha//JeFBVR1755Olwx2CSflH6emRdVrE2VqUI61jntdaeQf
   UrqRFr2+VNnldeKhPqHTFsl/eQPzHviPzJyJwexgBroUKUlLyJHS6NQec
   A==;
IronPort-SDR: PBWMSUHCAHMdlj4mBmYjjyAdW+Iou2cvbL8aSgG9onbaQsagM/JCVk2KTSS9xW+iYSEPMyDokx
 unTgUv+UQNJWeNFyXq6bV/4us2NMumW37ONx/cXrZUscCxcv4a4zhGn5zJr3Unls9RlYdIvi2x
 NYo+lzTdC63+oMOycr2aL7Nj43HbrUnQhQjQ1rX93N1RdrsMZSJwLpuafaL7akPcZrGsuaW07u
 DdFxKKQ3xaN3+Sx7BiOc07OuEPwOpUpGiqjGq27FgJf/Fezglj4R8ceCL/JpnB6ilTlhOn5wZe
 3lQ=
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="91815713"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Oct 2020 06:40:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 06:40:41 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 29 Oct 2020 06:40:39 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v7 0/3] Adding support for Microchip/Microsemi serial GPIO controller
Date:   Thu, 29 Oct 2020 14:40:24 +0100
Message-ID: <20201029134027.232951-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

v7 changes:
- Fixed wrong sizeof in pin string name template. (Andy)
- Collapsed sgpio_input_get() to one liner. (Andy)
- Eliminated unneeded variable in microchip_sgpio_get_value()
- Removed noisy dev_info(). (Andy)
- Replaced platform_get_resource()+devm_ioremap_resource() with
 devm_platform_ioremap_resource(). (Andy)
- Replaced device_property_read_u32() with
  of_property_read_u32(). (Andy)
- Replaced __builtin_ffsll() with __builtin_ffs() for MIPS32 targets.

v6 changes:
- Use "bus-frequency" instead of "microchip,sgpio-frequency". Drop
  '$ref'. (Robh)
- Added "ngpios" description, bumped minimum to 32. (Linus)
- Added "#size-cells" description. (Linus)
- Changed "bus-frequency" validation in driver to reflect the YAML
  description.

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

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 145 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  91 +++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 258 +++++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  55 ++
 drivers/pinctrl/Kconfig                       |  18 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 653 ++++++++++++++++++
 9 files changed, 1227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
