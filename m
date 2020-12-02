Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FB82CB354
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 04:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgLBD1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 22:27:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:25514 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgLBD1U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 22:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606879640; x=1638415640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
  b=AXyTC66GKmQYTQF0dt+6QF0DLKjIyPGWWSafFX7cm2E8KMd2p2cXatsS
   PFhPeWE5bdSCni2+rSVJ6Q4Pom9RXGtKDEB/kbkgpg1W/G4z0zoHFfCCI
   3tJ1K4bbHrqp1JlIotDWsYy3m+1WagGpNs6FtVZFES3iMPgysy1Yoj93O
   G6GWM/MpgPHK9/2mFxg+0XwGK88mfQ5kkIZsVbiYS2Vy0M6mx+/pETQK1
   3o98WfTuGZpxJau6YSBHaU62RWgyKeSqYBo3EmQnYWtq3uPPuGWFIDumo
   Pa/Epf4DfwgkS3QCjBNXF7r1GBt+6V2hA2Tn8BhnwVWyHmL3bwIZ+loV4
   Q==;
IronPort-SDR: MiquEFU7dZXRVNxyKY5DnE24nvQZQcByHrHkU6nybePZAgeYUdmRkyNkVnELS2oXpMNlvLcn69
 r3eQQrBT57Pv3IlnI0hnYnS0MLHb27y+2vPD6kmi4MPiloWqgb7WD047oAogSFlCRUsHxMwWs1
 AguGk4Eb+CGnHdlGJQZg8gglWyvJyBi8vqv3xtYW+CV5To6Dsf5uvX+mbsLCmH39EerE4hOKqB
 lMT0AUrLYDmB1hzSn3kvA/yXCL0rNb3WYcPotqR3R91Fg6EVAT1vTo5FRQuAA0i9FltevLOXTv
 SWc=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; 
   d="scan'208";a="155183538"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:18 +0800
IronPort-SDR: ick4p12+tU5xj2LgDY4CpZt5fGEvVqdGMAi7q5UTGsZNhLsr8XKXobHQUxoSAgPqosL3oWcNGw
 JuBBBdgtqb2pthV7xmL4QDrsAxXpuBCqY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 19:10:52 -0800
IronPort-SDR: UMhMI5JpTKFTKtGn3DdPgcnteq6sFQbPAFAhYdqYis0wcnyiFOQHHg7zCHQa34l1OAI8NH8TsY
 xiEIwciQRj5w==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:16 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v4 06/21] dt-bindings: Add Canaan vendor prefix
Date:   Wed,  2 Dec 2020 12:24:45 +0900
Message-Id: <20201202032500.206346-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
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
2.28.0

