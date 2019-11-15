Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69C9FE797
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfKOWRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:17:54 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47662 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfKOWRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:54 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2BA09611BD; Fri, 15 Nov 2019 22:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856273;
        bh=vXbYBwpzjqpUtaliXsEar6TubTw9Dp5DFVeUJyH1tNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k8awBem1YT5xLIt2ka8RFY+Ol/7vdhqOiWhDWo5WK9LxrER8WXYoj2lVUWTMkChtM
         VIx2huiWfmHbdHmGj/LaCL2OjDAw35CMf8V9vY3wgMrCQv9Qwoy9+p6BRCi10rlrs0
         CE3cwNuFdf1PBo/9I7Eboca+Y7idfOtOXqOqRQNA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 41A8F611A2;
        Fri, 15 Nov 2019 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856272;
        bh=vXbYBwpzjqpUtaliXsEar6TubTw9Dp5DFVeUJyH1tNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q1KBbE5vCJrj3uJpEsVcM+pYaq8zfW3uA9h7CcrKhEulnqF31WJjHl0l+ycYrytsN
         KVDg97Axl9y9A5zK0H9qwxvDGmEy0OKcB48D1Bax/oNViTFzMnpH5tYYaFirdVW/kW
         Z5IFYL5k4JdYI/7yVsJX7Ncfuop4ldIVnmtaR08Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 41A8F611A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 09/12] drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
Date:   Fri, 15 Nov 2019 15:11:52 -0700
Message-Id: <1573855915-9841-10-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add interrupt parents for wakeup capable GPIOs for Qualcomm SDM845 SoC.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in RFC v2:
	- Rearranged GPIO wakeup parent map
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index ce49597..2834d2c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/acpi.h>
@@ -1282,6 +1282,24 @@ static const int sdm845_acpi_reserved_gpios[] = {
 	0, 1, 2, 3, 81, 82, 83, 84, -1
 };
 
+static const struct msm_gpio_wakeirq_map sdm845_pdc_map[] = {
+	{ 1, 30 }, { 3, 31 }, { 5, 32 }, { 10, 33 }, { 11, 34 },
+	{ 20, 35 }, { 22, 36 }, { 24, 37 }, { 26, 38 }, { 30, 39 },
+	{ 31, 117 }, { 32, 41 }, { 34, 42 }, { 36, 43 }, { 37, 44 },
+	{ 38, 45 }, { 39, 46 }, { 40, 47 }, { 41, 115 }, { 43, 49 },
+	{ 44, 50 }, { 46, 51 }, { 48, 52 }, { 49, 118 }, { 52, 54 },
+	{ 53, 55 }, { 54, 56 }, { 56, 57 }, { 57, 58 }, { 58, 59 },
+	{ 59, 60 }, { 60, 61 }, { 61, 62 }, { 62, 63 }, { 63, 64 },
+	{ 64, 65 }, { 66, 66 }, { 68, 67 }, { 71, 68 }, { 73, 69 },
+	{ 77, 70 }, { 78, 71 }, { 79, 72 }, { 80, 73 }, { 84, 74 },
+	{ 85, 75 }, { 86, 76 }, { 88, 77 }, { 89, 116 }, { 91, 79 },
+	{ 92, 80 }, { 95, 81 }, { 96, 82 }, { 97, 83 }, { 101, 84 },
+	{ 103, 85 }, { 104, 86 }, { 115, 90 }, { 116, 91 }, { 117, 92 },
+	{ 118, 93 }, { 119, 94 }, { 120, 95 }, { 121, 96 }, { 122, 97 },
+	{ 123, 98 }, { 124, 99 }, { 125, 100 }, { 127, 102 }, { 128, 103 },
+	{ 129, 104 }, { 130, 105 }, { 132, 106 }, { 133, 107 }, { 145, 108 },
+};
+
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.pins = sdm845_pins,
 	.npins = ARRAY_SIZE(sdm845_pins),
@@ -1290,6 +1308,9 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.groups = sdm845_groups,
 	.ngroups = ARRAY_SIZE(sdm845_groups),
 	.ngpios = 151,
+	.wakeirq_map = sdm845_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sdm845_pdc_map),
+
 };
 
 static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

