Return-Path: <linux-gpio+bounces-31675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNP5EICmj2kVSQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:32:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECD139CB1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8D77303A13D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 22:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF58315D37;
	Fri, 13 Feb 2026 22:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiuyVlEu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFE23BD1B
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771021946; cv=none; b=bbJLFLU/NXi6m0Z5FQNGx4lQ8oLdcrHGoloFakfg/LEmllEQ6470PU5MpSAvkqiSP24lLvwzg1JaoSEp1so4FAQVOcpnMfcD/VCDKkimuqbxl7iyOzWsea3Goym6f2FbSMB6rMd1mbrPnej/WkJlGwe0d9XMXAl4QvYlFiXeb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771021946; c=relaxed/simple;
	bh=QigO5K717byThetaj38bgtz6YLQk9cOFBuv9dpMoPGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rq4Q4H0LBbEItRojQ7YHyQGyQ47sPIKMIxkTuOcdCF7GMqZmDm2//cH23E60d6KygE8GhBBQJfjNTmhb48JC9PwTxdL+Py34l3DT6+jBAHnLJHLMjknQkvVt9cCPxHvn0dznybEPa94sTV4QCKHHlh1BbjROdOKf/hPZ//T+nB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiuyVlEu; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-463a0e14b4dso313550b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 14:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771021943; x=1771626743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwOZ+fMN1u7ZAD04Sc+WiPH2zobZhFlc/QjDODp9/tM=;
        b=AiuyVlEuNZb3GiAPIk9VqQG+7eReq3GRfpgpb0R71hs+3W/keIgxp6ulrtM8ccvoHq
         FRMf/kG6b2UhV4ER4tCrTfLdwNT3RH6rQGtyFRoGepztXwKksybNcPvOui6lx0eCACaQ
         2+SUm7wG27a/1Q+E63RX/5YPENPYZ4fETM09nd/dc3KbpfDGLgJoQ2qTx57UpvuMVOGW
         u3vmb5ud/gr/G9/vm5KSIC0f6qZI39cFz8bLpZEIH6wrYU5N95xsJ8TLcgVKgxLXaSop
         L0dNJJBnA1Ivbc2Cub3a1CQWO1q9Eg3DXT1CcmAGnbItzWQvmKsOHDyKWWoXEhuTO6Hb
         Aj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771021943; x=1771626743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwOZ+fMN1u7ZAD04Sc+WiPH2zobZhFlc/QjDODp9/tM=;
        b=TA1MXQVxb2+vMfD8+gf+uarkE+fNHeyJ0zYOQl0+b6eMeuZ8Io30+9Ban7i0PUQfC5
         7fGaqiiuzgaqW2z0EHFTs5hmjFlFC55AahD0xnLOHrLXQodmbcDpvh7UybV+W34PfLIX
         2UmRFw3aD1wpp48gTgza8VcvreNihH056MOldPdSd20ZbwVj7nLz7Mos/MAzq7Db2OLh
         EulJ2f5jqNbnDnd2zM3Jwfm1FBKFQVRYekdmFOB8Vs3u/apCQmKbL2HPc1akBCyHU4Cl
         gslPOCLh4fNqeuFn9ixrVOLGE4LHKh6hIHGpoME8yyKAYL1fBdY/t5XC6qFULe0VV6OO
         Fpvg==
X-Gm-Message-State: AOJu0YysXgIGsT+LAdhBt+8D1b0afdxwq+IXQGoctd+QyHSq+kvgBfxq
	YStNNBK3UAI3itL6Tk+ziqYLCvKUW6cuCy0aB2q9EHEA0tAgbt7Iaoo/CBLkIg==
X-Gm-Gg: AZuq6aIh1c+XgZa/88vV4YEs5bZXUBj+HjwEayyLMkc6Li6UFVfxUvb20cNxIqabSNQ
	UrLjohR3BKtmGbmk5o+IQB5WmAZQ7yNgmRPFlMclTpKSFdG6s3QeRGGYU504Iw4OR2nPJN1mEgD
	cY2zd2lyyg6wmlpbxqWqTkeQIeyUaJhoo3hlU7xMnIYE0f6PafrxbeRVZaCot9SHp7QQQFJEcES
	oSWVl4Dv++iV1+JJNYTKTCrUuy70LlWsSzbWQLJ2dz1dUKwOGcvJjSUsbAC1i596r6MrTNdn2w7
	yywyoRfMIc6McIKeAnF47lmrHpLQtq4P3ECJJrOVIynhEBY3XF+p1ajevKE27Q/NylOc34Cg1YV
	VIEfbUMe9NMHNrsKKt0GG5FKYynbC2p1KsI+sTVABbRvcaXEdiMYp/VtDzimvHvMEwjTomkOkSL
	lrtyESOdJZlEofTIM17TyYRsc+Fi0XYm/hWMkwfJO3VMJssmyMoDV/L8xgTkT1S4wzmxORtxs/O
	/hSHR//zVUf6bqs7VgbN3VdzeNMyPu8WPQlcNDtSpZsWqoJ1kMndZUtjrhU3v0=
