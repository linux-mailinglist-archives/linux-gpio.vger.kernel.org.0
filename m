Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AC245D0B3
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350651AbhKXXIL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352394AbhKXXIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65CBC061574;
        Wed, 24 Nov 2021 15:04:58 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id t26so11222719lfk.9;
        Wed, 24 Nov 2021 15:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVkTUK7QkjIeFdpB9hVLrTY5BoIQjyOYtxWUGwbvJys=;
        b=kL/fVgVn10AbM0lKYm76V+9I42RK7/GvBIURJGR8n2ZR4lXDzve1AorLsLZ6GvintH
         Ml8g8BKIMgZYfaNyI1Mw6jYiq+xc4mnote0sT054Cjd0jTLfvmQVyNFryxYdRLDgFTf2
         nGiWvuKURLzZ6MVUyUEIVRZsaOS69rOClS2qPukxGaEljXP/uS2zgdrpNDVzrCO64sZ3
         b1WQBeEt+UKjU/K8/Yg0VorHNDjMnvqJgk4SMVv5JVCnd5LbQ6R/VpJ5K8+gBdi/cP4z
         sOpwGIEA5JAL2XG/uAHpFHEtoscF6nP8gGON9Qr07D1VJYIu63H/b+uBqQb6SKlVc3fE
         IqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVkTUK7QkjIeFdpB9hVLrTY5BoIQjyOYtxWUGwbvJys=;
        b=7nGAarQcGdLUlcSLwQq59BPQJdm7ZIAaqXIrLVxlcvYOFarEVY4XSCVQdapk+fb+7m
         EXbAqyt6K1Q9t9EnLH1f3BT3xHa8lkksCBoy5auA1jd7xGyw2QuqzybK5Y4LKSmPOkvB
         JjcGWm8srAkY7X2XrDg9LDYD2PTD63KcGN6uQj5TeBQt2QOxxesGkiVAd2fIyB4eavBN
         wg3zlR3KdYDVYfYJlzyZ1YwOEMenIzAj4MuOIGDNaCXkdzB5VX24uuATmAvvaRbUXhwf
         pEuAP3H7yAim+JtOykVQY7z2etFj46Wx61ofsS5n6tsG7Ls7P/JBmBJCo7nJ3mcyTMK0
         SYeA==
X-Gm-Message-State: AOAM531Agmc0Cp4xmuGyi7AnCHveoS9yyL8FkbLmWfxIOoAHE0jEyy+s
        VpuLYyUSPoTmtTDI3VQ8crg=
X-Google-Smtp-Source: ABdhPJyAbaZJqJqseIcqpYz/VNW4WSEM4wxx6mxoUSpt0+BE7dUQIugjOrYjhoVf6yWSu5lF8vYrog==
X-Received: by 2002:a05:6512:a91:: with SMTP id m17mr19411033lfu.638.1637795097079;
        Wed, 24 Nov 2021 15:04:57 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:04:56 -0800 (PST)
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
Subject: [PATCH V2 3/6] pinctrl: prepare API for reading pins, groups & functions
Date:   Thu, 25 Nov 2021 00:04:36 +0100
Message-Id: <20211124230439.17531-4-zajec5@gmail.com>
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

That API can be used for parsing platform data (coming from e.g. DT or
ACPI) into pinctrl generic structures.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: New patch in the series to address Andy's API review
---
 drivers/pinctrl/core.c   | 12 ++++++++++++
 drivers/pinctrl/core.h   |  4 ++++
 drivers/pinctrl/pinmux.c |  6 ++++++
 drivers/pinctrl/pinmux.h |  2 ++
 4 files changed, 24 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ffe39336fcac..53b3e8b54a9b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -515,8 +515,20 @@ void pinctrl_remove_gpio_range(struct pinctrl_dev *pctldev,
 }
 EXPORT_SYMBOL_GPL(pinctrl_remove_gpio_range);
 
+int pinctrl_generic_load_pins(struct pinctrl_desc *pctldesc, struct device *dev)
+{
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_load_pins);
+
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 
+int pinctrl_generic_load_groups(struct pinctrl_dev *pctldev)
+{
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_load_groups);
+
 /**
  * pinctrl_generic_get_group_count() - returns the number of pin groups
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 840103c40c14..def60d89d37b 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -182,6 +182,8 @@ struct pinctrl_maps {
 	unsigned num_maps;
 };
 
+int pinctrl_generic_load_pins(struct pinctrl_desc *pctldesc, struct device *dev);
+
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 
 /**
@@ -198,6 +200,8 @@ struct group_desc {
 	void *data;
 };
 
+int pinctrl_generic_load_groups(struct pinctrl_dev *pctldev);
+
 int pinctrl_generic_get_group_count(struct pinctrl_dev *pctldev);
 
 const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6cdbd9ccf2f0..ef7d2cbf0946 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -788,6 +788,12 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 
 #ifdef CONFIG_GENERIC_PINMUX_FUNCTIONS
 
+int pinmux_generic_load_functions(struct pinctrl_dev *pctldev)
+{
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_load_functions);
+
 /**
  * pinmux_generic_get_function_count() - returns number of functions
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 78c3a31be882..85e5e3a0222f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -134,6 +134,8 @@ struct function_desc {
 	void *data;
 };
 
+int pinmux_generic_load_functions(struct pinctrl_dev *pctldev);
+
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *
-- 
2.31.1

