Return-Path: <linux-gpio+bounces-39261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ztA8F0tnRGr1uAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 03:03:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103F6E8FD4
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 03:03:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alliedtelesis.co.nz header.s=mail181024 header.b=HLMzTxRo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39261-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39261-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=alliedtelesis.co.nz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B96F300FCA1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 01:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4101A681E;
	Wed,  1 Jul 2026 01:02:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49FE224FA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 01:02:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782867779; cv=none; b=KoNzWOOTglYPvxqa+EHtdXVS4NJKhLfag4WTMDbE+4EN6yQVFoE4StASaFJA4O2Rq5l+xR9LLolir9a48EDOhsQiUf2x0J+KUJ3NtMWlK/Hx4cgfO0H0Fub6NAivxApS9eZ49DT3I4LXVOWvNANfFkYX/khLEnY9hgoFvOFTC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782867779; c=relaxed/simple;
	bh=f1Kfdp/24l27Z3g7GGBJKSuUuNkpzYfD1zD06/Xg+po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CX89+IHEF+FnKNT7GEG61eSfpAIYZ4QT6AfWXhsUkivQL4l4Rwa4SLXKGODfsYEx/gJWtlm8qooweJ0gz/qs04A5DSuf4xLLkc+jnefpbLtkj50742p6HvTxubUrUowibXTjkQtnTnNgiJ8D8HpJIhiiRJJy9yx1HPzeZTYJDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=HLMzTxRo; arc=none smtp.client-ip=202.36.163.20
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 982842C01F0;
	Wed,  1 Jul 2026 13:02:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782867774;
	bh=iZTYzu5o/YiQslM99gSKLg5tc25ewlHM95x3h+EO8KY=;
	h=From:To:Cc:Subject:Date:From;
	b=HLMzTxRoL3EMvGpVu3cBA5tqJMrUg+Tt+0VX/aGFnDxnLEvH/3rKN13o2i8qRRZmQ
	 pTMIQ3dFijZAQSqamKMG5o6re9GarMKaaALEDvvtv5a1zMz7jQ4zRnOhUUzvKbHVPQ
	 DCsAvYfndb+Pw4LFlEbDk0YtTPAZ2mGpDpO6OVD4k53Q11hGn5/2IUmL955vd+glFs
	 +6xDn6JFmiSGOS2ZTeEF84LaZUEMFC9lztkMQl1HZ3eMlsS2vJvMNgMhg2zjBx1cgn
	 4F8MyYIm1vQE++BTKGqDsRzWyWky1jQ9d0e5EHXy/uDajrAUnlticWaalw318MQq07
	 /rBk+xAEW08wQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a44673e0000>; Wed, 01 Jul 2026 13:02:54 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6A18E13EC4E;
	Wed,  1 Jul 2026 13:02:54 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
	id 67C11406AE; Wed,  1 Jul 2026 13:02:54 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: linusw@kernel.org,
	brgl@kernel.org,
	ian.ray@gehealthcare.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
Date: Wed,  1 Jul 2026 13:02:28 +1200
Message-ID: <20260701010228.1605573-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a44673e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RAioF0-LDSMA:10 a=HDTP818q5T4t6XSuYIMA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39261-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mark.tomlinson@alliedtelesis.co.nz,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:ian.ray@gehealthcare.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mark.tomlinson@alliedtelesis.co.nz,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.tomlinson@alliedtelesis.co.nz,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1103F6E8FD4

Locking is disabled in the regmap config as this driver uses its own
lock. This means that all calls to regmap functions (read or write) must
hold the i2c_lock. The function pca953x_irq_bus_sync_unlock() did not do
this, and it was therefore possible that multiple threads could cause an
incorrect register to be read/written.

A previous patch partly fixed this, but only protected the write to the
interrupt mask register, and not the read from the direction register.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/gpio/gpio-pca953x.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2ee35e855e4d..9689e3f3c517 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -605,20 +605,27 @@ static int pca953x_read_regs(struct pca953x_chip *c=
hip, int reg, unsigned long *
 	return 0;
 }
=20
-static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned o=
ff)
+static int _pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned =
off)
 {
 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
 	u8 dirreg =3D chip->recalc_addr(chip, chip->regs->direction, off);
 	u8 bit =3D pca953x_get_bit_mask(chip, off);
=20
-	guard(mutex)(&chip->i2c_lock);
-
 	if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
 		return regmap_update_bits(chip->regmap, dirreg, bit, 0);
=20
 	return regmap_update_bits(chip->regmap, dirreg, bit, bit);
 }
=20
+static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned o=
ff)
+{
+	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
+
+	guard(mutex)(&chip->i2c_lock);
+
+	return _pca953x_gpio_direction_input(gc, off);
+}
+
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
@@ -856,9 +863,10 @@ static void pca953x_irq_bus_sync_unlock(struct irq_d=
ata *d)
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
=20
+	guard(mutex)(&chip->i2c_lock);
+
 	if (chip->driver_data & PCA_PCAL) {
 		DECLARE_BITMAP(latched_inputs, MAX_LINE);
-		guard(mutex)(&chip->i2c_lock);
=20
 		/* Enable latch on edge-triggered interrupt-enabled inputs */
 		bitmap_or(latched_inputs, chip->irq_trig_fall, chip->irq_trig_raise, g=
c->ngpio);
@@ -880,7 +888,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_da=
ta *d)
=20
 	/* Look for any newly setup interrupt */
 	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
-		pca953x_gpio_direction_input(&chip->gpio_chip, level);
+		_pca953x_gpio_direction_input(&chip->gpio_chip, level);
=20
 	mutex_unlock(&chip->irq_lock);
 }
--=20
2.54.0


