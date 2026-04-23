Return-Path: <linux-gpio+bounces-35443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIr8Hp6l6mmi1gIAu9opvQ
	(envelope-from <linux-gpio+bounces-35443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:05:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879E45849C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF6E6303012C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05993D811C;
	Thu, 23 Apr 2026 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+esoVyL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA423D810B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985470; cv=none; b=WDXezJBorG9M2WQf++6u5n+P2VCUU8kFFhpcMH/Bi+tShYw0YyQD+jK5yfODcwdGP774S3PPKaCzImfy0hL2b4ZZic9fs1nKGKbT5oNTI9Ut8ycqaQimRUBtHQPWzVOseO7g4s9IXE7wD3sHdQslM4Qpvp3mmREMb3/S/Wtiq8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985470; c=relaxed/simple;
	bh=erx80ktmfhC9oapl7jG73U4xyRNc6cD1xGEMZX4Wvy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IX66bLdjTRhjp3o0kB7tCRpL2F1RIQsbmr9nacPXaUoXl4brA0L1KWWKkseWazRBPK1ztlDSIaciOVuqHYniHEnlyOVbqSatvdEcmHQ/QLjAMs9MJyLlQGE1c+rxh/EKYMu3zPJqWtx9F+q5oJeVpMjLnxIRjiE8VY3y7U/2+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+esoVyL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so9074890e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776985467; x=1777590267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tNmFsyAqLll9djiLitvDLt7Sq+VOfMkML8WGxUmnec=;
        b=j+esoVyLE+Qn/aXt7XK+WcnAmi5YIFlrMwJpdZ+H3gNmLFiC+IoPY+Ldtpr1c97oLZ
         rcmUGChqi3aexVElvpkD7ZUyTSH6+xQL0HtMHCqTp8WxGYvmuioQumDMgAnEtbVff41y
         wdGhxfu7WioqhrCGbYY5WkAw5+PXe3AUKfJccoWEDw9Ihti2ihG5tmCib0hUoEYM4KUE
         bmsATLDfyn1uMxi3iEPjATQ7fkMuuAB4sLmO4e8SVXt5fGsauI6Pe/C7KB5PAjVRzCOb
         I5NHO9oq9Y6xoZPVUNkhuUSUuTw8DhAb1EG4Guxnxg7RRLS4FE1OQJ4t8AYqJrDUQj1F
         kCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985467; x=1777590267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/tNmFsyAqLll9djiLitvDLt7Sq+VOfMkML8WGxUmnec=;
        b=TynogEXGD3yDgRKiMxo+F2bLYbP6Bu/NkhyevKvYDnPtYevKTemyEzNRAKiPyx/7LB
         TClhJQn0uhxLN9r1ODcfV8opaM5e3nLkCqS5e4k7Q5zEGb0IeWkVBIDUaiQ/gydSG3QC
         VRdoZl80LXwCIqp3pugDN6gOIPAHXkMnDHwxrdVt1Pqz8va01Ju8LNmL8BEgY6Mz+VXh
         T2p7tepxLoiUP/JDah2YHDJYJ7kIL+FnjRT4CIGa/EEoxVhJHctEKcoUFFPliFneSgsA
         SPmU67WM7eqEdi3AOrfkMZ7/om3HjkvhFCU+bInwldDlvDULJsAwAcNsi5a8y18rqOcm
         qoaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aeo+tTZ0wQREv5WDikbkDGMt4ZvTzbS996PRc8dxrtJd+Ne4O+tc26yzqL3WzUJn0xiX27+ITkWNW@vger.kernel.org
X-Gm-Message-State: AOJu0YzwK/oyNrc0kA3qLBYLjvOA9iv0BulQUyptKaj2ZWnxFcAHe3xT
	8i+Nmmm9TW83lia4EYmZqx2QVeRDs+5z2pvTbq4K2SXB7MsGTtK3yPqK
X-Gm-Gg: AeBDieu6geOK11kvke3ZfyAOh1pX2TUYGzglGrB8x/VXafqVkymr6nEJATD0L8mCYqj
	qWxg7cMz1kDK2vSG9CkNi7wvpK76b7lpqyCdmPcU1NYkTY5sR4Rc6tqPU0/cNAGM+QfIwV0s2rL
	x5wixHZho0Uvt103ZYdrbw7/TyLKzDiERr8Fxr5ySRSqbNcee0tuieqm3GPOfbmhejSaRDAwzAu
	NFUR9ic7zpEs3mqJnL0IX0M0ROXDz1M6IuuXdfHgc0WCaFXFRPXHo2E+pv0Dl4yWKOl+DIqBb5H
	v2757LgOdYIRRlpAj2lexlMN/dh6qFvKyfDTuhnGUQYpEqIqB5XhGVLG5DIjgOY5dM/1aebsOgy
	TmL4nR4cH2ogqD6auGJu6kJna/IN4BLmEHruobpppL1RANXUAqyd6+L1ipHoxHtznJO+PlH1Jnm
	JMwvJrRTqwNFrUY/Q2FwVyeEbQqWTY7KL6uvRqvDEusyJfIqQpJv5/kF53uFuHV3bUL/Y=
X-Received: by 2002:a05:6512:118b:b0:5a2:8568:826a with SMTP id 2adb3069b0e04-5a4172eece0mr8485360e87.34.1776985467167;
        Thu, 23 Apr 2026 16:04:27 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm5567888e87.30.2026.04.23.16.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:04:26 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yixun Lan <dlan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
Date: Fri, 24 Apr 2026 02:03:35 +0300
Message-ID: <20260423230338.442497-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260423230338.442497-1-bigunclemax@gmail.com>
References: <20260423230338.442497-1-bigunclemax@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[somainline.org,arm.com,kernel.org,gmail.com,pengutronix.de,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35443-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigunclemax@gmail.com,linux-gpio@vger.kernel.org]
X-Rspamd-Queue-Id: 1879E45849C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maksim Kiselev <bigunclemax@gmail.com>

The __reset_add_reset_gpio_device() function currently expects a GPIO
provider with #gpio-cells=2, which prevents using the GPIO from
controllers with #gpio-cells=3, such as the Allwinner pinctrl and others.

Extend the parsing to support the GPIO phandle with three args,
where:
  args[0]: GPIO bank
  args[1]: GPIO number
  args[2]: GPIO flags

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/reset/core.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 352c2360603b..18fb50ca645f 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -868,7 +868,8 @@ static int reset_add_gpio_aux_device(struct device *parent,
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
 	struct property_entry properties[3] = { };
-	unsigned int offset, of_flags, lflags;
+	unsigned int offset[2], of_flags, lflags;
+	struct software_node_ref_args sw_ref[1];
 	struct reset_gpio_lookup *rgpio_dev;
 	struct device *parent;
 	int id, ret, prop = 0;
@@ -879,7 +880,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * args[1]: GPIO flags
 	 * TODO: Handle other cases.
 	 */
-	if (args->args_count != 2)
+	if (args->args_count != 2 && args->args_count != 3)
 		return -ENOENT;
 
 	/*
@@ -889,8 +890,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	lockdep_assert_not_held(&reset_list_mutex);
 
-	offset = args->args[0];
-	of_flags = args->args[1];
+	offset[0] = args->args[0];
+	if (args->args_count == 2) {
+		of_flags = args->args[1];
+	} else {
+		offset[1] = args->args[1];
+		of_flags = args->args[2];
+	}
 
 	/*
 	 * Later we map GPIO flags between OF and Linux, however not all
@@ -902,7 +908,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	if (of_flags > GPIO_ACTIVE_LOW) {
 		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
-		       of_flags, offset);
+		       of_flags, offset[0]);
 		return -EINVAL;
 	}
 
@@ -923,7 +929,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
 	parent = gpio_device_to_device(gdev);
 	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
-	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
+
+	if (args->args_count == 2)
+		sw_ref[0] = SOFTWARE_NODE_REFERENCE(parent->fwnode, offset[0], lflags);
+	else
+		sw_ref[0] = SOFTWARE_NODE_REFERENCE(parent->fwnode, offset[0], offset[1],
+						    lflags);
+	properties[prop++] = PROPERTY_ENTRY_REF_ARRAY("reset-gpios", sw_ref);
 
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
@@ -1048,10 +1060,11 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 		goto out_unlock;
 	}
 
-	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
-		rstc = ERR_PTR(-EINVAL);
-		goto out_unlock;
-	}
+	if (!(rcdev->dev && fwnode_device_is_compatible(dev_fwnode(rcdev->dev), "reset-gpio")))
+		if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
+			rstc = ERR_PTR(-EINVAL);
+			goto out_unlock;
+		}
 
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
-- 
2.51.0


