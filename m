Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81B9D125F87
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfLSKnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:43:12 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:42221 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726887AbfLSKnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 05:43:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576752189; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=DS1NkcAGfyxw/2L/IdStB8Wi3Qt51B/yCyrtH9sujGU=; b=uQEy6wgHyZqPP5NZ6pmpRr/8jv2l0UpLgSEBSCirc75X/RbVvcNtj36K5CFa1SIbAwQkHuLk
 w4lh2tgnpWXUyhv/NVRC8c0vk5lRBS/AoO2fw2R94csw/qyhIJNgBSxyn4Ys23Bp9Hfj3rgx
 mbOiH5wFud7JUsYKyqClkI46+b0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb5437.7f95a9205848-smtp-out-n03;
 Thu, 19 Dec 2019 10:43:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B11B4C53807; Thu, 19 Dec 2019 10:43:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18C50C53807;
        Thu, 19 Dec 2019 10:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 18C50C53807
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: [PATCH V2 3/7] dt-bindings: qcom: Add ipq6018 bindings
Date:   Thu, 19 Dec 2019 16:11:45 +0530
Message-Id: <1576752109-24497-4-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the new ipq6018 SOC/board device tree bindings.

Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---

[V2] Added schema for the ipq6018 platform.

 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 529d924..164177e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -28,6 +28,7 @@ description: |
         apq8074
         apq8084
         apq8096
+        ipq6018
         ipq8074
         mdm9615
         msm8916
@@ -41,6 +42,7 @@ description: |
   The 'board' element must be one of the following strings:
 
         cdp
+        cp01-c1
         dragonboard
         hk01
         idp
@@ -150,4 +152,10 @@ properties:
           - enum:
               - qcom,sc7180-idp
           - const: qcom,sc7180
+
+      - items:
+          - enum:
+              - qcom,ipq6018-cp01-c1
+          - const: qcom,ipq6018
+
 ...
-- 
1.9.1
