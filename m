Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C343B4F6D
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 18:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhFZQUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Jun 2021 12:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhFZQUq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Jun 2021 12:20:46 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C1DC061574;
        Sat, 26 Jun 2021 09:18:23 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso7658546wmc.1;
        Sat, 26 Jun 2021 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EiwvhxHHYnXlQFAfyvbb660HqmLBRhfzVtQYXOX3ilo=;
        b=XNlmYzSufIMXd8MIV8JFtm/dgAJl17OSEvYTbpSPvJuBrgpmw6hZnFyS1S0+/r++5x
         VoRhbbFGCJqP19L1ZH5zmqhG2hio7c7vZC3XcjP2A9Rl6749QE65mVK/d75cWDIPDLU7
         DfT5mlMg3dCcuD27Dr5hjLyBsTj8GhYNzgqqzPG7WkL6/GuQBcJEO1oaeuKJA0P5odLR
         uwcW0Bh7ZG0hxZiwjTKsZee2qLLsDPizhER1dDi6h0BPN/SuxyPC1eYcqANpfuGCc9J2
         bAA4/53O5oDdUf2eUF/ezepe+D+Oq+FsAV3RlKvTjUwXs7+/HQ6mlFL5hs1CI2AtMNks
         Pafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EiwvhxHHYnXlQFAfyvbb660HqmLBRhfzVtQYXOX3ilo=;
        b=t/0fGvwRo6XAu+lRIMybqswBKECQ4M+BetTwtB2uCh9fb3utI3KWSlg7OTNB9m50tp
         KEimnig3rp77dCNln/FY8EDCZub8tCCmD9k84YuDRDzR/c5Lnt9rB9h1zfS6LsZn5ipG
         T1GMdnf7/7RDahyqLKqtz50eXzVoswJjrPn2VqUVx27WQc8eAbL2rZ4VTOXGHawP7VW5
         bbti6ZeTp1jHThVPzgWE7YcAXTCkqg4zFK2MEhZGk0D5b1Jng881Kp79dWfmf039wt1m
         4jO7Np01MFBAhjrSNrehkjLySpdVTFATg7yOj/8acRh+Yp6ZuIBZ2o9RW3gLc2a70p44
         iXVg==
X-Gm-Message-State: AOAM5306fhpvsSq5aQxcgoIXB2IxNxfT8oqLIa92AVkAKBC9y6Xg9uCq
        WDv9p7IXYrnrCF+oHwIX2JPII4KYI5o9pw==
X-Google-Smtp-Source: ABdhPJzwQFyIjjRy8sHFRg4X6d0e3lOZsP5GWKBcDoPtLK71iSp5Up0JWIobwb6UVyqA/8pdpVPgiQ==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr2830841wmh.111.1624724302020;
        Sat, 26 Jun 2021 09:18:22 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id c18sm8961944wrt.83.2021.06.26.09.18.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Jun 2021 09:18:20 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, matthias.bgg@gmail.com,
        linus.walleij@linaro.org, git@johnthomson.fastmail.com.au,
        linux-kernel@vger.kernel.org, neil@brown.name,
        opensource@vdorst.com, hofrat@osadl.org
Subject: [PATCH v2] gpio: mt7621: support gpio-line-names property
Date:   Sat, 26 Jun 2021 18:18:19 +0200
Message-Id: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The default handling of the gpio-line-names property by the
gpiolib-of implementation does not work with the multiple
gpiochip banks per device structure used by the gpio-mt7621
driver.

This commit adds driver level support for the device tree
property so that GPIO lines can be assigned friendly names.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Hi,

This driver has three gpiochips with 32 gpios each. Core implmentation
got gpio's repeated along each gpio chip if chip.names is not assigned.
To avoid this behaviour driver will set this names as empty or
with desired friendly line names. Consider the following sample with
minimal entries for the first chip with this patch changes applied:

&gpio {
    gpio-line-names = "", "", "", "",
                      "", "", "SFP LOS", "extcon port5 PoE compat",
                      "SFP module def0", "LED blue SFP", "SFP tx disable", "",
                      "switch USB power", "mode", "", "buzzer",
                      "LED blue pwr", "switch port5 PoE out", "reset";
};

