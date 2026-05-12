Return-Path: <linux-gpio+bounces-36636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFjIJt+fAmpevAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 05:34:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA25194F6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 05:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A0E23013328
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 03:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3A22FD1AA;
	Tue, 12 May 2026 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="N9VY6Bcw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760ED226D18;
	Tue, 12 May 2026 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556881; cv=none; b=udfmkKmxWfZgap5ITFxXLKKd6UHDoOjz4p5RW0spj0hmufGBvkxwhtpTT5vfemU0GDPRa2MS/5kk/BpYuBc4r6/999kNdfSJLa59/MyrXgsZILCQyYFOeenvj4fH7Twef76V5GIbK+yo/hvplzTFytX026VGX3XnXic5I39J1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556881; c=relaxed/simple;
	bh=STg+/kp/CRwX2rjIcCOFYfha5vMo8nNiCAngZ1D/WxM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jk2547Mzbzr8oFOXk+1iHtA804sjmzYRM9nGPJCwCBWEHmlr0NRfQW1rj5JZc1ahw8K9Yk65WFi50uCpRrDUZXdon4/sMFH/4CKazNCydBHsauabcs1ZuRh3gpZhCrPFlu6ugBzyGwOyqcDjio7SDYcC55lSRkhU29oSEFXYKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=N9VY6Bcw; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XIJG03571934, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556798; bh=b39iRkdeAbf1CRvk6sxIU/W3t/buJ3cnlV/F50ibrYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=N9VY6Bcws19ekXPWrJ8M5qYHsf4z1yU550RbNBFXq6SslSqwemJWDJgLQA+x0I/Ri
	 vuldl9dQYwoGXv+5/I54Ae3fa/DpXDN0qp7wreLwLX/21P0t+dWG7+HOn4WnmjGWgu
	 +17aEHAZ1RxPl1ipVzNzf4TPjhiu3yguDG6nvIjDvBTbwAzEOi4jPn7ZzFHbqHZQ5I
	 M/zryn0xfPQLvYeqdimKj3BQRNNww/OJY18x4K6X8+kXEXC5Ni/OO6XSD/FuuiaoEy
	 h+ArCzE/9y4wGUXAy1JwQejbNHWrxjxbvX7DHoSzkdri2bdUrvlPYA1TgNmn0ICGM7
	 v9lTnRAos7Mwg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XIJG03571934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:18 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:18 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        Linus Walleij
	<linus.walleij@linaro.org>
Subject: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and write-enable support
Date: Tue, 12 May 2026 11:33:13 +0800
Message-ID: <20260512033317.1602537-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 9FDA25194F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36636-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,realtek.com:email,realtek.com:mid,realtek.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the reg_mask_xlate callback with an operation type parameter
(gpio_regmap_operation) to allow drivers to return different
register/mask combinations for different GPIO operations.

Also add write-enable mechanism for hardware that requires setting a
write-enable bit before modifying GPIO control registers.

Consequently, update all existing drivers utilizing the gpio-regmap
framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
to accommodate the new reg_mask_xlate function signature.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-104-idi-48.c        | 18 +++++--
 drivers/gpio/gpio-i8255.c             | 13 ++++-
 drivers/gpio/gpio-idio-16.c           | 16 ++++--
 drivers/gpio/gpio-max7360.c           | 10 ++++
 drivers/gpio/gpio-pcie-idio-24.c      | 15 ++++--
 drivers/gpio/gpio-regmap.c            | 72 ++++++++++++++++++++-------
 drivers/iio/adc/ad7173.c              | 32 +++++++++---
 drivers/iio/addac/stx104.c            | 17 +++++--
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 12 ++++-
 drivers/pinctrl/pinctrl-tps6594.c     | 10 ++++
 include/linux/gpio/regmap.h           | 43 ++++++++++++++--
 11 files changed, 214 insertions(+), 44 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index ba73ee9c0c29..ebd0587f99c5 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -36,9 +36,10 @@ MODULE_PARM_DESC(irq, "ACCES 104-IDI-48 interrupt line numbers");
 #define IDI48_IRQ_STATUS 0x7
 #define IDI48_IRQ_ENABLE IDI48_IRQ_STATUS
 
