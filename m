Return-Path: <linux-gpio+bounces-36228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB4kKegW+mkqJQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:12:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A184D1034
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB13030A5C63
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 15:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2788048AE32;
	Tue,  5 May 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCqD9cRV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5833064D;
	Tue,  5 May 2026 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996760; cv=none; b=NzcdjH/ZNYLevezEyGNu5aXzQmdQyjqGhB6Vj/UOR7SxTZbz/Bm4fJLbiaMoEelLWmsRmkgS/7Y9GqfkxLNbFGUuZwlPLNlE1/usO4Q1gK3/8qcmV2S+mHp/WY5vTv5x0An6GmBvI/MnDITJwf+iADEf8fQj5314x+MRTN2B3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996760; c=relaxed/simple;
	bh=Rln2btHpLEkU3ktKxMapEczF6jjV96udsVudxc09Xyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tgOovTe/XwVsMqXpWAHMcnZT4XG+085N/9apFIsMk8Y0uoEtzoqR5Ia59MgQAwuyMFEDHY7Ql6jY2AnEAqWsO5hXDQlO9ThdrWe7INTpzLK6t/QvpATtLIbcSkummJry39YQeFW6DKqDOj21673qtsKiWr+4OpkKFvHGB+0BnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCqD9cRV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB67C2BCB4;
	Tue,  5 May 2026 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777996760;
	bh=Rln2btHpLEkU3ktKxMapEczF6jjV96udsVudxc09Xyc=;
	h=From:To:Cc:Subject:Date:From;
	b=UCqD9cRVWmOZPY4cJcnpMwLHPDkgArlz7A9cZ4a2/O4tT9B1lLoxgYzXUtEZlZgHg
	 dRy+QmHimlXdpct3eko0PEn4+fQqT501SO2CAiuFzhOCZJj8DEsaEpecV8YZSqymCd
	 8vD497GbUVAjGoZmReFAwr6mo7BZSAcCDhLoxRaN4xxbg/qUSaP8SyzP1Of+qSpsf5
	 FHauGZgic3KEQuheOwBacSNE/As4VI4N9OMCoQc4Cy+dSWlO/tg1YH3eMA1/mSs3E/
	 dzYuSJ/5sBMCUfGdIDpNkgVu2PH1qtO2mJ+b8DNaB1GPZ/zrdoNqLhjN25LXeaAON9
	 BsuP0UFiXGFYQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] [v3] leds: gpio: make legacy gpiolib interface optional
Date: Tue,  5 May 2026 17:58:48 +0200
Message-Id: <20260505155915.3698243-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 93A184D1034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36228-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,arndb.de:email]

From: Arnd Bergmann <arnd@arndb.de>

There are still a handful of ancient mips/armv5/sh boards that use the
gpio_led:gpio member to pass an old-style gpio number, but all modern
users have been converted to gpio descriptors.

While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
and related helpers is currently turned on in all kernel builds,
the plan is to only enable it on the few platforms that actually
pass gpio numbers in any platform_data.

Split out the legacy portion of the platform_data handling into a custom
helper function that is guarded with in #ifdef block, to allow the
the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
gets turned off. Once the last user is converted, this function can
be removed.

Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com/
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3: simplify gpio_led_get_gpiod
v2: rework a little bit to keep the legacy code path more separate,
    extend changelog description

Related to this, we may also want to remove support for passing
a gpio descriptor in the ->gpiod flag. The only user doing this
at the moment was introduced in commit 1892e87a3e91 ("powerpc/warp:
switch to using gpiod API").
---
 drivers/leds/leds-gpio.c | 54 ++++++++++++++++++++++++++--------------
 include/linux/leds.h     |  2 ++
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 961acc18d0ac..109e2316b775 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 					    const struct gpio_led *template)
 {
 	struct gpio_desc *gpiod;
-	int ret;
 
 	/*
 	 * This means the LED does not come from the device tree
@@ -221,18 +220,30 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	 * the GPIO from there.
 	 */
 	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod))
-		return gpiod;
-	if (gpiod) {
+	if (!IS_ERR(gpiod))
 		gpiod_set_consumer_name(gpiod, template->name);
-		return gpiod;
-	}
 
-	/*
-	 * This is the legacy code path for platform code that
-	 * still uses GPIO numbers. Ultimately we would like to get
-	 * rid of this block completely.
-	 */
+	return gpiod;
+}
+
+#ifdef CONFIG_GPIOLIB_LEGACY
+/*
+ * This is the legacy code path for platform code that still uses
+ * GPIO numbers, mainly MIPS and SuperH board files.
+ * Ultimately we would like to get rid of this block completely.
+ *
+ * ppc44x-warp sets the template->gpiod directly instead of
+ * adding a lookup table or device properties. This is not
+ * much better.
+ */
+static struct gpio_desc *gpio_led_get_legacy_gpiod(struct device *dev, int idx,
+						   const struct gpio_led *template)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	if (template->gpiod)
+		return template->gpiod;
 
 	/* skip leds that aren't available */
 	if (!gpio_is_valid(template->gpio))
@@ -252,6 +263,13 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 
 	return gpiod;
 }
+#else
+static struct gpio_desc *gpio_led_get_legacy_gpiod(struct device *dev, int idx,
+						   const struct gpio_led *template)
+{
+	return template->gpiod ?: ERR_PTR(-ENOENT);
+}
+#endif
 
 static int gpio_led_probe(struct platform_device *pdev)
 {
@@ -270,14 +288,14 @@ static int gpio_led_probe(struct platform_device *pdev)
 			const struct gpio_led *template = &pdata->leds[i];
 			struct gpio_led_data *led_dat = &priv->leds[i];
 
-			if (template->gpiod)
-				led_dat->gpiod = template->gpiod;
-			else
-				led_dat->gpiod =
-					gpio_led_get_gpiod(dev, i, template);
+			led_dat->gpiod = gpio_led_get_gpiod(dev, i, template);
+			if (!led_dat->gpiod)
+				led_dat->gpiod = gpio_led_get_legacy_gpiod(dev,
+								  i, template);
+
 			if (IS_ERR(led_dat->gpiod)) {
-				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
-					 template->gpio, template->name);
+				dev_info(dev, "Skipping unavailable LED gpio %s\n",
+					 template->name);
 				continue;
 			}
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..e646bffcd8e7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -676,8 +676,10 @@ typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 struct gpio_led {
 	const char *name;
 	const char *default_trigger;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	unsigned 	gpio;
 	unsigned	active_low : 1;
+#endif
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
 	unsigned	default_state : 2;
-- 
2.39.5


