Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B154E431296
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 10:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhJRI7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 04:59:00 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:11987 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhJRI6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 04:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634547405; x=1666083405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XJ1941v6zZfSvZQKQMytePL/8r8njzCROg8alY9Add0=;
  b=HPjsxQkP5XeBivmqzBJmo9QDg4O76NMexRkfQWbwhhxwTM9oQN4THzwf
   i6G7b/B93guwU48YX8LEPPp7+JDdOd0px7TBk7wVutgMmHAZmtQjK3/E5
   LMz09qxTb2861999EElZ+31rYeT4/9nAPlO8MWI63WmLqwFaJcwap2CaN
   44bZK66hoASKOaCRfYub1EE6rPCvsJsF7/E9YMkc8wPDLvnAdVy76Vy4r
   BID/QA9WLCorZrtxQyIGhlP84BBQOahrpha1UNAurzTH2fCjTNKe6q9hq
   h/9bY4MglC005yNWhsViKb6Bk0BuOsEarHJig0GJimZIawZjBlLPLiFfA
   g==;
IronPort-SDR: 2HLXB5salHeherzJ3jNuI+e277GMUuKMzrGWSQC/2UH36sibK7PP70Pr/BSRkX33UfkslqmG8z
 5lEnx8Mifcj0KSjcKLeWfwevYH5P/MvMB9bmTt49JdlSnOxX69QLJwPdq00q3Olu3mk9+m2SlX
 h1dMlzW8+FCZa90lHxUAfsRvN/jD7pDBqJgkS7QFaoY1Da55cIHaYGuvgCMw+PRPkzgxJJVfpJ
 YAUtOPkumj3U4A3T7CUkxdDqfFGAGooWJcOpBwXHqbXjCKWWOaDs1I7dgjgGO5eZZXmdIgSr3/
 QnjqSDZP/2iegpLdHT/uYzai
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="140703344"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Oct 2021 01:56:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 18 Oct 2021 01:56:32 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 18 Oct 2021 01:56:30 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Mon, 18 Oct 2021 10:57:53 +0200
Message-ID: <20211018085754.1066056-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
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
 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index 4fe35e650909..cb554084bdf1 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -68,6 +68,13 @@ properties:
       clock, and larger than zero.
     default: 12500000
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: switch
+
 patternProperties:
   "^gpio@[0-1]$":
     type: object
-- 
2.33.0

