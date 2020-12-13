Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F93E2D8C32
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392896AbgLMIMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:12:50 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32104 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390682AbgLMIMt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847169; x=1639383169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3D8NTC3KrPCHvVVEiTgbfIPXRYhsMwi8saVYnSZKxqo=;
  b=jxpTj6cXRRC/tC73GlC0ODFaeBnwDpq+23CGXFidHAZweTW0KwDWR8sG
   /V85jS80Etz80XXVPyjITokt2AJhtNBYzRa8FJsFvfCkCnGrbSdicWp/M
   Wphj8EsnSjBdfAk4oVP8noL7ERht7KQ0I33tBr3M4yMQmwo3friSVmHSr
   y0mpxCxVmPT4vU1lzHjSvNHvt0Ya6Egrs/xilvkv1ulBlN1TY+FKldDxq
   2g8VlHrL1YaTdxZPnvtzPhO1h6Ixf0rVph01YEZpUvM+QHAnnL7pS2Wfo
   vBQ2k8EjcAF6JPB7HLtzGs4Cieeb3Og5cXtWZi0vesDnCLcxqzyHVm0HP
   w==;
IronPort-SDR: OT2ud0y2W3SIdizz/nULECKHhXm+boKOVGL4Z3lYH/tymsJ9zzyAZfy387dD4INx5s8RaVGsoS
 ZMShlzLxLdWVp0pusr/o1M1I+fOWok7fO/TSPb9hYXAiMyvX334Yqz7onAjmDhdOlQ2csdOtOX
 cSxfsOyCTViKgrO5nJDMUcNchaCe4C9+lq69KCa9lT0ToPWnfV9htCIkm1+M0liyoYgc+4H6vO
 1LCQTtsjXn6YfYx7DHOXXDbBrSX8TRqQ3u+MiJ9IMBVY3yXcOYA/tO29KTC7Lx7d50hLDJCIo/
 Ets=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208177"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:35 +0800
IronPort-SDR: ajSY6eIZGVEkiC2S9jg8PsUFw0kU0gahYWcc3EB4ExN9wnZBxJDcip6Laej//dZceZw+UEt8I8
 pVw8ZT0+pTNKa0OoAPgOXkn/j2mU00qgB7YX+oRvYv311pinkpQmc3gzH4bu8qgYJneihF/yDN
 dw34/vVk6pqVBRS1hDCHTBZxR292pqNq/rcG3M11op32snCAkxpk925c0EV02OgiiduxX+Tp7P
 zWJMDIv1H3v630ZF5KgeqcnVS4rlRFOkBooIkVXpR2jJ4MJpgpgpu9zlNCN6rKnU/MdC9S9waq
 UwYdxarA/HEEXGZ2e5xvWX5F
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:55:56 -0800
IronPort-SDR: HNl63QyBwdR9TIvczWVWP/OZpr+/GPTdyUJ9NffkBPs798oneh08ONbUuJ/6wEq7fiY0/+gnu9
 SAL0+5s2wBH08thcnO4cZzPyazgfE1zN6jk27f7tAM59C+Rx5+BQIWbSDiSwmWeVRrOU7k8+zY
 1r8MugtRfM2qNCHtNJPjlR0xjbHdnzQLJ4G3vODnwYIRZ6w22ISSh3YWjK1i2TAk0IVpW0ynY3
 lOXtkbKks5nvfG0YShYyAg4BSOXL175HCoZoXrSwr4/GrFM9Z6u+Ww7CADVrw+G7XbuGcfKkkJ
 GRo=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:34 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 07/22] dt-bindings: Add Canaan vendor prefix
Date:   Sun, 13 Dec 2020 17:10:01 +0900
Message-Id: <20201213081016.179192-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
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