-static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
-				 unsigned int offset, unsigned int *reg,
-				 unsigned int *mask)
+static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio,
+				 enum gpio_regmap_operation op,
+				 unsigned int base, unsigned int offset,
+				 unsigned int *reg, unsigned int *mask)
 {
 	const unsigned int line = offset % 8;
 	const unsigned int stride = offset / 8;
@@ -46,7 +47,16 @@ static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
 	const unsigned int port_stride = stride % 3;
 
 	*reg = base + port + port_stride;
-	*mask = BIT(line);
+
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		break;
+	default:
+		*mask = BIT(line);
+		break;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-i8255.c b/drivers/gpio/gpio-i8255.c
index 953018bfa2b1..ec3c3186e2d1 100644
--- a/drivers/gpio/gpio-i8255.c
+++ b/drivers/gpio/gpio-i8255.c
@@ -67,8 +67,8 @@ static int i8255_ppi_init(struct regmap *const map, const unsigned int base)
 	return regmap_write(map, base + I8255_PORTC, 0x00);
 }
 
-static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
-				unsigned int offset, unsigned int *reg,
+static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
+				unsigned int base, unsigned int offset, unsigned int *reg,
 				unsigned int *mask)
 {
 	const unsigned int ppi = offset / I8255_NGPIO;
@@ -76,6 +76,15 @@ static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
 	const unsigned int stride = ppi_offset / I8255_NGPIO_PER_REG;
 	const unsigned int line = ppi_offset % I8255_NGPIO_PER_REG;
 
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		return 0;
+	default:
+		break;
+	}
+
 	switch (base) {
 	case I8255_REG_DAT_BASE:
 		*reg = base + stride + ppi * 4;
diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index 4fbae6f6a497..d78a05c22531 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -66,9 +66,9 @@ static int idio_16_handle_mask_sync(const int index, const unsigned int mask_buf
 	return 0;
 }
 
-static int idio_16_reg_mask_xlate(struct gpio_regmap *const gpio, const unsigned int base,
-				  const unsigned int offset, unsigned int *const reg,
-				  unsigned int *const mask)
+static int idio_16_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
+				  const unsigned int base, const unsigned int offset,
+				  unsigned int *const reg, unsigned int *const mask)
 {
 	unsigned int stride;
 
@@ -81,7 +81,15 @@ static int idio_16_reg_mask_xlate(struct gpio_regmap *const gpio, const unsigned
 		*reg = IDIO_16_IN_BASE + stride * IDIO_16_REG_STRIDE;
 	}
 
-	*mask = BIT(offset % IDIO_16_NGPIO_PER_REG);
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		break;
+	default:
+		*mask = BIT(offset % IDIO_16_NGPIO_PER_REG);
+		break;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-max7360.c b/drivers/gpio/gpio-max7360.c
index db92a43776a9..2a26313d021d 100644
--- a/drivers/gpio/gpio-max7360.c
+++ b/drivers/gpio/gpio-max7360.c
@@ -94,9 +94,19 @@ static int max7360_set_gpos_count(struct device *dev, struct regmap *regmap)
 }
 
 static int max7360_gpio_reg_mask_xlate(struct gpio_regmap *gpio,
+				       enum gpio_regmap_operation op,
 				       unsigned int base, unsigned int offset,
 				       unsigned int *reg, unsigned int *mask)
 {
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		return 0;
+	default:
+		break;
+	}
+
 	if (base == MAX7360_REG_PWMBASE) {
 		/*
 		 * GPIO output is using PWM duty cycle registers: one register
diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 80c0ba0afa67..dc80f96174c2 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -225,9 +225,9 @@ static int idio_24_set_type_config(unsigned int **const buf, const unsigned int
 	return ret;
 }
 
-static int idio_24_reg_mask_xlate(struct gpio_regmap *const gpio, const unsigned int base,
-				  const unsigned int offset, unsigned int *const reg,
-				  unsigned int *const mask)
+static int idio_24_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
+				  const unsigned int base, const unsigned int offset,
+				  unsigned int *const reg, unsigned int *const mask)
 {
 	const unsigned int out_stride = offset / IDIO_24_NGPIO_PER_REG;
 	const unsigned int in_stride = (offset - 24) / IDIO_24_NGPIO_PER_REG;
@@ -235,6 +235,15 @@ static int idio_24_reg_mask_xlate(struct gpio_regmap *const gpio, const unsigned
 	int err;
 	unsigned int ctrl_reg;
 
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		return 0;
+	default:
+		break;
+	}
+
 	switch (base) {
 	case IDIO_24_OUT_BASE:
 		*mask = BIT(offset % IDIO_24_NGPIO_PER_REG);
diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index deb9eebb58de..c76eef20e412 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -38,9 +38,10 @@ struct gpio_regmap {
 	struct regmap_irq_chip_data *irq_chip_data;
 #endif
 
-	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-			      unsigned int offset, unsigned int *reg,
-			      unsigned int *mask);
+	int (*reg_mask_xlate)(struct gpio_regmap *gpio,
+			      enum gpio_regmap_operation op,
+			      unsigned int base, unsigned int offset,
+			      unsigned int *reg, unsigned int *mask);
 
 	void *driver_data;
 };
@@ -54,6 +55,7 @@ static unsigned int gpio_regmap_addr(unsigned int addr)
 }
 
 static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
+				    enum gpio_regmap_operation op,
 				    unsigned int base, unsigned int offset,
 				    unsigned int *reg, unsigned int *mask)
 {
@@ -61,7 +63,16 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
 	unsigned int stride = offset / gpio->ngpio_per_reg;
 
 	*reg = base + stride * gpio->reg_stride;
-	*mask = BIT(line);
+
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		break;
+	default:
+		*mask = BIT(line);
+		break;
+	}
 
 	return 0;
 }
@@ -69,7 +80,7 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
 static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
-	unsigned int base, val, reg, mask;
+	unsigned int base, val, reg, mask, dir_mask;
 	int ret;
 
 	/* we might not have an output register if we are input only */
@@ -78,10 +89,24 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	else
 		base = gpio_regmap_addr(gpio->reg_set_base);
 
-	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &reg, &dir_mask);
 	if (ret)
 		return ret;
 
