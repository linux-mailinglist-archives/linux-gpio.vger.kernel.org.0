Return-Path: <linux-gpio+bounces-35593-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKMWHgl072kcBgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35593-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:34:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBF47474B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A263F30A26EB
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D4F2798F3;
	Mon, 27 Apr 2026 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ/fOKue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B311E5B63;
	Mon, 27 Apr 2026 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300228; cv=none; b=YgT89PGp/pqrvZV1haQ/QcTIycfMe08iNDn93eygl6EjGGE0I0j+8JthhZpc83cwcII2JDMZuduCI+1Sgzd3A/lesZSS5wCTjgwnyNQbdKijeWqEG82ePwE+Om5aCRwYpSAeCBx9Ig++MuM+NaRBUc7TqZMXrJhqX31kNIjKUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300228; c=relaxed/simple;
	bh=hhw7ORcJvx+XMfsnPQMXBBhpIaCemzbjzVToiUZbMdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uu5INcsMRxfynKwl/MN/fpe34n47GKT8i9khgzQDlDDDKzByiV5VkEj/8Ti4BqRAXPZ6WWOtmn5D7tIaC4P3EhyM0GOlz4ruIx+hxM+BOFJalAhw/xXZ33O0dxGCUCmRrdRbut+eZePRLNJYWyDRLkqNSxs+G32kWN5K8N8K0io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ/fOKue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF362C2BCB4;
	Mon, 27 Apr 2026 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300228;
	bh=hhw7ORcJvx+XMfsnPQMXBBhpIaCemzbjzVToiUZbMdI=;
	h=From:To:Cc:Subject:Date:From;
	b=cQ/fOKue37nRo1QbbzH2e/+lr5hpba/j2XAmC/anSZW3kP0EbksKCvrUuO0mS2MTh
	 L0o5wG5yxu/tON6aS8TWAgr7ixHcVKcgoowXLy89wCgVM2CE7/H3/okfVZkxmRx4Iz
	 7k955PmOwOdUzfjkLnKCUFH6raG/3li2mgbmu7wZsB08a7eW5Bom9M+fF8R6U+0eAM
	 QnYYg3ddBrdPE/AxtVwR7QS7hqFMsdKD26jkPXrwQPRnTFaDiDG1gpkORN6PRp4wAy
	 S4I7YzyT6OfpGvx1NLr4DMozltPFRiBKJH/b9j3IaUiv37mD+QiPvCewqCMDY3VzZ3
	 IeTkLvcZYF06g==
From: Arnd Bergmann <arnd@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Kyle Hendry <kylehendrydev@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] dsa: b53: hide legacy gpiolib usage on non-mips
Date: Mon, 27 Apr 2026 16:30:08 +0200
Message-Id: <20260427143020.2800317-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 14EBF47474B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35593-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[broadcom.com,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Arnd Bergmann <arnd@arndb.de>

The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
on gpio numbers, but other platforms do not.

Hide these interfaces inside of the existing #ifdef block and use the
modern interfaces in the common parts of the driver to allow building
it when the gpio_set_value() is left out of the kernel.

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/dsa/b53/b53_common.c | 17 +++++------------
 drivers/net/dsa/b53/b53_priv.h   | 25 +++++++++++++++++++------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 2c4131ed7e30..d838511ae674 100644
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
@@ -3173,12 +3172,6 @@ static int b53_switch_init(struct b53_device *dev)
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
index 923d56bbd061..ad0c65a9bdc3 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -149,7 +149,7 @@ struct b53_device {
 	u8 duplex_reg;
 	u8 jumbo_pm_reg;
 	u8 jumbo_size_reg;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	u8 num_arl_bins;
 	u16 num_arl_buckets;
 	enum dsa_tag_protocol tag_protocol;
@@ -468,23 +468,36 @@ static inline void b53_arl_search_read(struct b53_device *dev, u8 idx,
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


