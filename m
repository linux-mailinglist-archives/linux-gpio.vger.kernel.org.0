Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00312ABB4E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 14:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731980AbgKIN1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 08:27:06 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:44817 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387610AbgKIN1F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 08:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604928426; x=1636464426;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yQ7aQbaQcUFJGuL2d0l9emAGsalZe+Edw03if27uOyU=;
  b=hkwreRyKWIqJdsS+9seds87LeWouA3XnfVBrO/9oIDylxiViEF54vd7D
   1n47tpzAG+M8jv9NsmiCc7xFzQIK2fuk0xYLpvngVLeCkXKf/DtgvJVnl
   x3BQ3M21gygoTMHWRVe8L+yPM65yOmwaI3DHzqXyBYhAzFNchCMV7yVd9
   9RT8VzZR8gI6rcr79Ni/qoM4zEL3P7k+/qs5SI/m9m/UyGjfw6UMfYqLq
   z+sHxAzd8srJXdTu+Qw3RysN4GsMkrrYUwsdmP2LgVv0eoOaXMHJViv8H
   Pp2+kEWt/XR1QdRp6jxBRdabDNjcN+hACZ7m8Gp9TSDmGesn96YNLWx+P
   w==;
IronPort-SDR: izAjxhWgaHu9XCtkfi8HyQBOHgHwsD9UvcEXXmsnm81zHh5ylWakVLRLQVwqwnKfjAaHwVOD4k
 0FjdS7adZjXyPJUxu2zZ26Y+hn3diChepsTwbmW6IxucX2VGX4BEoGyMKzY8Xvz2EWJPFt283J
 rkazrfmnC2DJXeKfUvLDJnaFGKUaeojSc2eRbKaco3WXfYyIIQObSwG4EOUqaS+5H3enU/G1NA
 jRZnKQfa2FUgxJ6VNDakHERv9g9DD6JiTvHJz0pyPQRo6hM1b0QZhUbIfJZbegBDBpxwlSEOvA
 WNo=
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="97721891"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2020 06:27:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 9 Nov 2020 06:27:04 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 9 Nov 2020 06:27:02 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v8 0/3] Adding support for Microchip/Microsemi serial GPIO controller
Date:   Mon, 9 Nov 2020 14:26:40 +0100
Message-ID: <20201109132643.457932-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series add support for the serial GPIO controller used by
Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.

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
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 640 ++++++++++++++++++
 9 files changed, 1212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

--
2.25.1
