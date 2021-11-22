Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF68458A52
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 09:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhKVIMz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 03:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhKVIMz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 03:12:55 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF176C06173E
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 00:09:48 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id p18so13359602plf.13
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uQ/+zOySUXz8+736XnP9ZMKw5v3u7n3hZqXwPthJL04=;
        b=svPsnqBijieqr4XxzbY5mKcYwOH4RdYULdK9wZuS0ZMBSA/pJPvoymRNmDiH/0UXOD
         LoBTnucxfDbqNIyEvlZ8onHUQfuLltO3R0h4A5DnWs3lakJr7/4FJ5DYSqIkWZRQkAbW
         CK92LnT8jI+thyer9KYxPLqy0075RdT3Ma1PI/V51NHpG3J6Mb7onEMbCeYGijXFMy9h
         /+2DC6Y3QcS4wUyy39zFPp4xu0eFuRRr4D84E5MmsEjpnvfdEicHSuvxJNUm40NK/D87
         WtWKt7oFgmM73oo2LAS20E6tSPEEYSHxtxOloBdhloHNajcafJHaGbxS2jNWENISWUVk
         qEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uQ/+zOySUXz8+736XnP9ZMKw5v3u7n3hZqXwPthJL04=;
        b=sZCFLAbnpjn9eTu4P1weO+/7XIEAmEB5sRIzVTR1W9ZqBBSn7gV7kevBxMExg7nosC
         0Su3xjGDGZE7qfZjVjad+rgjycrjCAEUYwR18aepqdtnUBfxqJGqSv4rHdrZm7Uu/mPG
         BR6pU0xcKMzYizyAYRxpl+alGBb0Icm0xp/120Tv9Kqtlizy615qlDSNESe3LdjLyZ4l
         57u/zXF32SnRKlATBpjHC47ENSJu2GPY0i0ZsPSu1p3KarNPPpz3QuA5aYHXKo5J4nrp
         YOXWa0EXt3CzaH5JlLRMKUzcqvtZWSKPcd7uqWHcqV206VdTfWIQQg0UgJzgXge4R0Ep
         +27g==
X-Gm-Message-State: AOAM532/veJd9qc63/bZO5iyjTGUVhRNqkYvAaxPZ8o9h7PpuBdTTUyj
        QdpK9Q69DuxS3aErR5gYlL6aXA==
X-Google-Smtp-Source: ABdhPJybJrED/Lat35Z7w8WNd8v013GgDX61eCQ4gyX/sbBxICtNUU4BIT8hBCfnMDyy2Q9N5UKnag==
X-Received: by 2002:a17:903:2445:b0:142:830:ea8e with SMTP id l5-20020a170903244500b001420830ea8emr104746579pls.54.1637568588467;
        Mon, 22 Nov 2021 00:09:48 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id il13sm19507813pjb.52.2021.11.22.00.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 00:09:48 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] pinctrl: qcom: qcm2290: Add GPIO wakeirq map
Date:   Mon, 22 Nov 2021 16:09:38 +0800
Message-Id: <20211122080938.20623-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It adds the map of wakeup capable GPIOs and the pins at MPM wake
controller on QCM2290, so that these GPIOs can wake up the SoC from
vlow/vmin low power mode.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-qcm2290.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index 3f05c0a24b79..aa9325f333fb 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -1083,6 +1083,16 @@ static const struct msm_pingroup qcm2290_groups[] = {
 	[133] = SDC_QDSD_PINGROUP(sdc2_data, 0x86000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map qcm2290_mpm_map[] = {
+	{ 0, 84 }, { 3, 75 }, { 4, 16 }, { 6, 59 }, { 8, 63 }, { 11, 17 },
+	{ 13, 18 }, { 14, 51 }, { 17, 20 }, { 18, 52 }, { 19, 53 }, { 24, 6 },
+	{ 25, 71 }, { 27, 73 }, { 28, 41 }, { 31, 27 }, { 32, 54 }, { 33, 55 },
+	{ 34, 56 }, { 35, 57 }, { 36, 58 }, { 39, 28 }, { 46, 29 }, { 62, 60 },
+	{ 63, 61 }, { 64, 62 }, { 69, 33 }, { 70, 34 }, { 72, 72 }, { 75, 35 },
+	{ 79, 36 }, { 80, 21 }, { 81, 38 }, { 86, 19 }, { 87, 42 }, { 88, 43 },
+	{ 89, 45 }, { 91, 74 }, { 94, 47 }, { 95, 48 }, { 96, 49 }, { 97, 50 },
+};
+
 static const struct msm_pinctrl_soc_data qcm2290_pinctrl = {
 	.pins = qcm2290_pins,
 	.npins = ARRAY_SIZE(qcm2290_pins),
@@ -1091,6 +1101,8 @@ static const struct msm_pinctrl_soc_data qcm2290_pinctrl = {
 	.groups = qcm2290_groups,
 	.ngroups = ARRAY_SIZE(qcm2290_groups),
 	.ngpios = 127,
+	.wakeirq_map = qcm2290_mpm_map,
+	.nwakeirq_map = ARRAY_SIZE(qcm2290_mpm_map),
 };
 
 static int qcm2290_pinctrl_probe(struct platform_device *pdev)
-- 
2.17.1

