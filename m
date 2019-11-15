Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D724DFE78C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfKOWSB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:18:01 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47816 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfKOWRz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:55 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 06DDE61211; Fri, 15 Nov 2019 22:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856275;
        bh=RdpguBh5wfKkafHR4yhLWSnKf+bZbjMsRHGKYXVDf0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oJkiwxkpQhbI1/VIh2j3uhglsFLv0H0KPYL7x9z4bBMlqXxJZlIsjB12sPCjockNi
         Kh6BJrNDFawwwDF2vjUPlfCVry8Jt1TzJLCy52KQbCoLNHWQ4CI3XuSDTI1evHUWDV
         ENt6sMhihEjJ+RgoEYcZ37HAOarUZTTHK0kiVhLA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89738611E4;
        Fri, 15 Nov 2019 22:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856274;
        bh=RdpguBh5wfKkafHR4yhLWSnKf+bZbjMsRHGKYXVDf0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BlSFqV1y0WQvDtdYjm4oM0/54+zRm8+2dC7xhzMBkPJ254R5A1VzCVhFY5nv5wHGu
         /Mrjgk36u3DebM1HGf6kvULtU+B55CX7wboF5W8Oq7i4UJAGIIyRjSsVrYC0GYp1Wh
         yMfX/ppOOIplb8iG3WdxZw/uH9rw72f5T5nVUxhA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89738611E4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 11/12] arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
Date:   Fri, 15 Nov 2019 15:11:54 -0700
Message-Id: <1573855915-9841-12-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PDC always-on interrupt controller can detect certain GPIOs even when
the TLMM interrupt controller is powered off. Link the PDC as TLMM's
wakeup parent.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

