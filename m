Return-Path: <linux-gpio+bounces-26673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17839BACC2D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 586CC7AAF52
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA32E27B331;
	Tue, 30 Sep 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDqrI9o5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F7DF6C
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233790; cv=none; b=BKOxePNCKnUkd0o83KiPzZ8LU45Oms9t1TYiluEM/M56pI3NlK2wz/GW9MWO51ZzWc3DBiuf9kcBKGG2eRZuJTToCvS80CXj72f+XZiRaN1iM2cpxoRQa+N9Ez+As2rNaCBHZ5z4kAF6hjeNnSS2hyzQIZZNyjT9AS+NnwBOX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233790; c=relaxed/simple;
	bh=8NmLSNphzkIrH6tclA5TysejI5KW7SbBIIi1kB32W+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLWJcwcgT4sckwI2MgbZoBnQ/GUq343j1uj3mTqG/JoxdB3IKbiefbp1SlQKOu2sorAiWCo9VYv1N0jcRbW1lL+2bcswj3omzWbTUNMMmtkqhQLr321lwBilcEHimqsa9v/rslOLGAV+GAJZBG7FK30GAI9bWjw+4gYXQuwStus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDqrI9o5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4da7a3d0402so72737091cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233785; x=1759838585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3qzOwSTKdjG+1AJEsIbyEqdLI7qqdObL+c7b91xxc4=;
        b=iDqrI9o5XbSICn0q2UjnGUu/yxOH9ELAwRWEiORYkIZOeCuolWr/leHgIirTiIH6Qu
         yYi2VnLvgoBpWSR6D9/btYRvx/PdBRWZ219ztfajtqGiMOMraQPTa9ZIq8L+lMQg1914
         fdI0H3xb7pbjIdnf4WdJJCbgyV9Sr6xAe6DZjxiGrcv7pMXSUoYpeg9Tqk+yjdrPl1bS
         yM73jBTIOdARvL0jez7n6n+WvTo+esvhgLde+mbSmIZfTc6oVnIYbtq1tVS8kA106JZP
         BHT0d0u6Jm8b+RUyzPnmI+V6UASc0Tw12CHG7kp5QcugRAItkzPo+UkpbwWvUb3w6WZ5
         yW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233785; x=1759838585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3qzOwSTKdjG+1AJEsIbyEqdLI7qqdObL+c7b91xxc4=;
        b=PQxholOKde5Ly/FE9IFJJibCI3Kcmth/YI0DS44/Zr8/j6viX0nEJ4YkeqWnZ4IZiN
         gP48SEQ18lON0qBchIWeDQ2Lw4pQNc4gP20o0Rj1+nwM2k4KlD+x5GXhUtKn9owGv+z+
         bkesj3v06Lerm1dPqhukbVqjNqS9Y/eTjL16iIjR4GqlJdh9NXri65YIUthkjR2057jn
         Mfb7R8LFZmWPeAEQplaMCmdvKUoCTW5U0uAKlkQBKeh9TVm7SpKIseoUAHlBDkkPH1Qe
         +oDR9fwtbOV6LOIS9TAaxyVDWTMbPiLT4v6cYhwf4bBEhKWisMYebP1j1LK6MMuMHnQ0
         02Ww==
X-Gm-Message-State: AOJu0YzGHTYq0l3Mnosr5x4r3f7j9WDFtbSJZq+SymfouLmMGxL8i7bX
	gDPgZibErZMUPzrflDXnTOtU1DdU1FA0NC8LjKagpEgkoLwxYhE2wCjcESu42RCoofY=
