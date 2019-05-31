Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273E630920
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 09:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfEaHHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 03:07:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36297 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfEaHHG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 03:07:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id d21so3634908plr.3;
        Fri, 31 May 2019 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gCzPYZeRgzuxB/s/HnMyy2mQvWi7OdLM0MRQ3A6icIU=;
        b=N9aDnulkY1Sw39aFl/VRAFPXkuoHv54dZ8n6jHZMrECIta1ErWsd8gArMwFTJ6Z5CF
         +fn1jBNNvO+PilqWYQc/qg7ZFfBcae1os5qtWEsuR44IWdIp4m3FTJky3L4Hy2F+Cp6z
         KfGAGW1+WcPCoqMBsrhuaE1sZZE8rjnTNh1GQFu+FKVgJ3JFTi+a2QfEzqv204N5GBY1
         srom02AuUoSAuNVSlf68bBQDm1t3CMsgLwnlIjnmVIc6/IlZPergmNzqA789t/6bZnKp
         QvSQLrMPS0wqQwX/8wDgrtKhvelcX0jyCe5BDdSnOoOxFVVEcJF7n85QebaMXTMzdOrb
         X8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gCzPYZeRgzuxB/s/HnMyy2mQvWi7OdLM0MRQ3A6icIU=;
        b=NVdItCVxk6NZVib4hQYpLKHLqKc1ISCnbLqu/GFc27JIUlJEH0RvssfX5N97THho8+
         4j+CePg7hvAgVF7Lr9rQ4YiPh6C2+xdTKuJ0skiuKHSY+C8N1NVT/2nUx4oouHHOeXGq
         yqvP/ANSAbrzzKXFAxBoF3mf9oxYhMJcsKGsUlEHiAFUt9BhrxxsQoQhya8IGG3O0E+l
         mI7BzgJ/vz9MK/Naj0qRyfSwnrbnFl5Qpm02WD+7ijBDQ5teROxIPUzu+ZAfXF0nIAsB
         zLxJeuOpCq7VsWS68Mdco5dgGuGEX/f9Yg6erNsiVN/MiK612lXqpOa/xeEwxEr8agZt
         ew1Q==
X-Gm-Message-State: APjAAAUifCXrGYs96EiNG1QMe1vqVhlpUZzC1kySZLwqGBlXeOMlPdQQ
        y4V91oqAkE+Yff2yQ6SM6co=
X-Google-Smtp-Source: APXvYqyxJsDO9UeM9q0M+fBL8/9K7JuWsbGJrDj2dkj/zbuEYvCNFMay+iJhARsFqHiwXuGlN3cG1Q==
X-Received: by 2002:a17:902:a40d:: with SMTP id p13mr7181833plq.11.1559286425503;
        Fri, 31 May 2019 00:07:05 -0700 (PDT)
Received: from xy-data.openstacklocal (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
        by smtp.gmail.com with ESMTPSA id k6sm5177437pfi.86.2019.05.31.00.07.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 00:07:04 -0700 (PDT)
From:   Young Xiao <92siuyang@gmail.com>
To:     sean.wang@kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] pinctrl: pinctrl-mtk-common: fix a possible NULL pointer deference
Date:   Fri, 31 May 2019 15:08:09 +0800
Message-Id: <1559286489-5418-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function, external interrupt controller, is made as an optional to
pinctrl. But if we don't want pio behaves as an external interrupt
controller, it would lead to pctl->eint not be created properly and then
will cause 'kernel NULL pointer' issue when gpiochip try to call .to_irq
or .set_config. To fix it, check pctl->eint before accessing the member.

See commit 5f591543a937 ("pinctrl: mt7622: fix a kernel panic when pio
don't work as EINT controller") for details.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 0716238..b395f0b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -836,6 +836,9 @@ static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 	const struct mtk_desc_pin *pin;
 	unsigned long eint_n;
 
+	if (!pctl->eint)
+		return -ENOTSUPP;
+
 	pin = pctl->devdata->pins + offset;
 	if (pin->eint.eintnum == NO_EINT_SUPPORT)
 		return -EINVAL;
@@ -853,7 +856,8 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	unsigned long eint_n;
 	u32 debounce;
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+	if (!pctl->eint ||
+	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
 		return -ENOTSUPP;
 
 	pin = pctl->devdata->pins + offset;
-- 
2.7.4

