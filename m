Return-Path: <linux-gpio+bounces-16189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92316A39930
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 11:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E03FF188BCEE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 10:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C87023AE66;
	Tue, 18 Feb 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ac6ZqgOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1938A23959F
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874490; cv=none; b=UWDEKrioVxdmXvuFgcd9Bz3oJpPdLvjSPlI21JtGDayRubqFkHcTQlRq9W4Yx7miRhQ3h26Tx5mB5r3VhjQRXfibHl+FP9IpTtQGZmMgojkoBSJErMjmNzyNgQwpVfw2KNVUL0U+/7P1DOaiEn1h35Lrt8FZ+Ego0A6KBvNLqgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874490; c=relaxed/simple;
	bh=dZLGpdNd1A4j3GPoXQ09AaawNXIpE5erJf2/7ZjsIVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LM24y2w/XtCxMCAJsoABApuz8vU0WLaBG+kJjBp9m+y0qnh9kUov93S9INGWfX/Lwk+xh7IIXzzkMNAh0h+iT4Vm59pWgp2GMIXMYrMLq+NEL4EPmpQler8wKQ4G4Sh9AjLU+IlQKvkrQfthkIE/CMS71YL6ETgGvAs9IzLN9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ac6ZqgOZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54529e15643so3391991e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 02:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739874486; x=1740479286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk2RAfTMKuDExTvoi9nEepL1tvSfB7+G20+tDZme8pI=;
        b=ac6ZqgOZ3ivEW+76N/V9TH9CIBYlM8qG0p6HW3hKWLu6h45n1owaOepMBnjKuILHJ0
         wzQyswjvwHiYiiQX6OzO3nCdlyL/vgSrSqJI8GD0q4S90RDG2KeVZUu/ejWbkQHSmote
         JgwalLomY5HVI1l6UwN1o8GK8p1j1QgZ9oCFt9eVLWf/xjayu99o0giaGwgetX8Q2Clb
         h6U9s0Og5zG8ZqTiL0HGoDxHx7J+mMsqiWffpzp4q8lZ81SrpKaz6A6lQa4lXdAIgeCm
         BUJj7G2L0/tel3aVgprUo6GiEkn2frFWWvpHOTsMMyYpVXKxiknaEfQxvSdiWjC8GIZW
         SRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874486; x=1740479286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk2RAfTMKuDExTvoi9nEepL1tvSfB7+G20+tDZme8pI=;
        b=p72iz0sinC901/G09kjUE4frL8KcbRB/cMdAOCcguRbTlh6SQYNF2aRo+HkGGKlwPb
         0vVBalYPqMcVS534OBvw8Rnh/cYBUNN+pGiSERsUiRzn5phYrztRwY5y6JijkODJmpif
         d7uP+mWFz7UwPsEapv74yJXV/nUMPYcVI8lc663o2tUKvzj5GX+0ANDLSKY87m1Uy4nJ
         hXhM8LLXAGKz4Jb+MPoaHaUEXm6xtSTcT/97Kf64WLBr5AE4kQBTsGdXg6CZAtcrHz52
         Nz1cDBdothGoZAwHKEbQ2uvrt914x3K13r5M7eMMj+pXjxCCMGBUseMkdsFuPp1BGhBO
         Yxmg==
X-Forwarded-Encrypted: i=1; AJvYcCXyNNHb+3Ir8NxC8LBhhNPRkl4uXBHgjaaWEcujID+e2wfGbMAP8c51WQSRI6FrCvGDa+AhJfUvbZAd@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCxZzqX/wIodox4UiwLk0hUK1GDPSAp5ojJN3LTQmWxTB/vB1
	/M6uf8tL3ONJ0rIOBQnMwdXXrZYH9N/kJbPtMIkzXEyaoeQLJlO3Tq65pyo3nJQ=
X-Gm-Gg: ASbGncu3YR+3ljU8hqo7/iJicdAE0gg3Tk6qaadt67NwQAj8w1tdtL4E9naEUbHIPx6
	Z8F8pNsQNSB6J1QxVFG6VjUBOK21LxI5AqUqd6Jb3KBIcwImOTMSV+/kEboegzekVusOyxQCnmf
	0Un3yRRCJR5vnmJJsr/Bu6IqX9CaxFjU0lO3ermgd+oFNZwt1lfEV1KZXd7a3LwGercZQ0fUZcN
	FL4wJeRJqSgWxtYC42XcHIKw8Tnfb+jTiHAhFrLHsimuU5aApQUZqyH41TI/N5x3jlz0DUO4xLa
	mbUZa2fox0+YMprOLqCHZcM8Uw==
