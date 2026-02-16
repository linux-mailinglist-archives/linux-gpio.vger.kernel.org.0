Return-Path: <linux-gpio+bounces-31728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL8tEsyHk2ns6AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:10:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5E147A5F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 310C2301159C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 21:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A82C31076A;
	Mon, 16 Feb 2026 21:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+Jdbft/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7A2EC0BF
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771276230; cv=none; b=dkM9rrxGOW4qTFOR2oSNf7cgr4lmsSPb/Bx+eRfk3VoLXEnCpLDNrNbLGI+Nu4kSlOeu1EVGXxGGA+F7acKwL7M2YnM+7pbyxC3uiJq38pk5W+U/v0pgs0euYawWK3A7ZBPj2WDOUqDtCXGKgPwttkywKqMUOLe5XS8cwdHRaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771276230; c=relaxed/simple;
	bh=gi/vS2WBIvjKTvDNwCGoJ1Sn3vwTdP3btLdqWXMtbys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NVY44ff/RIQkFaDRYAZvkHzG4GyqVXdmxtRq9yBI9CyXKeFBOqFNbE+MbP1V4GaI041g9/2/EcYpRW8cJmD5QRH9h/I2wEJA/xwST2kWVEYZSmTuAJSlf8mDi/+Cl5mLaujQwFON0sKi3OHhXqmfcRW9KbP2CtEbmsJTS5aZibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+Jdbft/; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so3149234a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771276227; x=1771881027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PofBO8lUwGBUKB9LSos0xCn+tFUPzNgDgwvV8yIWRgA=;
        b=T+Jdbft/l7ivL7ibixLPDc5Os+XAK8xEoaPrt6pr38D3LegSiERQbUpJOMM3eCP4bU
         pwM0IgIy6DMNM+vkJ2y96PYgxYnDUA+gD1p8hNWp4Y/A+Oa4dtVtrwRPsO/tJNzkSWX2
         sVC1av35/TOSwusHUVjl4ypT2kN7hiaKDMvrgxbWxGtEb9/mUyUj6mED0IXHUZvKvr8O
         PMiE4KNr9FZUI9/jVQqx5EFDGgawG2JTOkOA9fgG7QT+Abw2Xp+lGVzD4vzEweKOPI2v
         O2LqVwvzkzWVwi8rcTNHzbbvXH94WcFCg6Y9cHR9ru5wtrY4A9bnwXH4qyyzh7Mph1Xa
         hK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771276227; x=1771881027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PofBO8lUwGBUKB9LSos0xCn+tFUPzNgDgwvV8yIWRgA=;
        b=AxD20MOX7vc9Xm/yo+1SLce5+VZntpc5S9AsgAoRDYRCYaQixjSvjTJckqhdWe0jJ/
         ZBuRmxV0s0ualQor77YKxJifufUTTXKQnL3ulqxiAJEF1AUUDe35h6cCUsJznTe0A/uO
         k2rQMheqbjPw+i/+8Fb9rKSAfe9EsLJpqwZvW17JAwWmUxN6411DopTrXU/UTu4hKQpe
         sxBtTTOT972HrRWcFENg2GQaDdMBPRA2s9i/3s9foEfMcqm4VbmCzleMoNCQxIxjcwz2
         LrXjC2u90nGM4C5+G581P0qNdigmQ04F3W2SckIJpKBqPYIG9TQLgmdP9Ey253TWjSp/
         YvXg==
X-Gm-Message-State: AOJu0Yx9FbeBTwd6qXX406FPA8FpKJ0tbZS2usXUQy1fiKzEhbh97QLN
	mOW3EwK2rWOT2saT/pNh61nxZ17WpXNY3QpnOf+NO0zy10OnAXiQHKO+mVMGLQ==
X-Gm-Gg: AZuq6aLo2RD6bcnW7WiGH15INQ/kE97PY5IvsjaFv4a7ikTJ0yqc6/xk/VONAXuXTQf
	PFXFqb38zhgj7EJCWO1mFVNLL1aG07P5Z5veDKE45ebq6hNlVU0kJK79fSA2opDnthSHNa08NyT
	j8MAnn9Jqxph9CobdoszXxmGQYJsXuNuFLgDHJ6QMysATphBusRVvrD4zG2Js8Xfk3WvZoYwRLA
	iWKCaijkAO+4NVLDEYekCis5q3Tykh8AAur9/As+JBMR9XliByI5DzFCkwDsE8VBPZxpyhorm53
	mApxY18Cv9xMao4BDZ+h1p4SAR+3od3RhvJzqyC5ljBGXZyqiM0BJEsU/NqN0NMypw40jixntxG
	v2cZwf/Cn+i2Hx1qzzk6tCpxaIfsmoiq2iMpT4nHQU8aE1VnKA0BcvN6uC4tOWvWUHHuX8OhPbw
	909Nek6OCMY3/78+wTnP5WMTzxRKDfrkfLpOZhByTo2FQgJyW8SfpdxKzVWVYmiykEtH1+D9RD1
	0sEBoPj/Pn7DP9nMhCIQGgslMu3nNRwH7Lq1x6pCmTzuztuHiqDaYDxCp7qD5A=
