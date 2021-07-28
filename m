Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848B83D90D5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236663AbhG1Omn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:42:43 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:56734
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236794AbhG1Omm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:42:42 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5E0713F23E
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627483360;
        bh=iVAoF/iZyFmC3s0sRlT9GVhMSwyFNtFGp8i7c+DzusI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Pgdefb9fDSn2ROiqtM8crZqLzaZBgaf8xtRG1coa11GLZCZ2O5AxsrpPUfVY2LKc8
         80Utgd+Wts1yH3aRIQf6DuQEU6zbcxRpLEvuXL1w4t6hkRyqDB29WWO7dc5SAl8COg
         /hBPu4yQiVTyJURyYdVT/7q7xrBUZMYPl164aZ7ZjPj5RnMFNyCSDJWpTMCxINIAaU
         IVllUxp3CqX9K4fFnqhtBuTX1LYOSUCxMcCXNri4uGim+YIcsLSfbrty4Deq/XVYU0
         wkOvHwYEC2iWl/9nyvhBMhsZcT9IKvARXVHXoeRwRmt+y7/IecJp2kjj2J93HE61OI
         bXJ7QavUJhOzw==
Received: by mail-ed1-f70.google.com with SMTP id u25-20020aa7d8990000b02903bb6a903d90so1350508edq.17
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 07:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iVAoF/iZyFmC3s0sRlT9GVhMSwyFNtFGp8i7c+DzusI=;
        b=T5wGUljvlbfuaul3yc/M/kCExSlYoy9/6bEO7/F+ZoUFBthBDJEmv0CCqFdxCt1PyS
         buo7ZmSBjby2hCFt9ctXh/Pz9SCZ1SYMqi8GpsY+D5RoqbQ0iUG4zfyLm4nqHwV6DplG
         58AlOXcA+2LqQTwKYKq7414xk3JrbeiCyJirsi7NGIzDLBzHVRmIYGmLtM5zjV+emVGD
         e4umvu/igpSFANicK2oXQ0wl6BjzDzfjqUBDNWSBEULJ4Q/W3SA6znbTgK/9AP7hO66S
         4yNlaWzB9kOp8dhuEmEGylq3177y2YD5ukXpfHhISSyVwBg9L74xQD7QmbJJUbjW/jRo
         QlbQ==
X-Gm-Message-State: AOAM531a7MCi/8xwh4psiDPqbHNHb0XJUOddbJwXn20jx5mdmsUT3M6W
        5Y5N2NcpibUXmRJbq5pCiADTaaUNe/2V3aCMZyeypKwrg7/xJ1VsAA8419Q/4jl62fh/5J0OYCT
        +nWLEH0kZT1+hDaCRJRA2m3YkK9zlVte1mY3YSLg=
X-Received: by 2002:a05:6402:2317:: with SMTP id l23mr144103eda.265.1627483360123;
        Wed, 28 Jul 2021 07:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzwue7zaRLweLShaJFr+TW/TFKDimu9t8u+oOJiuyP9dh7vLQM3TY9ToaPYJy+honvYq0Igg==
X-Received: by 2002:a05:6402:2317:: with SMTP id l23mr144078eda.265.1627483359898;
        Wed, 28 Jul 2021 07:42:39 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id d19sm2683676eds.54.2021.07.28.07.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:42:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/3] gpiolib: constify passed device_node pointer
Date:   Wed, 28 Jul 2021 16:42:28 +0200
Message-Id: <20210728144229.323611-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
References: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several gpiolib functions receive pointer to struct device_node which is
later passed to OF functions.  These OF functions accept already pointer
to const, so gpiolib can follow similar approach to indicate they are
not modifying the struct device_node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpio/gpiolib-devres.c |  2 +-
 drivers/gpio/gpiolib-of.c     |  8 ++++----
 include/linux/gpio/consumer.h |  8 ++++----
 include/linux/of_gpio.h       | 15 ++++++++-------
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 4a517e5dedf0..79da85d17b71 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -145,7 +145,7 @@ EXPORT_SYMBOL_GPL(devm_gpiod_get_index);
  * In case of error an ERR_PTR() is returned.
  */
 struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
-					      struct device_node *node,
+					      const struct device_node *node,
 					      const char *propname, int index,
 					      enum gpiod_flags dflags,
 					      const char *label)
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bbcc7c073f63..1e5a6f63b2fe 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -130,7 +130,7 @@ bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 	return false;
 }
 
