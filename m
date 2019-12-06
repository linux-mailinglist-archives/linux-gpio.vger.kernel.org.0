Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9819D115619
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfLFRIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:36 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37569 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbfLFRIg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:36 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so5813032lfc.4
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P6wkq44hOUaRXToIbJJl7vWgcKUynxHObY8PwUP4zZ8=;
        b=aJl+9hkZMeoYw7Sp+Ah8kASUSXs35gClU8Xj3C5zggbrGrUybRnN7qlpEHJDlF5Aub
         6j9/pXLqhVpsmPFKj3A6G12TKeJ5nGQlILdr8UpaSUpN6VedW63FVN5GvAQJKwHtTl/m
         blmWxjmifZV6TS7mSz8uWfOPxPD4bU5/ZR9Tw1cNZ9XWNRxK9CBH3ycpTHzDWrVGufwn
         VAowJ+1E9apNmpsOSk20Csw67uK06DkinJeyvRVl92hS7XLCBOEnqPHlDIpN30dstq8p
         8TmX+Lm2foRKawEsnJ/NVYBIE1yC/ZiGC3GaypYVJEFczjWA4HLWY+EAhYK3rQrQf91v
         leRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=P6wkq44hOUaRXToIbJJl7vWgcKUynxHObY8PwUP4zZ8=;
        b=WnRZKnVssJAq2Ibs9l3AHHSkv6kDhv/6J6HDhnuB2fA+4LH4Aob7VXh737Yh+W+usm
         eduqlQhveVT66vg9AEFlxhK8gyNaP8PpjIT926VeIrirOb7mwa3gALfvF8FJvnq4iIfg
         JDUni9Isz4OefulouL8DVfSCCWZvHZMHK8CX5s5TF1ZFz+V2bs3+iqWK4zEj9xbC/RkN
         MQOgz7nkzTBBJ9bTThkNJyypoVPTB1frrGE5a8muRF8SRmLV88A0tjwGIsEf7sULfb5r
         dXX9yXYQs56tWTzje/AidtfDmKOLJGrjTdLAJAzpeGIq++YHXjhmcgjz643LlkpoJL23
         ztBQ==
X-Gm-Message-State: APjAAAXD7/Z4reeBr/a+qb6mPL4NdakL1UYLa3XioLQcOeOnVOMYadOT
        OMBOTFMYqlbbthbdolXAX9T8Nk5OEFU=
X-Google-Smtp-Source: APXvYqyXQ/7aXhzLUKmtOFra4sQxFySjBivrm4MghpcnnI5es3eI5GzwgETumQKWJxEB5uEyttz3xg==
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr9042656lfn.150.1575652113906;
        Fri, 06 Dec 2019 09:08:33 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:32 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 5/9] mmc: omap_hsmmc: Convert to pinctrl_select_default_state()
Date:   Fri,  6 Dec 2019 18:08:17 +0100
Message-Id: <20191206170821.29711-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's drop the boilerplate code for managing the default pinctrl state and
convert into using the new pinctrl_select_default_state().

Additionally, move away from using pinctrl_pm_select_default_state() as
it's scheduled for removal and use pinctrl_select_default_state() instead.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/omap_hsmmc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 767e964ca5a2..a379c45b985c 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1605,12 +1605,6 @@ static int omap_hsmmc_configure_wake_irq(struct omap_hsmmc_host *host)
 			ret = PTR_ERR(p);
 			goto err_free_irq;
 		}
-		if (IS_ERR(pinctrl_lookup_state(p, PINCTRL_STATE_DEFAULT))) {
-			dev_info(host->dev, "missing default pinctrl state\n");
-			devm_pinctrl_put(p);
-			ret = -EINVAL;
-			goto err_free_irq;
-		}
 
 		if (IS_ERR(pinctrl_lookup_state(p, PINCTRL_STATE_IDLE))) {
 			dev_info(host->dev, "missing idle pinctrl state\n");
@@ -2153,14 +2147,14 @@ static int omap_hsmmc_runtime_resume(struct device *dev)
 	if ((host->mmc->caps & MMC_CAP_SDIO_IRQ) &&
 	    (host->flags & HSMMC_SDIO_IRQ_ENABLED)) {
 
-		pinctrl_pm_select_default_state(host->dev);
+		pinctrl_select_default_state(host->dev);
 
 		/* irq lost, if pinmux incorrect */
 		OMAP_HSMMC_WRITE(host->base, STAT, STAT_CLEAR);
 		OMAP_HSMMC_WRITE(host->base, ISE, CIRQ_EN);
 		OMAP_HSMMC_WRITE(host->base, IE, CIRQ_EN);
 	} else {
-		pinctrl_pm_select_default_state(host->dev);
+		pinctrl_select_default_state(host->dev);
 	}
 	spin_unlock_irqrestore(&host->irq_lock, flags);
 	return 0;
-- 
2.17.1