X-Google-Smtp-Source: AGHT+IFwCQ976IhxBLO/1FXtKhY2VNxzqS2VEuXwm1jzlWawCytrp71miBBjM8shP2zZEQWc8AfpPw==
X-Received: by 2002:a05:6512:2346:b0:545:1049:eb4f with SMTP id 2adb3069b0e04-545302cee81mr3547677e87.0.1739874486095;
        Tue, 18 Feb 2025 02:28:06 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461e202368sm830756e87.61.2025.02.18.02.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:28:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 11:28:02 +0100
Subject: [PATCH RTF 2/2] gpiolib: of: Handle threecell GPIO chips
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-gpio-ranges-fourcell-v1-2-b1f3db6c8036@linaro.org>
References: <20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org>
In-Reply-To: <20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org>
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

When describing GPIO controllers in the device tree, the ambition
of device tree to describe the hardware may require a three-cell
scheme:

gpios = <&gpio instance offset flags>;

This implements support for this scheme in the gpiolib OF core.

Drivers that want to handle multiple gpiochip instances from one
OF node need to implement a callback similar to this to
determine if a certain gpio chip is a pointer to the right
instance (pseudo-code):

struct my_gpio {
    struct gpio_chip gcs[MAX_CHIPS];
};

static bool my_of_node_instance_match(struct gpio_chip *gc
                                      unsigned int instance)
{
    struct my_gpio *mg = gpiochip_get_data(gc);

    if (instance >= MAX_CHIPS)
        return false;
    return (gc == &mg->gcs[instance];
}

probe() {
    struct my_gpio *mg;
    struct gpio_chip *gc;
    int i, ret;

    for (i = 0; i++; i < MAX_CHIPS) {
        gc = &mg->gcs[i];
        /* This tells gpiolib we have several instances per node */
        gc->of_gpio_n_cells = 3;
	gc->of_node_instance_match = my_of_node_instance_match;
        gc->base = -1;
        ...

        ret = devm_gpiochip_add_data(dev, gc, mg);
        if (ret)
            return ret;
    }
}

Rename the "simple" of_xlate function to "twocell" which is closer
to what it actually does.

In the device tree bindings, the provide node needs
to specify #gpio-cells = <3>; where the first cell is the instance
number:

gpios = <&gpio instance offset flags>;

Conversely ranges need to have four cells:

gpio-ranges = <&pinctrl instance gpio_offset pin_offset count>;

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c   | 93 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/gpio/driver.h | 24 +++++++++++-
 2 files changed, 106 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 86405218f4e2ddc951a1a9d168e886400652bf60..614590a5bcd10e5605ecb66ebd956250e4ea1fd8 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -929,7 +929,7 @@ struct notifier_block gpio_of_notifier = {
 #endif /* CONFIG_OF_DYNAMIC */
 
 /**
- * of_gpio_simple_xlate - translate gpiospec to the GPIO number and flags
+ * of_gpio_twocell_xlate - translate twocell gpiospec to the GPIO number and flags
  * @gc:		pointer to the gpio_chip structure
  * @gpiospec:	GPIO specifier as found in the device tree
  * @flags:	a flags pointer to fill in
@@ -941,9 +941,9 @@ struct notifier_block gpio_of_notifier = {
  * Returns:
  * GPIO number (>= 0) on success, negative errno on failure.
  */
-static int of_gpio_simple_xlate(struct gpio_chip *gc,
-				const struct of_phandle_args *gpiospec,
-				u32 *flags)
+static int of_gpio_twocell_xlate(struct gpio_chip *gc,
+				 const struct of_phandle_args *gpiospec,
+				 u32 *flags)
 {
 	/*
 	 * We're discouraging gpio_cells < 2, since that way you'll have to
@@ -968,6 +968,49 @@ static int of_gpio_simple_xlate(struct gpio_chip *gc,
 	return gpiospec->args[0];
 }
 
+/**
+ * of_gpio_threecell_xlate - translate threecell gpiospec to the GPIO number and flags
+ * @gc:		pointer to the gpio_chip structure
+ * @gpiospec:	GPIO specifier as found in the device tree
+ * @flags:	a flags pointer to fill in
+ *
+ * This is simple translation function, suitable for the most 1:n mapped
+ * GPIO chips, i.e. several GPIO chip instances from one device tree node.
+ * In this case the following binding is implied:
+ *
+ * foo-gpios = <&gpio instance offset flags>;
+ *
+ * Returns:
+ * GPIO number (>= 0) on success, negative errno on failure.
+ */
+static int of_gpio_threecell_xlate(struct gpio_chip *gc,
+				   const struct of_phandle_args *gpiospec,
+				   u32 *flags)
+{
+	if (gc->of_gpio_n_cells != 3) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	if (WARN_ON(gpiospec->args_count != 3))
+		return -EINVAL;
+
+	/*
+	 * Check chip instance number, the driver responds with true if
+	 * this is the chip we are looking for.
+	 */
+	if (!gc->of_node_instance_match(gc, gpiospec->args[0]))
+		return -EINVAL;
+
+	if (gpiospec->args[1] >= gc->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[2];
+
+	return gpiospec->args[1];
+}
+
 #if IS_ENABLED(CONFIG_OF_GPIO_MM_GPIOCHIP)
 #include <linux/gpio/legacy-of-mm-gpiochip.h>
 /**
@@ -1068,7 +1111,15 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 	has_group_names = of_property_present(np, group_names_propname);
 
 	for (;; index++) {
-		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+		/*
+		 * Ordinary phandles contain 2-3 cells:
+		 * gpios = <&gpio [instance] offset flags>;
+		 * Ranges always contain one more cell:
+		 * gpio-ranges <&pinctrl [gpio_instance] gpio_offet pin_offet count>;
+		 * This is why we parse chip->of_gpio_n_cells + 1 cells
+		 */
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges",
+				chip->of_gpio_n_cells + 1,
 				index, &pinspec);
 		if (ret)
 			break;
@@ -1078,9 +1129,25 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		if (!pctldev)
 			return -EPROBE_DEFER;
 
-		offset = pinspec.args[0];
-		pin = pinspec.args[1];
-		count = pinspec.args[2];
+		if (chip->of_gpio_n_cells == 3) {
+			/* First cell is the gpiochip instance number */
+			offset = pinspec.args[1];
+			pin = pinspec.args[2];
+			count = pinspec.args[3];
+		} else {
+			offset = pinspec.args[0];
+			pin = pinspec.args[1];
+			count = pinspec.args[2];
+		}
+
+		/*
+		 * With multiple GPIO chips per node, check that this chip is the
+		 * right instance.
+		 */
+		if (chip->of_node_instance_match &&
+		    (chip->of_gpio_n_cells == 3) &&
+		    !chip->of_node_instance_match(chip, pinspec.args[0]))
+			continue;
 
 		/* Ignore ranges outside of this GPIO chip */
 		if (offset >= (chip->offset + chip->ngpio))
@@ -1170,8 +1237,14 @@ int of_gpiochip_add(struct gpio_chip *chip)
 		return 0;
 
 	if (!chip->of_xlate) {
-		chip->of_gpio_n_cells = 2;
-		chip->of_xlate = of_gpio_simple_xlate;
+		if (chip->of_gpio_n_cells == 3) {
+			if (!chip->of_node_instance_match)
+				return -EINVAL;
+			chip->of_xlate = of_gpio_threecell_xlate;
+		} else {
+			chip->of_gpio_n_cells = 2;
+			chip->of_xlate = of_gpio_twocell_xlate;
+		}
 	}
 
 	if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..70a361f6aba06d4a11e5ca913ec79411d7a11b3c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -516,10 +516,32 @@ struct gpio_chip {
 	/**
 	 * @of_gpio_n_cells:
 	 *
-	 * Number of cells used to form the GPIO specifier.
+	 * Number of cells used to form the GPIO specifier. The standard i 2
+	 * cells:
+	 *
+	 * gpios = <&gpio offset flags>;
+	 *
+	 * some complex GPIO controllers instantiate more than one chip per
+	 * device tree node and have 3 cells:
+	 *
+	 * gpios = <&gpio instance offset flags>;
+	 *
+	 * Legacy GPIO controllers may even have 1 cell:
+	 *
+	 * gpios = <&gpio offset>;
 	 */
 	unsigned int of_gpio_n_cells;
 
+	/**
+	 * of_node_instance_match:
+	 *
+	 * Determine if a chip is the right instance. Must be implemented by
+	 * any driver using more than one gpio_chip per device tree node.
+	 * Returns true if gc is the instance indicated by i (which is the
+	 * first cell in the phandles for GPIO lines and gpio-ranges).
+	 */
+	bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned int i);
+
 	/**
 	 * @of_xlate:
 	 *

-- 
2.48.1


