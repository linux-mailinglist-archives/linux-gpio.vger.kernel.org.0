Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D4442F213
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 15:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbhJON1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 09:27:20 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34023 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235985AbhJON1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 09:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634304313; x=1665840313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rmf3/CTvHOYsMOoYG1qTohpi8i7hVFFCkcZosN22AQ8=;
  b=IXEHBXgrI9gfx8+4BvjkLfjgQv+zE32/+MuI0COr5BEr5rciJugKo3vq
   LlIgSPCDANIEC9rtLs5KGl2/hqv94JUZ3XHP3jkOv6qHyfGrn+GUuy0wq
   0x3zFQtF3oU6b9FUuDxY6ENBUGP+v1jzlVYEPnOEH7sDWgoESqPxX982X
   xQtVV4njjNG7isldrsrvjRndEtfyaxzbin9xs/wUkiNPMVfonH2/EwE/T
   OtKtna7j4jLtLtes2TYERkk8kAhW1Ffhk3CJiG1vY/jBaY54O9NIGuSqi
   bQIRak2eCIJoauTuMUxepo6j9qXK/c1w8w9Ee7FQ52klsnaWddy+yQII3
   A==;
IronPort-SDR: j/LE/Cbu3hNCnIgHOntnkSC0+XsWCRvmhrQTGfAjDnBNJkRUjgB5E/BlQKzPrcQYXa6OQ2izWS
 Yi9hqtgYioTPJsefY0yD0QUJ4vHSSiKCxKdRl8dFhnEr9dovQGEITVgo+zEY0PA0xKmaa0R+We
 0vqFeFX998hhA6fGMklqfQM3TiDB0n9uOvYwPzQnjXZvBcHL46AwGJXfyFcLuPCLR/xwxwrKZj
 JsSHKR9hmbU9c6gxo4E+0H87n/QAdXSitPLhJ8RsC3yBviaRQwLkR9+kaHH7SEZG1TOE16zeM6
 5R+ZARUCQ6N6e/P96XXh4FId
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="73075269"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2021 06:25:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 06:25:12 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 06:25:10 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4 0/2] pinctrl: pinctrl-microchip-sgpio: Extend to call reset driver
Date:   Fri, 15 Oct 2021 15:25:24 +0200
Message-ID: <20211015132526.200816-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows the driver to call an optional reset driver.

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

 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml  | 3 +++
 drivers/pinctrl/pinctrl-microchip-sgpio.c                    | 5 +++++
 2 files changed, 8 insertions(+)

-- 
2.33.0

