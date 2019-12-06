Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2878E115617
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfLFRIf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:35 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35262 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLFRIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:35 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so5831457lfr.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rFMoiOb3bUP9LxJIzW1x3OJ7y3lUt3rITRuiEhSamMw=;
        b=yuBt1Nz63ljeeTGifF8LW4UZodTP03zOMvHRkLXlCEc4hZgzUrIZaFmigouYuu/5QQ
         yW2Wl3wSL6gGLxORyG6LdhioVtzqXg9caEL/Ryo/N24vFCPrG+ajtpk/gwAZibTAIolM
         ZxNiwoBij19TremrALO0Mx0jMqS9xK3LxRVKlWrDZvOgpjv4zNRvLz8vu1LTr4SMPhjm
         NH2bLJdJnbCKCWhS5H1DdQE7DKb/kraSjpB509FJqLGrxplNdsmayzsxhC2L8I6IH1RQ
         BCo/Lh7tZ+yvheB2BEKy4cPrV8Bn90ITFcRxOUUnHwj4pFYVXxiF8ElIUz6a38jUwPPW
         eXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rFMoiOb3bUP9LxJIzW1x3OJ7y3lUt3rITRuiEhSamMw=;
        b=o5M0HBVPiwoPX8UwORHsh9NAIIuK2QcfTvjlPF71MvNp/z/2JP0j5w75uxbQ1nwa9V
         ObD/lpYzzuSCd92CYE3rIxwPgdz1Wv4CMT/zK34it8f1BV84H+dzH67SBhpoexXaKjbo
         69et6eTDEqZ4raK3Wa15YSARmoEaMIVMMUt/o7VOjYuhZ+GCTXaLPCjnPITsA1slSWnT
         zaQXTnQPEuB0TnmC/cDkRzGf6dI4cX4gAz61fsb2NmESUUKiSrBXRu4BK8sicnljU69b
         Gm+zf7WYnURKIBtFyCo+KGdNvD5NvbNczknV4DNyeaaNbX+eoMIX2C0xbUkGeybrmi7b
         I1jQ==
X-Gm-Message-State: APjAAAV7tg3F6USE0q7gj4xG+6/HgASSj9IaO6FTZAN7BFenoH+I2knp
        tdfYB2ZmYS/e1bAb7wN33YnYbYoJa8w=
X-Google-Smtp-Source: APXvYqx0qpC5LT1rrt5Z6fK9f1Qoo58inkUhE1J56SLYUqKWNAX18lgbkzE7VWQhJDcOmtomKc3qAA==
X-Received: by 2002:a05:6512:21d:: with SMTP id a29mr1570063lfo.186.1575652112299;
        Fri, 06 Dec 2019 09:08:32 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:31 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>
Subject: [PATCH 4/9] mmc: usdhi6rol0: Convert to pinctrl_select_default_state()
Date:   Fri,  6 Dec 2019 18:08:16 +0100
Message-Id: <20191206170821.29711-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's drop the boilerplate code for managing the default pinctrl state and
convert into using the new pinctrl_select_default_state().

Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Lars Persson <lars.persson@axis.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/usdhi6rol0.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
index b11ac2314328..969a34e698f2 100644
--- a/drivers/mmc/host/usdhi6rol0.c
+++ b/drivers/mmc/host/usdhi6rol0.c
@@ -199,7 +199,6 @@ struct usdhi6_host {
 
 	/* Pin control */
 	struct pinctrl *pinctrl;
-	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_uhs;
 };
 
@@ -1162,8 +1161,7 @@ static int usdhi6_set_pinstates(struct usdhi6_host *host, int voltage)
 					    host->pins_uhs);
 
 	default:
-		return pinctrl_select_state(host->pinctrl,
-					    host->pins_default);
+		return pinctrl_select_default_state(mmc_dev(host->mmc));
 	}
 }
 
@@ -1770,17 +1768,6 @@ static int usdhi6_probe(struct platform_device *pdev)
 	}
 
 	host->pins_uhs = pinctrl_lookup_state(host->pinctrl, "state_uhs");
-	if (!IS_ERR(host->pins_uhs)) {
-		host->pins_default = pinctrl_lookup_state(host->pinctrl,
-							  PINCTRL_STATE_DEFAULT);
-
-		if (IS_ERR(host->pins_default)) {
-			dev_err(dev,
-				"UHS pinctrl requires a default pin state.\n");
-			ret = PTR_ERR(host->pins_default);
-			goto e_free_mmc;
-		}
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->base = devm_ioremap_resource(dev, res);
-- 
2.17.1

