Return-Path: <linux-gpio+bounces-37420-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPxCHA4nE2q78QYAu9opvQ
	(envelope-from <linux-gpio+bounces-37420-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 18:27:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C05315C3201
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 18:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F08D03002914
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 16:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139D43A875B;
	Sun, 24 May 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JXKFCZou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D53955E7;
	Sun, 24 May 2026 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640067; cv=none; b=suT/TzU+CFzeqtY8S24D4kUt7bhWA3nmSgviyAUsVV5NISeGgkrwQsGwJhev8/n7/M05BItfK+BFXWViFNpsBe5VCNvk28E/QmplJ53Ode+04r+XLYHYMO5oViPl+8mZjjNWyBhNQUivPd7XBbxscn9YkzRnjxJFgiMqsAPstuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640067; c=relaxed/simple;
	bh=YD8sJMoQhvgKRXmNw0oeZALWK1936E/rH9WI/1OWJWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwyRi2KKtmFhCja+GjZGp7yJVcpt2rXYmDFBqSCctkjgQxYuRKLITS5BJpcfjW6hMrS8EHjyp+vloG7fgagCN/fTqo5cQXxNZkRdCUJJu5ARoe9wbmEjMT6K9FbL842OrgR810nSDF77Kie0CXYwPk3tRyuFiHTNyMtn4fPPCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JXKFCZou; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 98653271BC;
	Sun, 24 May 2026 18:27:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4o4Fd2LDS06; Sun, 24 May 2026 18:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779640062; bh=YD8sJMoQhvgKRXmNw0oeZALWK1936E/rH9WI/1OWJWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JXKFCZouxh8sZKFxJHndsgPIOtRddh9jYhgnirWLEk0xtl25PukzZYEZwm0qKfQB5
	 v8HNw4/8wy3ijJkXJO6NH1JwiLMklImVPcFJTEO+IynWnSIereHH+j2lJlHLeepmJq
	 o+ejpTfUpKSqrmu3NJP7FKC9UcEHbBBQkh0YRuZ9jCbWgwzAOHV0XLz1ilb1OIUdjW
	 S8Wz16IrxlVOXxjlzT9JUEdKb5PYjm5ZsygfYGKldUCqCqfqwyX/5iLsu1Q5w5hldz
	 gE1esM9s4w85zE1QRY287me91v/YHHd717n2g+HhgBJo6hecnR8Nzi1TVTJivFEnKL
	 82Trt953Bii8w==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 1/2] gpio: core: fix const-correctness of gpio_chip_guard
Date: Sun, 24 May 2026 18:27:07 +0200
Message-ID: <20260524162708.62949-2-scardracs@disroot.org>
In-Reply-To: <20260524162708.62949-1-scardracs@disroot.org>
References: <20260524162708.62949-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	TAGGED_FROM(0.00)[bounces-37420-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C05315C3201
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DEFINE_CLASS macro for gpio_chip_guard currently expects a non-const
struct gpio_desc pointer. This prevents the guard from being used cleanly
in fast paths that receive a const descriptor, forcing developers to fall
back to open-coding the SRCU locks.

Update the macro to accept a const struct gpio_desc pointer. This is valid
because the actual targeted gpio_device pointer assignment does not drop
const qualifiers on the target structure.

Convert the open-coded SRCU locks in gpiod_get_raw_value_commit() and
gpiod_to_irq() to use the guard, removing their legacy FIXME comments.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib.c | 28 ++++++++--------------------
 drivers/gpio/gpiolib.h |  2 +-
 2 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 69743d6deeaf..6b0c6e8abf7b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3428,20 +3428,13 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
-	struct gpio_chip *gc;
 	int value;
 
-	/* FIXME Unable to use gpio_chip_guard due to const desc. */
-	gdev = desc->gdev;
-
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
 		return -ENODEV;
 
-	value = gpio_chip_get_value(gc, desc);
+	value = gpio_chip_get_value(guard.gc, desc);
 	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
@@ -4148,8 +4141,6 @@ EXPORT_SYMBOL_GPL(gpiod_is_shared);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
-	struct gpio_chip *gc;
 	int offset;
 	int ret;
 
@@ -4157,16 +4148,13 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (ret <= 0)
 		return -EINVAL;
 
-	gdev = desc->gdev;
-	/* FIXME Cannot use gpio_chip_guard due to const desc. */
-	guard(srcu)(&gdev->srcu);
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
 		return -ENODEV;
 
 	offset = gpiod_hwgpio(desc);
-	if (gc->to_irq) {
-		ret = gc->to_irq(gc, offset);
+	if (guard.gc->to_irq) {
+		ret = guard.gc->to_irq(guard.gc, offset);
 		if (ret)
 			return ret;
 
@@ -4174,7 +4162,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 		return -ENXIO;
 	}
 #ifdef CONFIG_GPIOLIB_IRQCHIP
-	if (gc->irq.chip) {
+	if (guard.gc->irq.chip) {
 		/*
 		 * Avoid race condition with other code, which tries to lookup
 		 * an IRQ before the irqchip has been properly registered,
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index dc4cb61a9318..650a702741df 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -244,7 +244,7 @@ DEFINE_CLASS(gpio_chip_guard,
 
 		_guard;
 	     }),
-	     struct gpio_desc *desc)
+	     const struct gpio_desc *desc)
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
 int gpiod_request_commit(struct gpio_desc *desc, const char *label);
-- 
2.54.0


