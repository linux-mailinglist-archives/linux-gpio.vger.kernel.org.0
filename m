Return-Path: <linux-gpio+bounces-27943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754FC2AC78
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 10:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9F02348D7A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 09:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E786C2EF664;
	Mon,  3 Nov 2025 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m4L7NfH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A782ED87F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162548; cv=none; b=LDzCnOIm598si6y8TO5soDf0mGTQisuG7/sJ+f4xoXMcU/fO7dB2bjtRYZ/1tigzOnPi6ihyjucg3DysoV91IE8LRt8arybT/5gS8wXCxLp0oAMdXC/4F2hxLttY6wYfXAFkeZMU6lnIFmiMXP1I5+HyM9Z0fafDTc/JnG5yvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162548; c=relaxed/simple;
	bh=+skCMKtZUro42624JZ1QUZs6XXv2cnD0krG3QzW97Qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXwTCxn3NNcAqVKPc5nyCU0caQz6Hrbv8Xi1J0HxqcSMQm6TbZn8EojUIrGzVWaxA4BfltPrc2994Apg2gfK/CIy8crO2yByfGnl5oLBRAS9elcK5FbzbxZKatE/XWucr8Z1A/bO35QuijWr//GUDC9sHqZ8ZVtYur8Vu6GIS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m4L7NfH0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4710665e7deso18960035e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762162545; x=1762767345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hARBiXPjJrSTvy/xdjK5sGzNu7AhBm6QjSrW+nMlBA=;
        b=m4L7NfH0Chet1jdap0A5tJniEQuBEREWWnBJhRNbFSuw1wz5HQfQevQ+xRONN3TNik
         rn69vY45o7xO/WiZrIEEhcWsjYneG1EjWYP9ZmUg5LmnWUUHKssErtI0lOfM9WXtnRO6
         5ZV05fiFvT7sGlIQDg3W9UOoWmdJ+GH3SmOwzhQA7xZsW3kaPE1r9eCVteEMoKmmqRHU
         UMKNuAUsh85R+ALDdxJ3pqYmpgXazbVn+d8Pmzo8MKbKbkhAuq86n7QwR2hAq6OtM85z
         9BrjLZjgLoi7ufYQAsN9bCLXHiGTi0kKW2L9Om7RuuafO9QHelM4p87i85bfuVDfnprk
         sxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162545; x=1762767345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hARBiXPjJrSTvy/xdjK5sGzNu7AhBm6QjSrW+nMlBA=;
        b=En+wGqpQ+r4yZOCgachGgzKGGZ0zu1aGywYN0esZNk6DL5yS4cO1xmF2WAcHoRrkBj
         m7DTqWfsarOYA4u/eDJJ3S1t9HjOl+bN4AeRxC84PGBONHbOupFYvER5kIRtrkjR4A+d
         VaYhTJtHI0S0zvoIJDRvI0QKCHBKgsqSllXIcs/AKy5QW6EoRLGefACvmwYllUjHhjRo
         fCutNEtIR/M1p3pbhCeOF56JCvqYAAKl7wccu5sLfzh7HRhrr9ZxjT7CNo7JvdqmtCr6
         CytPUfcE6VQxSkrsUhVo0o2zQh34hlt7UO1z9N5BhIhS4G8zkmdwQhjLBoBHaylrqfLP
         +w4g==
X-Gm-Message-State: AOJu0YyefREkoXsxXXsdxhtX0c4wwiXPCRO771XFZ3DOi+CiCcbBWKe6
	75jVX7vIsA3cjMrwvHxq6LglwA1V7MsGv8HQrnHVvpJAbmJm5+23LTu9Jqi8zuUtBfY=
X-Gm-Gg: ASbGnct2rI6CzrIlss6Hhhk4E61duwt6eGp5ti/B1epUosnDeIgK7/1Am1xkv60akRN
	HSkAl28obMB5Phg4BFqMrUYKOTc74jxNLQhtvGDxcy2M5Yg1+dRVN1IPyQlmwv0hiNJUMmq3dcH
	IgCqLlx5b+s0uBPD3+L/VNyjalIr4aSqXMZ5svyO3KvnD2lL32+GDiPiaskZc2QPOEz1V7U/q6p
	4vB1KhCOua3kGs/9+l292/A1QNXMeCMJlLFUrQgvzvj+FSqsYUurTVFSTymKcT6lCLVns5DqWcU
	WPLAc3Drv7KHct7vRgPy2fWraqSW2TPVMmKjNIN6RdJ0MmRDcddSWGcBPsJ32fBC1Elc2t7215K
	/BPnWrZgroKNvHQ89Y7q2OrItrw9v+15i2d8KiRfAnIferWZLDXXRu2hf+xLcoTMybdsyd94LPC
	1ab6SL