X-Received: by 2002:a05:6808:4fcd:b0:463:8a49:ca7a with SMTP id 5614622812f47-4639f245eedmr1381171b6e.52.1771021943296;
        Fri, 13 Feb 2026 14:32:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636b0c8606sm5446923b6e.18.2026.02.13.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 14:32:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpiolib: of: add gpio-line node support
Date: Fri, 13 Feb 2026 15:32:01 -0700
Message-ID: <20260213223204.2415507-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31675-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BECD139CB1
X-Rspamd-Action: no action

Allow GPIO controller child nodes marked with "gpio-line" to
configure direction/flags at probe time without hogging the line.

Teach OF gpiochip scanning and OF dynamic reconfiguration handlers to
process gpio-line nodes in addition to gpio-hog nodes.

Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
nodes, keep "line-name" semantics as the hog consumer label.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/gpio/gpiolib-of.c     | 89 ++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib-shared.c |  7 +--
 drivers/of/property.c         |  7 +--
 scripts/dtc/checks.c          |  4 +-
 4 files changed, 82 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b7..b10a21a63d46 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -744,6 +744,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np, const char *con_id,
  * @lflags:	bitmask of gpio_lookup_flags GPIO_* values - returned from
  *		of_find_gpio() or of_parse_own_gpio()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
+ * @hog:	indicates if this is a gpio-hog node
  *
  * Returns:
  * GPIO descriptor to use with Linux GPIO API, or one of the errno
@@ -753,11 +754,13 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 					   struct gpio_chip *chip,
 					   unsigned int idx, const char **name,
 					   unsigned long *lflags,
