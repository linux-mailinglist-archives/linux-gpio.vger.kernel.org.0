Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF6350817C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 08:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343630AbiDTGxy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 02:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiDTGxx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 02:53:53 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A848193DA
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 23:51:08 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c15so776972ljr.9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4SKvFXJAiPOxhXYYWnU3KQqUCWPtRch5VioogwyZpM=;
        b=g9U94RWhC9OTMsD2I7phYKtiYorHapfpf21cZItO3xwStrucoK96bvTTyueEN5vQCn
         yl2HLMIxhdTkgQZroFdt4+X1jA+yFA5zwlBATeaguAU3jQGyApcEcJcUzS1H2/sYqBA0
         i98RmlNxKYA0NUul1rxLORw7HXGuw6BPZOr0tGo5W7Ul/WEpJT9Ybh7BAqKxCPcUa6M3
         7oP9ZYBmijiZ/WJNldtzMHspis59K+pkPrxqzs+f1ED4l7u8oAP7aVziveKhoe5XMM93
         F8yIypYN4spN4zf7LzsVt91DMeQ51ZIegsbgxJZBcfshuXxrBFnEAvYeii/TLEgrLycf
         tJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4SKvFXJAiPOxhXYYWnU3KQqUCWPtRch5VioogwyZpM=;
        b=0mLbgTjvXPMWW+G+AehVt7f7bwYZ2KlFhLGvOGCiAfFwRqKGGHwIJhbpxqHlWMWGP9
         4Dkc52WIF/rgWYILeaigoZwrt4TkkkOHOjbWPfpBDudGgYSrgXYVkkzKOj3OZXVr8ABD
         2yy49EY+C45wBa6+jy0iJyh8s932ipbSng1+HJ1pJxjJ//XFUxNd86tlhdwSNCZp/FVD
         CRMBTNBM5nGNeDOOSQv4AC2mESjA5+QKSMWy2JEQJVdbFWtuiJ2wsYBjuGO3p+5tT7Kx
         jZJIZcUtjstZ4Xt6J+Q7VHhZh4JurDvWsL08aLYc6mH+fWw3qvw/8m9OeOV0i2ln73H2
         +P8A==
X-Gm-Message-State: AOAM531M2G0L9m603SApN5GSxj8eWfg0t+ln3gNnFFdNdKqJP9DqszPT
        a5l9zraSGSJWIYjCi5IUrZT+aw5p5wrA0OcI
X-Google-Smtp-Source: ABdhPJzc94oeeBaJ0VD5RPAF5oCgenJ80lsjUMgpKbNSya+npnKtu1FL//5qcb6cHN7NXI+VvcjEog==
X-Received: by 2002:a2e:9b43:0:b0:24d:b646:6e66 with SMTP id o3-20020a2e9b43000000b0024db6466e66mr10089531ljj.386.1650437465985;
        Tue, 19 Apr 2022 23:51:05 -0700 (PDT)
Received: from shc.milas.spb.ru ([188.243.217.78])
        by smtp.gmail.com with ESMTPSA id s12-20020ac25fac000000b004435e2e0a08sm1732801lfe.251.2022.04.19.23.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 23:51:05 -0700 (PDT)
From:   Alexander Shiyan <eagle.alexander923@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] gpio: syscon: Remove usage of syscon_regmap_lookup_by_compatible
Date:   Wed, 20 Apr 2022 09:51:02 +0300
Message-Id: <20220420065102.44083-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since version 5.13, the standard syscon bindings have been added
to all clps711x DT nodes, so we can now use the more general
syscon_regmap_lookup_by_phandle function to get the syscon pointer.

This patch removes the usage of the syscon_regmap_lookup_by_compatible
function as it is no longer used in the driver.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/gpio/gpio-syscon.c | 49 +++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index fdd3d497b535..6076937b18e7 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -38,7 +38,6 @@
  */
 
 struct syscon_gpio_data {
-	const char	*compatible;
 	unsigned int	flags;
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
@@ -125,7 +124,6 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 
 static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 	/* ARM CLPS711X SYSFLG1 Bits 8-10 */
-	.compatible	= "cirrus,ep7209-syscon1",
 	.flags		= GPIO_SYSCON_FEAT_IN,
 	.bit_count	= 3,
 	.dat_bit_offset	= 0x40 * 8 + 8,
@@ -182,7 +180,6 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 
 static const struct syscon_gpio_data keystone_dsp_gpio = {
 	/* ARM Keystone 2 */
-	.compatible	= NULL,
 	.flags		= GPIO_SYSCON_FEAT_OUT,
 	.bit_count	= 28,
 	.dat_bit_offset	= 4,
@@ -219,33 +216,25 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 
 	priv->data = of_device_get_match_data(dev);
 
-	if (priv->data->compatible) {
-		priv->syscon = syscon_regmap_lookup_by_compatible(
-					priv->data->compatible);
-		if (IS_ERR(priv->syscon))
-			return PTR_ERR(priv->syscon);
-	} else {
-		priv->syscon =
-			syscon_regmap_lookup_by_phandle(np, "gpio,syscon-dev");
-		if (IS_ERR(priv->syscon) && np->parent)
-			priv->syscon = syscon_node_to_regmap(np->parent);
-		if (IS_ERR(priv->syscon))
-			return PTR_ERR(priv->syscon);
-
-		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 1,
-						 &priv->dreg_offset);
-		if (ret)
-			dev_err(dev, "can't read the data register offset!\n");
-
-		priv->dreg_offset <<= 3;
-
-		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
-						 &priv->dir_reg_offset);
-		if (ret)
-			dev_dbg(dev, "can't read the dir register offset!\n");
-
-		priv->dir_reg_offset <<= 3;
-	}
+	priv->syscon = syscon_regmap_lookup_by_phandle(np, "gpio,syscon-dev");
+	if (IS_ERR(priv->syscon) && np->parent)
+		priv->syscon = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(priv->syscon))
+		return PTR_ERR(priv->syscon);
+
+	ret = of_property_read_u32_index(np, "gpio,syscon-dev", 1,
+					 &priv->dreg_offset);
+	if (ret)
+		dev_err(dev, "can't read the data register offset!\n");
+
+	priv->dreg_offset <<= 3;
+
+	ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
+					 &priv->dir_reg_offset);
+	if (ret)
+		dev_dbg(dev, "can't read the dir register offset!\n");
+
+	priv->dir_reg_offset <<= 3;
 
 	priv->chip.parent = dev;
 	priv->chip.owner = THIS_MODULE;
-- 
2.32.0

