Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CED3D90D7
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236909AbhG1Omo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:42:44 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:56760
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236889AbhG1Omn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:42:43 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id A0DA8402C2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627483361;
        bh=vhKtDpijEwzqypmCoxqNYUO22vvDYc0oFhewweVeSvo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=MZKNYvyV4od7dbbEgXk0uBoxcjX8ydOebtLfZMZkSTClUkzk3UZDEWPISWSAUBdl0
         JKQGfK/4vHtw6TMvZt22YK4yVLLRTkiHTKNwehQv3mZjtTRuwOPkSzsUmb2PTpEryd
         q/xkejQMpiAE0tSVZiEjJuwYrnEE3XMxsNfpq6lAWfe/znOTbuWaZBcGr59fs3WsP1
         WdOOrg5P+AGwBFmmgamFUZMElbbANgskPtIdmS1ld2oX0wH+OfPeZ5T6qPVfWaVYHy
         BPg90mm01zGZHaESko1+CZ69vCrpjnUH/H6wZCFbbpNIINd7Z80YcFUbz02IvPZ92p
         s5zyu0AQcaj7w==
Received: by mail-ed1-f71.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so1373658edu.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 07:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhKtDpijEwzqypmCoxqNYUO22vvDYc0oFhewweVeSvo=;
        b=lQHaBpzp1Ju6ryYYsIjI8tFHL65G7YZA4jlgT3fW6fZPOIqpgLapLLFdhQVxyTZbG0
         Ms93+VfyGbncfyjZmj7iCpBleZEfMTiUsbxZk015xv27S7oqL1tUrGrsrohsI/B912WU
         r1qDMkDfrBjYHXEutgyIFqavPqXUtWpoqpzJzyAzFLbdbADSljqgPoByLUEmPnn/wUaY
         eByOPAO/AoavKHnHvvqZM0W8Scvh8zy7283+O9TmpxZoA5Uo03DusQZh5FE7AU54Lrsq
         O900NejL2pbiq9XMz1XTN1vVa7MBhmJPxGrmVeHAEmRhg1pvBuCHpo/k/MY+U1AbGeml
         VPGg==
X-Gm-Message-State: AOAM532McfOg5gMERTW0wPZUpC2iWCrAT0qgUv7CyTg7CBIqQRboCIX7
        kjmlL4oI2UtL1YZMDbjh8Wx0yXxT5CIJ0SMXXuyZTEiz8FvpCLMAMPY81xvfPHxPgPvaykmXXbp
        qn9hkd7xOOJl9BGRUjRvI5omuAUOeRR2zstIZ7Po=
X-Received: by 2002:aa7:c858:: with SMTP id g24mr202666edt.250.1627483361437;
        Wed, 28 Jul 2021 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2XZQvwY+SVOhT/EErnGZDZWwl1CML/Duf2XYwD3kIwYQ2UEYLx6GZZ48zkIz7I3zJp+0/bA==
X-Received: by 2002:aa7:c858:: with SMTP id g24mr202655edt.250.1627483361337;
        Wed, 28 Jul 2021 07:42:41 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id d19sm2683676eds.54.2021.07.28.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:42:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/3] gpiolib: of: constify few local device_node variables
Date:   Wed, 28 Jul 2021 16:42:29 +0200
Message-Id: <20210728144229.323611-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
References: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiolib does not modify struct device_node, so few local pointers can
point to a const data.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpio/gpiolib-of.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1e5a6f63b2fe..0ad288ab6262 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -122,7 +122,7 @@ static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
 bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 {
 	int size;
-	struct device_node *np = gc->of_node;
+	const struct device_node *np = gc->of_node;
 
 	size = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
 	if (size > 0 && size % 2 == 0)
@@ -373,7 +373,7 @@ static struct gpio_desc *of_find_spi_gpio(struct device *dev, const char *con_id
 					  enum of_gpio_flags *of_flags)
 {
 	char prop_name[32]; /* 32 is max size of property name */
-	struct device_node *np = dev->of_node;
+	const struct device_node *np = dev->of_node;
 	struct gpio_desc *desc;
 
 	/*
@@ -404,7 +404,7 @@ static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
 					     unsigned int idx,
 					     unsigned long *flags)
 {
-	struct device_node *np = dev->of_node;
+	const struct device_node *np = dev->of_node;
 
 	if (!IS_ENABLED(CONFIG_SPI_MASTER))
 		return ERR_PTR(-ENOENT);
@@ -440,7 +440,7 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *
 		"wlf,ldo1ena", /* WM8994 */
 		"wlf,ldo2ena", /* WM8994 */
 	};
-	struct device_node *np = dev->of_node;
+	const struct device_node *np = dev->of_node;
 	struct gpio_desc *desc;
 	int i;
 
-- 
2.27.0

