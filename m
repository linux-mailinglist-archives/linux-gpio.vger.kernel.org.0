Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEA72D2484
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgLHHgP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:36:15 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58688 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgLHHgP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607412975; x=1638948975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
  b=rUcO+iZi9zylMUq4gcd8gvVYNLcivJ2LP/COmQU9Z7P3e6kIdgNweXiY
   ip6/deCyjTb4wqR/BzMCDPnwZx4fWrD6pJavzEVPPBy7DCY1STxmOUedn
   JKa5zBAUtuurVXGtR2ckcWjsOLDtIbQgWbtpgEpZ0mstkmt1/fraieshY
   OV45fBivF4GFX/rdgl3v+AtJMyzPjsejW4n0FBWRFeEjiiwhk70zrIB8y
   o1CmJew6sTxgaUCeJ2pQ3n9iCxK7WBE8UKIlhGW3xN6k4PG+rjSC5VdJ8
   7ABhReSg+QBn9LoejZeAv5d28xXX/85H39fJ2ZRg7hl6PWkQ5UPYmhvWq
   A==;
IronPort-SDR: tuOPBRbp/gxdKOkYDhwyVLaMnxhf3Dkzb6cj/bIjfVWyQ3vA1Y+vpzr0nfbu3Q8POsp+QY9qFC
 StvBj7GvVrBdDoU0Hyd45lT1oE0msRFoHKaw6MFC87YK9lwrQt0o8W42ux0TQahA/zheFpWYnM
 zoC9qBK1NjgPnsoaf63WOMj2y2WYOKXZ00dWHkJp2jfvHY1E4JL8N3RlnVowR5nbMPCoa6EOGJ
 9KxtgfC4sVvCXs/MX3GcD0jvPt7qUHF3hoz/33YoXR//R3aX15hT7fpBO6F8+JXg1eswYwz5Xr
 uX0=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876641"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:13 +0800
IronPort-SDR: IZ+HjIYhQay+q5OB29cgzaNC2MiyNkIdzy80/xg0DCmDfZKK8/DvK3VIZ3sxmEqIgSH0zMnab1
 VRzMUkUb8OPmuz7V3pDSiycUEFbIrS1Ew=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:13 -0800
IronPort-SDR: fHV2Oo0b5HDf/fIsYIhXendaxJV2mwKrHaAzoaX5oDnmVKuxOiJysLjFLvV8ck14mRsD99Dqd4
 smXOGbW8bhyQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:11 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 06/21] dt-bindings: Add Canaan vendor prefix
Date:   Tue,  8 Dec 2020 16:33:40 +0900
Message-Id: <20201208073355.40828-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
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

