Return-Path: <linux-gpio+bounces-35596-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IGcIRR172mZBgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35596-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:39:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD94748A2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5D5B3064A97
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955E92EBBB9;
	Mon, 27 Apr 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB/29f12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836B25A2A2;
	Mon, 27 Apr 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300482; cv=none; b=Xrh39+l2OY33SMThtkm2mLAkVXfxh5d7qKrbqTR2oHyv8PFMZ5O8ggaARzdl42oEfmU98SywSf6mpOqRqCRkFofB5lX6icqtv34hzn7i/MYNPdiNi1OFqFet/UHNEGNNjzlvdJIWkTeqvN2xbMtXnGeK04fIhdiNLppsFYB6dew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300482; c=relaxed/simple;
	bh=mTUH+5o1bCZlGv0N2SmW4VVGqADrGr5LqXlgXCKhQnw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HILAEF80G8+ZjS3145dHdWMFUBpuOUpr0xQFXFdVSd4ljlZZcrje7p7zIpt9s7O4DGTAxI82Ay60+JHvE61MF2M1SWQX7GRZzYPTgTCGM22ZI/mLsryRhEFbmQOA5VHkw0jLF3I2D+KXwnuu/G/t3hRMuA8G4pB2UfvVMSAmtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB/29f12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4AFC19425;
	Mon, 27 Apr 2026 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300482;
	bh=mTUH+5o1bCZlGv0N2SmW4VVGqADrGr5LqXlgXCKhQnw=;
	h=From:To:Cc:Subject:Date:From;
	b=hB/29f12hACMom2d+lmOodTokY/eVGgg90TOy0kA7jV3TlFc+D6t07nW2cCpEbNFR
	 CLzsmwo3J8tcDFIoTX3EubxEyyYEQWhq3QKyyFI+6ml0w2pinNUuaV8Crs48h/Znq+
	 Qor38J/7YFbEuzUN85I1CKsN46pvgQbu+iHvQMYM20FoBiTd/4iirAgmovmcedx4LD
	 qMmCqHPzZTysrQbyA5qq2c/DqKqhHMvGry/skI5OQecxjIzwk+YwypqLd7p5r5VQkq
	 ZZhllAv2RJvhn8wBS44yQJIIS1kLaPAlFMZALAW9t/3qisUMHkAUWqrLKHYo+DOPv3
	 uzNKmvC7Whe2g==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] mfd: wm8994: remove dead legacy-gpio code
Date: Mon, 27 Apr 2026 16:34:27 +0200
Message-Id: <20260427143437.3059210-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0CFD94748A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35596-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Arnd Bergmann <arnd@arndb.de>

The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
("mfd: wm8994: Emulate level triggered interrupts if required") in
linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
in the wm8994_pdata structure, so this was always dead code.

Remove it now to reduce the dependency on the legacy gpio interfaces.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/wm8994-irq.c         | 94 ++------------------------------
 include/linux/mfd/wm8994/pdata.h |  5 --
 2 files changed, 4 insertions(+), 95 deletions(-)

diff --git a/drivers/mfd/wm8994-irq.c b/drivers/mfd/wm8994-irq.c
index 1475b1ac6983..a46cea948763 100644
--- a/drivers/mfd/wm8994-irq.c
+++ b/drivers/mfd/wm8994-irq.c
@@ -135,53 +135,9 @@ static const struct regmap_irq_chip wm8994_irq_chip = {
 	.runtime_pm = true,
 };
 