+	ret = regmap_read(gpio->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	if (val & dir_mask) {
+		ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_OUT, base, offset, &reg, &mask);
+		if (ret)
+			return ret;
+	} else {
+		ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_IN, base, offset, &reg, &mask);
+		if (ret)
+			return ret;
+	}
+
 	/* ensure we don't spoil any register cache with pin input values */
 	if (gpio->reg_dat_base == gpio->reg_set_base)
 		ret = regmap_read_bypassed(gpio->regmap, reg, &val);
@@ -98,10 +123,14 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
-	unsigned int reg, mask, mask_val;
+	unsigned int reg, mask, mask_val, wren_mask;
 	int ret;
 
-	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
+	if (ret)
+		return ret;
+
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
 	if (ret)
 		return ret;
 
@@ -112,9 +141,9 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
 
 	/* ignore input values which shadow the old output value */
 	if (gpio->reg_dat_base == gpio->reg_set_base)
-		ret = regmap_write_bits(gpio->regmap, reg, mask, mask_val);
+		ret = regmap_write_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
 	else
-		ret = regmap_update_bits(gpio->regmap, reg, mask, mask_val);
+		ret = regmap_update_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
 
 	return ret;
 }
@@ -123,7 +152,7 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
 				      unsigned int offset, int val)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
-	unsigned int base, reg, mask;
+	unsigned int base, reg, mask, wren_mask;
 	int ret;
 
 	if (val)