X-Gm-Gg: ASbGnctySosEsenU3uCjh2gL3cMSVxCvhxHSDKZBuf4A2jbVY5x0IIC8wYCd5tKZhyS
	h/Ajce26eCEIozvCJMHWaTYWwB2G0MLOUg7c9O59r2zNpyNSGkSGsAdCLng8vWhQK4M6UJEQN7E
	d5t9O9KYZEA/+djIgGmsDMcTIMVgxptOzpGctNSvyGrDWDXYljdJa+e3szK/jYAFPJv4VG9i4NI
	gB3lRrde1kjU4sIHg/sFMep40AJXXKKMHpfVIvjI5o5ogEfbwCJ8TUKj8DBSmb/0noCVRQ0oQ1K
	4vxmrSgQKVlXWgS4c0I9YBbusQeRxmuDlbQdXcxjKFovHepstSlTq9Sgr1G5UbKGQK8DjjVxhQk
	WTblPnLLvQh4szt9i7JCu+ePlB2SCYKZ1ekYgOCG0RqgG5TAp1R4ln11KbaTnfoMfOY6q
X-Google-Smtp-Source: AGHT+IEastmCyZJTPBvZ7LB4qmrx0NvYSaVwLrW9+ZmEs8AvH85g7hqXgKgsLJjSHNcb2+IsvbYdfA==
X-Received: by 2002:ac8:5ac9:0:b0:4cf:cc1b:84e6 with SMTP id d75a77b69052e-4e27fed20a1mr59511521cf.36.1759233784875;
        Tue, 30 Sep 2025 05:03:04 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:02:48 +0200
Subject: [PATCH 1/6] pinctrl: bcm: Rename bcm4908 to bcmbca
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-bcmbca-pinctrl-v1-1-73218459a094@linaro.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The basic structure and the hardware of all BCA SoCs are the
same as for BCM4908 so rename all symbols to BCMBCA.

This makes for a good base to isolate/parameterize and split
out BCM4908 and add other SoCs.

