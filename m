Return-Path: <linux-gpio+bounces-18728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9BA86B6D
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 08:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D67699A52C7
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79AD1993A3;
	Sat, 12 Apr 2025 06:58:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37829198851;
	Sat, 12 Apr 2025 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744441119; cv=none; b=cdv+TZggA1UBE8n6SlXU3DYkp5mksyjNQr1Fs+UlLLmf6VlDt6Kyhz4hlstzdUO/H7j92dMDFimjQH7kWDlb+84E8H+x92FN9cXd6cTcVllPaeGcLxi+64T4NACiOZuhJ9czxKz6N3epWoKz6waJCCnTbMEEWCLCoteCrNYM9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744441119; c=relaxed/simple;
	bh=uKJ1ad2lEp8x+k7QGXDQ7nI3Inkr3OfFpOyRlBwB+tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmxKxTqEyaDuZSIcpeNJ924y20IO2Tw8vUci6H8paBAZCY5A2b1aFAC5C9uw/wvzTx2T/b+HNZ1B7KsMTgrWoMz501xbSvm0XADrgQ+KxmUvzl1rptjGoj4a59j23ZNpJzKI3C667BCkkPjTgKKhcAjLXuoRF2szmqHqac2C99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 65269343766;
	Sat, 12 Apr 2025 06:58:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 14:58:10 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-02-k1-pinctrl-clk-v1-1-e39734419a2d@gentoo.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
In-Reply-To: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uKJ1ad2lEp8x+k7QGXDQ7nI3Inkr3OfFpOyRlBwB+tk=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+g8PwS5rkTkGPv7pYBtVVDAv2Rd2NhLPo+uM7
 BU/jxS96PCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/oPD18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VhUD/9Lb/o9rZJSPCqKda
 TIUs4eLUXx5udi7wmK98AsGxqxrv6J8oQkroLcgWMc1j8EWBIw9UASf40zfl8hNGlPVoj9xWay3
 +5qq0tpXOSoXtstuBaynI3dpinDYP6BEGs4IQMOOv5Qa9QA17uKJSJvc9+NxXRPQwad3ECrF60J
 gnDx4KXgg0fUk01V/vb5NWg1HuP1rIrxt/qdlD3ckvU9FFOhtOFAJxeEuZI57kZ/rvNSZTKa+rh
 lTfbSSg9nCzeXcNtFegVTPVJteo4sHKxrQP0mokC+y6AjfA1NRTi2AYMGXd5TpoF/EfmV7CQ7jp
 ekQ4uB8KmTpbOV6q0stc3h4i+Cg0/8SV2yi+aMEEILWz8M/XAwfaAN8CBWueJL2PY1nLI47guCq
 GxmKORVr7zdw7nfHfOH7LySOUQFf7PEPiPCpmw0e7eF9eQ+K1WxCAuA7DH5ixSFmfEoXulHm6iS
 jh1n8Ok4SttdfsrG6cqqtW8oSzPfQF4jogNZFfQkLVt1Z3bzWPLoUF5q4sXX/miHzJ0yLYrBDKt
 xpFRtr4GsGaohZObqa6pWhTQgvbYpGVoLOi5F5qN/MOH+9ETy731DphGzKR7P2w/g9ncaj9qSPU
 4x1OamCRjtQkqUdWAOiwZw15HTaGhlyVBNZ04Iy9+y/itDqxfhblmfL640LRBGHBv45w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K1 SoC's pinctrl controller requires two clocks in order
to work propertly, also has one reset line from hardware persepective.

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


