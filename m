Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2CD42F5C3
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240591AbhJOOnv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:43:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21966 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240578AbhJOOnu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 10:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634308903; x=1665844903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/goTSRahbsIqfRa7LYsf4UTbJb7pkbOHZ10tl9Z7LFU=;
  b=VxKwiN087ch96IKG+CueMnivESjcmqH0jpcNVXIEaovZ4LhPkpH1Zkqs
   mIJN9gjje9aRd6ZrkKsvF/84L1JBtHeXWI+8UWRohFZ9skDkfr+wdCH/C
   DV+HILpTMG0E9CND4g0fM3yare0fUahSdcwYll1L40L0BaHWraeWcl71H
   mnf6ib6YBprbo7DgyuE09RuijNCc32+/52kv73esMGhqsRWvGnASRSYp4
   WDU06ORB9PBpYLXRrXD+mUhSSJsU+jaKFm6QDAVU3H1LUdbfeKzGqx9Sl
   OBDRZ0z1T4/oDRqz5D7AAB2i7wbCDc9ZqitUJbPZ2GNQeVvqVPNoau94R
   w==;
IronPort-SDR: 4f58+Kak86+gCKsi2336qSPe8FqlhX2/D3R3ixnTB5ShLryZ5Tv8crFCpsod0LFCuWf2gs4RqA
 PS9y8Lmv/RXlAqkkT87B4wEHugjQNpHbct85hx10SgsDGBMoFECuKL3VsgzRdjIXGx5niBbpVb
 socrb7ijBmVScf4m178wrr2yAPFvmvWEzKbeFnfFX+HW41oX+0+kyl+vLenwdGX+3PmIYtgonW
 xxeXNWKp6+1fUtXoODfbjA6Ec0tO7/0i7/lvti6L6CPzSkIf7M7xl+izqgykbMmxtNPSJpJ4+F
 /W/nHEUNoPzM6b7oYU2r4xnS
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; 
   d="scan'208";a="133143190"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2021 07:41:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 07:41:41 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 07:41:39 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v5 0/2] pinctrl: pinctrl-microchip-sgpio: Extend to call reset driver
Date:   Fri, 15 Oct 2021 16:42:57 +0200
Message-ID: <20211015144259.219909-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows the driver to call an optional reset driver.

v4->v5:
 - check the return value of devm_reset_control_get_optional_shared

v3->v4:
 - use devm_reset_control_get_optional_shared
 - remove the expected name of the reset line

v2->v3:
 - fix warnings reported by 'make dtbs_check'

v1->v2:
 - add dt-bindings changes

Horatiu Vultur (2):
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
  pinctrl: microchip sgpio: use reset driver

 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml           | 3 +++
 drivers/pinctrl/pinctrl-microchip-sgpio.c                  | 7 +++++++
 2 files changed, 10 insertions(+)

-- 
2.33.0

