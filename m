Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649AEBB684
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 16:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407085AbfIWOUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 10:20:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46147 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407022AbfIWOUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 10:20:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id e17so13836808ljf.13
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2019 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cn9/9Me6Kmp4Xn9AfJMQMku3qxEXOlFZIGtDmEDrJpc=;
        b=abcoxhvNE4QzsWdjpcm4fIk+YAxDnJvfoFRGb46mpPwEFg0aOpeJ0eaheg3tZgT4ZG
         ojpl8m/oDAh+qYbzYsIcSeNXc5m5DY3mfdWvxLXTBeWP7wfLsaIXItCLI6UZUPW+vtJ1
         VGOT858b8NEkfBIvrgsoW5+e3A7n18FZCZM84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cn9/9Me6Kmp4Xn9AfJMQMku3qxEXOlFZIGtDmEDrJpc=;
        b=PuGGB92rO5Cs6OiNHzmQz+yVEtPGmEVDeRgTz9VrqW82Jz+iQNACMWD6YKN6vo1qmJ
         3MYBmUE6ivPdvJVWrFvxFm891zhdq1Rr9b6c6m1Yy3BKxdMSw58dLtC8Rjkoppt6O9YW
         i14ufsJlWVAoQCnOQWqY8Jl7fE3DgHxdRh1uSc3w/iQKRiF2kJh4SR1pS5E2l0UzyKrp
         VSCr8NOLjStG9G/gIGtsoTEZ7vMtqoHZ5Tx/yzLEa1VJmO6IjMas9BvT4wi1d6++N4/P
         uXEqA6NV92MVFEoZi5PyoOYSmTfypUl9Xv10cXtmeS/YSiSAZOtTMECQ1BDzuZkCrbBi
         Ta/A==
X-Gm-Message-State: APjAAAWGc7hn2dos2ITIVj0yp5h/9647myPymXqbSMYyp6VqUVz/WMrv
        EbFoR/joEV1uZAQ1YQ7T9U1/Nw==
X-Google-Smtp-Source: APXvYqy+Ki9LgN+TwomD1Y4hGoRYgJaAEevteVNzRvde3/6GQAoELKo5qYA33O6wCDX/Pq8W4P59VQ==
X-Received: by 2002:a2e:3902:: with SMTP id g2mr17815555lja.196.1569248411411;
        Mon, 23 Sep 2019 07:20:11 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id b21sm2230125lff.96.2019.09.23.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 07:20:10 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: devicetree.c: remove orphan pinctrl_dt_has_hogs()
Date:   Mon, 23 Sep 2019 16:20:05 +0200
Message-Id: <20190923142005.5632-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The helper pinctrl_dt_has_hogs() was introduced in
99e4f67508e1 (pinctrl: core: Use delayed work for hogs), but the sole
use then got removed shortly after in 950b0d91dc10 (pinctrl: core: Fix
regression caused by delayed work for hogs).

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/pinctrl/devicetree.c | 15 ---------------
 drivers/pinctrl/devicetree.h |  7 -------
 2 files changed, 22 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 5d6d8b1e9062..6716a406d128 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -166,21 +166,6 @@ static int dt_remember_dummy_state(struct pinctrl *p, const char *statename)
 	return dt_remember_or_free_map(p, statename, NULL, map, 1);
 }
 
-bool pinctrl_dt_has_hogs(struct pinctrl_dev *pctldev)
-{
-	struct device_node *np;
-	struct property *prop;
-	int size;
-
-	np = pctldev->dev->of_node;
-	if (!np)
-		return false;
-
-	prop = of_find_property(np, "pinctrl-0", &size);
-
-	return prop ? true : false;
-}
-
 int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
 {
 	struct device_node *np = p->dev->of_node;
diff --git a/drivers/pinctrl/devicetree.h b/drivers/pinctrl/devicetree.h
index 00e645d7fac7..efa80779de4f 100644
--- a/drivers/pinctrl/devicetree.h
+++ b/drivers/pinctrl/devicetree.h
@@ -9,8 +9,6 @@ struct of_phandle_args;
 
 #ifdef CONFIG_OF
 
-bool pinctrl_dt_has_hogs(struct pinctrl_dev *pctldev);
-
 void pinctrl_dt_free_maps(struct pinctrl *p);
 int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev);
 
@@ -23,11 +21,6 @@ int pinctrl_parse_index_with_args(const struct device_node *np,
 
 #else
 
-static inline bool pinctrl_dt_has_hogs(struct pinctrl_dev *pctldev)
-{
-	return false;
-}
-
 static inline int pinctrl_dt_to_map(struct pinctrl *p,
 				    struct pinctrl_dev *pctldev)
 {
-- 
2.20.1

