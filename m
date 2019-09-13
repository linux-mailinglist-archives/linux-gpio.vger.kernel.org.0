Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C187B27C7
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403820AbfIMV74 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60310 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403798AbfIMV74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 06A5861572; Fri, 13 Sep 2019 21:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411995;
        bh=RkPTz7sLNcUVhcpu56ji8HogFM/HLe7mwUPyf10X7Tk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GS5zUpR3SXyCi13ukFTaNuPG59oOL4I1FBuS+XxQkt5Q2gpoLVxVFAzZqbjD4sI6x
         HQ+zTu1HqvaxOQ9Fem0iGU0ZXgdmzjEpqEupO+fbwFPOvRNwxWydAQ4PHH9clP5kIP
         kLSp7qBIlJz+XMLUzIFS1ZVA9IUJtEZGjAWrWO1E=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95AD5614DB;
        Fri, 13 Sep 2019 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411994;
        bh=RkPTz7sLNcUVhcpu56ji8HogFM/HLe7mwUPyf10X7Tk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GINagmKJjVjx8TAOPGwCvZNKMjxn73Kwp/m2koBQ7dwD1lLrpUw2jX9ly/teJmLsV
         TzSnDic+lXCH92/DGDivjilAviAusS9xhuCZ5AEdyvAh/lam6WMJ42V2gLyfw1knIb
         qGgmrF7nSQnyL2fa+xfHGtroMXu1pD/WkunuX8XY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95AD5614DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 13/14] arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
Date:   Fri, 13 Sep 2019 15:59:21 -0600
Message-Id: <1568411962-1022-14-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
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
index 41455b8..1b70254 100644
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

