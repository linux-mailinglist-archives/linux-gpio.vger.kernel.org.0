Return-Path: <linux-gpio+bounces-36432-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHMgK7WA/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36432-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:20:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 597204F26B5
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57C2830684E1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54154356A0D;
	Fri,  8 May 2026 06:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZLlb5Xm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A437104A
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221085; cv=none; b=CZp1+mRCaFjaguTNBU7KiFfQOfbHtFVcG7YofiuSRMETyusM9MeGHAg6biObd09QIlsPl3EFxpvX0LZI3EUUS4fOY2Oesfm8tqV7xucG58nBbN8VDbghp96vzzSQyf0IEd8L688ALq8BTbMtEDa57uJCEhFebkqK6O+J8NKppPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221085; c=relaxed/simple;
	bh=iAz3jJlPBsba8da3kwjpUIhKKIX2c5o7oUegAZLaLs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7xvV+46Rha6j+ea1R821a60R5WrabAQyfF4kkYoaMiGq3UmF5tNGIrSm/tCtO43gPu6SVJrea9bHdPQu3OqSM8Afl5ZzX7DR77OZW7v09CFZYrz/q5g2VIyrCAvBeS4Dc9dCFctg6JHy2U34pxagwijL4vNoEXEp6sgXgrE9eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZLlb5Xm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so14113045e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221075; x=1778825875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/HBkO+y62XsV45mtLzlDevXxl0xhhsA9eRibM5h14I=;
        b=bZLlb5XmFI5aUFxtUyQJyuZaE3fA3eA3C/SAu+k5kxhItC5EjvAhgAUvCjqJ9kF+NY
         OzmFlXPYXSCe1jtrSxsLYiu0u7goCAbg1pu3FLUI/nFEgrDwRX3T61Tfx+VJoRWG94QV
         z/tRN/WsF3ab6LItv1YThZycu9mDO6lmAJ7xWzveADTpHhKJliDuxq21hs2wSb3z0l/N
         BpQiYVEQpTGvApanGRWRu8NdJd9qDCFrgGGy/rsGD6MxE+hjMjscTPOSvS96PXk5YpB1
         gG+j45kP010HTcQ790KDFnIDOXQhxb3rk8VooSS1gQYlmPmt7NO9In6TK0661I1QydKF
         3qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221075; x=1778825875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7/HBkO+y62XsV45mtLzlDevXxl0xhhsA9eRibM5h14I=;
        b=Wx4Q7Ep6OD7UsH69Bh8I/xtAhpgW4oY2YXVm+1mz43RKe8u1ECpe6umCiaoq8hxUDY
         8XTbwxLmddu4cRtZlUoZWlOKppdwkZysyV66wRTQEvVKdCgxm6MX9p73/igHamhN27A3
         /5SXMthm3PJ/BepFTne/u9+vEGjwntRue2pn+vyyFuUxKldmzme60mNfjaSY7rWp7ydi
         rMhXRDRHXEUPPaV4U+kwt2E+FqE110Qdcrvi51FRGizWD9bOPMN7Xgi5CQ9pTQTVvdX3
         JhbttS7PNFibOsFMTELh9vTtE0D+AqxANWAt1xd9aWokViQ4AD3n1AtcQrSdgTazUjnA
         SdOg==
X-Forwarded-Encrypted: i=1; AFNElJ/KwEqRou71ViGoy1jK6Hf0ohEi1JwBa6KbSBye8ubBllVESzQY1XwJklcL0kNc2/gGBJpUm7x5UWsm@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGiYrs4M3B/EF7cHV6iQTniIZkdMLzHy/toSus8oWIrShUO5Q
	2/hsAI5qGVSS1OcjMVXJ3YM0zVB1GMCWXj1BdLa8VROlP0CIj/j157zo
X-Gm-Gg: AeBDiet35YZWpyhrSvyrKYr5Pcf7hXX7MlicjQwkuzGG4LAg9tsIXhksKipIGEvXYeG
	6p1arYwotChgzWlbx/FNvsySuI2kl1vKS4V9HDBQ4XIOANobvGzn5QXY4tIVKv0u4x+WF7yC59o
	trn8YejqYKtUsqTYrDfzN9BfYHDwpCMmZJbeOPcNWvqFKo8TGMMKc21qodRPL8JXqg7PW2yakl6
	GDTueh1A/7ryf0LAI7tk5zNYUAZO5BxYa1KkzQb1p9o8RPbdcRlIW4r+GOC9h2qEm8uJymNHqKc
	qMXZzqW2Uaa8FJC7GnyGU1XcDXFQqyY9O+8HE3ucuWObONBz1eSDoymBNa4GMVtfibscJpjw3/T
	7nZ3PhNsXV07zgItxbFrIlPgYdkFytIqfzIQPcEN8NR324h4yIwZ5C5eXCST50dekYUKfIq4Dzp
	6xlNzP2418NeUC7h99YD9cFvCmlw==
X-Received: by 2002:a05:600c:3f18:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48e51e19668mr170774595e9.8.1778221074930;
        Thu, 07 May 2026 23:17:54 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:54 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 4/6] gpio: acpi: use guard(mutex) for conn_lock
Date: Fri,  8 May 2026 08:17:27 +0200
Message-ID: <20260508061729.9530-5-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508061729.9530-1-mscardovi95@gmail.com>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
 <20260508061729.9530-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 597204F26B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36432-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Replace manual mutex_lock() and mutex_unlock() calls in
acpi_gpio_adr_space_handler() with the guard(mutex) helper. This
ensures the conn_lock is automatically released when exiting the
scope, preventing potential deadlocks and simplifying the logic.

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index e53d68578024..33d6c3b6cdf0 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1123,7 +1123,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		u16 word, shift;
 		bool found;
 
-		mutex_lock(&achip->conn_lock);
+		guard(mutex)(&achip->conn_lock);
 
 		found = false;
 		list_for_each_entry(conn, &achip->conns, node) {
@@ -1155,17 +1155,15 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
@@ -1173,8 +1171,6 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 			list_add_tail(&conn->node, &achip->conns);
 		}
 
-		mutex_unlock(&achip->conn_lock);
-
 		/*
 		 * For the cases when OperationRegion() consists of more than
 		 * 64 bits calculate the word and bit shift to use that one to
-- 
2.54.0


