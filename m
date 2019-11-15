Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA0CFE78D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfKOWSB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:18:01 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47890 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbfKOWR4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:56 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4996161216; Fri, 15 Nov 2019 22:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856276;
        bh=l7vCzD05bzA4al+cHWP5MB6Y8yDBmMZuKunIkyGbyCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YH+iQ+6E9OR8cG8d0PnAKibucGEi705VhUigc6fUKcj/jtEp+pWsBeY61OpjfGnYY
         VTBp3ZkDUIqZOvIFfITGCs5cWVP4QWypD9kk4iS04ujtLPRKKfn212gIkLdO8z6IDU
         Aezq//M8OHgNiAT6x3NKy0MRp1rLd547CV0mag1M=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8612611FB;
        Fri, 15 Nov 2019 22:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856275;
        bh=l7vCzD05bzA4al+cHWP5MB6Y8yDBmMZuKunIkyGbyCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czZiZmQWermZuTeKRp7cTl+fmC4s0iS/2r2c9axzvEhDgaTm3/NhEeq2J9cdGWfpy
         5JlQTXoMlP7zUeoTQV944Cousf7ygwzN/3EyLKxR0hIVXR7KwCLmd/reb0MuDZpOOc
         AyjdIC8VRS7LXm44PymdbizvyYWabu7rBoIDz+rY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8612611FB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 12/12] arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845
Date:   Fri, 15 Nov 2019 15:11:55 -0700
Message-Id: <1573855915-9841-13-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable PDC interrupt controller for SDM845 devices. The interrupt
controller can detect wakeup capable interrupts when the SoC is in a low
power state.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9a867a..8d8d4d5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -749,6 +749,7 @@ CONFIG_ARCH_R8A77970=y
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

