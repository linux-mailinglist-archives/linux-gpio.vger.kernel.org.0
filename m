Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E4AB27BE
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390572AbfIMV7y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60104 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390559AbfIMV7x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D10846141D; Fri, 13 Sep 2019 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411992;
        bh=rmhnZDa5DvGyEFcw8DBTGLtXibcXJptqhTVYshv2Dc0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fCguyrRZhptn9hkMLD8LhOUGm47YnF8a7XCBbsO6hZUFaK3ofylISPbLs7uCs4Pph
         y+xnttDVufQBS1k4zw8wi71oIVzVs1DqD/PI5+GFPH1+oPhiyoIoVBL99xmcrrDyNU
         CkztHJyM1zfcLwLspk6mwEf1h9X03177Iy+w4++k=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D25161418;
        Fri, 13 Sep 2019 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411992;
        bh=rmhnZDa5DvGyEFcw8DBTGLtXibcXJptqhTVYshv2Dc0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fCguyrRZhptn9hkMLD8LhOUGm47YnF8a7XCBbsO6hZUFaK3ofylISPbLs7uCs4Pph
         y+xnttDVufQBS1k4zw8wi71oIVzVs1DqD/PI5+GFPH1+oPhiyoIoVBL99xmcrrDyNU
         CkztHJyM1zfcLwLspk6mwEf1h9X03177Iy+w4++k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D25161418
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 11/14] drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
Date:   Fri, 13 Sep 2019 15:59:19 -0600
Message-Id: <1568411962-1022-12-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add interrupt parents for wakeup capable GPIOs for Qualcomm SDM845 SoC.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in RFC v2:
	- Rearranged GPIO wakeup parent map
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 39f498c..9cff3a4 100644
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

