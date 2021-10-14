Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB2542D589
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhJNJAn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 05:00:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:31893 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhJNJAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 05:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634201916; x=1665737916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6ERzaviBGE9gRkQRs52lHzKzv/Gbwl17DQLyfGhip0=;
  b=Bz4H9ZPW6omPUdSlOsxLkljel9v5A+FzKKP6MMP6N5Wia1eujmEW3Cdf
   0kE0lXbRZjIquqaB6KQvr48QXNN5ziIVxGv1hC/5tq0AORxzuNIX9CFsY
   ++4aifDHe3QYp2gKJf7APyY4pC6LwfuH1qHnTP8cLDNv3cMAw4aswAfsW
   RuCecuDfb8y1MFp2PZf0hCWGsbW15RV2AnXQuVgzfxucUYzlh3ciNMZyg
   +Lxlb+OqhiqaUqspDRNa3OfHaLbhouHC/ZsVYXj3x8G9EBZR4hdt0s4Nw
   sxO5rIPnhn7y8i68u8F2tddT5PzOX60tv+fWMnrK29PsPI5xQoFj+t0wI
   w==;
IronPort-SDR: GPGDaDGJWLyrVgrr3balPbTJR1GW7k30Oes+iXGYIadrse7cffwAMjTMeqyAVrotp905VlX55L
 dHV7JqdJukFVFbdi2yudfUaqerkkZ/hfdjlvjR8uBMW3B+DF1c/wPH24Flssio7G14c4lUzk+c
 y2RmziAfwMY4nY14DE4BOqf18snMm4xVlfM1tDMxOsb2Yd/0mY/N0X4S+LfxNOquP0pf6MDY8t
 K8iOtzDVnkClU7r3uK858DFaYcF5VRHTczU78Gw56704vMczlpWWIFVCVyGeiFkbfnDO/zSQLW
 2FO6aik5K3AlNnmktunaY2xB
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="139676508"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Oct 2021 01:58:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 14 Oct 2021 01:58:35 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 14 Oct 2021 01:58:32 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Thu, 14 Oct 2021 10:59:28 +0200
Message-ID: <20211014085929.2579695-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
References: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
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
index 4fe35e650909..d7b3aa726e1d 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -68,6 +68,12 @@ properties:
       clock, and larger than zero.
     default: 12500000
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    maxItems: 1
+
 patternProperties:
   "^gpio@[0-1]$":
     type: object
-- 
2.33.0

