Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C736A2D8D79
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406987AbgLMNxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:53:30 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:1980 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406984AbgLMNxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867609; x=1639403609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3D8NTC3KrPCHvVVEiTgbfIPXRYhsMwi8saVYnSZKxqo=;
  b=U4LliVZc0ciwpG8fMW+1HgkUU6w5rT4SrtDv53J0FRWAyNKqLofBODf+
   pheblABpPipTyDJvjkL8Fkuzr5+RonzpckQSbE8A7haWov7s/+vr3dK+U
   4SKbMw7VnSKgnBf+lkg3SDKLJdCdAe7zMeLV0msoPnCbxg4VCGfwmHXWE
   IQUcCeJ7ptrthA5N3Ua4+pnVWHa50YuDpND/xia3PFwTTRA35kPCHdqj+
   EOmhe40/aeXhDrItpzZOp5hAVRT6wXWr5U5GCdXRjfj1TA2I46rpvQc9H
   GX5eVQ2Kme8hGp0mPMoG5wsomt6J+Sy/EvXJIU5TWogwLmHHb9fDHUj+B
   g==;
IronPort-SDR: QfBM9djAW4O/vPZFtwwMuod31NnNAzXoGXTWPdkn5Eh7x1dPNKw/SJibJYqdbvItzb7FB8FSth
 oEEz7DET0yqSgsRlTCbg3+SiTW7SkzCn4Gg+lCg+24BDxiphZYQx5ZPR24Dl95HnXXTy6UCaLa
 CnF0Cv7L0laG/2n/Q7HNtzk0LaBZuLM5kKagm7yTtr0bVNglh/NMHWI9K60wjeaURjNLNO8/45
 CCsiJDANVkOLj0bzqNy8Bd3NxLdInOsfK+L5f7J4Ie1VLdBdoSxdyw0to0Dzm3XZWwmnCapIiP
 Vms=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494602"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:16 +0800
IronPort-SDR: +zqlijKy1bhu7oVKOnbH841x2vVIN1b613YmYx5kvDZ/WCuYQCtrR5LMObU+V2XphYnr1fvAwj
 pnJRVxRcpfzeUTIOt/kAwIqE+ra/QtJjYUJK4jyxRrm/aox9qx/ltWsjMYWVoyD1aRHcB6jWOx
 xJBYzCGEcnqzvfAWyfPSHGISGU3svZIO0boNRO+/MpeQXw/9LxRt8iU6v7R3mtyRUiNZSA0qm5
 8Ug/cgXsouGYaBlRuTx6wwquRCBun0MmmjxH1lVnDO2oLwA9wVW0A7ql/UYHVfsntcPN350Xzq
 YUrboUO0mtRb7Q0lVJwerP5Y
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:35:01 -0800
IronPort-SDR: l4m8Z/DvHEZ3IoUae9HZPOw+I8LMPAhiy2acixk1JLJoFWEJori+6Iw0pzYymG00wxqF4TQTWb
 H+lAzyepBdaG4Ff5NdBg3nN2onYGtzqa7E62fAhBeM05wD6Yb/q2wGdB12N884381y98XlqAn6
 OfQkFI0dTnBG4vOfyZ/2XbC/e1DTNuGvAqdZhuj9dbvQZMNF2xGVGPIXDOsQk3xfGjBFjn6a8x
 vxLQ2ISNnBNYubuxBWTH/uItI2XxUMHnHby7tuI/9ZgodFviZs/quUHa+H2NFvwFfUavUZFCiS
 Ng8=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:14 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 08/23] dt-bindings: Add Canaan vendor prefix
Date:   Sun, 13 Dec 2020 22:50:41 +0900
Message-Id: <20201213135056.24446-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.29.2

