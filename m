Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D2DFCDD1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfKNSgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:36:02 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56352 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfKNSgB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:36:01 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B2074609CD; Thu, 14 Nov 2019 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756561;
        bh=lyzaaL3HufBnwLI3PVEjtKaYbwKVvY1v+lgNTQKPi+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PdsuVvJEKXpUrG4wJV+m+RQdXktjVZQFZUfueiD4mrd9oRDiHLtto60CcZYbIRdmQ
         45YIN+udN5pDWvrqVNTUxdlf087tV0VZzpOD+VYQ7NVw/LB7c2WAmc47ZcU6Vftv+O
         4VT/XAogtEz49MvsVCL5A2Dc+lUZ7RdZkIOMJ80Q=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B77566145C;
        Thu, 14 Nov 2019 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756548;
        bh=lyzaaL3HufBnwLI3PVEjtKaYbwKVvY1v+lgNTQKPi+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SZX+hyqavHR5p0zSsxZl6yDgJVn4a8tZl9UhMlIUkx6Lhqq/kh+31MjBIFDA1+H3X
         eMaqfHH1D4a7GAzNvDW26Zz8jNkG0p8IecsaYMJNAmf1YY34Et1tC1Gg48vZAlgzUX
         QRKm4RBnbL8pRNFqm4hrkirFNfa5aNtgR37odsRQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B77566145C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 10/12] arm64: dts: qcom: add PDC interrupt controller for SDM845
Date:   Thu, 14 Nov 2019 11:35:19 -0700
Message-Id: <1573756521-27373-11-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add PDC interrupt controller device bindings for SDM845.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index da8aa59..fb060a4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2939,6 +2939,15 @@
 			#power-domain-cells = <1>;
 		};
 
+		pdc_intc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm845-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		pdc_reset: reset-controller@b2e0000 {
 			compatible = "qcom,sdm845-pdc-global";
 			reg = <0 0x0b2e0000 0 0x20000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

