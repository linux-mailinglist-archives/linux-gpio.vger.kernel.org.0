Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A317636246
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 19:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfFERQk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 13:16:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59908 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfFERQi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 13:16:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E89246156F; Wed,  5 Jun 2019 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559754997;
        bh=c95mWIKY1tNSkuZhQIVCkq9LrewgA9o6Cw9pqYMpaQE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=imqxBvOQ9WhzWWO+bTw9i87gG/BYGhJS6Q+rJjv0RPXTIP+k4flnlS7W6rujHsbsB
         q8RnruQfZJGvYY6cJVXytjsaAtll9T1LzEQqflqvVVYcB6fERt8446kjnkb9tt3Ih5
         5dSNVsPEjZuT3kNkuVSATnhK99WeZ1oClKl/Zir0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C4306132B;
        Wed,  5 Jun 2019 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559754993;
        bh=c95mWIKY1tNSkuZhQIVCkq9LrewgA9o6Cw9pqYMpaQE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SiTRJ/4TaIBe+c6PwFnwnmYnqyDRbQ5BvXXoMn/3dbnKLRNLLd+YjwQYVhB2y/SNn
         pkeGEy2NB8HRsBS0p6mOTdn/XdrBzfRN6KCop6fWgGO+QdQvkpF4C2rIGKh1VqcXnl
         dtdvxwu1Y12vgwFK7ABBg8cuyqXLUK6nyYIcy9S0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C4306132B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: defconfig: Enable qcom ipq6018 clock and pinctrl
Date:   Wed,  5 Jun 2019 22:46:01 +0530
Message-Id: <1559754961-26783-7-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These configs are required for booting kernel in qcom
ipq6018 boards.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4d58351..abf64ee 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -373,6 +373,7 @@ CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IPQ8074=y
+CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8994=y
 CONFIG_PINCTRL_MSM8996=y
@@ -646,6 +647,7 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_GCC_8074=y
+CONFIG_IPQ_GCC_6018=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

