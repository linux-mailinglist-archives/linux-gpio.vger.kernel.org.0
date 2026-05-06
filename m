Return-Path: <linux-gpio+bounces-36285-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ8cOPo1+2nfXgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36285-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:37:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222254DA497
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3024300A5B8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D8944E041;
	Wed,  6 May 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDLMjJeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9744D039
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071024; cv=none; b=f5Arn2UK5N6uy/kc8gnOsEi8R412NfRmTwQEKf6Q/jVxkbQxf34GgBc3pY3nHdqDSThFBSl7ZTnxU7kjISRJB4FQjbJmxyoZFWHeX2FBmxOr+NlIHtYUw4x1obOGokiv9rKzJdOzUmWj5D2hEuxFxXuyqaiStAOiSP8HBsDdluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071024; c=relaxed/simple;
	bh=KKiO622uH2fJq1/tL0XKTF01Sy2g4i8eF9XE0Orhm3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2P+PXj0wrl/T9cqKnYIBob2YsX3/CjATF2NSRYUUMcQh9uozwgH9/G27OBSmsKJ4QR6MUZv4SuKe/pQOG2g8Co5J3vqfP+hgwLsA+cQJSbqIXDpT8gCVP/2czv6Wk2OESvdugkITY/YPp9coxb/QeUQN7gMzXpDcc57E6rJ2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDLMjJeq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso76501425e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071018; x=1778675818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zYEKZkZ0zrzlHgzw7EqsB6P1zONDhRzS0uvOcHxVKk=;
        b=DDLMjJeqfTt+pEmhiVbxIWjuCSo1pS8fYkZHJAV2Lm2kPrDR9hipn5o70o6gGtM9CU
         BMLqFmC9OeWnRUQtDFA3RDpBCcJwFx+TG8Br2nB6NdB/yxVkc0Mitu2WSEcaKs68G2e1
         e0/zBJNjPQu94RSfla8zWzXwHdF2OfZV4jKhn9Pd8TVaLRopyeONPn2H8gzbBhefSY0D
         9Lz4vXXh23Erwq/EYiU0wdqaiiH4KJC3B9f55ZlfY2XhHweU4aKeHioZ8sd0Wp+5ElA2
         4ZX6eh7Bga0T0qi6WxvFRHZ8McDyAra7X4nH7Q/Qfjm0K5FUQomI5vIrcYrj242Kak9q
         FfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071018; x=1778675818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zYEKZkZ0zrzlHgzw7EqsB6P1zONDhRzS0uvOcHxVKk=;
        b=c5X4vdNuQ1jKL3uUM0WEyBdva3yKGXb225qLxXO3NYupQVNosv0wS2NWChh24iuJbt
         iaX9n8jgNdL9xUGjETrjlJVvZArDzyAlxkbrFeyPBteXKY36VkSV8JmsmLH7ItH0y1s1
         cuTIzvubMYPBjwy4w+5qOtdWGS0/IwgClu/J2TnhOKP28ohcSeGTLpJd++yY46M8QVzk
         Xk3BUNtfWIebgK6sF9fgtYTISIqa/Bd9j/nycthoVTArFSLikAj6QN8+Kq0PBk/cY2kf
         zPPo2Ow8RLI/oGYfL0qpKHWHH5JKe5zE+eW5youF73K8qh3Ll2EAru4orhk1wn5piowi
         T4Jg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZmZRNjLAjDnD7MrPHfv8G95QyCFyYkT0pXHbWfEVMfdBXGnEeO2YtYET8htePoiSPd8IUqJ3ZNMom@vger.kernel.org
X-Gm-Message-State: AOJu0YzW02FrQTZYYMbe0RPyGBhSOgXts9Q2Y3OJCtWJSFexXdYrdAM+
	uedqET0PMvmNgW05XeTPDaCoF822mlOvlMH5yo9vL/cNlq3oqQaV4tjv
X-Gm-Gg: AeBDievx6+LJp/DJu6aG/TzTOa3adGfbikj2Zg2itYrl89oBkj9m/r2rHbyaTeyg0co
	+IeLbP59wyHNASnk+UEvKlIvh48l2HUcmyjw0KVQK3gZRcAoO0f9JUjGbUcRrsTe5EY+pz/4vVh
	F9KjQfM58iDOEZG8ZNlcRyWSK5LxDV8DtXO329KV0hJ2imK8a8vTPS4C6Jdb2/pkYiOMGKnBIuE
	pibXXNzOW+w84HkV7Jq0RPrCYncGwJqSQuJvd5U5mBcMbxKL5YfGIj/nEWDnLWhsxAijdEQCpzi
	CpvceiTysyXCV3gqVnBYicsS9xd50KH55IWCkw8cc7DfpfYbfsl7N0SI3ldB30dFutMgKIBkdX0
	+gBPrBv+bBGT3Gy7jquoK7w4o4gwBUZRxBb557GDXl9xSb4joBimLfI2MRL1FvoC+UPmKZUjPgS
	O9qqsCZKRX8ivxb1oFAQZPQTvgIK1Hjcru8wQ0
X-Received: by 2002:a05:600c:a411:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-48e51e08ce3mr40215835e9.1.1778071017611;
        Wed, 06 May 2026 05:36:57 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm31767485e9.1.2026.05.06.05.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:36:57 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: mathias.nyman@intel.com,
	andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v2 1/3] [PATCH 1/3] gpio: acpi: modernize resource management using cleanup.h
Date: Wed,  6 May 2026 14:35:34 +0200
Message-ID: <20260506123637.1077421-3-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506123637.1077421-1-mscardovi95@gmail.com>
References: <20260506113215.GK6785@://intel.com>
 <20260506123637.1077421-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 222254DA497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36285-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]

---
 drivers/gpio/gpiolib-acpi-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..7c17bffcd4e7 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -7,6 +7,8 @@
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/cleanup.h>
+#include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/errno.h>
@@ -23,6 +25,16 @@
 #include "gpiolib.h"
 #include "gpiolib-acpi.h"
 
+DEFINE_FREE(free_gpio_desc, struct gpio_desc *, {
+	if (_T)
+		gpiochip_free_own_desc(_T);
+})
+
+DEFINE_FREE(acpi_free, void *, {
+	if (_T)
+		ACPI_FREE(_T);
+})
+
 /**
  * struct acpi_gpio_event - ACPI GPIO event handler data
  *
@@ -361,6 +373,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	struct acpi_gpio_event *event;
 	irq_handler_t handler = NULL;
 	struct gpio_desc *desc;
+	struct gpio_desc *desc_guard __free(free_gpio_desc) = NULL;
 	unsigned int pin;
 	int ret, irq;
 
@@ -370,6 +383,11 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	handle = ACPI_HANDLE(chip->parent);
 	pin = agpio->pin_table[0];
 
+	if (pin >= chip->ngpio) {
+		dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, out of range\n", pin);
+		return AE_OK;
+	}
+
 	if (pin <= 255) {
 		char ev_name[8];
 		sprintf(ev_name, "_%c%02X",
-- 
2.54.0


