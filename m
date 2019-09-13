Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53CEBB27C4
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403840AbfIMV74 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60224 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403810AbfIMV74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BE9CA6155F; Fri, 13 Sep 2019 21:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411995;
        bh=tOdi53r950iLkmXvUmN+jY4TQ4fKdBRyPIEbVWZA66g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UccG/WMB14CHYrEFDl2xKWb/M5Kt2jvEGig9LOlLDM8Wgz0+OAC9YwiVkBpPAIdu4
         KGIwohSERVyQZ8ZVLVRMRnkPEbDnU1Zi0T2mjf+cVRuC2MnlV8AL3jnXIRrW69fkeE
         /4srxSznk1lr9z9BbR1EX4vtZTLu+ecbT0XO4sQI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91A586155F;
        Fri, 13 Sep 2019 21:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411995;
        bh=tOdi53r950iLkmXvUmN+jY4TQ4fKdBRyPIEbVWZA66g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UccG/WMB14CHYrEFDl2xKWb/M5Kt2jvEGig9LOlLDM8Wgz0+OAC9YwiVkBpPAIdu4
         KGIwohSERVyQZ8ZVLVRMRnkPEbDnU1Zi0T2mjf+cVRuC2MnlV8AL3jnXIRrW69fkeE
         /4srxSznk1lr9z9BbR1EX4vtZTLu+ecbT0XO4sQI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91A586155F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 14/14] arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845
Date:   Fri, 13 Sep 2019 15:59:22 -0600
Message-Id: <1568411962-1022-15-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
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
index 0e58ef0..310b604 100644
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

