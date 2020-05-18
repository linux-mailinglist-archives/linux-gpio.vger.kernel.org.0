Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626271D7D57
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 17:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgERPuw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 11:50:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:17464 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726958AbgERPuw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 11:50:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589817051; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MA7x95uTokqN/aU7nVR9VOVc4EF74ZFKJm4hvl9kPak=; b=WUlRjf5jDjPPwPDaLpabOSgUsNHq1H7HP4oGlYiHBjK0z8AfYRjFQhylkaGULMh53+b+AQcW
 a2lUV8zOGxyS2dSkPwV5l5ACNi5oqYzshTyN2wEb9dc9AnEosLpmP3GtsEyynFJtyE5G7mr1
 /J2m9dt4BhSrg4vUM8WRe8OuhF4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec2aecd.7fd5868fa960-smtp-out-n01;
 Mon, 18 May 2020 15:50:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B71BDC433D2; Mon, 18 May 2020 15:50:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from groverm-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: groverm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C9E4C43636;
        Mon, 18 May 2020 15:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C9E4C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=groverm@codeaurora.org
From:   Mayank Grover <groverm@codeaurora.org>
To:     linus.walleij@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraju@codeaurora.org,
        Mayank Grover <groverm@codeaurora.org>
Subject: [PATCH] pinctrl: msm: Add check for pinctrl group is valid
Date:   Mon, 18 May 2020 21:20:25 +0530
Message-Id: <1589817025-21886-1-git-send-email-groverm@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The list of reserved gpio pins for platform are populated
in gpiochip valid_mask.

Here on MSM common driver introduce ability to check if
pingroup is valid, by parsing pins in pingroup against
reserved pins for gpios. This does not handle non-gpio
pingroups.

Signed-off-by: Mayank Grover <groverm@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 85858c1..b6ebe26 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -261,6 +261,24 @@ static unsigned msm_regval_to_drive(u32 val)
 	return (val + 1) * 2;
 }
 
+static bool msm_pingroup_is_valid(struct msm_pinctrl *pctrl,
+				  const struct msm_pingroup *g)
+{
+	const unsigned int *pins = g->pins;
+	unsigned int num_pins = g->npins;
+	struct gpio_chip *chip = &pctrl->chip;
+	unsigned int max_gpios = chip->ngpio;
+	unsigned int i;
+
+	for (i = 0; i < num_pins; i++) {
+		/* Doesn't handle non-gpio pingroups */
+		if (pins[i] < max_gpios &&
+		    !gpiochip_line_is_valid(chip, pins[i]))
+			return false;
+	}
+	return true;
+}
+
 static int msm_config_group_get(struct pinctrl_dev *pctldev,
 				unsigned int group,
 				unsigned long *config)
@@ -276,6 +294,10 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 
 	g = &pctrl->soc->groups[group];
 
+	/* Check if group has all valid pins */
+	if (!msm_pingroup_is_valid(pctrl, g))
+		return -EINVAL;
+
 	ret = msm_config_reg(pctrl, g, param, &mask, &bit);
 	if (ret < 0)
 		return ret;
@@ -355,6 +377,10 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 
 	g = &pctrl->soc->groups[group];
 
+	/* Check if group has all valid pins */
+	if (!msm_pingroup_is_valid(pctrl, g))
+		return -EINVAL;
+
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation
