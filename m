Return-Path: <linux-gpio+bounces-36390-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGqJIsO2/Gn9SwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36390-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:58:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 038564EBB18
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9580E307753B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8464A4611E8;
	Thu,  7 May 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBQBrdvh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55EF453486
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169420; cv=none; b=NnlIo9xjg4B3cx2RGnouCOiBhidMEpmiisen5CvbOZHe37iZSOq6hEPNS3eydJy3ubEHkYE48hd9BGIUuxfR9pBWq4Iw37ii6Gj5xmKV1rLu+TwxIcHN/dHl6uGC28TC6orKHhlwS/p7pX9Ye4PIFlF4ObPkQVVCJdhHX/Jqtto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169420; c=relaxed/simple;
	bh=nbaIl3cWAUayfZ68Bw38GpU8PLcyTE4jy50VHYLn3X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkSbMjPUOXZQZ7cwLz+a7i3v/EeO8z9W5lJd80DMMoh8A6SbhrqEoFT7MnEOzWXA0ST2omJ7C/QdCVKXu2lEysUK8YguZklbWLV/9NvoPwZA02TxVNcdzbRAQ1rtNKtl4/Z09Rv83BfT4GeBuFYkoca/RqJ1WIzMzlgr1c1b5r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBQBrdvh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso8134345e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169417; x=1778774217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy6jWWAG+WnrqZjUEDtwqVMfyW+YY1GrQIhezkYTLCw=;
        b=rBQBrdvhp6QUtGVAB+Jc2K5dYEeWwdQuF4c6kuLsS/19pjabpKQzXY8oy2etSlSX3d
         XmI1zR/Ne46zaqucZFMDKXC1vAqnJacnYE9NYZM9rF6XFt4NuTLHANudEY/3Gv77nOgS
         /ToqkK6dKPGbFRaLRa2Up1OvkH+MRSWzvZjc9LPT2+ZlczAPjmvZhk6rqc+3kbTwhHTL
         tLOnsJENQog8+sYJy65C28wLYKWHzIe6udzDt5OrAc9+PwsaWqhud5BC+1k5WlthfOMz
         1DKryO7UCxOWTlrPfcAd5F7gqGlEdyqxXIXJaSKLoX0midxCyZlA72HFbzCHfUt2lKYH
         wfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169417; x=1778774217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wy6jWWAG+WnrqZjUEDtwqVMfyW+YY1GrQIhezkYTLCw=;
        b=DaODaKj/KjAwOnrJPoYzlllr997Fu9+ZdLBX75gUxqCiNUcUfDbv4pKcM1ENidIIBB
         O0ZlahTJBoQdA4aD+jlMGZ4ZsGV+KcqQbc6R44hVMNDbeB5QqGFwXVAqUx3jY/w3G3Up
         Usv3JX7BhXk0qt9qaqjHyq3SaMhNsMaEhULjVUNULN0GlOSsrv33JIHpl6hTKGGZyIw5
         cPw97LXeI4fBWgB7V+AeO8Ap+0Sl7TMEFw1Rq67TsEfAZQZCDF0cmQlZu/vSYbqrDX+4
         Q5sJhh5rjrQVD5ZaatJXo9/cCi7nUy6xc/EsD6kGPGqXyLt5NKuRzpOdgQ7wufhAOAck
         b76w==
X-Forwarded-Encrypted: i=1; AFNElJ9Ebc7OG0q1qUOQ8be7mbB4YoOQ8NYkrK5Zepmf2CCHlrKwiTE0EXxRoz5iIb+Dk37qLFe6DNSol8Fm@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGpGQNtq0tXpo/49VL/oElmg4DDArDKAr7rDZQlVXvl7fAj31
	7JsxI9kkDCUIrb7Au8GSMht6mHh1QL4CjrXao+ked2qfvl8SOHMXRqis
X-Gm-Gg: AeBDiete6ENgQ4YgjQdgPSoPV2nGYqgf22xywSDFyJPiA0ZzE1TwGWdfOh0FAH8X40R
	NAlH8rH61BaXn89DYAmbe6UPFwVTOq3aST+JGHKRyFyjHM47UgbwGomPsqseD+ZeZJCXRw9VYWI
	e8WkKBgiWsyIuMPKgQ2JR7gk5Xk7YfJqNdarOVYHv+Bm/YayUNP8sUVeGliyysv5N+HuIsGwfD1
	i7u9COoQj5XutU9ibT6FXXNHSNlq0keJLpMNpN0S/qrgnny2zFwnM98sFv+cUHYo0TnRTnnBgtB
	v5rQ7XAwGRMTIYviwp/zUevSYwSf0tPOF+CSs389mWmrQAMGV4RS9IBieJmKVq+YeiRpGgiLTqm
	zG/sdjHNbcFvEpHLD5G+2UNHVJYr43RTR3wDl1Y/N3h9vXdJchaItmwhxdJN0EySHMK0LWY/kra
	oiDAsNH09ij/Ofeul/je2AXqpdlA==
X-Received: by 2002:a05:600c:3420:b0:48e:51f5:2764 with SMTP id 5b1f17b1804b1-48e51f52779mr87836065e9.27.1778169416854;
        Thu, 07 May 2026 08:56:56 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:56 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 4/6] gpio: acpi: use guard(mutex) for conn_lock
Date: Thu,  7 May 2026 17:56:45 +0200
Message-ID: <20260507155647.403964-5-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507155647.403964-1-mscardovi95@gmail.com>
References: <20260506123421.1077421-1-mscardovi95@gmail.com>
 <20260507155647.403964-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 038564EBB18
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
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36390-lists,linux-gpio=lfdr.de];
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


