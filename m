Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B572D5CF3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389953AbgLJOGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:06:12 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5149 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389899AbgLJOFu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609150; x=1639145150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H22u4xiKw/P4g/XcfsJWee9fpfvG7aMiAyWR5GHomJw=;
  b=fVDct0MzYGdZDpn42kjIBHqLwpAg97CxlM5HB106p/JY8b/uCzyt2hy/
   GwB88ui0cyj4ivVPU7WaVdm47cRDiGSL3DYFmmqgMHIfUqskplUCbYiHq
   7iRm+C1Iui15jWx1By7l6irGzYrYlK9SguDEuR7EMAXEqvWN0eio+GlCL
   f8MpGx96AjYiQN6HF2XSg9Sqgrzp3AbOfNniLy7JHAvNhCaMCk5ZLIR3Q
   4UoBrEHOEJFk3xKLi/t+claRfDDl4trvOduasAVbXqNWu3pUFL1U2B3Zy
   hrdrQ/8VC/TZKJzzRzato933gLCQNr8qJe0Kyv1tdZiKuDvXFLaXNSkgm
   g==;
IronPort-SDR: Qepq/xR+QO3hZpgWNhIj8vWq/ELI0rnI2AgRhjgrCQdPAGcBdr1n+Iuxh14yAUItXmI6aGlMYP
 l2kY60I3c3MwEBht1RBRmjEhGPOTDwupzbGCNq1TprCFGn3gpkWoEWv/Ls7b/tclIPTbpn4Dhv
 FhwLvR5ay8axntmm6TO2dBiCSpL7dWLxO014qU66LVzZ/fUJx0toHRBYUS++Qf+wuU+arNLHTn
 v/yn1/eLM0EcjjbHw0voOMQm0e2TXhs/6nkFAvBihisFY//iO6h1oKv7c7YUth0KoHhpWcq+oo
 uQg=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316710"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:32 +0800
IronPort-SDR: rRNrZfeswQXO3h767QkSPL2cxfWADCL8/OZdsDtGoJNhgSil45x5Yw/8/4b82ZH9HXzBCYaJwS
 nmITycEDCL6uqOPXjR4rKzhLwkrrmFmjQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:24 -0800
IronPort-SDR: C1L/DOiilQxvR/D85ESfOrQn5uT81s4MpR9XLd1buS1LZJ5myMNvaJxHHN6oeriOSDXde/kI61
 7KrWc+AJd0jQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:31 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 07/22] dt-bindings: Add Canaan vendor prefix
Date:   Thu, 10 Dec 2020 23:02:58 +0900
Message-Id: <20201210140313.258739-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
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

