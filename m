Return-Path: <linux-gpio+bounces-16572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117DA445D3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2785A3A9CAE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFBD19047C;
	Tue, 25 Feb 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MkdD3On8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591F18E75A
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500155; cv=none; b=V5AJduhdeh2hp0MQipw/EYK+TUe1apHoM6KAECnbQBc+mQF+601RnI3mo8b6ma2JId7Vo1zi9XkvhuDbtIQacOwy2DJef+O7QJ8LCxjtOCMzXjgVVBDU4PHRR7tjBMWpc7uic6oBKyAh2HjG/2JdhhQ1g+uO/D5QEQDwE0DmRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500155; c=relaxed/simple;
	bh=cFjqZSWgJlOJwLn4F6U83WAoI/z6YKYlElwqcgUvs4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7PiosfpudWv36ezdMs8x4FW/6ZAAUtPvBKHdku+zNBXvia6qXjRR0nzPEPc3GT8aGoRIHG6WJytAApb4LYWt/5szggyy4gzaanrZevvYgccwAH4L+4pkMVJr8RfKr193wNk151z6seYCWJkeN+aM1I4PcHonSybwFWbnGnFEa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MkdD3On8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439a6179a7so6459475e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500151; x=1741104951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UhTIBltfgKBBmLidVKld5as0xmpbG/Fdm5sX7gsUgk=;
        b=MkdD3On88mOUDVZwlHaLvAfwpV1EhzW0Cu/kw8MwEt2fuLOLp/2+6bWiKRAXWvKapE
         MfN1C4jZpTKjdiIUeEAASjeEvbtoq7XH83hVIcSYyLl2rP/AxB6KA0tVBJcpBXtXc+AF
         F6Vk19/hfMHUSqNNIcLi8sutDdlAy1udk4hIFfHMxIeoSxhdzgWajaE2t/eaJi0fw/Hp
         l9XdW+XnWujvYXCcKRZiHU2PJq5HjElfB8cj6GshW+hxwstPHL5thwwJZD0wbmxCLYMx
         18jooj0sW9+VjRpxtFfMr+ruimr1RcQ1+PeYMI4xSiFeOPQQ2VJIJ/8MEpHmCdrYrBV5
         SpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500151; x=1741104951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UhTIBltfgKBBmLidVKld5as0xmpbG/Fdm5sX7gsUgk=;
        b=IQr/P094Boiwf5ib2c2Rnee1/HOExlA7NzFB2tJLx/GZK2eyu//862qkex5lgTeUfD
         DYqDt+wM1XyCugqbTOf006oY45TSBQ8nPBNM+hiLt2ZwYN0U0POz4iIC5jtiVhuH5gpc
         TiTUvOk9/yEUTAfnFFVAj1Y34ur1oSKSOAji3IE3tGBLjj1rCgE1e0eq9g+s0MAVlriM
         Rn/43OFsNYzNubSB8GS90B33UoddQzaQJSRUqsEy4b5hwwjZFgDR0b5UtdS8ygsXTZZ2
         beQeADnSVSxWPf5RCXz10+QSCKDxhpcVMwM7k2IENEtyXxtZ0JKVtVD4yiumFjHWMSfG
         Uc9w==
X-Forwarded-Encrypted: i=1; AJvYcCWGb1q6RgGZ/PpPotK0vc4ZdtG0fVDkMegsp09bCUQMRoLIG+F3Lm2+dGSWq3V7jGKJLYjERWVjcgU/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeku/hSv6/EiebIfFNKpFOln6dtEPOLkz17NVp0a9ZbK41wi8N
	0yWuqvJm2DxE81JL658DDWd+PNo+XI4DYHhwySGZIkQ2VifqgG6i2DsEsVoJQ5g=
X-Gm-Gg: ASbGncvUTgqEbTmJSfS4ZO1SmG7ZqTukeIMmQJLD1z/sHIEO2HCvdrk81Ig+kBRxggT
	gdAt5Yd6JhkrPx6iQPRS17JO1hov9J6PqJ8XUnM7WmyeTZp2lBD/+3N5MpwpT4Jya4CW0VLRgdv
	RaB9j7C4jqWznpWbsZuhnUDs6i7CiuDYRd++Kdg/hAJlXOXBqtaefhG8/a9wPteCbkE4scOvIJ2
	8sB7gseVn+GkpDBs2+vkmuzcHD9o22Z6mgXFH0qFaa4u+lSoZPr9OvztqS5Z2PfZj5dPE57qLz+
	JoP0z4kcGCSiNq7+PBtbb5BzyxmyQh7qqf/X
X-Google-Smtp-Source: AGHT+IH2GZTZ5sYtMQgmbcB5c7PsJz6WQp2M0e9NQnvea+V6C0hr0c+xi8/ObRpH91rna4ZcewqJsw==
X-Received: by 2002:a05:6512:1326:b0:542:2139:636a with SMTP id 2adb3069b0e04-54838c5e1fdmr6155328e87.7.1740500151057;
        Tue, 25 Feb 2025 08:15:51 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f512dsm212587e87.178.2025.02.25.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:15:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:15:47 +0100
Subject: [PATCH v2 2/2] gpiolib: of: Handle threecell GPIO chips
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-gpio-ranges-fourcell-v2-2-8da9998fa976@linaro.org>
References: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org>
In-Reply-To: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org>
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Alex Elder <elder@riscstar.com>
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
    return (gc == &mg->gcs[instance]);
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

Reviewed-by: Alex Elder <elder@riscstar.com>
Tested-by: Yixun Lan <dlan@gentoo.org>
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
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..680217ef8d92d0a6161356cc556eb5456a00eeb9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -516,10 +516,32 @@ struct gpio_chip {
 	/**
 	 * @of_gpio_n_cells:
 	 *
-	 * Number of cells used to form the GPIO specifier.
+	 * Number of cells used to form the GPIO specifier. The standard is 2
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