@@ -131,11 +160,15 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
 	else
 		base = gpio_regmap_addr(gpio->reg_clr_base);
 
-	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
 	if (ret)
 		return ret;
 
-	return regmap_write(gpio->regmap, reg, mask);
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WITH_CLEAR_OP, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	return regmap_write(gpio->regmap, reg, mask | wren_mask);
 }
 
 static int gpio_regmap_get_direction(struct gpio_chip *chip,
@@ -167,7 +200,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 		return -ENOTSUPP;
 	}
 
-	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_DIR_OP, base, offset, &reg, &mask);
 	if (ret)
 		return ret;
 
@@ -185,7 +218,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 				     unsigned int offset, bool output)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
-	unsigned int base, val, reg, mask;
+	unsigned int base, val, reg, mask, wren_mask;
 	int invert, ret;
 
 	if (gpio->reg_dir_out_base) {
@@ -198,7 +231,12 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 		return -ENOTSUPP;
 	}
 
-	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset, &reg,
+				   &wren_mask);
 	if (ret)
 		return ret;
 
@@ -207,7 +245,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 	else
 		val = output ? mask : 0;
 
-	return regmap_update_bits(gpio->regmap, reg, mask, val);
+	return regmap_update_bits(gpio->regmap, reg, mask | wren_mask, val | wren_mask);
 }
 
 static int gpio_regmap_direction_input(struct gpio_chip *chip,
diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index f76a9e08f39e..e8a6921bc443 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -561,21 +561,41 @@ static int ad4111_openwire_event(struct iio_dev *indio_dev,
 	return ret;
 }
 
-static int ad7173_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
-			     unsigned int offset, unsigned int *reg,
+static int ad7173_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
+			     unsigned int base, unsigned int offset, unsigned int *reg,
 			     unsigned int *mask)
 {
-	*mask = AD7173_GPO_DATA(offset);
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		return 0;
+	default:
+		*mask = AD7173_GPO_DATA(offset);
+		break;
+	}
+
 	*reg = base;
+
 	return 0;
 }
 
-static int ad4111_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
-			     unsigned int offset, unsigned int *reg,
+static int ad4111_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
+			     unsigned int base, unsigned int offset, unsigned int *reg,
 			     unsigned int *mask)
 {
-	*mask = AD4111_GPO01_DATA(offset);
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		break;
+	default:
+		*mask = AD4111_GPO01_DATA(offset);
+		break;
+	}
+
 	*reg = base;
+
 	return 0;
 }
 
diff --git a/drivers/iio/addac/stx104.c b/drivers/iio/addac/stx104.c
index 7bdf2cb94176..a4e54ed102a2 100644
--- a/drivers/iio/addac/stx104.c
+++ b/drivers/iio/addac/stx104.c
@@ -349,16 +349,25 @@ static const struct iio_chan_spec stx104_channels_diff[] = {
 	STX104_IN_CHAN(6, 1), STX104_IN_CHAN(7, 1)
 };
 
-static int stx104_reg_mask_xlate(struct gpio_regmap *const gpio, const unsigned int base,
-				 unsigned int offset, unsigned int *const reg,
-				 unsigned int *const mask)
+static int stx104_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
+				 const unsigned int base, unsigned int offset,
+				 unsigned int *const reg, unsigned int *const mask)
 {
 	/* Output lines are located at same register bit offsets as input lines */
 	if (offset >= 4)
 		offset -= 4;
 
 	*reg = base;
-	*mask = BIT(offset);
+
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		break;
+	default:
+		*mask = BIT(offset);
+		break;
+	}
 
 	return 0;
 }
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
index 59d2ce8462d8..3a868deb7793 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -20,6 +20,7 @@
 #define BCM63XX_DATA_REG	0x0c
 
 static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
