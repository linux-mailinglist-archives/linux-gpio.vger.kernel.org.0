Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2775135581
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 10:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgAIJTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 04:19:35 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:62684 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729330AbgAIJTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 04:19:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578561574; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5+GZjw2TCHeQIbwTltRSDntorXWcIHggVUbgZKjVq54=; b=W0Y7x83xyFyOxWyKJYCPmPyfS51S49Z5QOr640Da0y9PyQ2y2QQDqsD5hvPgE+0Qi7t7tCKT
 +/Xah9pSPD5WPwLb1JoZLjUORE+AnGaBrw3GSXkicrsaA9/O6PP86dLDT4H4yj7IXNbbzCXu
 5qP+7kWo1795fnSdjFjlmar+F9k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e16f025.7fdadcbefdc0-smtp-out-n02;
 Thu, 09 Jan 2020 09:19:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52271C447A9; Thu,  9 Jan 2020 09:19:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4756CC447A4;
        Thu,  9 Jan 2020 09:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4756CC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        sricharan@codeaurora.org
Cc:     Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Subject: [PATCH V4 3/5] dt-bindings: qcom: Add ipq6018 bindings
Date:   Thu,  9 Jan 2020 14:49:01 +0530
Message-Id: <1578561543-23132-4-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1578561543-23132-1-git-send-email-sricharan@codeaurora.org>
References: <1578561543-23132-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the new ipq6018 SOC/board device tree bindings.

Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
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
2.7.4
