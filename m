Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4146A2D3AC9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727765AbgLIFhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:37:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15253 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgLIFhn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492262; x=1639028262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
  b=UUV36Evk/SyIj9XE2AG77U9InE6xkCgEac2wRq3bG3rc1Ke+qp7snEI/
   h9vuZ+BL0IQAF/Z6ULm7Qc/aDIME3joSuBImJ7CilgRRo0j3fhyW/Jn5P
   pFauDvueesuhxJwmhsqIqroBCYGEL0K2KsK1eO4yyjpApsZqHCR4DoqAb
   4rOl5y1BoXntpLrmi2qwMEDn68HX0pFC9WmEdNyqPDSx4CDsAumcaTJ5u
   Lbl9470cM15iKmaWoyH4z9aFEy3vYa5hcXAAuvxcvM8kWiRFkxSFGqzWZ
   +zKZ3tjYM7zK59m/leL+VOpxH5RkIDtiPwok/F+2WTSjimr2ydR+omG4z
   A==;
IronPort-SDR: QzWAfRnrMfmh5EQj3toepmbkOXBz2Y3eiZnOyqu5o5vqtuyCYxCWzkCcvGXhduei7AHsvYJ+3T
 GCMNLBH+wvFB/Do8ioeQnZVYrYb22Nci9DshKIwGJfkyTT5AN4bcUpO+cITmhdxP5a9kYUw2D9
 Pv3hs1d715XbFREiFB9SuMmgM6dWuvH5K5jSKM/bSQ1AOVCjv7eIS6Dz6//jwEoGS8xXATHWuG
 p9ct1IfpvImwaPEYFPmKYsj+0IG+G2Kkuo2dyWI63p1tQfhKPrsOJSoU9JRe4DG9KD2WRfZxLl
 UmI=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735894"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:25 +0800
IronPort-SDR: LkQw1TprxVMJVKuu9BjcL7wZ7SFckt4SbYBdUoiiBR/zheVV5cmA9PIbtfrXCQF8lL/z7dDrSr
 7axA4EnZAmzp2QBnMEq5+vuvhgN6Yh0x8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:20:51 -0800
IronPort-SDR: zKlNfBpUt0XZ5WXGViO15Km0ziS4/MVtN2v6nTqayqOvRVSS45/n1E1K4FpmyaWWRceOvVAQRt
 77Vs2ROhSlUw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:23 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 07/22] dt-bindings: Add Canaan vendor prefix
Date:   Wed,  9 Dec 2020 14:34:51 +0900
Message-Id: <20201209053506.122582-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
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

