Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A763642F5C7
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240592AbhJOOnx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:43:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:8966 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240598AbhJOOnw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 10:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634308906; x=1665844906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI+/jkZ9HIZYKKCL9WS4VRlk6uYGVABKF2GuTEy4CUE=;
  b=Od07SKp+OxPbztlkIgz0qfJixFLPv2CTXTYF9x1AKUqzKH21/IQ0cXs0
   6pR+Yc4j63d/DcEC+h5E9SANm9UC/u6yQ8QcnOGSVAgcQVpOH3WUKVdK6
   1Bo5aRwbAPNJxWylQkAWYzWRpV88ufx/yEs5245prlqEhk+xUvnVlfKWr
   VPZbppd+YR+uBWqFY9yLGb6JEIHpzsJQzq1QhXDB5xC9gVgzpc0yxfBdY
   gcR4JEheMZdpJXM6Wci0qtRzexhQ9+7eq3El4JfIBD7Csg10fvAJpm4DL
   NAjHV35GytSE1u/BfUshgay6kpnzv6hn4yjTcUxQ6K+yqOriml3SIPohA
   g==;
IronPort-SDR: S8bnbHJKd3hnY5GMO5mf0j15bYEjdtGA0FRN7vUuRYfPuOEbYEmldYEhPaE4q02mT8NxSewEBJ
 6VPnuKEGczpqHX3BCPbl9Z8+vPjlYh/yC4trEMNZQLE9Bu9SFcUdO+oTqXHB2+BlV2fpnCCLkP
 jFsktz8LzOJtqKGlUyqIFsXY4rbWzVLIvgtzzRVjP2XWY9L3jVdoq4/ZUpOQK6TDfh2S+hr4nT
 TI4nLhT1HCISWHmay4QKzz17C3S6bgCsjWn7IyChAUuyzBN54UxmfX/fAKftTvF7V+9H+dHhDE
 Tw3L9B7paliSNcDFzZQZyMGY
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; 
   d="scan'208";a="140437677"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2021 07:41:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 07:41:44 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 07:41:42 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Fri, 15 Oct 2021 16:42:58 +0200
Message-ID: <20211015144259.219909-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015144259.219909-1-horatiu.vultur@microchip.com>
References: <20211015144259.219909-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This describes the new binding which allows to call a reset driver from
the pinctrl-microchip-sgpio driver.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index 4fe35e650909..b0b7d02a57e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -68,6 +68,9 @@ properties:
       clock, and larger than zero.
     default: 12500000
 
+  resets:
+    maxItems: 1
+
 patternProperties:
   "^gpio@[0-1]$":
     type: object
-- 
2.33.0

