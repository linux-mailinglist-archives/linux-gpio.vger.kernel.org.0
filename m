Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0EEA2646
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbfH2Snn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:43:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53652 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfH2Snn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:43:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7F956675E1; Thu, 29 Aug 2019 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567104222;
        bh=/sOoz74UPGyBboFaMGdZyPO+sOZ6PBTKdK3o6MAKGHA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aqxWGZfOvSzqn1LDCrvQXCsmpBkvl7aODdeYzgVyt7oXFG7QHPDMIc3m7CTJPIYt1
         AdtmabNN6B6TRhpHw6qyTzrQAI9gQLLCNEcrj/WtHF+Y1b7vzMbcTrzVLoIxQI+T6v
         QPU5p1Updd9bkWoJVLo86epvl0l2N8VyY+PsJ8Nc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BA8768A9D;
        Thu, 29 Aug 2019 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102354;
        bh=/sOoz74UPGyBboFaMGdZyPO+sOZ6PBTKdK3o6MAKGHA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hZG8Qr4fdVY+rC2UORwJh1tT1eBgNorNNMKsb0LwZN6Kv94b2LFyz7Ks0vBvphc4o
         wEKncnbv0mlFwJ+MaWzUcZqUXpLm/jiasJvoI9ae+eJfdd4GfIYVXPuwt/onobtKNN
         /P80GowTsvHU6NV66jirRZIrPA1U+C8Ok6GU1AZ8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BA8768A9D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 13/14] arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
Date:   Thu, 29 Aug 2019 12:12:02 -0600
Message-Id: <20190829181203.2660-14-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index ffe28b3e41d8..3002793ee688 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1358,6 +1358,7 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 150>;
+			wakeup-parent = <&pdc_intc>;
 
 			qspi_clk: qspi-clk {
 				pinmux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

