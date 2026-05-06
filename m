Return-Path: <linux-gpio+bounces-36286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA6IAvU2+2nUXwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:41:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 796524DA5CC
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5710230534FD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB6F44D02F;
	Wed,  6 May 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE5oi6+B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26744CF5F
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 12:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071025; cv=none; b=QNM+MXCgayRzEBkh46OMjLs5YwHacUecmNi5HuwPzL+pujZkzVj3oJVEXnI2IIi8y8xOYLgmcTcGYrjJbaetvtJTJVX1S5CUxnIWwvJkiub/66fIwQxIvt1ORzumerlzqblTlWPq0vBnc8yXYc0ImnVRAHAnmrXPv7CPspTxBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071025; c=relaxed/simple;
	bh=MtVKX0+/RgsoWzLc/ouyVcU1ubZM16+m3j5A53wkB4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhLd5dDYpt8gEiBGrykoNYIJvCksFVdnZ6Y2+hdPmRE8J5de9RO/3JNZ99Y0ez+TMTvEyGhiqCROxnKel2VHfwwaWit0/5ghWEJSmbKUO5kObL+PkEaY6ydHY6Ie4/TAfDVh5naQY+v3dtIan/kxVj/ncmZHxIipBsKVUBlIotY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE5oi6+B; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so60566285e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071019; x=1778675819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4fhAWXiUtHh50/c6yGRrCeHmG4RlLuqrhdgBtX1yOM=;
        b=YE5oi6+BFzVcPSzvAXmQoMtRJwmvQRMxm8sLZABSCNP4N3+paiXPrVGdVySgfsrmtZ
         vsMNDtpi+nShPImkP2m76/OdvbEdfCZZ3Z1dK09N1d6FauV6tvzfNl0low6bqF0kWlWb
         vxX13sywOv6HmXC+qY9CAXWFcu4fxQLBuCu+qzHYK5WVFt9tdqFja9x7HVQSywGVLpo0
         6ua2A+yygYoLti8+3uwzWbNOzpsEcaW0WY3d6GbpaUoYwEoNyA63gVq0Z5zDTPPf//8W
         KS4P9xOBfFRmwstC2AE/woS8spwQFFZWzRBaQS9wCUyP3cfk337jJcyAUUuwYTluVM7E
         qWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071019; x=1778675819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4fhAWXiUtHh50/c6yGRrCeHmG4RlLuqrhdgBtX1yOM=;
        b=fyOWibdwX9xWa0mI1J4EXK87x1MI4d+ktvGpAwrW6vCUxwJx1dURL75fAX5tzllFxx
         Xa7M3Pp+oh8YMbfwCA4YSQtwpOusJsDgvDfolvJOn72hiIcskK8HIJADtt/y88wH1E+W
         7CB/w69Fa2eBSo636vG/bk9yE/E3ieiag8+d08aRwkQuCecDWNtyueU3RlIZoR5zFEgR
         AFvOvjoa1g0v4HET6+Wp8nJES1Jy9HiH+1IvoGfpB/xQBej4QkzXtPh91qOVpmGQBCrr
         i5Mcx7m6cRTf7c63hLz7h0GUUZVeCvAm9wiq+T0WRhPXy8ddJVOAobx29kUMyV5v6WgJ
         Ykgg==
X-Forwarded-Encrypted: i=1; AFNElJ82taiDhhMIu0C4rYlik3/UDxOs0ed+ZoLLJZW8YGXO4PV7ekjC+JgmdZVw6u0AtAbjpnJiJLtjsS3o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjw/VvC9gFUMY+gIbzqPHK25pVqBuUUrQC2UKzTQG+PDWKCsAk
	L3DFqnIA77IqPxZ+5g2x6JtJsL3ku68Ek+dnxcAcjr4j+Yr5VcLJ4syX
X-Gm-Gg: AeBDiesYHkVGr3KK2juQ3xCTt5juzADZuzCT80yy0VcE58bm0NrSU+hn8fZfpVwBhMX
	sbMKgUDxEDReOyrfiIL0UUrdd8d3HZuBjZQlHSKkzWhCTAZO73RScaKJSJNqqX8FmA8QT5J9KDt
	VpoSx8gY0+OHleWpjQk8cOIMezdZVt5Iu3B1/lFB15bekelJki/4wDviQeFRx26E+ly9P25KKk+
	JywKYp26xAMUZc4EJnQveLhWrS42XBQSDN0dFfBSfF+avQHFQPKtQ5GCvWdMZi8uEDUHfVpjUuy
	2bDoWRD6+X1QrZrIFCmhe8HoHkxQEsgyewWUgzwhO/YbcefEBnfJvrj9tpqZrWMU4rP+jUuUp0W
	YBJng9aGkUH4eIZHSaYl1nApPyVQeD06RjcljafhK7vatnqCtACFAJVvtkQZ/I3pFZyKCdoLXp8
	8wmYHtFm2TPkQ79koPPpjyfLwblw==
X-Received: by 2002:a05:600c:8485:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-48e51f32a64mr60865175e9.18.1778071019394;
        Wed, 06 May 2026 05:36:59 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm31767485e9.1.2026.05.06.05.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:36:59 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: mathias.nyman@intel.com,
	andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v2 3/3] [PATCH 3/3] gpio: acpi: modernize resource management using cleanup.h
Date: Wed,  6 May 2026 14:35:36 +0200
Message-ID: <20260506123637.1077421-5-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 796524DA5CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36286-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

---
 drivers/gpio/gpiolib-acpi-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index b6accbaba04d..7b6476b90f13 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1126,7 +1126,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		u16 word, shift;
 		bool found;
 
-		mutex_lock(&achip->conn_lock);
+		guard(mutex)(&achip->conn_lock);
 
 		found = false;
 		list_for_each_entry(conn, &achip->conns, node) {
@@ -1158,17 +1158,15 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		if (!found) {
 			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
 			if (IS_ERR(desc)) {
-				mutex_unlock(&achip->conn_lock);
 				status = AE_ERROR;
-				goto out;
+				break;
 			}
 
 			conn = kzalloc_obj(*conn);
 			if (!conn) {
 				gpiochip_free_own_desc(desc);
-				mutex_unlock(&achip->conn_lock);
 				status = AE_NO_MEMORY;
-				goto out;
+				break;
 			}
 
 			conn->pin = pin;
@@ -1176,8 +1174,6 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 			list_add_tail(&conn->node, &achip->conns);
 		}
 
-		mutex_unlock(&achip->conn_lock);
-
 		/*
 		 * For the cases when OperationRegion() consists of more than
 		 * 64 bits calculate the word and bit shift to use that one to
@@ -1196,8 +1192,6 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 	}
 
-out:
-	ACPI_FREE(ares);
 	return status;
 }
 
-- 
2.54.0


