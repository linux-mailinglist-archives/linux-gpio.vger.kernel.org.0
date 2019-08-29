Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B0EA265A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfH2SrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:47:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35324 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2SrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:47:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 662F668B12; Thu, 29 Aug 2019 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567104439;
        bh=UrH1sAFAb1z9oIzC3C7zIhB+/ZJIJDhRvFYRG0P+AAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O9hf/MTlKD3LwL1oqjIJYG+EVIhZ1YfMeKrtCohMSMHXbRWmomBBAcW9HCwbHmph3
         8nJ9TYpmiPxGzZfhynFzA2CI98v1X9e4JdJsVJ0VeRJmkNuhR7JUuKfCnH5gUJPTpO
         7deBcmHtmPJXW+buKhdNsTVubYY/BWur35FvodUw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93B1568891;
        Thu, 29 Aug 2019 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102340;
        bh=UrH1sAFAb1z9oIzC3C7zIhB+/ZJIJDhRvFYRG0P+AAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o9wmELH7qzTvMQkbu04AsjCoy5NjTGqsFtQ1lSjvKSxK7QAEI1J3ajb8cbjIcbOz3
         o36Qrl0sJDIobSaS6OqEO7wsvr2Gs+T+OzJl60TGlXIOlTC2Q0+iT2v3PpR5EQ6cRk
         K6ryPuX+WfYgPdrgZxUrwGG/sI5//AOoDQoXLG6E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 93B1568891
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI config register
Date:   Thu, 29 Aug 2019 12:11:54 -0600
Message-Id: <20190829181203.2660-6-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In addition to configuring the PDC, additional registers that interface
the GIC have to be configured to match the GPIO type. The registers on
some QCOM SoCs are access restricted, while on other SoCs are not. They
SoCs with access restriction to these SPI registers need to be written
from the firmware using the SCM interface. Add a flag to indicate if the
register is to be written using SCM interface.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../bindings/interrupt-controller/qcom,pdc.txt           | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 8e0797cb1487..852fcba98ea6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -50,15 +50,22 @@ Properties:
 		    The second element is the GIC hwirq number for the PDC port.
 		    The third element is the number of interrupts in sequence.
 
+- qcom,scm-spi-cfg:
+	Usage: optional
+	Value type: <bool>
+	Definition: Specifies if the SPI configuration registers have to be
+		    written from the firmware.
+
 Example:
 
 	pdc: interrupt-controller@b220000 {
 		compatible = "qcom,sdm845-pdc";
-		reg = <0xb220000 0x30000>;
+		reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
 		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&intc>;
 		interrupt-controller;
+		qcom,scm-spi-cfg;
 	};
 
 DT binding of a device that wants to use the GIC SPI 514 as a wakeup
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

