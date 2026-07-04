Return-Path: <linux-gpio+bounces-39444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /uERCTXHSGoItwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 10:41:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8644B70720F
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 10:41:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kemnade.info header.s=20220719 header.b=ERr1QZNC;
	dmarc=pass (policy=none) header.from=kemnade.info;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39444-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39444-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA38E3007886
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 08:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6029A3A0E8B;
	Sat,  4 Jul 2026 08:41:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A439E18E;
	Sat,  4 Jul 2026 08:41:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783154479; cv=none; b=YgeUCnmOXQ8o59aRp3I12tPgQ1vjgEJeVN0/rDoE0DeZb+6cPzRmYANaAAansqfZ8AaM7QX33R3jKK4EsNyeJwiQEx+HFhZHNPPkEdTZd0AG31vvArF7Sv/L2hy9FviiVzV4NmAoJLZVbUF0nQo+95aEyXq1URceLxJ8damQvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783154479; c=relaxed/simple;
	bh=LoAQGQx1nOKBdu36DWA9epVCvUN1aDJ6wWrFVe89Z40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y8V1+sNoFWgOWox3Q7EdetCvA1xvxM7HkT39khQd1elYPToG5f53/4LeWZ0EtDAOXqH7/55/M0dnz9ENtVLshF1Kj83Eozmszd8f7M9+y1E3vUGG78XdIHWul+VV9rxYjhKmOW4u4fh5kUK+k/sW/UXCL6Qqsdo/c3vc0A+IaFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ERr1QZNC; arc=none smtp.client-ip=178.238.236.174
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V41pSvo0YeLVFGkk+99Snc9WzkqH5EUfSjSfk1PM8ck=; t=1783154478; x=1784364078; 
	b=ERr1QZNCPDBl5LLEBOlvqhjyXXW8WxBPchGoGsp3n1vX13IARP4fXGfYGwelpxlu8v6xwefCnHg
	akaUcJKQ7KD8WYOCFpLjVcZ39WnIhDKuZuyWRD+/P9CBrQpV3xCmwRPaXd5eRMSglgBBdjxXbFfLp
	ZCrf0Kgn4lcM6oowKChg8zeQDx8bhifXwqRf4nAxyh+pTaaUj7dYiAnFr3jCC4RyuG5QVF/PLI4iP
	Y9u50SvSHCVTubzmNY2ayLmVgiS/cPCvFdKIYTzfHJLIM1WFLZmTDNBUobeN0yv6zkHrhN6eLfkFw
	g13ryenJ5UK/tG+QW7NokoHp4AtIDdTFKQkw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Sat, 04 Jul 2026 10:40:54 +0200
Subject: [PATCH v2] gpios: palmas: add get_direction op
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-palmas-getdirection-v2-1-2fd85fee3832@kemnade.info>
X-B4-Tracking: v=1; b=H4sIABXHSGoC/32Nyw6CMBBFf4XM2popL4Mr/sOwKO0Ao9KSFomG8
 O8W3Ls8ybnnrhDIMwW4Jit4WjiwsxHSUwJ6ULYnwSYypJiWeMFMTOo5qiB6mg170nP0RSVzMqb
 LsEWEuJw8dfw+qrfmx+HV3qO9p3Zj4DA7/zluF7l7/x8WKaTAvNSyKKpS6rx+0GiVoTPbzkGzb
 dsX7/DPIcsAAAA=
X-Change-ID: 20260703-palmas-getdirection-914eddf30b00
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, stable@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Samuel Ortiz <sameo@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=LoAQGQx1nOKBdu36DWA9epVCvUN1aDJ6wWrFVe89Z40=;
 b=kA0DAAoWF+d09HUlhtwByyZiAGpIxx2jaSNojyj7duhY4ModwW4gye8ZO8dOH9gSIPtXs/34z
 Ih1BAAWCgAdFiEE+jsgRvIk5m1TlVg/F+d09HUlhtwFAmpIxx0ACgkQF+d09HUlhty5jQD9E73p
 siyiPfdBmRrKwm8EBlfk1dJCb1S0qyPb3r3CxGoBAPz4mi33F44uyKmTZ92oGbGRSB0Fj8R3Ujt
 uKYG99/UP
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39444-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andreas@kemnade.info,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:stable@vger.kernel.org,m:andreas@kemnade.info,m:ldewangan@nvidia.com,m:sameo@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,vger.kernel.org:from_smtp,intel.com:email,kemnade.info:from_mime,kemnade.info:email,kemnade.info:mid,kemnade.info:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8644B70720F

Accessing debug/gpio is quite noisy without a get_direction()
implementation.  To calm that down add an implementation.

Fixes: 3d50a2785271 ("gpio: palmas: Add support for Palmas GPIO")
Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- add a proper fixes tag
- Link to v1: https://patch.msgid.link/20260703-palmas-getdirection-v1-1-046c155961c4@kemnade.info

To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Laxman Dewangan <ldewangan@nvidia.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-palmas.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e377f6dd4ccf..e64ee0487718 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -116,6 +116,24 @@ static int palmas_gpio_input(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
+static int palmas_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
+	struct palmas *palmas = pg->palmas;
+	unsigned int val;
+	unsigned int reg;
+	int ret;
+	int gpio16 = (offset/8);
+
+	offset %= 8;
+	reg = (gpio16) ? PALMAS_GPIO_DATA_DIR2 : PALMAS_GPIO_DATA_DIR;
+	ret = palmas_read(palmas, PALMAS_GPIO_BASE, reg, &val);
+	if (ret)
+		return ret;
+
+	return (val & BIT(offset)) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int palmas_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
@@ -165,6 +183,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.can_sleep = true;
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
+	palmas_gpio->gpio_chip.get_direction = palmas_gpio_get_direction;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
 	palmas_gpio->gpio_chip.set	= palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260703-palmas-getdirection-914eddf30b00

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


