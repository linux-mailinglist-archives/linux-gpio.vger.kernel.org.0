Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A767412F7BF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2020 12:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgACLuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 06:50:13 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49955 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727722AbgACLuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 06:50:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578052212; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=/pz9MbSBhV8YYU0dDyCnGvIiknduPiuUTM/iRFOWWOY=; b=j7mVYwd2Rk4P4jC0zfofGPs8WCxgL4V6R01hIeRIxennJb8V9JsQEmfb2EsHuzYyB35RT+JB
 KfUZrMJIMdUAfKlUTpo/WdgAbjjw/9WLVPWKCGmJDuKsTqtbH2U25cQud9tp7z/7A4I4WJd8
 Y3kYazVkf7wX1qC5CCbsDGZjYeE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0f2a73.7fc02e9d97a0-smtp-out-n01;
 Fri, 03 Jan 2020 11:50:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B63C9C447A3; Fri,  3 Jan 2020 11:50:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57ECFC447B0;
        Fri,  3 Jan 2020 11:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57ECFC447B0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: [PATCH V3 5/5] arm64: defconfig: Enable qcom ipq6018 clock and pinctrl
Date:   Fri,  3 Jan 2020 17:19:37 +0530
Message-Id: <1578052177-6778-6-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These configs are required for booting kernel in qcom
ipq6018 boards.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f123840..631372c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -403,6 +403,7 @@ CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IPQ8074=y
+CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8994=y
 CONFIG_PINCTRL_MSM8996=y
@@ -709,6 +710,7 @@ CONFIG_QCOM_CLK_APCS_MSM8916=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_GCC_8074=y
+CONFIG_IPQ_GCC_6018=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
-- 
1.9.1