gpioinfo
gpiochip0 - 32 lines:
  line   0:      unnamed       unused  output  active-high
  line   1:      unnamed       unused   input  active-high
  line   2:      unnamed       unused   input  active-high
  line   3:      unnamed       unused   input  active-high
  line   4:      unnamed       unused   input  active-high
  line   5:      unnamed       unused   input  active-high
  line   6:    "SFP LOS"        "los"   input  active-high [used]
  line   7: "extcon port5 PoE compat" unused input active-high
  line   8: "SFP module def0" "mod-def0" input active-low [used]
  line   9: "LED blue SFP" "blue:sfp" output active-high [used]
  line  10: "SFP tx disable" "tx-disable" output active-high [used]
  line  11:      unnamed       unused  output  active-high
  line  12: "switch USB power" "usb_power" output active-high [used]
  line  13:       "mode"       "mode"   input  active-high [used]
  line  14:      unnamed       unused   input  active-high
  line  15:     "buzzer"     "buzzer"  output  active-high [used]
  line  16: "LED blue pwr" "blue:pwr" output active-high [used]
  line  17: "switch port5 PoE out" "sysfs" input active-high [used]
  line  18:      "reset"      "reset"   input  active-high [used]
  line  19:      unnamed       unused   input  active-high
  line  20:      unnamed       unused   input  active-high
  line  21:      unnamed       unused   input  active-high
  line  22:      unnamed       unused   input  active-high
  line  23:      unnamed       unused   input  active-high
  line  24:      unnamed       unused   input  active-high
  line  25:      unnamed       unused   input  active-high
  line  26:      unnamed       unused   input  active-high
  line  27:      unnamed       unused   input  active-high
  line  28:      unnamed       unused   input  active-high
  line  29:      unnamed       unused   input  active-high
  line  30:      unnamed       unused   input  active-high
  line  31:      unnamed       unused   input  active-high 
gpiochip1 - 32 lines:
  line   0:      unnamed       unused   input  active-high
  line   1:      unnamed       unused   input  active-high 
  ...
  line  31:      unnamed       unused   input  active-high 
gpiochip2 - 32 lines:
  line   0:      unnamed       unused   input  active-high
  line   1:      unnamed       unused   input  active-high 
  ...
  line  31:      unnamed       unused   input  active-high 

To avoid gpiochip1 and gpiochip2 entries repeated with this
minimal lines definition change, we assign empty reserved
'names' in driver code.

Note that we also don't want to to prevent the driver from
succeeding at probe due to an error in the gpio-line-names
property and the ENODATA error is considered a valid result
to terminate any further labeling so there is no need for
an error message in that case. Other error results are
unexpected so an error message indicating the consequence
of the error is appropriate here.

Changes in v2:
 - 'mediatek_gpio_set_names' returns -ENOMEM in case of OOM.
 - Caller checks 'mediatek_gpio_set_names' return value.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

 drivers/gpio/gpio-mt7621.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..7fc9e3c1ce10 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -206,6 +206,47 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 	return gpio % MTK_BANK_WIDTH;
 }
 
+static int
+mediatek_gpio_set_names(struct device *dev, struct mtk_gc *rg)
+{
+	struct device_node *np = dev->of_node;
+	const char **names;
+	int nstrings, base;
+	unsigned int i;
+
+	names = devm_kcalloc(dev, MTK_BANK_WIDTH, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	base = rg->bank * MTK_BANK_WIDTH;
+	nstrings = of_property_count_strings(np, "gpio-line-names");
+	if (nstrings <= base)
+		goto assign_names;
+
+	for (i = 0; i < MTK_BANK_WIDTH; i++) {
+		const char *name;
+		int ret;
+
+		ret = of_property_read_string_index(np, "gpio-line-names",
+						    base + i, &name);
+		if (ret) {
+			if (ret != -ENODATA)
+				dev_err(dev, "unable to name line %d: %d\n",
+					base + i, ret);
+			break;
+		}
+
+		if (*name)
+			names[i] = name;
+	}
+
+assign_names:
+	rg->chip.names = names;
+
+	return 0;
+}
+
 static int
 mediatek_gpio_bank_probe(struct device *dev,
 			 struct device_node *node, int bank)
@@ -241,6 +282,10 @@ mediatek_gpio_bank_probe(struct device *dev,
 	if (!rg->chip.label)
 		return -ENOMEM;
 
+	ret = mediatek_gpio_set_names(dev, rg);
+	if (ret)
+		return ret;
+
 	rg->irq_chip.name = dev_name(dev);
 	rg->irq_chip.parent_device = dev;
 	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-- 
2.25.1

