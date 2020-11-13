Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5012B1DB8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 15:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgKMOwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 09:52:18 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:62802 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMOwS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 09:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605279137; x=1636815137;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yV2HkxAG0/DBudqLtQxcT+BFvOnhMV/3Cue+wO1EP7g=;
  b=kk76zWlH0x4PJEA87c9J2jCxpHBUeugSwABRjLzjD9bzZwjXcW9n3eh+
   YxJJPfKBcUksINERbOvtmnoWrTERTQSwGhHLnzByR577IMODUSvxO6Cyc
   7R73QBLnrT65AILmyYQAvaxAhVtVUQH0O/iy5pvgNW+LyGRGsqMirFxKw
   Paq1KVUCbywFYW/P9kQFVLNaCf/8a1rauOK5UPPlNvakypZdfkGldzdlk
   FtRTY+SOd035yn0N/UyzQegcGFOryFEvOtkycEBV8gOIUPH/kHc+Mx1iO
   7GWLLcTpA+70LPTeLYhrWbV7VDBquTgKR5Cs8zxpUhZ0j0Pyk6y0Z0iOq
   Q==;
IronPort-SDR: y46HRo/M1JjhTBpD9idJyZziUnVzas7QTVFlSFcnFagUMBYF9usKEZDlbNMN2PyFv0e0IuKAnv
 PQYG9BG0CT0FDxBys4eqYWqDF7bJIg6VxvWYskHWR8Nx5NMEkEph/rq2lAG9bRiok46r2wK6DC
 ij8WzojQquGy4ETWgOKQUcHoccSo6QOKKBi3Sdfh7SLQtG5DaD5f6CgQlYODdcgq4axpW7AH5x
 L88OvvOmSZGqoIUxj1MLcdVLT2U/SfRqmJNBjgT7qn1cq0IDxVHCSk3F13vfqrDw90PE/i8oia
 dzo=
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="96233652"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Nov 2020 07:52:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 13 Nov 2020 07:52:16 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 13 Nov 2020 07:52:14 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v10 0/3] Adding support for Microchip/Microsemi serial GPIO controller
Date:   Fri, 13 Nov 2020 15:51:48 +0100
Message-ID: <20201113145151.68900-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

v10 changes - anniversary edition (from Andy):
 - Fixed "Author" comment
 - Added missing "break;" in default switch case
 - Return -EINVAL when requesting pin disabled in bitstream
 - Change bank consistency check to return -ERANGE if failed (-EINVAL
   previously)

v9 changes (from Andy):
 - Avoid bitfield duplication (use FIELD_PREP/FIELD_GET)
 - Introduce SGPIO_SRC_BITS define constant
 - Use ENOTSUPP instead of EOPNOTSUPP (checkpatch will complain)
 - Drop dev_err() when using pin for wrong direction
 - Replaced left-over OF code with device_property_* flavors
 - Use devm_kasprintf() instead of strnprintf()+devm_strdup()
 - Minor formatting changes, deleted comments

v8 changes (from Andy):
 - Removed OF dependency/usage entirely.
 - Trimmed+sorted include files.
 - Made local variables reverse xmas sorted.
 - Removed __func__ usage.
 - Changed some occurences of "if (x) { ..." to early return.
 - Use dev_err_probe() where possible.
 - Replace of_device_get_match_data() with device_get_match_data()
 - Some minor formatting corrections
 - Do per-pin string allocation as opposed to bulk allocation+chop.

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
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 709 ++++++++++++++++++
 9 files changed, 1281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
