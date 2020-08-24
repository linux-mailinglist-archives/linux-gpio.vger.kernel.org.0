Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAED24FDDA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 14:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgHXMb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 08:31:58 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:46334 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgHXMbM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 08:31:12 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 07OCUIZk028782; Mon, 24 Aug 2020 21:30:18 +0900
X-Iguazu-Qid: 34tMJPQphi6dON98vh
X-Iguazu-QSIG: v=2; s=0; t=1598272217; q=34tMJPQphi6dON98vh; m=m3Y8GLTJsMQ3hhhuehO0QoVXv0KQHF1I8ozbvJ25EEQ=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 07OCUGZE025664;
        Mon, 24 Aug 2020 21:30:16 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 07OCUGSP018040;
        Mon, 24 Aug 2020 21:30:16 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 07OCUFh5032290;
        Mon, 24 Aug 2020 21:30:15 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 3/8] dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
Date:   Mon, 24 Aug 2020 21:29:52 +0900
X-TSB-HOP: ON
Message-Id: <20200824122957.1392870-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for the Toshiba Visconti ARM SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../devicetree/bindings/arm/toshiba.yaml      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml

diff --git a/Documentation/devicetree/bindings/arm/toshiba.yaml b/Documentation/devicetree/bindings/arm/toshiba.yaml
new file mode 100644
index 000000000000..efd3f4859669
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/toshiba.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/toshiba.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti Platform Device Tree Bindings
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Visconti5 TMPV7708
+        items:
+          - const: toshiba,tmpv7708
+...
-- 
2.27.0