X-Google-Smtp-Source: AGHT+IF7IaKJSdToPk66ygauWBuIYI4bhnWeBOc7JZzNi0p9M3D/pOagfL4B+gAkxX0uQUM9td9stg==
X-Received: by 2002:a05:600c:3f14:b0:477:e09:f0f with SMTP id 5b1f17b1804b1-477307d763dmr110723125e9.8.1762162545082;
        Mon, 03 Nov 2025 01:35:45 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm147285675e9.8.2025.11.03.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:35:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Nov 2025 10:35:25 +0100
Subject: [PATCH v4 05/10] gpio: swnode: allow referencing GPIO chips by
 firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-reset-gpios-swnodes-v4-5-6461800b6775@linaro.org>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
In-Reply-To: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M8Bc1P0DLQy5VPk7D0DtzmmkQ2KhHSrn6f+3txDi7M0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCHdl9AwQOZ0lLe1K4BR3pivzNYUL5uxic/vV6
 Dg6562lyRqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQh3ZQAKCRARpy6gFHHX
 cnybEACaL21lCfB8IUqkV/9OqjRJ9SXXYy0LhUdavpRoQcKhHDq+3qVQZirvO+unRsSPea/cjVz
 I2JIk7YczwYX5rA4Z+bEcqG2R4N20Kyc191O1gh+3wZOxPllzfkbx0vExrSTnH+sSC4bbMAXH5o
 Sj5daga/hlpMB3ougK1i6xk3B0z77X9Pm5zVFjhXmQ8UkEMy9rJ+yW+vL9N7JeZZ6tQRzU8vqpa
 yYnMnNlrHhVQjBWLgMZ8T9XbbKtOKX2td6zV4e8kuy0e4EiEHfpuLSqiTMUdKJN2a0NE0YZkVtn
 yTGqYfNEte+deszdOJ6Ksxk2HQ279WIByqhkziuoEwLuiub4ofClLoSCM1lv+adN4nB+VuP2mWQ
 2EbT3liOLeqJFicQSUvskjxVdLdkAmZgiQcjjtMF8vBhP3Wkh9FqLx+SprGfKb4lF4aXfLeLaUL
 H4lapvKPWdtANyGYbxS18vmSUbzrRInMsOIri09t99KQmzstON9VLUpOspC+ojw/kSj/zglKvmL
 VErXH//Jhqgooc6PPwkTvMWocTwdZKRGx0hqOCdFFE8QsmEePKOnx8JkC9HaGa9lNg1bxg0lWJn
 OHKq9LNYzapsKAt+IggSXYs5YGc8N+/Whyh+1XcjFGIA4SDsa/XmfiG1K/GHX73Zx5cjwF5uiT4
 FKf3zwfOcN9AiXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

When doing a software node lookup, we require both the fwnode that
references a GPIO chip as well as the node associated with that chip to
be software nodes. However, we now allow referencing generic firmware
nodes from software nodes in driver core so we should allow the same in
GPIO core. Make the software node name check optional and dependent on
whether the referenced firmware node is a software node. If it's not,
just continue with the lookup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index e3806db1c0e077d76fcc71a50ca40bbf6872ca40..16af83fcc5aa886dd009dedc26b1ac23e5cbc4ea 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -30,16 +30,15 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 	struct gpio_device *gdev;
 
 	gdev_node = to_software_node(fwnode);
-	if (!gdev_node || !gdev_node->name)
-		return ERR_PTR(-EINVAL);
-
-	/*
-	 * Check for a special node that identifies undefined GPIOs, this is
-	 * primarily used as a key for internal chip selects in SPI bindings.
-	 */
-	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
-	    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
-		return ERR_PTR(-ENOENT);
+	if (gdev_node && gdev_node->name) {
+		/*
+		 * Check for a special node that identifies undefined GPIOs, this is
+		 * primarily used as a key for internal chip selects in SPI bindings.
+		 */
+		if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
+		    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
+			return ERR_PTR(-ENOENT);
+	}
 
 	gdev = gpio_device_find_by_fwnode(fwnode);
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);

-- 
2.51.0


