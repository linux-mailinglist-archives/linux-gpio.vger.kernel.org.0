Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EB542BAB0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 10:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238612AbhJMInn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 04:43:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19610 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238576AbhJMInm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 04:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634114499; x=1665650499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nAIU5mKHgPCnMlpSj8ZGVDM3qQQtayRKJ1dDO6fPSac=;
  b=t0ClVpLkq5x2NncG2Ws08CBfAS+NLsebCsjPD5CjziMZ5RFsPM36be7u
   YWA1sRG0bv2fre0CESoQpkKYvQ+b1lJ0MPmImUTmyOsHTpLuOsBjCmLlT
   xu4ocfYvHmwfbFAkLNuHHkF6GwLDcLerZ9Fu/5y34t9Lt33A+ElN2s6od
   AAPd1eN1W2urV38/kTOYVwvbXs25c0l5rzBh9+HnCYco7acEdM70zEIUn
   P3djfHdagCZauurUAx1GEWpuH5oKGSss7tjbdKk2YRF3UzRbZnwzBqWx0
   NPYSK71G5I63JmMQBqUsgt9bd/1THBN0uT4CtW6oBkHIwZkVPNiZ3eFT6
   w==;
IronPort-SDR: p/Y46k/Fcpk/SgH2SI8cbozCXYIxNE3wPPNNwDzVck3LD75kocK6+6AA1/3Lf1Ms+TvM+XovO4
 FaYzrKKtucskea03k5uoOGk++Ww3EBX3lBxp/5H52Nfa3BxBrsjuc+q47aHEp8acEmGf6IGyx1
 1Cjnh4FsMP5dIYeBhcJ/HPE6vmkREtZiKFYdmkw5z8b7BxjiIz0jgY8majdWbPHUApplJNqu5e
 VMBwWM4138Hb+uwUH1vJ/kxGYlF13IjABssFZI1qMHh6RhGzYbypvMu/+9GdvaqwxxPsUeoraL
 AZCZVqLbHn4p9BmMX1Ku9cvc
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="140121174"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 01:41:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 01:41:38 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 01:41:36 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Wed, 13 Oct 2021 10:42:16 +0200
Message-ID: <20211013084217.2298553-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013084217.2298553-1-horatiu.vultur@microchip.com>
References: <20211013084217.2298553-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This describes the new binding for calling the reset driver in the
pinctrl-microchip-sgpio driver.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index 4fe35e650909..b91f9954ce01 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -109,6 +109,12 @@ patternProperties:
         minimum: 32
         maximum: 128
 
+      resets:
+        maxItems: 1
+
+      reset-names:
+        maxItems: 1
+
     required:
       - compatible
       - reg
-- 
2.33.0

