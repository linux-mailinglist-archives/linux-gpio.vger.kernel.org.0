Return-Path: <linux-gpio+bounces-6817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 880208D3303
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BD0B26A72
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A160F17083C;
	Wed, 29 May 2024 09:29:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91B16A379
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974989; cv=none; b=pvzm3ZsHZSSse2oxKQdI3XinD/zfaZhIC7F1IKEd1lOyzLXzOukrY3La4PO1FPIx6O6UokQBJzJ2HIpHx6xKACE2XYRH+K4rJvU30jY2a5kZG6ELBuFLV2dNH49FAFFnLoeEQd6z/o6Uf/CPSnPbJ7nisi0p7dK2ntCroJ1q7J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974989; c=relaxed/simple;
	bh=K9JbpboeEVGszs4uTMo3Rfibhk0VjLLtBuNKn9PsLKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QAL3VV+EUEsQVmCvxeujSrCj9sK8wlItCWOoYFOmY4QgBBq43L2XTsG3lecT4VyT7iGxZN7GQto8JEz2A0x+9zHBDHpWE0vmI3HmHOhs3dqA0SdZVChmHzBxcx76lJRfdZpVkJfzGlRzdSU1ZLINEDSrmU5g1hfBRJgv6NnoFPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id UxVg2C00g3VPV9V01xVgkh; Wed, 29 May 2024 11:29:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFbt-00GHKZ-Vo;
	Wed, 29 May 2024 11:29:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFcq-008wRu-Cd;
	Wed, 29 May 2024 11:29:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/8] dt-bindings: fuse: Document R-Car E-FUSE / PFC
Date: Wed, 29 May 2024 11:29:30 +0200
Message-Id: <03e43e97941df238ef1a618852aecd7be68adbb0.1716974502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716974502.git.geert+renesas@glider.be>
References: <cover.1716974502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for E-FUSE non-volatile memory accessible through PFC
on R-Car V3U and S4-8.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 .../bindings/fuse/renesas,rcar-efuse.yaml     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml

diff --git a/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml b/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
new file mode 100644
index 0000000000000000..d7e289244e72cce1
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fuse/renesas,rcar-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: R-Car E-FUSE connected to PFC
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The E-FUSE is a type of non-volatile memory, which is accessible through the
+  Pin Function Controller (PFC) on some R-Car Gen4 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779a0-efuse # R-Car V3U
+      - renesas,r8a779f0-efuse # R-Car S4-8
+
+  reg:
+    maxItems: 1
+    description: PFC System Group Fuse Control and Monitor register block
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    fuse: fuse@e6078800 {
+            compatible = "renesas,r8a779a0-efuse";
+            reg = <0xe6078800 0x100>;
+            clocks = <&cpg CPG_MOD 916>;
+            power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+            resets = <&cpg 916>;
+    };
-- 
2.34.1