+				  enum gpio_regmap_operation op,
 				  unsigned int base, unsigned int offset,
 				  unsigned int *reg, unsigned int *mask)
 {
@@ -27,7 +28,16 @@ static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
 	unsigned int stride = offset / BCM63XX_BANK_GPIOS;
 
 	*reg = base - stride * BCM63XX_BANK_SIZE;
-	*mask = BIT(line);
+
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		break;
+	default:
+		*mask = BIT(line);
+		break;
+	}
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 6726853110d1..e30a856712af 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -347,12 +347,22 @@ static struct tps6594_pinctrl tps6594_template_pinctrl = {
 };
 
 static int tps6594_gpio_regmap_xlate(struct gpio_regmap *gpio,
+				     enum gpio_regmap_operation op,
 				     unsigned int base, unsigned int offset,
 				     unsigned int *reg, unsigned int *mask)
 {
 	unsigned int line = offset % 8;
 	unsigned int stride = offset / 8;
 
+	switch (op) {
+	case GPIO_REGMAP_SET_WREN_OP:
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = 0;
+		return 0;
+	default:
+		break;
+	}
+
 	switch (base) {
 	case TPS6594_REG_GPIOX_CONF(0):
 		*reg = TPS6594_REG_GPIOX_CONF(offset);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index e4a95f805a81..519fc81add8a 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -13,6 +13,43 @@ struct regmap;
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
+/**
+ * enum gpio_regmap_operation - Operation type for reg_mask_xlate callback
+ *
+ * This enum is used to distinguish between different types of GPIO operations
+ * so that the reg_mask_xlate callback can return the appropriate mask for each
+ * operation type.
+ *
+ * Value operations:
+ * @GPIO_REGMAP_GET_OP: Mask for reading direction to detect if GPIO is input or output.
+ *                      Used in gpio_regmap_get() to determine the GPIO direction.
+ * @GPIO_REGMAP_IN: Mask for reading input value. Used when GPIO is configured as input.
+ * @GPIO_REGMAP_OUT: Mask for reading output value. Used when GPIO is configured as output.
+ *
+ * Output operations:
+ * @GPIO_REGMAP_SET_OP: Mask for setting GPIO output value.
+ * @GPIO_REGMAP_SET_WITH_CLEAR_OP: Mask for setting/clearing GPIO using separate registers.
+ * @GPIO_REGMAP_SET_WREN_OP: Write-enable mask for output operations. May be used to enable
+ *                           writes to protected registers.
+ *
+ * Direction operations:
+ * @GPIO_REGMAP_GET_DIR_OP: Mask for reading GPIO direction (input/output).
+ * @GPIO_REGMAP_SET_DIR_OP: Mask for setting GPIO direction (input/output).
+ * @GPIO_REGMAP_SET_DIR_WREN_OP: Write-enable mask for direction operations. May be used to
+ *                               enable writes to protected direction registers.
+ */
+enum gpio_regmap_operation {
+	GPIO_REGMAP_GET_OP,
+	GPIO_REGMAP_SET_OP,
+	GPIO_REGMAP_SET_WITH_CLEAR_OP,
+	GPIO_REGMAP_SET_WREN_OP,
+	GPIO_REGMAP_GET_DIR_OP,
+	GPIO_REGMAP_SET_DIR_OP,
+	GPIO_REGMAP_SET_DIR_WREN_OP,
+	GPIO_REGMAP_IN,
+	GPIO_REGMAP_OUT,
+};
+
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
@@ -97,9 +134,9 @@ struct gpio_regmap_config {
 	unsigned long regmap_irq_flags;
 #endif
 
-	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-			      unsigned int offset, unsigned int *reg,
-			      unsigned int *mask);
+	int (*reg_mask_xlate)(struct gpio_regmap *gpio, enum gpio_regmap_operation,
+			      unsigned int base, unsigned int offset,
+			      unsigned int *reg, unsigned int *mask);
 
 	int (*init_valid_mask)(struct gpio_chip *gc,
 			       unsigned long *valid_mask,
-- 
2.34.1


