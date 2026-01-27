Return-Path: <linux-gpio+bounces-31173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB9mIvgKeWnyugEAu9opvQ
	(envelope-from <linux-gpio+bounces-31173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:59:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74A99818
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 833CF305201D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 18:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA732B9A0;
	Tue, 27 Jan 2026 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="qeVrGCcg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07E328B71;
	Tue, 27 Jan 2026 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539986; cv=none; b=BbYG0TzPaEvY7PdX7CDfER+juZrf3VVhdKvDUBwi/CZFjruuRvJWpFq25xLVjMLprccx0m4b9D6qEkyM1BuBPzlxwLdJHGDLeypU+we9LFbLLktEKMg8f0kc3I58ajuVqn5YJnWqFHJ+S4Av9pzu2qM6Gn7lV33MhWFb54YU7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539986; c=relaxed/simple;
	bh=nUUA37xD4ZUC780N/LEa+/KCl37A7KAkBtVsxe6xQeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UnILICuVBVfBHZDJgbW7y7iLLNt1Bj7arhEEmB33oOHhYf4NYe1nS/rcK9NCqZMaSdFeuN00RCRp/EGPxMYDsCtEluoLxQDHZ9KzUKpF5NIbR3SKxKWm/9vfgHSoLaxKsRGeOVWtqq6Arb+Ws7xdQ//hdwoc4iFYalQOVi0HiXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=qeVrGCcg; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id CBEF3600025E;
	Tue, 27 Jan 2026 18:52:58 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 4w_SIb_PtS_a; Tue, 27 Jan 2026 18:52:56 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 3DC316000870;
	Tue, 27 Jan 2026 18:52:56 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1769539976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F+O0A8gzgvdYirAVTdcENc7lG8aqFZVcs1fick+I94g=;
	b=qeVrGCcg/JK1UhTD9sUPGLPmGP7gjkARQnPXBMeyGevxt7SutInW9fxUOILcaUOoTfz/ne
	S3Dt7VaiMdrqF/Ne8oe2ofOvCxEGblOdJfA89HO78iPmbbkUnCgSV2zeQMWWbxBUlSMltl
	8sb/B7CI34hJboGZihQirp4st0+qJwc4n8bs/Jdy7+00PsEhDI+thlOseIDnC/646j7+Az
	w18JwUIlh4jVsjby9CrjrrhQZr5XCoRJXiJ51HJLqEBISEpO/AY1fkT4ilgzn+qFq5WpjC
	I9oZpq707QG6e/n2F7WOK+fcMXof7nH28jcfQB9HDs7kJzKMhkTaP1fUpXPFHw==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 01D953600FB;
	Tue, 27 Jan 2026 18:52:56 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 27 Jan 2026 18:52:42 +0000
Subject: [PATCH] gpio: max77620: Implement .get_direction() callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-smaug-spi_flash-v1-1-5fd334415118@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNz3eLcxNJ03eKCzPi0nMTiDF2TFOOkFDPT5GRzkxQloK6CotS0zAq
 widGxtbUArS2No2EAAAA=
X-Change-ID: 20260127-smaug-spi_flash-4d3bd65cc74d
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539975; l=1793;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=nUUA37xD4ZUC780N/LEa+/KCl37A7KAkBtVsxe6xQeg=;
 b=5px8J/U9xGoN+AZ0rDoj2gDF0NJmKgsLKQOIe7+DtrxXjsr5/Gud5rpIFl8BbQsK7xjafz/N9
 JONdNxHw2ZHBMDsWjUuOfp22IHvwWtUR8IEAwmKb9v91CFuOM0sWAGr
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tecnico.ulisboa.pt,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tecnico.ulisboa.pt:s=mail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31173-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tecnico.ulisboa.pt:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ulisboa.pt:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diogo.ivo@tecnico.ulisboa.pt,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC74A99818
X-Rspamd-Action: no action

Add support for reporting the current GPIO line direction by implementing
the .get_direction() callback for the MAX77620 GPIO controller.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/gpio/gpio-max77620.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 02eca400b307..e6c85411c695 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -132,6 +132,24 @@ static const struct irq_chip max77620_gpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static int max77620_gpio_get_dir(struct gpio_chip *gc, unsigned int offset)
+{
+	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(mgpio->rmap, GPIO_REG_ADDR(offset), &val);
+	if (ret < 0) {
+		dev_err(mgpio->dev, "CNFG_GPIOx read failed: %d\n", ret);
+		return ret;
+	}
+
+	if (val & MAX77620_CNFG_GPIO_DIR_MASK)
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
 static int max77620_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
@@ -308,6 +326,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 
 	mgpio->gpio_chip.label = pdev->name;
 	mgpio->gpio_chip.parent = pdev->dev.parent;
+	mgpio->gpio_chip.get_direction = max77620_gpio_get_dir;
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;

---
base-commit: de1901b57167aa8fa28cfe99d4c9cb181bad47d3
change-id: 20260127-smaug-spi_flash-4d3bd65cc74d

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>


