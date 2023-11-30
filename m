Return-Path: <linux-gpio+bounces-794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA07FF836
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0761C20C7E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A815676C;
	Thu, 30 Nov 2023 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbtrIlzh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF946432;
	Thu, 30 Nov 2023 17:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F95BC433C7;
	Thu, 30 Nov 2023 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365288;
	bh=5A2nMF8bQazQm/PANboitp4avpKZMzqlSbhjxjKug2g=;
	h=From:To:Cc:Subject:Date:From;
	b=SbtrIlzh+X8FKoYR+YQEy0lJxLgR3oDGE25hYsNRhabhmvDQPydTodjPMZgoiKDiI
	 4nRdBWf4QMzZNSrolNA7BWVZqdNVUC+uCDsyDxfTp4ByzA6hmRYg1HKxQzHwCA3PJ8
	 B39yE78KuCIYFp2z85Xe9C1RbWVR7/zgTHEtCTTDRNLdS52y4IPYIvinl6fIF4F0OM
	 7Heci8Wo6VnPYYCyllhdTqqaATcNOzCGpdh//cd/7An+btPD36bBPK9Wv0FCJGdclA
	 CbP17rmP8J55Eu8+EtH3YYGj86YikniBxQ4dxQ0j5uWWxyJrrPUlePym6cCTnmY1/d
	 9qDXWDgBI+nFQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8kq9-0003II-37;
	Thu, 30 Nov 2023 18:28:42 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: clean up example
Date: Thu, 30 Nov 2023 18:28:34 +0100
Message-ID: <20231130172834.12653-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Multi-Purpose Pin controller block is part of an SPMI PMIC (which in
turns sits on an SPMI bus) and uses a single value for the register
property that corresponds to its base address.

Clean up the example by adding a parent PMIC node with proper
'#address-cells' and '#size-cells' properties, dropping the incorrect
second register value, adding some newline separators and increasing the
indentation to four spaces.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 62 ++++++++++---------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
index 80f960671857..fe717d8d4798 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -158,34 +158,40 @@ examples:
   - |
     #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 
-    pm8841_mpp: mpps@a000 {
-      compatible = "qcom,pm8841-mpp", "qcom,spmi-mpp";
-      reg = <0xa000 0>;
-      gpio-controller;
-      #gpio-cells = <2>;
-      gpio-ranges = <&pm8841_mpp 0 0 4>;
-      gpio-line-names = "VDD_PX_BIAS", "WLAN_LED_CTRL",
-              "BT_LED_CTRL", "GPIO-F";
-      interrupt-controller;
-      #interrupt-cells = <2>;
-
-      pinctrl-names = "default";
-      pinctrl-0 = <&pm8841_default>;
-
-      mpp1-state {
-        pins = "mpp1";
-        function = "digital";
-        input-enable;
-        power-source = <PM8841_MPP_S3>;
-      };
-
-      default-state {
-        gpio-pins {
-          pins = "mpp1", "mpp2", "mpp3", "mpp4";
-          function = "digital";
-          input-enable;
-          power-source = <PM8841_MPP_S3>;
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8841_mpp: mpps@a000 {
+            compatible = "qcom,pm8841-mpp", "qcom,spmi-mpp";
+            reg = <0xa000>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pm8841_mpp 0 0 4>;
+            gpio-line-names = "VDD_PX_BIAS", "WLAN_LED_CTRL",
+                              "BT_LED_CTRL", "GPIO-F";
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&pm8841_default>;
+
+            mpp1-state {
+                pins = "mpp1";
+                function = "digital";
+                input-enable;
+                power-source = <PM8841_MPP_S3>;
+            };
+
+            default-state {
+                gpio-pins {
+                    pins = "mpp1", "mpp2", "mpp3", "mpp4";
+                    function = "digital";
+                    input-enable;
+                    power-source = <PM8841_MPP_S3>;
+                };
+            };
         };
-      };
     };
 ...
-- 
2.41.0


