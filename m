Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6372D51AD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgLJDmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:42:43 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39174 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730678AbgLJDmn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572501; x=1639108501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H22u4xiKw/P4g/XcfsJWee9fpfvG7aMiAyWR5GHomJw=;
  b=jd85beFVSR/5OzlcKwHkS8vzPN7aSlqsS3XBFYFmVNsOSkvn9tvpgXZW
   pAF6A3ns4nOaiayYz67hSLUz/6eCam6m1/fCicE5mxYjhPlovnXjSFlg5
   jkGqcm9Ug8C0LEG65eJd98l4texdSBHMU6f5hiaI4Je5WN8Uk7arEIWMc
   hNnEvhBVGju5LvgP54Fc6Q/njEOhTiDxkudAo6TxOipaF6QTMjoBRQNhY
   ELy6Ye9aPcj8WIi57A35ZIZpyA3ZD4ZwHeMmIwwzlDliqymKn9m5ISD0S
   adzLEamAxNcK1xJ6M4TmdsOM+2YBLWWkE0RDewLCSIBfnQqqtdbuORNTG
   w==;
IronPort-SDR: 1GFdt9oukn5Q4rE7BM5F83j7Bs+tUXq4za8Qm7RMeuYE+7mH65+hQ7Qh7rLshGhonVAA5jiH37
 t7A0y1DQjyncOGca2EQbO5yyQg00YEPQXM2uUfBk1QNsLHz1P0u+KDNlt3hL+gV/FT5doBBI7l
 CPQWj6eFtGf57MuhNUbllTQIv4cJsu0MONZZVHRuk16t63MyxNbK/yh7yWG343cLnbTTmOoEk1
 2rh3TtR//ZXNZqqh5uIITQhNhOzKUA8OZgmIDk1yS4z8asuWhmKfCp2A8l7LK+zk+NYNHymjHq
 lDk=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551216"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:51:37 +0800
IronPort-SDR: 8GRzyGS95YVqUd0PKMnx5tItYkiCeypvemHG6FPMRJHz+6BhALtH4S8PtavNIdR94yIGM+4LVV
 RdV9PElpPuOHlAR5XWdXlWykkdVr2NUII=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:23 -0800
IronPort-SDR: /axEbwi3MPwj2rIvOtkwuX8xwH/xQfgZQHA1graKYojTPpnPo27ILLjazmJP1ps+hByCbCf5Yi
 eja1+5YhCl7Q==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:25 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 07/22] dt-bindings: Add Canaan vendor prefix
Date:   Thu, 10 Dec 2020 12:39:48 +0900
Message-Id: <20201210034003.222297-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
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

