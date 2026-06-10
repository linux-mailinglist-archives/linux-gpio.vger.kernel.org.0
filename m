Return-Path: <linux-gpio+bounces-38271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id osXuIWiXKWoLaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:57:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CA766BBD2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:57:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b=rPBrzQAh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38271-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38271-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F736309C544
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEDE352003;
	Wed, 10 Jun 2026 15:34:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AFA3E9C1F;
	Wed, 10 Jun 2026 15:34:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105679; cv=none; b=arSkigSz/vz53S+a1tm8+mn7qegNwH/A7GLJjQTtOM6MnMkLpX0rVKJRs2hYYjskgknNi2B/xJe7DKtumgvzX3Vkj9yfFwQ/tiemAY7As368A1K8arPq1EiXz/Fj+9N/o5p/uvE7AbhMb+8PDoUXGGl+NPsiEPrlCCutGgZTIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105679; c=relaxed/simple;
	bh=YsdvJcGUHS+XdA/J7Hb8nCGweWTaO6RIQHL07ueXIJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr942kjWM6RNH8ZL/ZPWCAzpxMEzquB2Ev65K/zPS5yLhkWlC/aGOI7ug+FwMctQt6R1bEHR6nTC5xbFqKtty06Cf+4ODgozx/VCavkEZhxLGvQ58r3GUg30bnlDkyvKvKMoVUEB+TaqJyBI+Zqc7Bw4O6Mpp0/5G4pf6r5tju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=rPBrzQAh reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FA14176A4E;
	Wed, 10 Jun 2026 18:34:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1781105675; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LaXsQyCAP4gFiFFUxqAjDQuXyDetzIk5A6HbOjXl79U=;
	b=rPBrzQAhI7sIJSm/VbEUy8m4NQdwlKi4aq7hGmcYTc1ZAoY7gJyQT7dZ8X4HjbB5HBh0Zb
	RzFsB3X/fTHt7McYqV3r9dHKeR562E2AUpCREJSNrL+vzsD2w249st0gRiMk2hQVb1p9ul
	Gk9CouqxPtNGjennSKUy8l5K2OFVbNXjO8ZtXZg7E8fMz+vds8so53bE+Sg+X02QmsZz+2
	YXU5MRCavCERdNRU2FGPFs3dHiZmnFyWy1GufZb9msYl583o1UI63K6txkNP09eYsGo+aZ
	PY0ZC6hi3CqJMaytDOYTqJibqOfnHwKa5aXRXoE3fMaVNIdyJAFfSQbFNZlQIA==
From: Viacheslav Bocharov <v@baodeep.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: meson: restore non-sleeping GPIO access
Date: Wed, 10 Jun 2026 18:32:11 +0300
Message-ID: <20260610153329.937833-3-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
References: <20260610153329.937833-1-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38271-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[baodeep.com:-];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baodeep.com:email,baodeep.com:mid,baodeep.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6CA766BBD2

Commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
sleeping") set gpio_chip.can_sleep = true to work around
gpio-shared-proxy holding a spinlock across a sleeping pinctrl config
path. That locking bug is now fixed in the shared-proxy itself ("gpio:
shared-proxy: always serialize with a sleeping mutex"), so the
controller-wide workaround is no longer needed; the meson GPIO
controller does not sleep.

meson_gpio_get/set/direction_* access MMIO through regmap. The
regmap_mmio bus uses fast I/O (spinlock) locking, so these value
callbacks do not contain sleeping operations. Since gpio_chip.can_sleep
describes the get/set value path, restore can_sleep = false.

Marking the controller sleeping also broke atomic value consumers such
as w1-gpio (1-Wire bitbang): w1_io.c runs its read time slot under
local_irq_save() and uses the non-cansleep gpiod_set_value() /
gpiod_get_value(), which with can_sleep=true trigger WARN_ON(can_sleep)
in gpiolib on every transferred bit (from w1_gpio_write_bit() /
w1_gpio_read_bit() via w1_reset_bus() and w1_search()). The printk and
stack dump inside the IRQs-off, microsecond-scale time slot destroy the
bit timing, so reset/presence detection and ROM search fail: the bus
master registers but w1_master_slave_count stays at 0 and no devices
are found. Verified on an Amlogic A113X board (DS18B20 on GPIOA_14):
with can_sleep restored to false the warnings are gone and the sensor
is detected and read again.

This must not be applied or backported without the shared-proxy locking
fix above; otherwise the original Khadas VIM3 splat returns on boards
that genuinely share a meson GPIO.

Fixes: 28f240683871 ("pinctrl: meson: mark the GPIO controller as sleeping")
Link: https://lore.kernel.org/all/20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com/
Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---


 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 4507dc8b5563..18295b15ecd9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -619,7 +619,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.set = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
-	pc->chip.can_sleep = true;
+	pc->chip.can_sleep = false;
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
-- 
2.54.0


