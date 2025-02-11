Return-Path: <linux-gpio+bounces-15773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E8A318BD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41E65164F14
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50A426A09B;
	Tue, 11 Feb 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qeFFQ0zF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09AF268FC2;
	Tue, 11 Feb 2025 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313497; cv=none; b=DEiPIdI8OX1jXv/WytOGKHywNDSHrLpAl0aiCPhz/mPeW98Cax6azoMyE0v3KSToX4k6uSl/XIQSzYCoxaq2kRUOiMlsGE6q35ZM0v89JebiQv6c0jJaJS26Olx8iOusR0DqOgkicaDHc1ZmBRdzWcJf2X+Crwx5r4D7VGUTfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313497; c=relaxed/simple;
	bh=jmyK6OmAW4qYROU6mafw3Xc/B3JfTXW89rYfmgZBrUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNOn78U+Re0JIDmPhMTtFKDZ0HVX9wOme1cIJs9hVnYXCSfDXCdCMO0x9Z8S7LYVDP0PtALLISrw1o5VPz1CRrrKSMQwgEu2Ls7KVQ4n4M7L7Ui+zJ0LvyM5wy3/vBvBWgoNa6doNMtDXDV3iWUDxijrC2tIlEdpWVUn/WnidMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qeFFQ0zF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id ABE57E453A;
	Tue, 11 Feb 2025 22:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YpI4LDOINdeyIvkPaxY9t9lhB+DY2CS2HQIavrdvgdw=;
	b=qeFFQ0zFJ49j/KL/CLyJT7gBDrYgLuuHFW85mt7URcN2k04oG4WjHdqWIZlGBdgo7Yx1SW
	L4InU+VVShDxGCxJODiQuf5bnTsuaJe7732zOakbFeXG6t18FwWuxoClRNRdDc3z/zhBFd
	+aWPkgeAZE5qxYmimDt0s828dzUvkLF10a66O4zAJuAjDb4VQkqAAyf+1aiZcJrg+pM8xf
	VJeR9DdOmBva03YF3CjLgiIbakGKOxx7ugdG6WAttlDJK85fnw/ztX+KsgIR6TQyIdDfuY
	wW2E3AQHtiLHc8JaqAswD759vYvnuNDt2av9+Z7CdRREsqgYQtJzHH+g7FPDzw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 11 Feb 2025 23:37:45 +0100
Subject: [PATCH 01/10] dt-bindings: clock: gcc-msm8917: Split to separate
 schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-msm8937-v1-1-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=3709;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=HvgoiBX4M/pokAv1+f2Nk5xpaoeVGWOJhvn5e5Pbucg=;
 b=3R2/vaiVoJ6mof98/3ib2TxRX47spduj6OYzUAfcerShpoVoEtqx6NlCWPVT08I4qC5HzBdNp
 ZZGng50sXhCDTMQIOg0u6o5kKmH4kZNAH7sYe9F3m+rRdU8+CKgYr7x
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

The Qualcomm MSM8917 Global Clock controller after adding support for new
SoCs has different clock inputs, thus existing qcom,gcc-msm8909.yaml was
not describing it fully. Move the binding to it's own schema file and
document the clocks based on DTS. Add driver contributors as it's
maintainers.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/clock/qcom,gcc-msm8909.yaml           | 10 ++--
 .../bindings/clock/qcom,gcc-msm8917.yaml           | 59 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
index ce1f5a60bd8c9dfe60a791881868337d3e1723df..5a4ff4f78d4e1d9ecdc06ec171f9b126194e3bc4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
@@ -4,25 +4,21 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8909.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on MSM8909, MSM8917 and QM215
+title: Qualcomm Global Clock & Reset Controller on MSM8909
 
 maintainers:
   - Stephan Gerhold <stephan@gerhold.net>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8909, MSM8917 or QM215.
+  domains on MSM8909.
 
-  See also::
-    include/dt-bindings/clock/qcom,gcc-msm8909.h
-    include/dt-bindings/clock/qcom,gcc-msm8917.h
+  See also:: include/dt-bindings/clock/qcom,gcc-msm8909.h
 
 properties:
   compatible:
     enum:
       - qcom,gcc-msm8909
-      - qcom,gcc-msm8917
-      - qcom,gcc-qm215
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6e567b2a5153af9bb32958154633d6da5fd1cd50
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8917.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on MSM8917 and QM215
+
+maintainers:
+  - Otto Pflüger <otto.pflueger@abscue.de>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on MSM8917 or QM215.
+
+  See also:: include/dt-bindings/clock/qcom,gcc-msm8917.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8917
+      - qcom,gcc-qm215
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gcc: clock-controller@1800000 {
+      compatible = "qcom,gcc-msm8917";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>, <&dsi0_phy 1>, <&dsi0_phy 0>;
+      clock-names = "xo", "sleep_clk", "dsi0pll", "dsi0pllbyte";
+    };
+...

-- 
2.48.1


