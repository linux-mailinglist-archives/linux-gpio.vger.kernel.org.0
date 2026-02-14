Return-Path: <linux-gpio+bounces-31690-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPZAOp/qkGkpdwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31690-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 22:35:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B613DA5D
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 22:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAA3A3009B37
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 21:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6F9311C37;
	Sat, 14 Feb 2026 21:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt7Sqne3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AED311956
	for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771104768; cv=none; b=UkRRGc7mfE7tWz51nFTqSiYpyn6vowM6Xf23mTH05G8+dM2GtUDO7UJFk+Bx/sHK3sMZ8lbp4VXKMSji2q+ay7C3O9uSOXbIe+sM8KIdX6LZhYk2iwW4//cVO+S6bNSmMLNHUSJSlXE+4D8c68KIgFgcVtjBfi7h/ILAanJJKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771104768; c=relaxed/simple;
	bh=mHYCYIynKnTU9C6JHA+3biClChxi9HQvWugV7yDWqRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3tj6ghDZdyNtdEgakaWTM6DalsA+pU6nyQQ/ed7CC4EGQ7XwVxaUXVpw3nte+TTrjUxRA05T98kERHghwrH5L+3K+tz/zGIarD4FQFnfBFbBdl0t88CWwn9gbnX1vCOQ9zraBXvKK0Pir8y/aJtSyoiDkEZC1L1UYYv3ANsQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt7Sqne3; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-463960df4a8so1250098b6e.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771104765; x=1771709565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4c/Ah4XWvxrSV/SoFkvHi4YIXjIbfcCsisFz1apAmI=;
        b=Dt7Sqne3mt7LHEjiLpAizzud9qGkhu8FZRVJea5bQZE6KU65aDVOVu5pIy0T/MmelM
         cUDS35QVqsArihgdI+gxfpWrbyNBoifSVbOwXIBGN+25V/YYL2yxnL8Ys/Jqp6MmVxQw
         0J3MaAgLBz3D75kNd3N74H6Lk3JlnJ593rTlzyVtpTezc4M9654BOi6H/NQyYc+W81cH
         MonKO3bPrrAox2WYx6nAswS4/Fh3Rm2OG3PjfKbMihRtGj+2cYeQDApfIIJtD0XiIpVd
         8GKhJTEKUp2jN1rNA73zewdA/VxpthSPr/GsGauI4JdJAQd40i5/+msLhxwooSjxSz+n
         f4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771104765; x=1771709565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4c/Ah4XWvxrSV/SoFkvHi4YIXjIbfcCsisFz1apAmI=;
        b=UNfTZseVntgYgOjBTR+1bCtF++a0nmu8WVHyrzAUc6jFGsqs+4D9u5OP+M4vefv65I
         VGmn8sOUhD/oqYv24M/15n/cTMgEXAIDZj2NPaOYTMmIR3rCtUqRWJ8SytuF0Ryt3phW
         H9c2Is5A40yTlpAhCRm7Qa2SPguR9CbXYk+fr1Y5BgJlCCZxEckbpDDDr3YOa0z+Thbs
         aVftX4+pyTnDBFQhPmbTuTfnKl2qViPh7/jnHwNIByfmyltqrSEv3DI+DRD8pTW7Fu/j
         q8vqEOSlpwvhZ+iRZBFhUPn9zNORHVAlnoEXOWjAhi+qZk4+eFo1Mi5/JR6INiJML+8P
         kOOQ==
X-Gm-Message-State: AOJu0Yyt2RrftOCnQl/ttRnABtcLfAhn4k2JVI222syDt/qgGVHHUHhe
	a3ZcgyA+Cl0vLdO2mnhwJg4o/eOSHSJOhG/wvev8/jvfLrSIOKWLN+fJHgn20Q==
X-Gm-Gg: AZuq6aLN5R/LGbHUVkwEqQ2u51Ngk0O6FJclett3eSW9Gme/OeaMVMWd7IOsT8k8NB0
	BYDbemOY69v62foPDbypCZLN2zjfK5hFxIGHb8w3d8BPvdzli8+Qpnn9dAl/70vxueXbfxO5osi
	S6bvERmAyb5zo7Wkw9kIStq/4iqtTXlHo/7fZEXDAl0eOjtzMScf2O4SHtDIZFNDblf5XoMSSPb
	LCaCH08eYF7OMUidmpA4+EWo450lyRBjV9LDdl4yj10AaSxyTc5Z0ImzOZQD6JyZU1I54B7mRBv
	R8tdOy2hahx6t/+LN7eQ8qqiJgD0wWBrfrpp7N9T3IWFBo5aFidQwhTD0US7pl/P9cvxXFcrz2e
	YKwpDekUtK2EsgNlktThsVRYkjwud8Supql5i9EJJsLXFaTeyvN4kjXDCac3Okd1jVxJF97w8lp
	hDQWomiMeFZ12SEo1cjl3A7kNgK+vxTo5TD/BL3nhXNohwxyX8L9CwnzNZrDu4kK0VJ8BXHzz40
	HkTeAN2jGCNawGHYIBhGsJndeXec3gbb+kUe60lroBr8+Ar2D4hFixTQVRsXec=
X-Received: by 2002:a05:6808:1208:b0:450:4628:e3ce with SMTP id 5614622812f47-4639ef1a5f3mr3413419b6e.15.1771104765501;
        Sat, 14 Feb 2026 13:32:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636ae901d4sm7319937b6e.2.2026.02.14.13.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 13:32:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
Date: Sat, 14 Feb 2026 14:32:37 -0700
Message-ID: <20260214213239.2546012-1-james.hilliard1@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31690-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 522B613DA5D
X-Rspamd-Action: no action

Allow GPIO controller child nodes marked with "gpio-line" to
configure direction/flags at probe time without hogging the line.

Teach OF gpiochip scanning and OF dynamic reconfiguration handlers to
process gpio-line nodes in addition to gpio-hog nodes.

Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
nodes, keep "line-name" semantics as the hog consumer label.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Depends on:
  - https://github.com/devicetree-org/dt-schema/pull/185

Changes v1 -> v2:
  - drop documentation changes
  - add depends on to changelog
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


