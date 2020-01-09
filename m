Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D510B1353EB
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 08:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgAIHzj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 02:55:39 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34160 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgAIHzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 02:55:39 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so4506477lfc.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 23:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3Ove3V1T1Bub/qpR2/pGJpcK97x4w+sAXIAlpmwqS0=;
        b=uPrjIdVbemOlwwlYfUDc9W0dUcRENF8avWVNwTiniR+wQTIIeqaQuPQagvC6AiYgEL
         Qd08FLedYjXtP/4V013BXtwtNrFXAnX71ACTCrGykkRdSlblVuSpgC6AKpDnZOrtIiXK
         nG25hF/+XjIz2ZP/6buTbSEFFeZjTjSAEqXLegsjeaQ/Iq8N1N4CfInYzlXYkykXKX5D
         XRKe+JBOPN6JiOaL1f3BylPQCcenElr3q6EBtICl78EDLhOv426D69sRl8imyB7JvWPG
         cvc1IyjD4V0m/hTV+O20vPEIE9EKHDX3JDRLNl7QF17ZsLusflIomMiPLpINKHMtdpAl
         eDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3Ove3V1T1Bub/qpR2/pGJpcK97x4w+sAXIAlpmwqS0=;
        b=BoQHaqromeMvEsBqFc0YiFQWaZb0sgHhbowapmx9J3ZRfwIROKIUvKuv2h2ZV20EXN
         ouxlaPdla2Z4JjcwtRwWqf5FgVSUkx0j96WZq8CqWt9Sypi8wnLEFPbtR/BEWkRiAsL+
         fN/BWMpSOxN0k7MHSpDfvejGtW0c5eLtrJ0UNiKaxLCOm2v4ojd8qX/WrHiQptXthYMO
         K5sHP21Ifc1sA2YzXTKXpKX+gZHYCKUuCML7BuDLRaz9gEkegWNGq1fHqs/HGk+19IHL
         2BGC2JWhk55Luvzr/oTxuGHc133eoWORdvIpldVDS/4KVduxvJFBEcn/xUHNtw8rKRso
         Vi6Q==
X-Gm-Message-State: APjAAAWxyf/VdccP97D/gMyXE6Svi3lrQiyIAKG21TknYNE31sdMu9Nr
        BLe0pwQXkNIwhyDqEmjH61QXcw==
X-Google-Smtp-Source: APXvYqwd0/GIz86Mhs0GL6KvZG5qP3M1e3Eazxbc5mSmU+2GuLMDUmqBMOsv6yD26CF0xsVb2pMo9Q==
X-Received: by 2002:a19:7604:: with SMTP id c4mr5547705lff.101.1578556537498;
        Wed, 08 Jan 2020 23:55:37 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id d9sm2452745lja.73.2020.01.08.23.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 23:55:37 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] pinctrl: intel: Add GPIO <-> pin mapping ranges via callback
Date:   Thu,  9 Jan 2020 08:53:28 +0100
Message-Id: <20200109075329.398347-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When IRQ chip is instantiated via GPIO library flow, the few functions,
in particular the ACPI event registration mechanism, on some of ACPI based
platforms expect that the pin ranges are initialized to that point.

Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Please apply this to the Intel pinctrl tree when you're pleased
with it!
---
 drivers/pinctrl/intel/pinctrl-intel.c | 35 +++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 4860bc9a4e48..b479bcf1e246 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1160,8 +1160,8 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 	return ret;
 }
 
-static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
-				     const struct intel_community *community)
+static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
+				const struct intel_community *community)
 {
 	int ret = 0, i;
 
@@ -1181,6 +1181,24 @@ static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
 	return ret;
 }
 
+static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
+{
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
+	int ret, i;
+
+	for (i = 0; i < pctrl->ncommunities; i++) {
+		struct intel_community *community = &pctrl->communities[i];
+
+		ret = intel_gpio_add_community_ranges(pctrl, community);
+		if (ret) {
+			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 {
 	const struct intel_community *community;
@@ -1205,7 +1223,7 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 
 static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
-	int ret, i;
+	int ret;
 
 	pctrl->chip = intel_gpio_chip;
 
@@ -1214,6 +1232,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->chip.label = dev_name(pctrl->dev);
 	pctrl->chip.parent = pctrl->dev;
 	pctrl->chip.base = -1;
+	pctrl->chip.add_pin_ranges = intel_gpio_add_pin_ranges;
 	pctrl->irq = irq;
 
 	/* Setup IRQ chip */
@@ -1231,16 +1250,6 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 		return ret;
 	}
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		struct intel_community *community = &pctrl->communities[i];
-
-		ret = intel_gpio_add_pin_ranges(pctrl, community);
-		if (ret) {
-			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-			return ret;
-		}
-	}
-
 	/*
 	 * We need to request the interrupt here (instead of providing chip
 	 * to the irq directly) because on some platforms several GPIO
-- 
2.23.0

