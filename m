Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0EC455C94
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhKRNZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhKRNZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:25:17 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E3BC061764;
        Thu, 18 Nov 2021 05:22:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y26so25855572lfa.11;
        Thu, 18 Nov 2021 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9E+oBGu3s/wKY5ZnDLWn9aAASyvfS9O25fFkmrDjZDg=;
        b=g1VXvm95hleoOSdqO5/XtKVhOGke2/AqUe350SVd0FPK5y50OyVvH63wvhatm0Q9nQ
         LQ0HJ8VVNo095BvU6FaCp3IXkgm7HvKMCtq2uPP/NX9QZyDkGs04eiGPQbDFGhZjGRBg
         CxvpM+20YWwMSXyybGyu/TabXBF98/i6604dzFTi33NfmUVzc3dCqvr2wNUzMWTga19E
         vgR7A60eacjWxywyhxueAlh/omjgWjkapkITe+k4aWx7xqO/ei6xpQltbaywslMEbQJx
         Y/cJGDn1xNAH1ZS1BKEfEVjKPE5FM8WOIHOGxwjt1PxP99mXkIM6JfbX+I/snjyMjxaO
         jvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9E+oBGu3s/wKY5ZnDLWn9aAASyvfS9O25fFkmrDjZDg=;
        b=TcOJ+rCe17Ufk1vAxgdKwZbXiKLBCmw+HDz+A3+zwaCqc6z+Ai/4rtN3/8wFDJrB9L
         8r+EiRBxvvmMKP3LVCobLca5AWhvCOyygMGkcx1xK5jF6YrkYuCrcTs3gDigsRqGFed8
         f0GTGGpdcCqXNRHY2/xDbueJaF5GdJzxCTWKD06GvkLTZ+k5abfXH1QBLIVCZmqk3NLw
         i/XcU1DgGk0qyaKcmIUa7oHb1jdjCU1OmXlHLhF3QqiRwNcI7yINgVqSrcgyMN7cEEZP
         R4o7rG5pKJG0uC9SC5iGLm7LknHackdf9kJpkvjuFziCHtnYOIUJ+/Q2oBk0w2jEHBrc
         QZmg==
X-Gm-Message-State: AOAM530aJ7MWayoy8cDNTEChjOoUoVbvFQcJ64/bXt41twxlaDZM/gJD
        5KcbtvbO7Uu32R2/hwtsRIA=
X-Google-Smtp-Source: ABdhPJyqcA/lYXMQf4qMh25mqXnzK2hhKOSWdnaKKiSeIuucVGO9wDKOsaCmDI3n0rkyl9XCHJ8AcQ==
X-Received: by 2002:a2e:95d6:: with SMTP id y22mr17047762ljh.5.1637241735587;
        Thu, 18 Nov 2021 05:22:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bp36sm356550lfb.0.2021.11.18.05.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:22:15 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 4/5] pinctrl: bcm: pinctrl-ns: supoprt DT specified pins, groups & functions
Date:   Thu, 18 Nov 2021 14:21:51 +0100
Message-Id: <20211118132152.15722-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118132152.15722-1-zajec5@gmail.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's now possible to specify hardware pins, groups & functions in DT
instead of hardcoding that info in a driver. Use pinctrl subsystem
helpers to extract that info from DT.

Keep hardcoded data as fallback method.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/bcm/pinctrl-ns.c | 90 +++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 0897041b5ef1..48e77ff25d9d 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -213,7 +213,11 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 	struct ns_pinctrl *ns_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pin;
+	struct device_node *functions;
+	struct device_node *groups;
+	struct device_node *pins;
 	struct resource *res;
+	int err;
 	int i;
 
 	ns_pinctrl = devm_kzalloc(dev, sizeof(*ns_pinctrl), GFP_KERNEL);
@@ -243,19 +247,27 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 
 	/* Set pinctrl properties */
 
