Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9044AE9702
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 08:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfJ3HHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 03:07:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43926 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJ3HHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 03:07:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 25FA660BE6; Wed, 30 Oct 2019 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419242;
        bh=PWRjE6RA4CMfH450ZAFjtGOqrhjym1PHjOFH8oC6DQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PhpZDYkG+8qO+iK+2i+DV9TE+rW2MN6UbXI6OvhZneMpHxv/SsflZNOHyq+UfknFK
         FxNo2Pseytgm82ZmBEcABec6pwIFBw0q3+zABlUSBnoeEcCXWV4t5rQk60NICc1yF+
         Bl57Zw/1tXQq7bWAv8b86q+vwTVYMRRjVvvmymRA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 603D360F7E;
        Wed, 30 Oct 2019 07:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419241;
        bh=PWRjE6RA4CMfH450ZAFjtGOqrhjym1PHjOFH8oC6DQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oceSxv5T/D6sd2Fwmh2qJvYKqlA1RKBsQx/UH/7iHufWtkNRk9NP0x8MvIMVELwYt
         TdVZdbvpZle3ovEq/6DD4ALLFoExxohCAEEkZqoLH8MXKJwvoC1z0+/C00ivEpdyHc
         Zp6Jl09R0UZ8lvtih7b2fH98q0LihczEk1zxUhz4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 603D360F7E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180: Add wakeup parent for TLMM
Date:   Wed, 30 Oct 2019 12:36:18 +0530
Message-Id: <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Specify wakeup parent irqchip for sc7180 TLMM.

Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 69d5e2c..9040eee 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -321,6 +321,7 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 120>;
+			wakeup-parent = <&pdc>;
 
 			qup_uart2_default: qup-uart2-default {
 				pinmux {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

