Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE2AFCDD0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfKNSgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:36:00 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56318 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfKNSgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:36:00 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 388E9611A9; Thu, 14 Nov 2019 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756559;
        bh=5rMhQxOWOs0dQWBJGBgaZChmSbMUKsUU5kePCG8JbCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PLINxus/p0a+ZS1bUD6p143S6bUVCzDsigKH/tZgodzTE7xwUMF8Kh9783Fj6KhWl
         2Ew+4CBHeI1fP1+KO2vbjO5fJHCWfVJQAV2eKqFyLeuA89IeWPRXxO+/iE4gNzJC8N
         U8xsh6Wdae4p51fu8oaF3zNm/xTJ+kUOk6GtVcgA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32C6461476;
        Thu, 14 Nov 2019 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756550;
        bh=5rMhQxOWOs0dQWBJGBgaZChmSbMUKsUU5kePCG8JbCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gQkCAQeAVkfJZqM4DGEipreBKD2oEfv56vMoc9zGAbqQmDuXrkOe+GT0xHEcaY576
         tsFAItzX67sLpbC56wAEm3GuXL5ckR/1DcB5TbTINg3TNfODoQNwcz8dvv5oVBs12V
         DJIuqztlALYbI8zoDO2nmPdz+zxh05OlVSObP878=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32C6461476
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 11/12] arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
Date:   Thu, 14 Nov 2019 11:35:20 -0700
Message-Id: <1573756521-27373-12-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PDC always-on interrupt controller can detect certain GPIOs even when
the TLMM interrupt controller is powered off. Link the PDC as TLMM's
wakeup parent.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fb060a4..6d2dfd7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1447,6 +1447,7 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 150>;
+			wakeup-parent = <&pdc_intc>;
 
 			qspi_clk: qspi-clk {
 				pinmux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

