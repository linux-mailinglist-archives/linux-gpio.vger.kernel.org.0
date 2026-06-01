Return-Path: <linux-gpio+bounces-37767-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNbVIOa6HWoidQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37767-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 19:01:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7504622F54
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 19:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F284300C249
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 16:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8923A7F40;
	Mon,  1 Jun 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4ylPAKx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DA36A023;
	Mon,  1 Jun 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333045; cv=none; b=jh+FUFMRvZ4LSblAxoB2dF8Qtabi4AVk/J3xm/VewDwHEWiuw2+2oadt+qCAEmJ3CYWAr8unWM0OjAwJ9ogDDrSQsiQ5MlzuvYcxQxals84QpgzmWHEFip5G4Erc52H3FCEjRqTRjEZijLgNhFTXQ6Dg62lSn6vgJBi1ZUnHbnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333045; c=relaxed/simple;
	bh=xyevwjMyr7vNl7ZzQrplOkY6U4utGgfVUdUraOPnOEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UMTarWnDxl1xCNj5Ic7acpJDI724z5eND9RJfimySUAJBFrtQHO3fpzx/13Lf/GspBDuXz5akNCUCFy+wXwz7q/9W3PT3XEj9fUjTIFg+IvxBNDpYeO8emnc9L3QK+T3qyc/lJJyBnvZM7s1CRG/G+/eWlRbEdkpPO3pLcv60uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4ylPAKx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC6D1F00893;
	Mon,  1 Jun 2026 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780333043;
	bh=w290A9I5MP2KqxKWsP3Z4me4Ofs//TPogdWk1zGmNOU=;
	h=From:To:Cc:Subject:Date;
	b=e4ylPAKxe33GcwzjIzqBzb+z6N1ataV9FHjcSujTtJdg8vP64JGHFhYcX5VYiQ5Uh
	 xRfMiMVatyJw/RueV5uoT9we3r6eMt1WOVYrmQhpLmfi78FebOOKWr/D3lxCkNqi5+
	 VSQqfNFIiZMW0CjYZobD+iJ1x+mDvpsLreDbjvCrMcKrmVyIbyye3MhsmM7DsUCYI5
	 spJCeerKj1UhgUoHz9F17wMz9wahG5Xkp/CT2bsG3s+MuYZsirDjk/QL2GPJu9p6zO
	 kK5B95dWR+LRYuCYDm7XpClzxtRRo99XlHRJrocIUQOJl1c0VJ0b7qNyNB63mBJrKm
	 1P9X7Jx8diMHA==
From: Arnd Bergmann <arnd@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Kyle Hendry <kylehendrydev@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] [v3] [net-next] net: dsa: b53: hide legacy gpiolib usage on non-mips
Date: Mon,  1 Jun 2026 18:56:42 +0200
Message-Id: <20260601165716.648230-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37767-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[broadcom.com,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,oss.qualcomm.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,broadcom.com:email]
X-Rspamd-Queue-Id: D7504622F54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
on gpio numbers, but other platforms do not.

Hide these interfaces inside of the existing #ifdef block and use the
modern interfaces in the common parts of the driver to allow building
it when the gpio_set_value() is left out of the kernel.

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3: add -EPROBE_DEFER check
---
 drivers/net/dsa/b53/b53_common.c | 20 ++++++++------------
 drivers/net/dsa/b53/b53_priv.h   | 25 +++++++++++++++++++------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 2c4131ed7e30..06b8be8dc4db 100644
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
@@ -965,17 +965,17 @@ EXPORT_SYMBOL(b53_configure_vlan);
 
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
@@ -3092,7 +3092,6 @@ static int b53_switch_init(struct b53_device *dev)
 {
 	u32 chip_id = dev->chip_id;
 	unsigned int i;
-	int ret;
 
 	if (is63xx(dev))
 		chip_id = BCM63XX_DEVICE_ID;
@@ -3173,12 +3172,9 @@ static int b53_switch_init(struct b53_device *dev)
 		return -ENOMEM;
 
 	dev->reset_gpio = b53_switch_get_reset_gpio(dev);
-	if (dev->reset_gpio >= 0) {
-		ret = devm_gpio_request_one(dev->dev, dev->reset_gpio,
-					    GPIOF_OUT_INIT_HIGH, "robo_reset");
-		if (ret)
-			return ret;
-	}
+
+	if (PTR_ERR(dev->reset_gpio) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 
 	return 0;
 }
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index bd6849e5bb93..cd27a7344e89 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -148,7 +148,7 @@ struct b53_device {
 	u8 duplex_reg;
 	u8 jumbo_pm_reg;
 	u8 jumbo_size_reg;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	u8 num_arl_bins;
 	u16 num_arl_buckets;
 	enum dsa_tag_protocol tag_protocol;
@@ -467,23 +467,36 @@ static inline void b53_arl_search_read(struct b53_device *dev, u8 idx,
 #ifdef CONFIG_BCM47XX
 
 #include <linux/bcm47xx_nvram.h>
+#include <linux/gpio.h>
 #include <bcm47xx_board.h>
-static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
+static inline struct gpio_desc *b53_switch_get_reset_gpio(struct b53_device *dev)
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
+	ret = devm_gpio_request_one(dev->dev, gpio,
+				    GPIOF_OUT_INIT_HIGH, "robo_reset");
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


