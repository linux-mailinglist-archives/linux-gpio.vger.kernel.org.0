Return-Path: <linux-gpio+bounces-33146-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAbeFO58sWmACAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33146-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:32:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E0265684
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF25D303932D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC3C366563;
	Wed, 11 Mar 2026 14:31:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41896361DAE;
	Wed, 11 Mar 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239516; cv=none; b=WD77dXyo3KVUgEIxbOLQQpXuJUIB7nmbFh2vQaxT6xfiYCHwaNB//0KL7FN87fZjJN+BcdAm6g5nlbBCc5OMAmiA4ribWV/15MHak/ZQAhJfr3RuFME24K+4i1QmMMg+lQ3qbK1rwTr/yaMkR9hYFhh7soDGH/j2MED1T4qFHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239516; c=relaxed/simple;
	bh=xwzDJldw2ScjgAZdF++yq28RL5rFT7+4YXOLSPkJCW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MvaXHBpBraDq7SsItQBAzM0klub/kvt6DtqdUgblzHOgT4Uu15osCMJ+A5W0wCotarzWQ8ZUB32SE+RuPKguJf3O572fg4GXmDh1/0y29cYyunJs9jt6nWtw1BpqUtodLaccQx9cI3iaZf5Bv/hRTIklDBVaFTa3qfqxttfOXA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id E41A72003F6;
	Wed, 11 Mar 2026 15:31:45 +0100 (CET)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 3/4] gpio: kempld: Add support for get/set multiple
Date: Wed, 11 Mar 2026 15:31:19 +0100
Message-Id: <20260311143120.2179347-4-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
References: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33146-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dlh.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lht.dlh.de:mid]
X-Rspamd-Queue-Id: C72E0265684
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As the bus accesses are quiet slow with this device, supporting the
get/set multiple API can help with performences. The implementation
tries to keep the number of bus access to a minimum by checking
the mask to only read or write the needed bytes.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/gpio/gpio-kempld.c | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 2263de77d40e9..7dd94ff6f2df4 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -65,6 +65,33 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL, offset);
 }
 
+static int kempld_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				    unsigned long *bits)
+{
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+	struct kempld_device_data *pld = gpio->pld;
+	u8 reg = KEMPLD_GPIO_LVL;
+	unsigned int shift;
+
+	bits[0] &= ~mask[0];
+
+	kempld_get_mutex(pld);
+
+	/* Try to reduce to a single 8 bits access if possible */
+	for (shift = 0; shift < gpio->chip.ngpio; shift += 8, reg++) {
+		unsigned long msk = (mask[0] >> shift) & 0xff;
+
+		if (!msk)
+			continue;
+
+		bits[0] |= (kempld_read8(pld, reg) & msk) << shift;
+	}
+
+	kempld_release_mutex(pld);
+
+	return 0;
+}
+
 static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   int value)
 {
@@ -78,6 +105,37 @@ static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static int kempld_gpio_set_multiple(struct gpio_chip *chip,
+				    unsigned long *mask, unsigned long *bits)
+{
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+	struct kempld_device_data *pld = gpio->pld;
+	u8 reg = gpio->out_lvl_reg;
+	unsigned int shift;
+
+	kempld_get_mutex(pld);
+
+	/* Try to reduce to a single 8 bits access if possible */
+	for (shift = 0; shift < gpio->chip.ngpio; shift += 8, reg++) {
+		u8 val, msk = mask[0] >> shift;
+
+		if (!msk)
+			continue;
+
+		if (msk != 0xFF)
+			val = kempld_read8(pld, reg) & ~msk;
+		else
+			val = 0;
+
+		val |= (bits[0] >> shift) & msk;
+		kempld_write8(pld, reg, val);
+	}
+
+	kempld_release_mutex(pld);
+
+	return 0;
+}
+
 static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
@@ -180,7 +238,9 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = kempld_gpio_direction_output;
 	chip->get_direction = kempld_gpio_get_direction;
 	chip->get = kempld_gpio_get;
+	chip->get_multiple = kempld_gpio_get_multiple;
 	chip->set = kempld_gpio_set;
+	chip->set_multiple = kempld_gpio_set_multiple;
 	chip->ngpio = kempld_gpio_pincount(pld);
 	if (chip->ngpio == 0) {
 		dev_err(dev, "No GPIO pins detected\n");
-- 
2.39.5


