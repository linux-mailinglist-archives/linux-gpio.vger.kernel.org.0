Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB8A45D0B8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352378AbhKXXIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352370AbhKXXIM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:12 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EFFC061748;
        Wed, 24 Nov 2021 15:05:01 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id n12so11328636lfe.1;
        Wed, 24 Nov 2021 15:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F+wTJaDM5r+kBEnKzSjdLDhTIMgT1zwrllSdQA6Fd8c=;
        b=GAcDYwPz9LSENEq26U7TEJnu6ce9k/4l2vXsfG9xKZjxo8q93jC+Eus++WIDCdLORm
         zRHYDw+2TK48X2NRzeY8Dm6gWWoZu0TPJRBOVIFaepkjyOzU7nBLlsQtC7Dv01TZ/zlW
         xZbtJ1pckfWxeRzXBGO4b32ioqsDT7zF/kXP5BTNnV/ysyURA505gvVNXBo2KFxfDaMc
         eWLuAGaSrja2fTXgkIFzqXWlb3FjnJH9ZuNvek935eCPQ9YFo5kfIkpEH5KacDuq0787
         orInYbewu19bnL4v+tqLC8vUySuQKrbc6O1hxiwdRd2Tz1eelXOWuu+i58rEcBO35YDv
         k8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F+wTJaDM5r+kBEnKzSjdLDhTIMgT1zwrllSdQA6Fd8c=;
        b=0mmTIKzXgqMs18WwGvt+ip4xv5uVuaFsJFh34xk+NuhW/HL6Z95siyzYHquVJ+Ktpr
         Z4Ge/UfwRiZYOXitWCBsMWTIvhJnDVYUj4TcYDyZqhTxBXC30tv63gXzvVBH/ig7wLoN
         YNLgJH+lp3f4IrP+DAQqZw9hWIjFZ6qtlHC1ayB95wZwVBvdcMl2xpKNew8YCk/zbyLW
         +Dk5xA3yRFCW3hoNiMZ1WTdesYcyKFf53CRJ+B6DBrSyQoVa70j1dF5dImqigaOJt44T
         WoNasTTEgDrS+54VtL5+szooZcrPN3FDy27Sz3s5YIbGTmgokjoN1flKS6exsfrPD5JG
         kGxA==
X-Gm-Message-State: AOAM530b906gnOdWQlsdNKvOncdbctfqWU0UWz3p3egqB3P/133A1t3y
        fA4GZ9oJvmNue1ay9oLdrPw=
X-Google-Smtp-Source: ABdhPJwu/Bw6vmmNeIOw2NrUsgPlQvnNVaCKt3cFrezWklnMjvvFXnXK5qx9O+hzEH9Qtt3+e1/LMA==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr19570402lfh.382.1637795100285;
        Wed, 24 Nov 2021 15:05:00 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:05:00 -0800 (PST)
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
Subject: [PATCH V2 5/6] pinctrl: bcm: pinctrl-ns: supoprt DT specified pins, groups & functions
Date:   Thu, 25 Nov 2021 00:04:38 +0100
Message-Id: <20211124230439.17531-6-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124230439.17531-1-zajec5@gmail.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
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
index 0897041b5ef1..9036d62c806f 100644
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
+		err = pinctrl_generic_load_pins(pctldesc, dev);
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
+		err = pinctrl_generic_load_groups(ns_pinctrl->pctldev);
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
+		err = pinmux_generic_load_functions(ns_pinctrl->pctldev);
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

