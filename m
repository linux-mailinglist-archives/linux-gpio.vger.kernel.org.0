Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A883B2A9196
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 09:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgKFIgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 03:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgKFIgm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 03:36:42 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED90C0613CF;
        Fri,  6 Nov 2020 00:36:41 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id e21so386742pgr.11;
        Fri, 06 Nov 2020 00:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+qSLTAucKIzC5zZwm342qCeQvvPCk8ksHbR7fQaZbX4=;
        b=imn0pZSNxZsLrHPYBFL+vAg8PxjfqXdFQxDQtbA1NSJGbdfCfW36wnzp/70b4P4PfC
         TH+rli3XjJSjxsT0Ygas1koR9AQVcKMZKmrlEvVghjmnZd//GXutkA0zAgFuy8y6DDW6
         RQGM+oCCwmpYaUeEPlF1kRGT41ddn4WcpbpBX//sB7OvYUC1u0e2TEpmRBr4mvKIlbne
         RgH3nS4TUNWCJl6I3zzNyH5kO5mLtqmueXaFMaXEutJGjNyUOLYZH8jwsdSjv/VqOPrC
         nrEqjh50gIypbrDD08xQsep7+aiw8tD10ewoGtgGy41mCR+f46XLYNm7163SKrgUxY0e
         VBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+qSLTAucKIzC5zZwm342qCeQvvPCk8ksHbR7fQaZbX4=;
        b=aN4K4ZiNhelP2b1XmW5j/dPuAxHOhNqxnWjpdCLolIpWH4a+qrlfWATEyZR8kJ+vi6
         ZnGcPhvmNnAmIogwTozighgL22mCmtOw6tZT8BRTGnQcwPC0A0ePl42DE8fpABJQIULl
         dxbxWcFzPBOC/aeVkaQK48BmeY9AIiINQtaJPnD8HCb2gsSjFqjvg8udSgmhUkR3ts58
         dn/+pzj9InbM1fUBEIVNCD0+EI6URjNXlQLkQHAx65lP8dyqvdBeIp/eSeEfoJXkComo
         cj92XZ03UfTIkzfJqyhNFDlPdp1zOAt9aZoIhaoG5FanGCIIA/F6AMyTuwLSiRjiDCZX
         Iz0w==
X-Gm-Message-State: AOAM530MYzhVkHbNh4M/5Y01yjhMia9YIC8WjmQTR+BmqFaNgnBG0fl8
        EumbG0YUFG4AGaQu+LYu/1ITkIWPuQu5
X-Google-Smtp-Source: ABdhPJxpBDG9SaVNnwr93UUXnTAbjCLxut547OQ22TAPQAQAexwPQt5bH3o3dZA+/VQn5lG1QZz8ow==
X-Received: by 2002:aa7:9095:0:b029:164:75c4:5d15 with SMTP id i21-20020aa790950000b029016475c45d15mr1037486pfa.49.1604651801151;
        Fri, 06 Nov 2020 00:36:41 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com. [67.216.221.250])
        by smtp.gmail.com with ESMTPSA id z206sm1232773pfc.3.2020.11.06.00.36.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 00:36:40 -0800 (PST)
From:   xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: [PATCH] pinctrl: ocelot: Remove unnecessary conversion to bool
Date:   Fri,  6 Nov 2020 16:36:35 +0800
Message-Id: <1604651795-1220-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kaixu Xia <kaixuxia@tencent.com>

Fix the following coccicheck warning:

./drivers/pinctrl/pinctrl-ocelot.c:732:28-33: WARNING: conversion to bool not needed here

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index a4a1b00f7f0d..c2be5c44077f 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -729,7 +729,7 @@ static int ocelot_pinconf_get(struct pinctrl_dev *pctldev,
 		if (err)
 			return err;
 		if (param == PIN_CONFIG_BIAS_DISABLE)
-			val = (val == 0 ? true : false);
+			val = (val == 0);
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
 			val = (val & BIAS_PD_BIT ? true : false);
 		else    /* PIN_CONFIG_BIAS_PULL_UP */
-- 
2.20.0