-static void wm8994_edge_irq_enable(struct irq_data *data)
-{
-}
-
-static void wm8994_edge_irq_disable(struct irq_data *data)
-{
-}
-
-static struct irq_chip wm8994_edge_irq_chip = {
-	.name			= "wm8994_edge",
-	.irq_disable		= wm8994_edge_irq_disable,
-	.irq_enable		= wm8994_edge_irq_enable,
-};
-
-static irqreturn_t wm8994_edge_irq(int irq, void *data)
-{
-	struct wm8994 *wm8994 = data;
-
-	while (gpio_get_value_cansleep(wm8994->pdata.irq_gpio))
-		handle_nested_irq(irq_find_mapping(wm8994->edge_irq, 0));
-
-	return IRQ_HANDLED;
-}
-
-static int wm8994_edge_irq_map(struct irq_domain *h, unsigned int virq,
-			       irq_hw_number_t hw)
-{
-	struct wm8994 *wm8994 = h->host_data;
-
-	irq_set_chip_data(virq, wm8994);
-	irq_set_chip_and_handler(virq, &wm8994_edge_irq_chip, handle_edge_irq);
-	irq_set_nested_thread(virq, 1);
-	irq_set_noprobe(virq);
-
-	return 0;
-}
-
-static const struct irq_domain_ops wm8994_edge_irq_ops = {
-	.map	= wm8994_edge_irq_map,
-	.xlate	= irq_domain_xlate_twocell,
-};
-
 int wm8994_irq_init(struct wm8994 *wm8994)
 {
 	int ret;
-	unsigned long irqflags;
-	struct wm8994_pdata *pdata = &wm8994->pdata;
 
 	if (!wm8994->irq) {
 		dev_warn(wm8994->dev,
@@ -190,53 +146,11 @@ int wm8994_irq_init(struct wm8994 *wm8994)
 		return 0;
 	}
 
-	/* select user or default irq flags */
-	irqflags = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
-	if (pdata->irq_flags)
-		irqflags = pdata->irq_flags;
-
 	/* use a GPIO for edge triggered controllers */
-	if (irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
-		if (gpio_to_irq(pdata->irq_gpio) != wm8994->irq) {
-			dev_warn(wm8994->dev, "IRQ %d is not GPIO %d (%d)\n",
-				 wm8994->irq, pdata->irq_gpio,
-				 gpio_to_irq(pdata->irq_gpio));
-			wm8994->irq = gpio_to_irq(pdata->irq_gpio);
-		}
-
-		ret = devm_gpio_request_one(wm8994->dev, pdata->irq_gpio,
-					    GPIOF_IN, "WM8994 IRQ");
-
-		if (ret != 0) {
-			dev_err(wm8994->dev, "Failed to get IRQ GPIO: %d\n",
-				ret);
-			return ret;
-		}
-
-		wm8994->edge_irq = irq_domain_create_linear(NULL, 1, &wm8994_edge_irq_ops, wm8994);
-
-		ret = regmap_add_irq_chip(wm8994->regmap,
-					  irq_create_mapping(wm8994->edge_irq,
-							     0),
-					  IRQF_ONESHOT,
-					  wm8994->irq_base, &wm8994_irq_chip,
-					  &wm8994->irq_data);
-		if (ret != 0) {
-			dev_err(wm8994->dev, "Failed to get IRQ: %d\n",
-				ret);
-			return ret;
-		}
-
-		ret = request_threaded_irq(wm8994->irq,
-					   NULL, wm8994_edge_irq,
-					   irqflags,
-					   "WM8994 edge", wm8994);
-	} else {
-		ret = regmap_add_irq_chip(wm8994->regmap, wm8994->irq,
-					  irqflags,
-					  wm8994->irq_base, &wm8994_irq_chip,
-					  &wm8994->irq_data);
-	}
+	ret = regmap_add_irq_chip(wm8994->regmap, wm8994->irq,
+				  IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+				  wm8994->irq_base, &wm8994_irq_chip,
+				  &wm8994->irq_data);
 
 	if (ret != 0) {
 		dev_err(wm8994->dev, "Failed to register IRQ chip: %d\n", ret);
diff --git a/include/linux/mfd/wm8994/pdata.h b/include/linux/mfd/wm8994/pdata.h
index 6e2962ef5b81..b95a56a338c3 100644
--- a/include/linux/mfd/wm8994/pdata.h
+++ b/include/linux/mfd/wm8994/pdata.h
@@ -226,11 +226,6 @@ struct wm8994_pdata {
 	 * lines is mastered.
 	 */
 	int max_channels_clocked[WM8994_NUM_AIF];
-
-	/**
-	 * GPIO for the IRQ pin if host only supports edge triggering
-	 */
-	int irq_gpio;
 };
 
 #endif
-- 
2.39.5