-					   enum gpiod_flags *dflags)
+					   enum gpiod_flags *dflags,
+					   bool hog)
 {
 	struct device_node *chip_np;
 	enum of_gpio_flags xlate_flags;
 	struct of_phandle_args gpiospec;
+	const char *desc_name;
 	struct gpio_desc *desc;
 	unsigned int i;
 	u32 tmp;
@@ -797,15 +800,19 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 		*dflags |= GPIOD_OUT_LOW;
 	else if (of_property_read_bool(np, "output-high"))
 		*dflags |= GPIOD_OUT_HIGH;
-	else {
+	else if (hog) {
 		pr_warn("GPIO line %d (%pOFn): no hogging state specified, bailing out\n",
 			desc_to_gpio(desc), np);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (name && of_property_read_string(np, "line-name", name))
+	if (hog && name && of_property_read_string(np, "line-name", name))
 		*name = np->name;
 
+	if (!of_property_read_string(np, "gpio-line-name", &desc_name) &&
+	    desc_name[0])
+		desc->name = desc_name;
+
 	return desc;
 }
 
@@ -827,7 +834,8 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
 	int ret;
 
 	for (i = 0;; i++) {
-		desc = of_parse_own_gpio(hog, chip, i, &name, &lflags, &dflags);
+		desc = of_parse_own_gpio(hog, chip, i, &name, &lflags, &dflags,
+					 true);
 		if (IS_ERR(desc))
 			break;
 
@@ -843,6 +851,36 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
 	return 0;
 }
 
+/**
+ * of_gpiochip_add_line - Configure all lines in a gpio-line device node
+ * @chip:	gpio chip to act on
+ * @line:	device node describing GPIO lines to configure
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+static int of_gpiochip_add_line(struct gpio_chip *chip, struct device_node *line)
+{
+	enum gpiod_flags dflags;
+	struct gpio_desc *desc;
+	unsigned long lflags;
+	unsigned int i;
+	int ret;
+
+	for (i = 0;; i++) {
+		desc = of_parse_own_gpio(line, chip, i, NULL, &lflags, &dflags,
+					 false);
+		if (IS_ERR(desc))
+			break;
+
+		ret = gpiod_configure_flags(desc, NULL, lflags, dflags);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * of_gpiochip_scan_gpios - Scan gpio-controller for gpio definitions
  * @chip:	gpio chip to act on
@@ -858,14 +896,22 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	int ret;
 
 	for_each_available_child_of_node_scoped(dev_of_node(&chip->gpiodev->dev), np) {
-		if (!of_property_read_bool(np, "gpio-hog"))
+		if (of_property_read_bool(np, "gpio-hog")) {
+			ret = of_gpiochip_add_hog(chip, np);
+			if (ret < 0)
+				return ret;
+
+			of_node_set_flag(np, OF_POPULATED);
 			continue;
+		}
 
-		ret = of_gpiochip_add_hog(chip, np);
-		if (ret < 0)
-			return ret;
+		if (of_property_read_bool(np, "gpio-line")) {
+			ret = of_gpiochip_add_line(chip, np);
+			if (ret < 0)
+				return ret;
 
-		of_node_set_flag(np, OF_POPULATED);
+			of_node_set_flag(np, OF_POPULATED);
+		}
 	}
 
 	return 0;
@@ -905,14 +951,15 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 	int ret;
 
 	/*
-	 * This only supports adding and removing complete gpio-hog nodes.
-	 * Modifying an existing gpio-hog node is not supported (except for
-	 * changing its "status" property, which is treated the same as
-	 * addition/removal).
+	 * This only supports adding and removing complete gpio-hog and
+	 * gpio-line nodes. Modifying an existing node is not supported
+	 * (except for changing its "status" property, which is treated
+	 * the same as addition/removal).
 	 */
 	switch (of_reconfig_get_state_change(action, arg)) {
 	case OF_RECONFIG_CHANGE_ADD:
-		if (!of_property_read_bool(rd->dn, "gpio-hog"))
+		if (!of_property_read_bool(rd->dn, "gpio-hog") &&
+		    !of_property_read_bool(rd->dn, "gpio-line"))
 			return NOTIFY_DONE;	/* not for us */
 
 		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
@@ -922,9 +969,12 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 		if (!gdev)
 			return NOTIFY_DONE;	/* not for us */
 
-		ret = of_gpiochip_add_hog(gpio_device_get_chip(gdev), rd->dn);
+		if (of_property_read_bool(rd->dn, "gpio-hog"))
+			ret = of_gpiochip_add_hog(gpio_device_get_chip(gdev), rd->dn);
+		else
+			ret = of_gpiochip_add_line(gpio_device_get_chip(gdev), rd->dn);
 		if (ret < 0) {
-			pr_err("%s: failed to add hogs for %pOF\n", __func__,
+			pr_err("%s: failed to configure lines for %pOF\n", __func__,
 			       rd->dn);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(ret);
@@ -932,6 +982,10 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 		return NOTIFY_OK;
 
 	case OF_RECONFIG_CHANGE_REMOVE:
+		if (!of_property_read_bool(rd->dn, "gpio-hog") &&
+		    !of_property_read_bool(rd->dn, "gpio-line"))
+			return NOTIFY_DONE;	/* not for us */
+
 		if (!of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_DONE;	/* already depopulated */
 
@@ -939,7 +993,8 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 		if (!gdev)
 			return NOTIFY_DONE;	/* not for us */
 
-		of_gpiochip_remove_hog(gpio_device_get_chip(gdev), rd->dn);
+		if (of_property_read_bool(rd->dn, "gpio-hog"))
+			of_gpiochip_remove_hog(gpio_device_get_chip(gdev), rd->dn);
 		of_node_clear_flag(rd->dn, OF_POPULATED);
 		return NOTIFY_OK;
 	}
diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index b3525d1f06a4..b934e58a07f0 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -147,10 +147,11 @@ static bool gpio_shared_of_node_ignore(struct device_node *node)
 		return true;
 
 	/*
-	 * GPIO hogs have a "gpios" property which is not a phandle and can't
-	 * possibly refer to a shared GPIO.
+	 * GPIO hog and gpio-line nodes have a "gpios" property which is not a
+	 * phandle and can't possibly refer to a shared GPIO.
 	 */
-	if (of_property_present(node, "gpio-hog"))
+	if (of_property_present(node, "gpio-hog") ||
+	    of_property_present(node, "gpio-line"))
 		return true;
 
 	return false;
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 50d95d512bf5..7689c4315115 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1435,10 +1435,11 @@ static struct device_node *parse_gpio_compat(struct device_node *np,
 		return NULL;
 
 	/*
-	 * Ignore node with gpio-hog property since its gpios are all provided
-	 * by its parent.
+	 * Ignore nodes with gpio-hog and gpio-line properties since their gpios
+	 * are all provided by their parent.
 	 */
-	if (of_property_read_bool(np, "gpio-hog"))
+	if (of_property_read_bool(np, "gpio-hog") ||
+	    of_property_read_bool(np, "gpio-line"))
 		return NULL;
 
 	if (of_parse_phandle_with_args(np, prop_name, "#gpio-cells", index,
diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 45d0213f3bf3..ee64cb4ada4f 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1533,8 +1533,8 @@ static void check_gpios_property(struct check *c,
 {
 	struct property *prop;
 
-	/* Skip GPIO hog nodes which have 'gpios' property */
-	if (get_property(node, "gpio-hog"))
+	/* Skip gpio-hog and gpio-line nodes which have 'gpios' property */
+	if (get_property(node, "gpio-hog") || get_property(node, "gpio-line"))
 		return;
 
 	for_each_property(node, prop) {
-- 
2.43.0