-static void of_gpio_flags_quirks(struct device_node *np,
+static void of_gpio_flags_quirks(const struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
 				 int index)
@@ -236,7 +236,7 @@ static void of_gpio_flags_quirks(struct device_node *np,
  * value on the error condition. If @flags is not NULL the function also fills
  * in flags for the GPIO.
  */
-static struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 		     const char *propname, int index, enum of_gpio_flags *flags)
 {
 	struct of_phandle_args gpiospec;
@@ -275,7 +275,7 @@ static struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 	return desc;
 }
 
-int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
+int of_get_named_gpio_flags(const struct device_node *np, const char *list_name,
 			    int index, enum of_gpio_flags *flags)
 {
 	struct gpio_desc *desc;
@@ -303,7 +303,7 @@ EXPORT_SYMBOL_GPL(of_get_named_gpio_flags);
  *
  * In case of error an ERR_PTR() is returned.
  */
-struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+struct gpio_desc *gpiod_get_from_of_node(const struct device_node *node,
 					 const char *propname, int index,
 					 enum gpiod_flags dflags,
 					 const char *label)
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 566feb56601f..bf945b776555 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -609,7 +609,7 @@ struct gpio_desc *devm_fwnode_get_gpiod_from_child(struct device *dev,
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_OF_GPIO)
 struct device_node;
 
-struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+struct gpio_desc *gpiod_get_from_of_node(const struct device_node *node,
 					 const char *propname, int index,
 					 enum gpiod_flags dflags,
 					 const char *label);
@@ -619,7 +619,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 struct device_node;
 
 static inline
-struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+struct gpio_desc *gpiod_get_from_of_node(const struct device_node *node,
 					 const char *propname, int index,
 					 enum gpiod_flags dflags,
 					 const char *label)
@@ -633,7 +633,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 struct device_node;
 
 struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
-					      struct device_node *node,
+					      const struct device_node *node,
 					      const char *propname, int index,
 					      enum gpiod_flags dflags,
 					      const char *label);
@@ -644,7 +644,7 @@ struct device_node;
 
 static inline
 struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
-					      struct device_node *node,
+					      const struct device_node *node,
 					      const char *propname, int index,
 					      enum gpiod_flags dflags,
 					      const char *label)
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index f821095218b0..8bf2ea859653 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -49,7 +49,7 @@ static inline struct of_mm_gpio_chip *to_of_mm_gpio_chip(struct gpio_chip *gc)
 	return container_of(gc, struct of_mm_gpio_chip, gc);
 }
 
-extern int of_get_named_gpio_flags(struct device_node *np,
+extern int of_get_named_gpio_flags(const struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags);
 
 extern int of_mm_gpiochip_add_data(struct device_node *np,
@@ -67,7 +67,7 @@ extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 #include <linux/errno.h>
 
 /* Drivers may not strictly depend on the GPIO support, so let them link. */
-static inline int of_get_named_gpio_flags(struct device_node *np,
+static inline int of_get_named_gpio_flags(const struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags)
 {
 	if (flags)
@@ -98,7 +98,8 @@ static inline int of_get_named_gpio_flags(struct device_node *np,
  * The above example defines four GPIOs, two of which are not specified.
  * This function will return '4'
  */
-static inline int of_gpio_named_count(struct device_node *np, const char* propname)
+static inline int of_gpio_named_count(const struct device_node *np,
+				      const char *propname)
 {
 	return of_count_phandle_with_args(np, propname, "#gpio-cells");
 }
@@ -109,12 +110,12 @@ static inline int of_gpio_named_count(struct device_node *np, const char* propna
  *
  * Same as of_gpio_named_count, but hard coded to use the 'gpios' property
  */
-static inline int of_gpio_count(struct device_node *np)
+static inline int of_gpio_count(const struct device_node *np)
 {
 	return of_gpio_named_count(np, "gpios");
 }
 
-static inline int of_get_gpio_flags(struct device_node *np, int index,
+static inline int of_get_gpio_flags(const struct device_node *np, int index,
 		      enum of_gpio_flags *flags)
 {
 	return of_get_named_gpio_flags(np, "gpios", index, flags);
@@ -129,7 +130,7 @@ static inline int of_get_gpio_flags(struct device_node *np, int index,
  * Returns GPIO number to use with Linux generic GPIO API, or one of the errno
  * value on the error condition.
  */
-static inline int of_get_named_gpio(struct device_node *np,
+static inline int of_get_named_gpio(const struct device_node *np,
                                    const char *propname, int index)
 {
 	return of_get_named_gpio_flags(np, propname, index, NULL);
@@ -143,7 +144,7 @@ static inline int of_get_named_gpio(struct device_node *np,
  * Returns GPIO number to use with Linux generic GPIO API, or one of the errno
  * value on the error condition.
  */
-static inline int of_get_gpio(struct device_node *np, int index)
+static inline int of_get_gpio(const struct device_node *np, int index)
 {
 	return of_get_gpio_flags(np, index, NULL);
 }
-- 
2.27.0

