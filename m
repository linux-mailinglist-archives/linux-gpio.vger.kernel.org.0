Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBDBFCDD5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfKNSgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:36:07 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56490 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfKNSgH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:36:07 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C50C96147C; Thu, 14 Nov 2019 18:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756565;
        bh=CNUnNySiEOI8Ft3kUF1s7qMezRd7NbAEq1RYYdi4qE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ic4YcdcvqBhUL109WwbeqMJRn1WeUuWhpqCBUYvamA1IckRH3Xwcqthb56s6FmEZr
         dgKvwDs1F7NWMoUaWDfVEX4dhxobM0IFg5besdVSvqHdPp+aZHjfHD71PdJiVccVXh
         e/jx9IMOS2tIZCPS5SXxXhMeh6zYPxsczItrwFcw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A8946145C;
        Thu, 14 Nov 2019 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756551;
        bh=CNUnNySiEOI8Ft3kUF1s7qMezRd7NbAEq1RYYdi4qE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o8mP17dyftkPeELm8pJUUdkEjat1b52KkbEBsM298TU+bcXj7Tj/QrulT/qGqGIJD
         BnC6MfkixLkO4Cr/+2o6KAvZUcicpw2KvZuF4/+HFJ0xhyRfQee/Z4VqRKUOoIfL2e
         hWLdKhBsB8qQUCO6/ELE0I04xNYnbRtCAp2bxIPc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A8946145C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 12/12] arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845
Date:   Thu, 14 Nov 2019 11:35:21 -0700
Message-Id: <1573756521-27373-13-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
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

