Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C68B245A92
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 03:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgHQB7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 21:59:23 -0400
Received: from mo-csw-fb1515.securemx.jp ([210.130.202.171]:49248 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgHQB7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 21:59:21 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 07H1lD8a030358; Mon, 17 Aug 2020 10:47:13 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07H1kuUN014481; Mon, 17 Aug 2020 10:46:56 +0900
X-Iguazu-Qid: 34tKBCMUDASVfMyYtB
X-Iguazu-QSIG: v=2; s=0; t=1597628816; q=34tKBCMUDASVfMyYtB; m=fIs1I/TAW8WbIDxuq+Rw9wh2MyVWdzPzvri6ct588Vs=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 07H1ktW4023009;
        Mon, 17 Aug 2020 10:46:55 +0900
Received: from enc01.localdomain ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 07H1ktpB002065;
        Mon, 17 Aug 2020 10:46:55 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.localdomain  with ESMTP id 07H1ks0d024119;
        Mon, 17 Aug 2020 10:46:54 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 3/8] dt-bindings: arm: toshiba: add Toshiba Visconti ARM SoCs
Date:   Mon, 17 Aug 2020 10:46:27 +0900
X-TSB-HOP: ON
Message-Id: <20200817014632.595898-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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