-	pctldesc->pins = devm_kcalloc(dev, ARRAY_SIZE(ns_pinctrl_pins),
-				      sizeof(struct pinctrl_pin_desc),
-				      GFP_KERNEL);
-	if (!pctldesc->pins)
-		return -ENOMEM;
-	for (i = 0, pin = (struct pinctrl_pin_desc *)&pctldesc->pins[0];
-	     i < ARRAY_SIZE(ns_pinctrl_pins); i++) {
-		const struct pinctrl_pin_desc *src = &ns_pinctrl_pins[i];
-		unsigned int chipsets = (uintptr_t)src->drv_data;
-
-		if (chipsets & ns_pinctrl->chipset_flag) {
-			memcpy(pin++, src, sizeof(*src));
-			pctldesc->npins++;
+	pins = of_get_child_by_name(dev->of_node, "pins");
+	if (pins) {
+		err = pinctrl_generic_get_dt_pins(pctldesc, dev);
+		of_node_put(pins);
+		if (err)
+			return err;
+	} else {
+		pctldesc->pins = devm_kcalloc(dev, ARRAY_SIZE(ns_pinctrl_pins),
+					sizeof(struct pinctrl_pin_desc),
+					GFP_KERNEL);
+		if (!pctldesc->pins)
+			return -ENOMEM;
+		for (i = 0, pin = (struct pinctrl_pin_desc *)&pctldesc->pins[0];
+		     i < ARRAY_SIZE(ns_pinctrl_pins); i++) {
+			const struct pinctrl_pin_desc *src = &ns_pinctrl_pins[i];
+			unsigned int chipsets = (uintptr_t)src->drv_data;
+
+			if (chipsets & ns_pinctrl->chipset_flag) {
+				memcpy(pin++, src, sizeof(*src));
+				pctldesc->npins++;
+			}
 		}
 	}
 
@@ -267,25 +279,43 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(ns_pinctrl->pctldev);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(ns_pinctrl_groups); i++) {
-		const struct ns_pinctrl_group *group = &ns_pinctrl_groups[i];
-
-		if (!(group->chipsets & ns_pinctrl->chipset_flag))
-			continue;
-
-		pinctrl_generic_add_group(ns_pinctrl->pctldev, group->name,
-					  group->pins, group->num_pins, NULL);
+	groups = of_get_child_by_name(dev->of_node, "groups");
+	if (groups) {
+		err = pinctrl_generic_get_dt_groups(ns_pinctrl->pctldev);
+		of_node_put(groups);
+		if (err)
+			return err;
+	} else {
+		for (i = 0; i < ARRAY_SIZE(ns_pinctrl_groups); i++) {
+			const struct ns_pinctrl_group *group = &ns_pinctrl_groups[i];
+
+			if (!(group->chipsets & ns_pinctrl->chipset_flag))
+				continue;
+
+			pinctrl_generic_add_group(ns_pinctrl->pctldev,
+						  group->name, group->pins,
+						  group->num_pins, NULL);
+		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(ns_pinctrl_functions); i++) {
-		const struct ns_pinctrl_function *function = &ns_pinctrl_functions[i];
-
-		if (!(function->chipsets & ns_pinctrl->chipset_flag))
-			continue;
-
-		pinmux_generic_add_function(ns_pinctrl->pctldev, function->name,
-					    function->groups,
-					    function->num_groups, NULL);
+	functions = of_get_child_by_name(dev->of_node, "functions");
+	if (functions) {
+		err = pinmux_generic_get_dt_functions(ns_pinctrl->pctldev);
+		of_node_put(functions);
+		if (err)
+			return err;
+	} else {
+		for (i = 0; i < ARRAY_SIZE(ns_pinctrl_functions); i++) {
+			const struct ns_pinctrl_function *function = &ns_pinctrl_functions[i];
+
+			if (!(function->chipsets & ns_pinctrl->chipset_flag))
+				continue;
+
+			pinmux_generic_add_function(ns_pinctrl->pctldev,
+						    function->name,
+						    function->groups,
+						    function->num_groups, NULL);
+		}
 	}
 
 	return 0;
-- 
2.31.1

