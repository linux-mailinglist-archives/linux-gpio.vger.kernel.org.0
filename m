Return-Path: <linux-gpio+bounces-6815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC618D32FC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BE6EB261D1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4771B16A37A;
	Wed, 29 May 2024 09:29:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B216A37D
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974988; cv=none; b=ocTEImOShMQHOi2d8h3LTWrdt+Kbrmb1gXVJmALrLF2TzSM9mJ0qnt+OaMR/RZw/DwpQgbV6cuEkPKFsj9L0G3U2034pdeMH+8efxBUyuVgiK+8OhEj+Kmt4iA93ik+6hSwB9nOcmqh8LGehawJPjSVJFCfz5nxBlccoy050zFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974988; c=relaxed/simple;
	bh=Fimg7RAC7/UiTVwu8Mu0fP7Gwstf2zrA/lN7Pjti7Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e1LEaEg5ldzIXbiezhKTDFAOYElDz/chQ+URC7jBbOQ92cQZ2SFecyGjNqB8U1EJ4XHT5HfkDh8bdSJAaDH22PuE+Vw52Y4Vh0/dKZJhdpiXcOmFt2KglUIrDTNoK2NQlmyg12/KNhB4kXyailRpnh+K67FUnGicrQZCd/FSjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id UxVg2C00i3VPV9V01xVgkg; Wed, 29 May 2024 11:29:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFbt-00GHKc-WE;
	Wed, 29 May 2024 11:29:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFcq-008wRx-DK;
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
Subject: [PATCH v2 2/8] dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
Date: Wed, 29 May 2024 11:29:31 +0200
Message-Id: <436506babe4ce468fda19380d9373470468e3752.1716974502.git.geert+renesas@glider.be>
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

Document support for E-FUSE non-volatile memory accessible through
OTP_MEM on R-Car V4H and V4M.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 .../bindings/fuse/renesas,rcar-otp.yaml       | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml

diff --git a/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml b/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
new file mode 100644
index 0000000000000000..d74872ae9ff378f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fuse/renesas,rcar-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: R-Car E-FUSE connected to OTP_MEM
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The E-FUSE is a type of non-volatile memory, which is accessible through the
+  One-Time Programmable Memory (OTP_MEM) module on some R-Car Gen4 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779g0-otp # R-CarV4H
+      - renesas,r8a779h0-otp # R-CarV4M
+
+  reg:
+    items:
+      - description: OTP_MEM_0
+      - description: OTP_MEM_1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    otp: otp@e61be000 {
+            compatible = "renesas,r8a779g0-otp";
+            reg = <0xe61be000 0x1000>, <0xe61bf000 0x1000>;
+    };
-- 
2.34.1


