Return-Path: <linux-gpio+bounces-18903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34342A8AC88
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 02:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6ED519039AA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 00:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7312189BB5;
	Wed, 16 Apr 2025 00:16:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE89156C69;
	Wed, 16 Apr 2025 00:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762560; cv=none; b=b0rFmAOtVZ8K7FBeo53y1J2h5oVxrC2oWYcPowClW9LjAIxEu4eWL26gLhoM8b9ksvNEjp/bmpWSjg2A5kAN1dJpKzXIkjpwT1HUSuwvhpO17WQVBhC69zdMxRku1X4T5iuAJTSjuq8o3OHjOeYFvkoLaSTY+uykcZHEB4Ojsh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762560; c=relaxed/simple;
	bh=fq5AgxXL/Rbjv2xhS5kCE8LhEurOI0DQa//wPMhgu/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEca9F46gSRFuKfKIX7G6xdIdDcaw/jI1OhXnznsYDSHqOVDZBHjvg2sfPmVOe3AZm+tg6mVmdx3HM7bLZuDj0aU5MMauWwSAolsYS/TyfyzxlYgeInp85Wix2aZrVKfsDxKtCn9go2/QmKCF1R6NB/+MgPPEE04TnTYx7rJInE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8AEB0343029;
	Wed, 16 Apr 2025 00:15:55 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Apr 2025 08:15:27 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=fq5AgxXL/Rbjv2xhS5kCE8LhEurOI0DQa//wPMhgu/0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn/vawMQPl39xdOBu0MVmeiRBAO6QN71bJ05Fhj
 KvIKdPMxXSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/72sF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277bYOD/9psoPxRAYyY97+cr
 7B9lUH1knhfElEXQUcSNxBUIyoXXnLi7sZLtF42kZNoO404rmnH0HGsi7tdXcDmhWsqz1x4yUUX
 NpL33+zkZYaWDQvGX6pcmjuUCQNAjjYqP5UhVKf+HWjVty6XasLtMJleKmK+AnU+J3byeAWNkUh
 5Z2Pq8RpNjjmBifqytwbRp++wb2wlDpYDdEvhzvWmEOTQaIhH+6L4z6snkVzPVo5sUSRyJVUZBL
 U1YKLUNTYJKxBiXmeGTgMB5f0Vy9v4oOL63buQh5aplEho7JyZUdGj0XUDG2BYkIm/kbwiSWK0p
 8B0Pu6kplkMWHhG5afP1x9Lp3HKUdCoQLz46LHElcBT6+MCnaRN0dhOfmZEg9HG9+7sty8mSPSI
 nAO9I3WHclWHOcmUVRuB77h5rpaR7zrbUoa15NzLun0RCRETgYV9u3pXuuAEpVrU4aOF+54fBev
 ta5tJUDEtBNrCGnNrjtgJ5Qfs449iSCxbm/eLP7zZ5q5r4+VLl3mHh2Q/kMKmU+HyUkli1m/zQH
 iDssGyfdIK3uMIpfTQPQZBsS46V6ua2FKRt/iI5K+B/FtsvTQ4DLSjtC+6kD0/WmoF80H/B0ftc
 SKAuBcBorwsNVek2eDeT8S2R+yRMV9u4/O/U0lziDao9tiIe4MEhoNQeuUNJEVUC1qRQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K1 SoC's pinctrl controller requires two clocks in order
to work properly, also has one reset line from hardware perspective.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index b01ecd83b71b5e9f47256adde23bc8b183bef05e..d80e88aa07b45f4a3d90e8217caf93d32655927d 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -17,6 +17,19 @@ properties:
     items:
       - description: pinctrl io memory base
 
+  clocks:
+    items:
+      - description: Functional Clock
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
+
+  resets:
+    maxItems: 1
+
 patternProperties:
   '-cfg$':
     type: object
@@ -94,6 +107,8 @@ patternProperties:
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
 
 additionalProperties: false
 
@@ -108,6 +123,9 @@ examples:
         pinctrl@d401e000 {
             compatible = "spacemit,k1-pinctrl";
             reg = <0x0 0xd401e000 0x0 0x400>;
+            clocks = <&syscon_apbc 42>,
+                     <&syscon_apbc 94>;
+            clock-names = "func", "bus";
 
             uart0_2_cfg: uart0-2-cfg {
                 uart0-2-pins {

-- 
2.49.0


