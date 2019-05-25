Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB9302A6F5
	for <lists+linux-gpio@lfdr.de>; Sat, 25 May 2019 22:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfEYUme (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 May 2019 16:42:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44702 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfEYUme (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 May 2019 16:42:34 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hUdUq-0002fD-Pq; Sat, 25 May 2019 20:42:28 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: fix spelling mistakes in pinctl documentation
Date:   Sat, 25 May 2019 21:42:28 +0100
Message-Id: <20190525204228.8546-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The spelling of configured is incorrect in the documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt    | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt     | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt     | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt     | 6 +++---
 11 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
index 68e93d5b7ede..c9782397ff14 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
@@ -122,17 +122,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
index 6dd72f8599e9..7b151894f5a0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
@@ -118,17 +118,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
index 86ecdcfc4fb8..d46973968873 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
@@ -97,17 +97,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
index 195a7a0ef0cc..3354a63296d9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
@@ -130,17 +130,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
index 5034eb6653c7..a7dd213c77c6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
@@ -124,17 +124,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
index f15443f6e78e..da52df6273bc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
@@ -128,17 +128,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
index fa97f609fe45..a56cb882830c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
@@ -149,17 +149,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
index e70c79bbbc5b..00174f08ba1d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
@@ -135,17 +135,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
index 2b8f77762edc..a50e74684195 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
@@ -150,17 +150,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
index 769ca83bb40d..be034d329e10 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
@@ -142,17 +142,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 665aadb5ea28..321bdb9be0d2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
@@ -118,17 +118,17 @@ to specify in a pin configuration subnode:
 - bias-disable:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as no pull.
+	Definition: The specified pins should be configured as no pull.
 
 - bias-pull-down:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull down.
+	Definition: The specified pins should be configured as pull down.
 
 - bias-pull-up:
 	Usage: optional
 	Value type: <none>
-	Definition: The specified pins should be configued as pull up.
+	Definition: The specified pins should be configured as pull up.
 
 - output-high:
 	Usage: optional
-- 
2.20.1

