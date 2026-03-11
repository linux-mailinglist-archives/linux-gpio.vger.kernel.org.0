Return-Path: <linux-gpio+bounces-33154-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFH0Bi9/sWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33154-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:41:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6E26596B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A9230CD008
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D8E3C5DB7;
	Wed, 11 Mar 2026 14:38:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6976B3B3C07;
	Wed, 11 Mar 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239893; cv=none; b=BomT3PMQtaOS77O+x9lfxMrxQqGYRbUjEvttskW/vj9Gf5sxfRkwPRz+JAV6lD4yFrD4U3dI5VcwMeKfEuJfxAqqXyImKjmySCBgdSlWEz/+dJwK1Qey30yQy47MSWxkTdb9uvRLIuTqDVXqU+tJhjzE3DCZLQIQyoBrV23F5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239893; c=relaxed/simple;
	bh=eqbx4mwZTaA0wRRinohHZ5IqBH8K0UTIbag01Jsx3mY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmyWQ8ldFzQoALaxOfvR1/iGcySyH1C1CAcXdcjG39/C/k0Cg61OvYo15ktJachPPyIBZ1/p/THkiNZgPF2sT/ox9xotgqOSA2o+yn+xsMUbyVwQhWpsCvVepElGPM9UR6A0DlGd91kuo4BRPFnVAu9Y2n1cjldZbH/EM4+yswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 098B8DF922A;
	Wed, 11 Mar 2026 15:31:47 +0100 (CET)
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id E866C2003FC;
	Wed, 11 Mar 2026 15:31:31 +0100 (CET)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 1/4] gpio: kempld: Simplify the bit level register accesses
Date: Wed, 11 Mar 2026 15:31:17 +0100
Message-Id: <20260311143120.2179347-2-alban.bedel@lht.dlh.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33154-lists,linux-gpio=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 80E6E26596B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The hardware uses 8 bit registers but supports configurations with up
to 16 GPIO, so all GPIO registers come in pairs. Most accesses to
single bits is done using the kempld_gpio_bitop() and
kempld_gpio_get_bit() functions, which take a register index and bit
offset as parameter. These functions apply a modulo on the bit offset
but leave the register index as is, so callers have to use an
additional macro to fix the register index before the call.

Simplify things by also handling the register index offsetting in the
bitop functions.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/gpio/gpio-kempld.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 923aad3ab4d45..532e4000879ab 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -17,8 +17,8 @@
 
 #define KEMPLD_GPIO_MAX_NUM		16
 #define KEMPLD_GPIO_MASK(x)		(BIT((x) % 8))
-#define KEMPLD_GPIO_DIR_NUM(x)		(0x40 + (x) / 8)
-#define KEMPLD_GPIO_LVL_NUM(x)		(0x42 + (x) / 8)
+#define KEMPLD_GPIO_DIR			0x40
+#define KEMPLD_GPIO_LVL			0x42
 #define KEMPLD_GPIO_EVT_LVL_EDGE	0x46
 #define KEMPLD_GPIO_IEN			0x4A
 
@@ -32,24 +32,25 @@ struct kempld_gpio_data {
  * kempld_get_mutex must be called prior to calling this function.
  */
 static void kempld_gpio_bitop(struct kempld_device_data *pld,
-			      u8 reg, u8 bit, u8 val)
+			      u8 reg, unsigned int bit, bool val)
 {
 	u8 status;
 
-	status = kempld_read8(pld, reg);
+	status = kempld_read8(pld, reg + (bit / 8));
 	if (val)
 		status |= KEMPLD_GPIO_MASK(bit);
 	else
 		status &= ~KEMPLD_GPIO_MASK(bit);
-	kempld_write8(pld, reg, status);
+	kempld_write8(pld, reg + (bit / 8), status);
 }
 
-static int kempld_gpio_get_bit(struct kempld_device_data *pld, u8 reg, u8 bit)
+static int kempld_gpio_get_bit(struct kempld_device_data *pld,
+			       u8 reg, unsigned int bit)
 {
 	u8 status;
 
 	kempld_get_mutex(pld);
-	status = kempld_read8(pld, reg);
+	status = kempld_read8(pld, reg + (bit / 8));
 	kempld_release_mutex(pld);
 
 	return !!(status & KEMPLD_GPIO_MASK(bit));
@@ -60,7 +61,7 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
-	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
+	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL, offset);
 }
 
 static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -70,7 +71,7 @@ static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
-	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
+	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL, offset, value);
 	kempld_release_mutex(pld);
 
 	return 0;
@@ -82,7 +83,7 @@ static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
-	kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR_NUM(offset), offset, 0);
+	kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR, offset, 0);
 	kempld_release_mutex(pld);
 
 	return 0;
@@ -95,8 +96,8 @@ static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
-	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
-	kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR_NUM(offset), offset, 1);
+	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL, offset, value);
+	kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR, offset, 1);
 	kempld_release_mutex(pld);
 
 	return 0;
@@ -107,7 +108,7 @@ static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
-	if (kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset))
+	if (kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR, offset))
 		return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
-- 
2.39.5


