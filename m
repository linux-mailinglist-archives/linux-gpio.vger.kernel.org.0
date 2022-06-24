Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FDC5595B0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jun 2022 10:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiFXIsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jun 2022 04:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiFXIso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jun 2022 04:48:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7714A56C3B;
        Fri, 24 Jun 2022 01:48:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,218,1650898800"; 
   d="scan'208";a="125535877"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jun 2022 17:48:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.68])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 16AC14009F9A;
        Fri, 24 Jun 2022 17:48:38 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: Add RZ/V2M pin and gpio driver
Date:   Fri, 24 Jun 2022 09:48:31 +0100
Message-Id: <20220624084833.22605-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

RZ/V2M has a simple pin and GPIO controller combined similar to RZ/G2L.
However, the differences are enough that I don't think it makes sense
to try to add support for RZ/V2M into the existing RZ/G2L driver.
GPIO interrupt support has been omitted from this driver, to be added
at a later date.

v2:
 dt bindings:
 - Remove power-source as it is not supported
 - Add enum and description for slew-rate
 - Remove 'oneOf' and 'items' for compatible string
 - Add description for the interrupts
 - Remove input-enable property as it is not appropriate
 driver:
 - Lots of small fixes based on Geert's review
 - Remove PIN_CONFIG_INPUT_ENABLE as it is not appropriate

Phil Edworthy (2):
  dt-bindings: pinctrl: renesas: Add DT bindings for RZ/V2M pinctrl
  pinctrl: renesas: Add RZ/V2M pin and gpio controller driver

 .../pinctrl/renesas,rzv2m-pinctrl.yaml        |  170 +++
 drivers/pinctrl/renesas/Kconfig               |   13 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       | 1118 +++++++++++++++++
 include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |   23 +
 5 files changed, 1325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzv2m.c
 create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h

-- 
2.34.1

