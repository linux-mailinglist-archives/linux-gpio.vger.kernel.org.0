Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6A32C9320
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388863AbgK3Xuu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:50:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7901 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388786AbgK3Xut (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780677; x=1638316677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
  b=NRzGCr4wjOX+jxX097z9xw2d3t6uQxmeFhpXrUPA2FeGA+fNjEA7VO2B
   jL/0pQKDKC/8axJ/M0ZqE0SU6eN+pUeTn7FYZpz4bnObBnn+rUAznjB+y
   2Im1at9IunIaY7UNzhOIh+B2PdDNs/+i0oCGNe0FUaN1TX/8rASoWLeJL
   Og2h96eqTgMF2NS55wS7pKXJ9Rn/pEhdLo7h6nOMpyB0GUOJRDSd3gwYw
   eAjh0gsV74H62q/r2G4l283SaFw1bCv/uWWwVOjGOcrEHjhkTQAkJgpQD
   UlBtFHuWHh6mrdDrWoed5AEvU54gPB2JXiKynWPjsGOhZRg+gozohP5cc
   w==;
IronPort-SDR: WwdDYBn9tVM/TvxcifTYnRtPHYUdrK34u9wp1hIgYwSsGszZUHK3jUibzp+jOwfbZ1DUVwqmiC
 6f7a9iC0r4zaMaUeu/1bKkm6K4t/jR0cofWZD99vIanKK6yJ9bSNNC3zWiBFvWXet0HXccHPpJ
 W59pv+JER5gtIqkBNDMbk0Nm4rIU8BbjVRCnGAqu9dN7ik0k5kbZpuvH4AD6IHbsb+lmqjGe7j
 ELp/eB0J3gaNEm7UR9mY7udOMyRElxZ1Et/ldF0YwPqQRne3qkE6czn65+WeaWdqWhs4GzLRKH
 SOU=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538300"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:54:51 +0800
IronPort-SDR: 4aiXlbOyfspoKowWN9532brmwxnnDgDHcLA+Fhon8YiZX4balc7TbOPf7grVxr8m2RGCNirfOw
 Z/ySFOIvsWXlRPDNtO7jlQW10rgdhxU0A=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:33:00 -0800
IronPort-SDR: YBZgtDEsIaewdFEfS18VeZvc05KlbVKZRdFWRPrN8LXeWhxttqcZJJ/SN500Ro1M8EmZ8TQq2q
 E5NmWXLdVv7w==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:45 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 06/21] dt-bindings: Add Canaan vendor prefix
Date:   Tue,  1 Dec 2020 08:48:14 +0900
Message-Id: <20201130234829.118298-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
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

