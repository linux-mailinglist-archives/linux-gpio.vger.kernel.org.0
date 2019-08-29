Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15EB8A25EB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbfH2SdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:33:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54764 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbfH2SdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:33:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 54E1C675E8; Thu, 29 Aug 2019 18:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567103598;
        bh=VsK0OWT4NrTuulRjb3e+y0lwEFWmdZz0LJdwLaeX5m8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ejFquLtQhxvoaLkFyTBOPDf2aHwbiabfhzMxIJjCa2QUGTBw5V+NNzhT7+B88xXNh
         WvhAGcx3o5AV9JD3WNw+8GTA0559qRsi40sNmQBIpRcmxKMtei221TSU8lcdMi9MJj
         r/5SBVZ+jpi9mHSe4RRAYBVc6YD/XcvFpQmOooTw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B1CB686B7;
        Thu, 29 Aug 2019 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102356;
        bh=VsK0OWT4NrTuulRjb3e+y0lwEFWmdZz0LJdwLaeX5m8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=COkHEyYbgqarmuN0Zt5gpdNFOQq5sGO5AUQwqSo5TY2zr8p3RUVC70IVq4yMSFlon
         YHiXCVcgVsgmxi92xn0RnpqPoEu9Mkg30jL5LnKGnZXSEVcZeB/dpaqRSbqI7j0s6u
         D1Ga0+ftGLMnRmszB4PaH1PY55ZRZ8xU3laV9aN0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B1CB686B7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 14/14] arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845
Date:   Thu, 29 Aug 2019 12:12:03 -0600
Message-Id: <20190829181203.2660-15-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable PDC interrupt controller for SDM845 devices. The interrupt
controller can detect wakeup capable interrupts when the SoC is in a low
power state.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0e58ef02880c..310b6048054a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -729,6 +729,7 @@ CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77995=y
+CONFIG_QCOM_PDC=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