The driver is unconditionally selected for all ARCH_BCMBCA
anyway so renaming the symbol should be pretty painless.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/Kconfig                        |   9 +-
 drivers/pinctrl/bcm/Makefile                       |   2 +-
 .../bcm/{pinctrl-bcm4908.c => pinctrl-bcmbca.c}    | 208 ++++++++++-----------
 3 files changed, 110 insertions(+), 109 deletions(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 35b51ce4298e2588d0ae9dbda95749858e75dba8..18619aa6c17f0794801fa55e4448c664588aa641 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -29,8 +29,8 @@ config PINCTRL_BCM2835
 	help
 	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
-config PINCTRL_BCM4908
-	tristate "Broadcom BCM4908 pinmux driver"
+config PINCTRL_BCMBCA
+	tristate "Broadcom BCMBCA pinmux driver"
 	depends on OF && (ARCH_BCMBCA || COMPILE_TEST)
 	select PINMUX
 	select PINCONF
@@ -39,9 +39,10 @@ config PINCTRL_BCM4908
 	select GENERIC_PINMUX_FUNCTIONS
 	default ARCH_BCMBCA
 	help
-	  Driver for BCM4908 family SoCs with integrated pin controller.
+	  Driver for BCMBCA (Broadcom Broadband Carrier Access) family
+	  SoCs with integrated pin controller.
 
-	  If compiled as module it will be called pinctrl-bcm4908.
+	  If compiled as module it will be called pinctrl-bcmbca.
 
 config PINCTRL_BCM63XX
 	bool
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 82b868ec14716dc80711d0fcfd9ddd1ee61c9f72..bd7d1762fc12b3736954600dcd78e224bf51e36c 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -3,7 +3,6 @@
 
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
-obj-$(CONFIG_PINCTRL_BCM4908)		+= pinctrl-bcm4908.o
 obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
 obj-$(CONFIG_PINCTRL_BCM6318)		+= pinctrl-bcm6318.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
@@ -11,6 +10,7 @@ obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
 obj-$(CONFIG_PINCTRL_BCM6368)		+= pinctrl-bcm6368.o
 obj-$(CONFIG_PINCTRL_BCM63268)		+= pinctrl-bcm63268.o
+obj-$(CONFIG_PINCTRL_BCMBCA)		+= pinctrl-bcmbca.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
similarity index 66%
rename from drivers/pinctrl/bcm/pinctrl-bcm4908.c
rename to drivers/pinctrl/bcm/pinctrl-bcmbca.c
index 12f7a253ea4d5bd0af5dbabc320fc2df32172e4f..834241103b5452836aea9fe817f7e5d143893985 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
@@ -17,14 +17,14 @@
 
 #define BCM4908_NUM_PINS			86
 
-#define BCM4908_TEST_PORT_BLOCK_EN_LSB			0x00
-#define BCM4908_TEST_PORT_BLOCK_DATA_MSB		0x04
-#define BCM4908_TEST_PORT_BLOCK_DATA_LSB		0x08
-#define  BCM4908_TEST_PORT_LSB_PINMUX_DATA_SHIFT	12
-#define BCM4908_TEST_PORT_COMMAND			0x0c
-#define  BCM4908_TEST_PORT_CMD_LOAD_MUX_REG		0x00000021
-
-struct bcm4908_pinctrl {
+#define BCMBCA_TEST_PORT_BLOCK_EN_LSB			0x00
+#define BCMBCA_TEST_PORT_BLOCK_DATA_MSB			0x04
+#define BCMBCA_TEST_PORT_BLOCK_DATA_LSB			0x08
+#define  BCMBCA_TEST_PORT_LSB_PINMUX_DATA_SHIFT		12
+#define BCMBCA_TEST_PORT_COMMAND			0x0c
+#define  BCMBCA_TEST_PORT_CMD_LOAD_MUX_REG		0x00000021
+
+struct bcmbca_pinctrl {
 	struct device *dev;
 	void __iomem *base;
 	struct mutex mutex;
@@ -36,184 +36,184 @@ struct bcm4908_pinctrl {
  * Groups
  */
 
-struct bcm4908_pinctrl_pin_setup {
+struct bcmbca_pinctrl_pin_setup {
 	unsigned int number;
 	unsigned int function;
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_0_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_0_pins_a[] = {
 	{ 0, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_1_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_1_pins_a[] = {
 	{ 1, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_2_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_2_pins_a[] = {
 	{ 2, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_3_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_3_pins_a[] = {
 	{ 3, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_4_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_4_pins_a[] = {
 	{ 4, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_5_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_5_pins_a[] = {
 	{ 5, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_6_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_6_pins_a[] = {
 	{ 6, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_7_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_7_pins_a[] = {
 	{ 7, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_8_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_8_pins_a[] = {
 	{ 8, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_9_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_9_pins_a[] = {
 	{ 9, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_10_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_10_pins_a[] = {
 	{ 10, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_11_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_11_pins_a[] = {
 	{ 11, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_12_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_12_pins_a[] = {
 	{ 12, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_13_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_13_pins_a[] = {
 	{ 13, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_14_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_14_pins_a[] = {
 	{ 14, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_15_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_15_pins_a[] = {
 	{ 15, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_16_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_16_pins_a[] = {
 	{ 16, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_17_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_17_pins_a[] = {
 	{ 17, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_18_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_18_pins_a[] = {
 	{ 18, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_19_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_19_pins_a[] = {
 	{ 19, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_20_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_20_pins_a[] = {
 	{ 20, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_21_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_21_pins_a[] = {
 	{ 21, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_22_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_22_pins_a[] = {
 	{ 22, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_23_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_23_pins_a[] = {
 	{ 23, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_24_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_24_pins_a[] = {
 	{ 24, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_25_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_25_pins_a[] = {
 	{ 25, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_26_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_26_pins_a[] = {
 	{ 26, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_27_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_27_pins_a[] = {
 	{ 27, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_28_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_28_pins_a[] = {
 	{ 28, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_29_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_29_pins_a[] = {
 	{ 29, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_30_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_30_pins_a[] = {
 	{ 30, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_31_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup led_31_pins_a[] = {
 	{ 31, 3 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_10_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup led_10_pins_b[] = {
 	{ 8, 2 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_11_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup led_11_pins_b[] = {
 	{ 9, 2 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_12_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup led_12_pins_b[] = {
 	{ 0, 2 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_13_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup led_13_pins_b[] = {
 	{ 1, 2 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup led_31_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup led_31_pins_b[] = {
 	{ 30, 2 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup hs_uart_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup hs_uart_pins[] = {
 	{ 10, 0 },	/* CTS */
 	{ 11, 0 },	/* RTS */
 	{ 12, 0 },	/* RXD */
 	{ 13, 0 },	/* TXD */
 };
 
-static const struct bcm4908_pinctrl_pin_setup i2c_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup i2c_pins_a[] = {
 	{ 18, 0 },	/* SDA */
 	{ 19, 0 },	/* SCL */
 };
 
-static const struct bcm4908_pinctrl_pin_setup i2c_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup i2c_pins_b[] = {
 	{ 22, 0 },	/* SDA */
 	{ 23, 0 },	/* SCL */
 };
 
-static const struct bcm4908_pinctrl_pin_setup i2s_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup i2s_pins[] = {
 	{ 27, 0 },	/* MCLK */
 	{ 28, 0 },	/* LRCK */
 	{ 29, 0 },	/* SDATA */
 	{ 30, 0 },	/* SCLK */
 };
 
-static const struct bcm4908_pinctrl_pin_setup nand_ctrl_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup nand_ctrl_pins[] = {
 	{ 32, 0 },
 	{ 33, 0 },
 	{ 34, 0 },
@@ -223,7 +223,7 @@ static const struct bcm4908_pinctrl_pin_setup nand_ctrl_pins[] = {
 	{ 56, 1 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup nand_data_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup nand_data_pins[] = {
 	{ 35, 0 },
 	{ 36, 0 },
 	{ 37, 0 },
@@ -234,28 +234,28 @@ static const struct bcm4908_pinctrl_pin_setup nand_data_pins[] = {
 	{ 42, 0 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup emmc_ctrl_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup emmc_ctrl_pins[] = {
 	{ 46, 0 },
 	{ 47, 0 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup usb0_pwr_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup usb0_pwr_pins[] = {
 	{ 63, 0 },
 	{ 64, 0 },
 };
 
-static const struct bcm4908_pinctrl_pin_setup usb1_pwr_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup usb1_pwr_pins[] = {
 	{ 66, 0 },
 	{ 67, 0 },
 };
 
-struct bcm4908_pinctrl_grp {
+struct bcmbca_pinctrl_grp {
 	const char *name;
-	const struct bcm4908_pinctrl_pin_setup *pins;
+	const struct bcmbca_pinctrl_pin_setup *pins;
 	const unsigned int num_pins;
 };
 
-static const struct bcm4908_pinctrl_grp bcm4908_pinctrl_grps[] = {
+static const struct bcmbca_pinctrl_grp bcm4908_pinctrl_grps[] = {
 	{ "led_0_grp_a", led_0_pins_a, ARRAY_SIZE(led_0_pins_a) },
 	{ "led_1_grp_a", led_1_pins_a, ARRAY_SIZE(led_1_pins_a) },
 	{ "led_2_grp_a", led_2_pins_a, ARRAY_SIZE(led_2_pins_a) },
@@ -308,7 +308,7 @@ static const struct bcm4908_pinctrl_grp bcm4908_pinctrl_grps[] = {
  * Functions
  */
 
-struct bcm4908_pinctrl_function {
+struct bcmbca_pinctrl_function {
 	const char *name;
 	const char * const *groups;
 	const unsigned int num_groups;
@@ -355,7 +355,7 @@ static const char * const emmc_ctrl_groups[] = { "emmc_ctrl_grp" };
 static const char * const usb0_pwr_groups[] = { "usb0_pwr_grp" };
 static const char * const usb1_pwr_groups[] = { "usb1_pwr_grp" };
 
-static const struct bcm4908_pinctrl_function bcm4908_pinctrl_functions[] = {
+static const struct bcmbca_pinctrl_function bcm4908_pinctrl_functions[] = {
 	{ "led_0", led_0_groups, ARRAY_SIZE(led_0_groups) },
 	{ "led_1", led_1_groups, ARRAY_SIZE(led_1_groups) },
 	{ "led_2", led_2_groups, ARRAY_SIZE(led_2_groups) },
@@ -402,7 +402,7 @@ static const struct bcm4908_pinctrl_function bcm4908_pinctrl_functions[] = {
  * Groups code
  */
 
-static const struct pinctrl_ops bcm4908_pinctrl_ops = {
+static const struct pinctrl_ops bcmbca_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
@@ -414,12 +414,12 @@ static const struct pinctrl_ops bcm4908_pinctrl_ops = {
  * Functions code
  */
 
-static int bcm4908_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
+static int bcmbca_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 			      unsigned int func_selector,
 			      unsigned int group_selector)
 {
-	struct bcm4908_pinctrl *bcm4908_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	const struct bcm4908_pinctrl_grp *group;
+	struct bcmbca_pinctrl *bcmbca_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct bcmbca_pinctrl_grp *group;
 	struct group_desc *group_desc;
 	int i;
 
@@ -428,71 +428,71 @@ static int bcm4908_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 	group = group_desc->data;
 
-	mutex_lock(&bcm4908_pinctrl->mutex);
+	mutex_lock(&bcmbca_pinctrl->mutex);
 	for (i = 0; i < group->num_pins; i++) {
 		u32 lsb = 0;
 
 		lsb |= group->pins[i].number;
-		lsb |= group->pins[i].function << BCM4908_TEST_PORT_LSB_PINMUX_DATA_SHIFT;
+		lsb |= group->pins[i].function << BCMBCA_TEST_PORT_LSB_PINMUX_DATA_SHIFT;
 
-		writel(0x0, bcm4908_pinctrl->base + BCM4908_TEST_PORT_BLOCK_DATA_MSB);
-		writel(lsb, bcm4908_pinctrl->base + BCM4908_TEST_PORT_BLOCK_DATA_LSB);
-		writel(BCM4908_TEST_PORT_CMD_LOAD_MUX_REG,
-		       bcm4908_pinctrl->base + BCM4908_TEST_PORT_COMMAND);
+		writel(0x0, bcmbca_pinctrl->base + BCMBCA_TEST_PORT_BLOCK_DATA_MSB);
+		writel(lsb, bcmbca_pinctrl->base + BCMBCA_TEST_PORT_BLOCK_DATA_LSB);
+		writel(BCMBCA_TEST_PORT_CMD_LOAD_MUX_REG,
+		       bcmbca_pinctrl->base + BCMBCA_TEST_PORT_COMMAND);
 	}
-	mutex_unlock(&bcm4908_pinctrl->mutex);
+	mutex_unlock(&bcmbca_pinctrl->mutex);
 
 	return 0;
 }
 
-static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
+static const struct pinmux_ops bcmbca_pinctrl_pmxops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
-	.set_mux = bcm4908_pinctrl_set_mux,
+	.set_mux = bcmbca_pinctrl_set_mux,
 };
 
 /*
  * Controller code
  */
 
-static const struct pinctrl_desc bcm4908_pinctrl_desc = {
-	.name = "bcm4908-pinctrl",
-	.pctlops = &bcm4908_pinctrl_ops,
-	.pmxops = &bcm4908_pinctrl_pmxops,
+static const struct pinctrl_desc bcmbca_pinctrl_desc = {
+	.name = "bcmbca-pinctrl",
+	.pctlops = &bcmbca_pinctrl_ops,
+	.pmxops = &bcmbca_pinctrl_pmxops,
 };
 
-static const struct of_device_id bcm4908_pinctrl_of_match_table[] = {
+static const struct of_device_id bcmbca_pinctrl_of_match_table[] = {
 	{ .compatible = "brcm,bcm4908-pinctrl", },
 	{ }
 };
 
-static int bcm4908_pinctrl_probe(struct platform_device *pdev)
+static int bcmbca_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct bcm4908_pinctrl *bcm4908_pinctrl;
+	struct bcmbca_pinctrl *bcmbca_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pins;
 	char **pin_names;
 	int i;
 
-	bcm4908_pinctrl = devm_kzalloc(dev, sizeof(*bcm4908_pinctrl), GFP_KERNEL);
-	if (!bcm4908_pinctrl)
+	bcmbca_pinctrl = devm_kzalloc(dev, sizeof(*bcmbca_pinctrl), GFP_KERNEL);
+	if (!bcmbca_pinctrl)
 		return -ENOMEM;
-	pctldesc = &bcm4908_pinctrl->pctldesc;
-	platform_set_drvdata(pdev, bcm4908_pinctrl);
+	pctldesc = &bcmbca_pinctrl->pctldesc;
+	platform_set_drvdata(pdev, bcmbca_pinctrl);
 
 	/* Set basic properties */
 
-	bcm4908_pinctrl->dev = dev;
+	bcmbca_pinctrl->dev = dev;
 
-	bcm4908_pinctrl->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(bcm4908_pinctrl->base))
-		return PTR_ERR(bcm4908_pinctrl->base);
+	bcmbca_pinctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bcmbca_pinctrl->base))
+		return PTR_ERR(bcmbca_pinctrl->base);
 
-	mutex_init(&bcm4908_pinctrl->mutex);
+	mutex_init(&bcmbca_pinctrl->mutex);
 
-	memcpy(pctldesc, &bcm4908_pinctrl_desc, sizeof(*pctldesc));
+	memcpy(pctldesc, &bcmbca_pinctrl_desc, sizeof(*pctldesc));
 
 	/* Set pinctrl properties */
 
@@ -512,15 +512,15 @@ static int bcm4908_pinctrl_probe(struct platform_device *pdev)
 
 	/* Register */
 
-	bcm4908_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, bcm4908_pinctrl);
-	if (IS_ERR(bcm4908_pinctrl->pctldev))
-		return dev_err_probe(dev, PTR_ERR(bcm4908_pinctrl->pctldev),
+	bcmbca_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, bcmbca_pinctrl);
+	if (IS_ERR(bcmbca_pinctrl->pctldev))
+		return dev_err_probe(dev, PTR_ERR(bcmbca_pinctrl->pctldev),
 				     "Failed to register pinctrl\n");
 
 	/* Groups */
 
 	for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_grps); i++) {
-		const struct bcm4908_pinctrl_grp *group = &bcm4908_pinctrl_grps[i];
+		const struct bcmbca_pinctrl_grp *group = &bcm4908_pinctrl_grps[i];
 		int *pins;
 		int j;
 
@@ -530,16 +530,16 @@ static int bcm4908_pinctrl_probe(struct platform_device *pdev)
 		for (j = 0; j < group->num_pins; j++)
 			pins[j] = group->pins[j].number;
 
-		pinctrl_generic_add_group(bcm4908_pinctrl->pctldev, group->name,
+		pinctrl_generic_add_group(bcmbca_pinctrl->pctldev, group->name,
 					  pins, group->num_pins, (void *)group);
 	}
 
 	/* Functions */
 
 	for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_functions); i++) {
-		const struct bcm4908_pinctrl_function *function = &bcm4908_pinctrl_functions[i];
+		const struct bcmbca_pinctrl_function *function = &bcm4908_pinctrl_functions[i];
 
-		pinmux_generic_add_function(bcm4908_pinctrl->pctldev,
+		pinmux_generic_add_function(bcmbca_pinctrl->pctldev,
 					    function->name,
 					    function->groups,
 					    function->num_groups, NULL);
@@ -548,17 +548,17 @@ static int bcm4908_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver bcm4908_pinctrl_driver = {
-	.probe = bcm4908_pinctrl_probe,
+static struct platform_driver bcmbca_pinctrl_driver = {
+	.probe = bcmbca_pinctrl_probe,
 	.driver = {
-		.name = "bcm4908-pinctrl",
-		.of_match_table = bcm4908_pinctrl_of_match_table,
+		.name = "bcmbca-pinctrl",
+		.of_match_table = bcmbca_pinctrl_of_match_table,
 	},
 };
 
-module_platform_driver(bcm4908_pinctrl_driver);
+module_platform_driver(bcmbca_pinctrl_driver);
 
 MODULE_AUTHOR("Rafał Miłecki");
-MODULE_DESCRIPTION("Broadcom BCM4908 pinmux driver");
+MODULE_DESCRIPTION("Broadcom BCMBCA pinmux driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
+MODULE_DEVICE_TABLE(of, bcmbca_pinctrl_of_match_table);

-- 
2.51.0