X-Received: by 2002:a05:6830:2119:b0:7c6:8bfe:f5e with SMTP id 46e09a7af769-7d4d0c3cd36mr6053842a34.32.1771276227511;
        Mon, 16 Feb 2026 13:10:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a77200fbsm13435593a34.27.2026.02.16.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 13:10:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/1] gpiolib: of: add gpio-line node support
Date: Mon, 16 Feb 2026 14:10:19 -0700
Message-ID: <20260216211021.3019827-1-james.hilliard1@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31728-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: A2B5E147A5F
X-Rspamd-Action: no action

Allow GPIO controller child nodes marked with "gpio-line" to apply
probe-time direction/flags without hogging the line.

Extend OF gpiochip scanning and OF dynamic reconfiguration handling to
process gpio-line nodes alongside gpio-hog nodes.

Some boards need probe-time GPIO direction/value setup while still
leaving lines available for later userspace or driver requests. GPIO
hogs can initialize lines but reserve them permanently.

Add gpiod_apply_line_init() as a core helper for one-shot line
initialization and use it for gpio-line setup.

Because gpio-line initialization does not reserve ownership, subsequent
consumer requests remain normal requests and may reconfigure or release
the line as usual.

Support "gpio-line-name" for setting the visible line name. For
gpio-hog nodes, keep "line-name" semantics as the hog consumer label.

Some boards only need to name a small subset of GPIO lines. Doing this
generally requires defining a full gpio-line-names array with empty
placeholders for unrelated lines.

In overlays, gpio-line-names replacement is all-or-nothing. Names from
base DT and multiple overlays for the same gpiochip do not compose,
because each update replaces the full property.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Depends on:
  - https://github.com/devicetree-org/dt-schema/pull/185

Changes v1 -> v2:
  - drop documentation changes
  - add depends on to changelog

Changes v2 -> v3:
  - add gpiod_apply_line_init() in gpiolib core
  - switch gpio-line setup to use gpiod_apply_line_init()
---
 drivers/gpio/gpiolib-of.c     | 89 ++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib-shared.c |  7 +--
 drivers/gpio/gpiolib.c        | 48 +++++++++++++++++++
 drivers/gpio/gpiolib.h        |  3 ++
 drivers/of/property.c         |  7 +--
 scripts/dtc/checks.c          |  4 +-
 6 files changed, 133 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b7..5f531d5cbc00 100644
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
+		ret = gpiod_apply_line_init(desc, NULL, lflags, dflags);
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
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff..e5ef2c0d8432 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5061,6 +5061,54 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	return 0;
 }
 
+/**
+ * gpiod_apply_line_init - Apply one-shot line initialization and release
+ * @desc:	gpio whose value will be assigned
+ * @name:	initialization label
+ * @lflags:	bitmask of gpio_lookup_flags GPIO_* values
+ * @dflags:	gpiod_flags - optional GPIO initialization flags
+ *
+ * Applies GPIO configuration using the descriptor APIs without keeping the line
+ * reserved by gpiolib. After configuration, the temporary internal request is
+ * released.
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+int gpiod_apply_line_init(struct gpio_desc *desc, const char *name,
+			  unsigned long lflags, enum gpiod_flags dflags)
+{
+	struct gpio_device *gdev = desc->gdev;
+	struct gpio_desc *local_desc;
+	int hwnum;
+	int ret;
+
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
+		return -ENODEV;
+
+	hwnum = gpiod_hwgpio(desc);
+
+	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
+					       lflags, dflags);
+	if (IS_ERR(local_desc)) {
+		ret = PTR_ERR(local_desc);
+		pr_err("requesting init GPIO %s (chip %s, offset %d) failed, %d\n",
+		       name ? : "?", gdev->label, hwnum, ret);
+		return ret;
+	}
+
+	gpiochip_free_own_desc(local_desc);
+
+	gpiod_dbg(desc, "line init applied as %s/%s\n",
+		  !(dflags & GPIOD_FLAGS_BIT_DIR_SET) ? "as-is" :
+		  (dflags & GPIOD_FLAGS_BIT_DIR_OUT) ? "output" : "input",
+		  (dflags & GPIOD_FLAGS_BIT_DIR_OUT) ?
+		  str_high_low(dflags & GPIOD_FLAGS_BIT_DIR_VAL) : "?");
+
+	return 0;
+}
+
 /**
  * gpiochip_free_hogs - Scan gpio-controller chip and release GPIO hog
  * @gc:	gpio chip to act on
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3abb90385829..ed78f9d4d0af 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -271,6 +271,9 @@ int gpio_do_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);
+int gpiod_apply_line_init(struct gpio_desc *desc,
+			  const char *name, unsigned long lflags,
+			  enum gpiod_flags dflags);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev);
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


