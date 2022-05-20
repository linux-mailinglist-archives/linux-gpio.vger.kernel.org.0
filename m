Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0DE52EF6A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 17:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351012AbiETPlU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 11:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350987AbiETPlH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 11:41:07 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 52FE842ED5;
        Fri, 20 May 2022 08:41:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,239,1647270000"; 
   d="scan'208";a="121664216"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 May 2022 00:41:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.97])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C4A0440121CF;
        Sat, 21 May 2022 00:40:57 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: Add RZ/V2M pin and gpio driver
Date:   Fri, 20 May 2022 16:40:49 +0100
Message-Id: <20220520154051.29088-1-phil.edworthy@renesas.com>
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

Phil Edworthy (2):
  dt-bindings: pinctrl: renesas: Add DT bindings for RZ/V2M pinctrl
  pinctrl: renesas: Add RZ/V2M pin and gpio controller driver

 .../pinctrl/renesas,rzv2m-pinctrl.yaml        |  174 +++
 drivers/pinctrl/renesas/Kconfig               |   13 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       | 1149 +++++++++++++++++
 include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |   23 +
 5 files changed, 1360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzv2m.c
 create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h

-- 
2.34.1

