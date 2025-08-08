Return-Path: <linux-gpio+bounces-24094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA4B1EBF0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780A1173B18
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6575028688D;
	Fri,  8 Aug 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCXQAgXR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC4286892;
	Fri,  8 Aug 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666627; cv=none; b=oKwlz8sfp6gVkBtOrK2R8INmrUtLXWfhSSidC/Kzt1jBAfvMA2NMwKhXrJXylZRRjYR/lZi2adgFWG/ETyY/FNcPqq7nK5GezTvKD6uTaaCBEvkkwpvZ7/vMOpYfKz6aXFfegYqCtFeck+CoRRH75glqs/lAIzmWt6Z8VwVcPuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666627; c=relaxed/simple;
	bh=Kb1FD+hpLQzBSNB/gTjqbR+cwX9zm9IL2DeUUYXs+lA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/N0P/IjDEeQtelkffg2u0mDtcWsyrl4a/5VqR72LsvVolLsnayJC/vr8VfbVnj4LQMlPCCIH1KC9t2lHHIkbgd8K0svnKMmIESzwlD+x0FmGaDHspDvjHWMLqbRu3gJaVymDkxe9vWSMAlEnx+Jr+ApgdIfaJzjIm0IuUXVbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCXQAgXR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94989C4CEF4;
	Fri,  8 Aug 2025 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666626;
	bh=Kb1FD+hpLQzBSNB/gTjqbR+cwX9zm9IL2DeUUYXs+lA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCXQAgXRmHo3wEbv5T2uyTCRFDcRydPQl1RR+oH0rHNDwAfLrgQLETEDwmv67dRxw
	 fRYgBnBAeaJ6XAiGEtqSJaYt5V5KL/EfibsGi5krrvGs0LTS/7iLCzdoA4UQjUL4hF
	 wnWr5CyjZzGuMIYnNoEO0TnkRuyZLPK/Vx/HOyPLRfsRgmTfTX/gJvdeieF+6Uejb9
	 l82lSfUiFV4d0ttNEGGNU8BqK+hHeZCVAJtcspHUR1LYh0yo7nko/iakiYdBFT5AZz
	 9I9vPxfCMtbSNAFkvqCFhmwqPOF/FkZYM1wx5Gsrz/Y/Msg4/gW68iWEsufWi0A1yD
	 6k6C2Jkwh/LjA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Kyle Hendry <kylehendrydev@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/21] dsa: b53: hide legacy gpiolib usage on non-mips
Date: Fri,  8 Aug 2025 17:17:59 +0200
Message-Id: <20250808151822.536879-16-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
on gpio numbers, but other platforms do not.

Hide these interfaces inside of the existing #ifdef block and use the
modern interfaces in the common parts of the driver to allow building
it when the gpio_set_value() is left out of the kernel.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/dsa/b53/b53_common.c | 17 +++++------------
 drivers/net/dsa/b53/b53_priv.h   | 24 ++++++++++++++++++------
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 9942fb6f7f4b..cb57bcc56c63 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -19,7 +19,7 @@
 
 #include <linux/delay.h>
 #include <linux/export.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/math.h>
 #include <linux/minmax.h>
@@ -948,17 +948,17 @@ EXPORT_SYMBOL(b53_configure_vlan);
 
 static void b53_switch_reset_gpio(struct b53_device *dev)
 {
-	int gpio = dev->reset_gpio;
+	struct gpio_desc *gpio = dev->reset_gpio;
 
-	if (gpio < 0)
+	if (IS_ERR(gpio))
 		return;
 
 	/* Reset sequence: RESET low(50ms)->high(20ms)
 	 */
-	gpio_set_value(gpio, 0);
+	gpiod_set_value(gpio, 0);
 	mdelay(50);
 
-	gpio_set_value(gpio, 1);
+	gpiod_set_value(gpio, 1);
 	mdelay(20);
 
 	dev->current_page = 0xff;
@@ -2925,7 +2925,6 @@ static int b53_switch_init(struct b53_device *dev)
 {
 	u32 chip_id = dev->chip_id;
 	unsigned int i;
-	int ret;
 
 	if (is63xx(dev))
 		chip_id = BCM63XX_DEVICE_ID;
@@ -3005,12 +3004,6 @@ static int b53_switch_init(struct b53_device *dev)
 		return -ENOMEM;
 
 	dev->reset_gpio = b53_switch_get_reset_gpio(dev);
-	if (dev->reset_gpio >= 0) {
-		ret = devm_gpio_request_one(dev->dev, dev->reset_gpio,
-					    GPIOF_OUT_INIT_HIGH, "robo_reset");
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index 458775f95164..16e82653a7c6 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -136,7 +136,7 @@ struct b53_device {
 	u8 duplex_reg;
 	u8 jumbo_pm_reg;
 	u8 jumbo_size_reg;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	u8 num_arl_bins;
 	u16 num_arl_buckets;
 	enum dsa_tag_protocol tag_protocol;
@@ -375,22 +375,34 @@ static inline void b53_arl_from_entry_25(u64 *mac_vid,
 
 #include <linux/bcm47xx_nvram.h>
 #include <bcm47xx_board.h>
-static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
+static inline gpio_desc *b53_switch_get_reset_gpio(struct b53_device *dev)
 {
 	enum bcm47xx_board board = bcm47xx_board_get();
+	int gpio, ret;
 
 	switch (board) {
 	case BCM47XX_BOARD_LINKSYS_WRT300NV11:
 	case BCM47XX_BOARD_LINKSYS_WRT310NV1:
-		return 8;
+		gpio = 8;
+		break;
 	default:
-		return bcm47xx_nvram_gpio_pin("robo_reset");
+		gpio = bcm47xx_nvram_gpio_pin("robo_reset");
 	}
+
+	if (!gpio_is_valid(gpio))
+		return ERR_PTR(-EINVAL);
+
+	ret = devm_gpiod_request_one(dev->dev, gpio,
+				     GPIOF_OUT_INIT_HIGH, "robo_reset");
+	if (ret)
+		return ERR_PTR(ret);
+
+	return gpio_to_desc(gpio);
 }
 #else
-static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
+static inline struct gpio_desc *b53_switch_get_reset_gpio(struct b53_device *dev)
 {
-	return -ENOENT;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 
-- 
2.39.5


