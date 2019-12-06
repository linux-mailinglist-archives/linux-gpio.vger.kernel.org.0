Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D194711561F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfLFRIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:40 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35271 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbfLFRIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:40 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so5831652lfr.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xG/TtMVmPt3YpqGKMEzSfHDWIvjefdWJoE6sWzREm9w=;
        b=T3j6q9yyJwGRnHfgLKReG38xnZcDjDAGoSs4KkNm6DxdV9IJWSMvIgc8IuTjgqPy2x
         XQnBk+IP+wLfnwBxIcr+A7ZjXoF4jLZHI55vCBxYMfUM/EPGh1AzGSzLcR/XDlfVs2F9
         fxgoiqzdo7IT16q1CPsWg2HXv600IRpsmwp69Wke0RU15Yqsd3DODVLEYPzq/aSPB482
         KOl827S/v2o5NJiqDzXxu31GgDYWGNofv06JMYca67U8AFSQ2DjktV0d0T2ELYHAINrB
         smMvP4jXvNW8YxnoaoPLvoSq4V0qlCYzwZRCvqdxzJfltyF7Lfr3VJEcu4/jAeV4vas/
         0jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xG/TtMVmPt3YpqGKMEzSfHDWIvjefdWJoE6sWzREm9w=;
        b=L7Wuv6BLvLr8y0UAtal+WmKIYG1t4AyEmsgycvfmj1OBv0r9tapcBCRPOPsskZgZI8
         t3SSq++NxVRpIREhiikSRCBSnho2B5xk2VsVMMFK1k7aOtpq8GAwsWacHNIQQU4LU6aJ
         O7uxd5Nn8kORRh/UJfxiBy2rGBM88JSDn4J2WVWC0tUhAlFNsYUJMpzYKK4ymkXPghiU
         N5j+rORCPBLuPt8EItj/qTLEVIT6TqfiEz5bpNc/rL0na8eDL4kMJllqR4KsR7BhqQ1k
         XGbY1uFUpT+bOqHPyoV3AilHqG8+eGOQeMbtPAXNvfuih67k55sYwYDDAkgFnQVG90XJ
         4TkQ==
X-Gm-Message-State: APjAAAX6++jq0+AWFqhd6TqAOwmG2L0pe6ZamPXY+YhQPKHUzuzn7P60
        +3/WZLo3C5V1uvyNohuU0s8lIV3GyB0=
X-Google-Smtp-Source: APXvYqx+65bHTzp79RZZPbKO9pZhUqV0hmJgvWeR0vfzi0w5W1n7PA9yW/kjlvKOR9fmTzlvKt4jgQ==
X-Received: by 2002:a05:6512:284:: with SMTP id j4mr8351775lfp.109.1575652117781;
        Fri, 06 Dec 2019 09:08:37 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:37 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 8/9] mmc: jz4740: Convert to pinctrl_select_default_state()
Date:   Fri,  6 Dec 2019 18:08:20 +0100
Message-Id: <20191206170821.29711-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's move away from using pinctrl_pm_select_default_state() as it's
scheduled for removal and use pinctrl_select_default_state() instead.

Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/jz4740_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 78383f60a3dc..fbae87d1f017 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1108,7 +1108,7 @@ static int jz4740_mmc_suspend(struct device *dev)
 
 static int jz4740_mmc_resume(struct device *dev)
 {
-	return pinctrl_pm_select_default_state(dev);
+	return pinctrl_select_default_state(dev);
 }
 
 static SIMPLE_DEV_PM_OPS(jz4740_mmc_pm_ops, jz4740_mmc_suspend,
-- 
2.17.1

