Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21890115613
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfLFRIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:32 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34676 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfLFRIc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:32 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so5837342lfc.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O8WqN3lnEyD9AJPmC5ibEKsr/6UO7fhL7XDNvCov7/A=;
        b=Q44gSt2TrsiZ2pSroay4LmdmBxBEL+IzpH+ye7xKOGnSPcnZffLFmAWa2J42YbNoEl
         5wZpDfG6gkeJYCQny4pRAJwgNaNOlh02jjhm3jaP7eZtu6iuIVsWWm3dbmwII05lg60v
         1qJXOgtYyIruva88pR9JPq2OGTeCwB9XGT/ma5OrQgzOsrKnohVx548xlYLKaXpz4S47
         7H2W0ldMFGYxbp7rzM060Q5tGJTrHjXqrzL6Z7rZn+X9gGPFFMKDeQWd3E+9zpwFcnTK
         A7J0BlkerrfC31vur6y5ZyAtCb/NBDQ1jrCJ+/GZm+q8egakeb4qg+NDtuu6B6luiCD7
         Wcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O8WqN3lnEyD9AJPmC5ibEKsr/6UO7fhL7XDNvCov7/A=;
        b=bmhs8nMBf2HL84f7WSRoyCraeBgiOFVMBd4/pJWRaAc7tW/snEhOe8Ea4+XNLONNko
         QxD/q6Os/2w08R3fro/S0Hmg/Kn9q4UOO7CGkDzshh16t83LqPI1EoRqEKAvJM2gL4VM
         H7Bk9nwOC01XCLkMKwMcMxnNvZfXmD9gQ6Dzj4B5uuTas4Z2GXwh+V2gsf77eyl723jd
         2ZCKV2Jc3TweJ9jRnCJl4TdQBPKSkTIygTRCKUAnmUOT94qW0zfHPS1OaNqrfEipOEBk
         lNfMS68F2MlgDdJ2MnrsxjrfSnlMAQX3K25O9trQrkFz/SwH+Z2J7dTO8ApNbj0XWctn
         wNkg==
X-Gm-Message-State: APjAAAXYPrsdqE32l5bxlfRfNY2tbDf03GBUwDU61QF7gQpFj5ZxkbRb
        hx+3X7+FrWI5e0AsmEjHwyCrr2Ga2mM=
X-Google-Smtp-Source: APXvYqwHweyq6mEptO8og8uBC9DT4NaGsbDLKM7d70VYzZ2DIG4Qfmb9tMUeAe5weBz+vUhsYYjpjg==
X-Received: by 2002:ac2:5b41:: with SMTP id i1mr8691197lfp.82.1575652110129;
        Fri, 06 Dec 2019 09:08:30 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:29 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/9] mmc: meson-gx: Convert to pinctrl_select_default_state()
Date:   Fri,  6 Dec 2019 18:08:14 +0100
Message-Id: <20191206170821.29711-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's drop the boilerplate code for managing the default pinctrl state and
convert into using the new pinctrl_select_default_state().

Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/meson-gx-mmc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index e712315c7e8d..35400cf2a2e4 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -161,7 +161,6 @@ struct meson_host {
 	bool dram_access_quirk;
 
 	struct pinctrl *pinctrl;
-	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_clk_gate;
 
 	unsigned int bounce_buf_size;
@@ -327,7 +326,7 @@ static void meson_mmc_clk_ungate(struct meson_host *host)
 	u32 cfg;
 
 	if (host->pins_clk_gate)
-		pinctrl_select_state(host->pinctrl, host->pins_default);
+		pinctrl_select_default_state(host->dev);
 
 	/* Make sure the clock is not stopped in the controller */
 	cfg = readl(host->regs + SD_EMMC_CFG);
@@ -1101,13 +1100,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto free_host;
 	}
 
-	host->pins_default = pinctrl_lookup_state(host->pinctrl,
-						  PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(host->pins_default)) {
-		ret = PTR_ERR(host->pins_default);
-		goto free_host;
-	}
-
 	host->pins_clk_gate = pinctrl_lookup_state(host->pinctrl,
 						   "clk-gate");
 	if (IS_ERR(host->pins_clk_gate)) {
-- 
2.17.1

