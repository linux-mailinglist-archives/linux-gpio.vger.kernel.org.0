Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B377B27C1
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403804AbfIMV7z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60224 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403783AbfIMV7y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0768C612F1; Fri, 13 Sep 2019 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411994;
        bh=zA+ZCKY0R8V8qszkGMazGbgmIX907KgflfYIX6eF6No=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J2jWd+5mB+7gRPpkSGPDMYWYGB8yoAysW69XSrHJmVPX7ppQzUj3Ru1xriVXEdTi4
         FyCD2sBSWMAaUO/oDrVA+ItMChfInVyoShmI71OX1olUNPYpssb8ZFNUV94phEA7gj
         pZdgvUztqNipeZcc31OAwT8lVVPz6j3Wnz44NCGo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9872761424;
        Fri, 13 Sep 2019 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411993;
        bh=zA+ZCKY0R8V8qszkGMazGbgmIX907KgflfYIX6eF6No=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pJkD41+qC1/AhMM9SHWs7zPFKlDOsf3SHWUWPwnAIKF+qp8Vx/EtR1Npy7RjsdIsJ
         HaJXV8Aoxbb/bvgoq0uBzNYK2YTp1ATuZVFdA4pjn///U24xeFKzI42GGTwNARlYsJ
         5KwfWlc81M8nWrXjxEVJknrjiiwm3buYWza/J0Vo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9872761424
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 12/14] arm64: dts: qcom: add PDC interrupt controller for SDM845
Date:   Fri, 13 Sep 2019 15:59:20 -0600
Message-Id: <1568411962-1022-13-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add PDC interrupt controller device bindings for SDM845.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index be0022e..41455b8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2375,6 +2375,16 @@
 			#power-domain-cells = <1>;
 		};
 
+		pdc_intc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm845-pdc";
+			reg = <0 0x0b220000 0 0x30000>, <0 0x179900f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+			qcom,scm-spi-cfg;
+		};
+
 		pdc_reset: reset-controller@b2e0000 {
 			compatible = "qcom,sdm845-pdc-global";
 			reg = <0 0x0b2e0000 0 0x20000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

