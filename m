Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6262128DE3F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 12:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgJNKF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 06:05:28 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:59969 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgJNKF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 06:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602669927; x=1634205927;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/I29CF5iiGyCnWFjnsZ+qI0s1CCYcoxLMpCKAkfIwK8=;
  b=17tTkvGKmsENgAYQ6dqi06EuoaGuJYYHa0DaSm4wUJrNZBqCreeO9Pbx
   Jv8N408Zh/uXKL5nFytCAoRwPuYFXi6EglEXKDwGUNiz4PgY7lF6tD4Tr
   VWL3hs1bclUi6aU1LgAt68T3w2pfuwc8f24yDO1+7CnurdjnuMwUMvpt6
   XzlzGkw93YwBZtCweYD3TK+UpJ8MzL4lxBHAwtAZaNWo8J6LcVDBFo0Xf
   9gD54S0B3BbgeTgVlcF8z/kfAU0ElpM/Aefhfu6NRt2cAHkZWhrUdZJO0
   BZvtCI3c0cBT4gPbKkp/OshQj7tPmLkUkKNhK35zjQLNNMtzfCHZghzM4
   w==;
IronPort-SDR: tnF6QV0/DD3E5rXwl2uEU0fwMGFFDTFSAeYdGzoEPLeC1dzPweoDYKNhJ5d/WB2qPIanffDNGR
 aWOSO4jZIG5Hob7rjrEyv0AegexhaXgdSNZONGQ9EpNPaMTY6T7/S2th39NOKuuEHDmKpwxiTp
 JPDkjF8oS12mUQfN6MH8lsl2I79QQAVw9F3vDMcFJhVU7/Jr9ovDQLuuAYweT+obHD/8ZdCel2
 LwXTzVFkqvuVLdCpHiVmWN2dPQPwjM1Xef8Dos+0D/rHPY7LE6L31JhCU4PmXPQ7SgNZmVpj++
 08E=
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="29850498"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Oct 2020 03:05:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 14 Oct 2020 03:05:26 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 14 Oct 2020 03:05:24 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v6 0/3] Adding support for Microchip/Microsemi serial GPIO controller
Date:   Wed, 14 Oct 2020 12:05:12 +0200
Message-ID: <20201014100515.2728584-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

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
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 667 ++++++++++++++++++
 9 files changed, 1241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
