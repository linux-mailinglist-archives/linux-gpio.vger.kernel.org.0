Return-Path: <linux-gpio+bounces-31046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XM0JEcrmdmlxYgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 05:00:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70E83CB7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 05:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3A01300463D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 04:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6382FE067;
	Mon, 26 Jan 2026 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXkrTi5C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665F27702D
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400005; cv=none; b=Z5oQeHP9nfU3y9UM4/YJu898TnRIwvAqefQPyhIRhqX42wf8lmX6LhmzCfvbvfXKIXc/iCntq6QraDQp0pndGY2I/X/OudOdQXDGXOW8jg2k6+nR2WkD3N/o3yqoD/CHe1OG0mq8t0cgDmrQSQWo5nITufYtyxHYqKc09fojZc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400005; c=relaxed/simple;
	bh=dWe/Ofg1Ju70PTF+2ND9l7SJJ9rV2eyZ7T92BJiX644=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOFmIWI3cuSi1u917L/KHPzCjLGZsqx3CDXaXal+6LZK1Pmgaew1+R+vs5CEhDP2cGfmBJnsYQeLP4W97kLqa7J+Oyni6UDB/WiWH6ywPoAs9Ub9gnXuzjBCckh0Gf8IKAmmd0177REFYAONUwX95jmys+0poMytPJYAf8J0zR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXkrTi5C; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38319cbc8fbso36207991fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 20:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769400002; x=1770004802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOBDD584N2G3qYvT8oMwoUGO5hkpiwx3PvZwbmC4EP0=;
        b=JXkrTi5CdI2s0Toa/N3GkeOYN0uErSAPQP0IANj5jcMOdEmUx7ppOq5yaDKn7NScMO
         MHsJDiW4H277NroVipvdzaup0J77u5n0MlPEGu0zJ6mPP3avuONaucfvjLPNrmLCbqby
         T6J+U9/nqCsr/iztMmKcYNFxUNWgeMxlbLDr9caqVDlUGCNjAAMRR/R1y7XRsn8ssiwY
         gBIhLwm6yGURaqzUerYmXVVzx56l4gUGAnf8CqI9/8xHntReCiRaosZ8U8xPATzsG+VP
         BNzQh3cDj21mnHzBw9ng0qRxSy0aKtZ0YnrUTajSn0kg/EOr4LG/fs7M70ELj6HK/AEO
         j1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769400002; x=1770004802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOBDD584N2G3qYvT8oMwoUGO5hkpiwx3PvZwbmC4EP0=;
        b=Sy9tGpjTUXiTA+jLImVmx0Wtose/9pxhdLZMj41b7bI7qysOFKp9Z5THpdR/m3TYs4
         fpkGiZ0k6MCN9r22n0Ndg0tPk6gDQ+sISBuMN33SZU6ljUfJ/UC/7cPMfYGG0bHNYq0U
         6MXBO9gG+f4ylbaCeZChlKqGEE1e8a9E/IpncONRy6zKYsV4ll+Rf4B2DiWFsQ2rIRnl
         Xe7MyeAlm5cdBXkYKQQblN6hgnlxWvdTI2FwLpMLLKVj6xTCx8aXRhBTGKBxZyRE4Yyw
         8CzugcmYPC/F4CcwLHZ1x5VLIWM9zWGrzhwPfv84scx1+6GmcIuDQYwFVQ96uvFwQW4u
         QhuA==
X-Gm-Message-State: AOJu0Yw8Aq8TURRXISywrzp9LrAMh57ImyWTD9XMlu3Pz2mjQAzHeL8c
	984fpI9Dao8ZQk6CCSH+cKSkpN5qeDeM6wPOBQyMZmLEzP42fuEV6P68
X-Gm-Gg: AZuq6aKPa7aIG3Aod1CUMStStp7i87E77C0AiaMZw0F/RigBVLPQ84+1asrnRHlW2EG
	XqMtyMqc1NFxCZIGtJWZZWRlIzAsyjDlHSUwY+Wj/EXyFRBK7Anr9xix0je1YYTit0uc/eHSXdu
	M6NZyyLiEAU+LgS/WeX3easKBs/sIkc3gBxuZYAlQ7SXDjM6HWEdzT8tVJvGrt1yay+1m0JMwol
	Fo7cFIi4QimEuiKQ6AdbYrMZDsGVp00OqmLEKlJbo+B69gE7ruMe6QJle7M59lwaytQYXgRk2vO
	v2RVf1Yko32vl1Nh1YmGmOXXOQiLC6PTEprbmv3lH991yH0MDur2gzZiK6Xi5oxh/SYeCg8PYUP
	gSl2WSarN1WFNT1xpaXUtOv6PEIYXhsSxJJ78MA+8+N4s/eBTfZA9d/Hf5MYq2xS7mxbGrEFsh/
	QadElARi+sgzJXltaVClNvrOwE9kGCB2rN
X-Received: by 2002:a05:6512:304e:b0:59d:f669:c924 with SMTP id 2adb3069b0e04-59df669c967mr685191e87.27.1769400001890;
        Sun, 25 Jan 2026 20:00:01 -0800 (PST)
Received: from happy ([217.15.199.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48e5fc6sm2434040e87.34.2026.01.25.19.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 20:00:00 -0800 (PST)
From: Denis Sergeev <denserg.edu@gmail.com>
To: westeri@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Denis Sergeev <denserg.edu@gmail.com>
Subject: [PATCH] gpiolib: acpi: use BIT_ULL() for u64 mask in address space handler
Date: Mon, 26 Jan 2026 06:59:14 +0300
Message-ID: <20260126035914.16586-1-denserg.edu@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31046-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxtesting.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[densergedu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtesting.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E70E83CB7
X-Rspamd-Action: no action

The BIT() macro uses unsigned long, which is 32 bits on 32-bit
architectures. When iterating over GPIO pins with index >= 32,
the expression (*value & BIT(i)) causes undefined behavior due
to shifting by a value >= type width.

Since 'value' is a pointer to u64, use BIT_ULL() to ensure correct
64-bit mask on all architectures.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 2c4d00cb8fc5 ("gpiolib: acpi: Use BIT() macro to increase readability")
Signed-off-by: Denis Sergeev <denserg.edu@gmail.com>

---
The ACPI specification does not define a strict upper bound for the
number of GPIO pins in the Pin Table. The value is derived from
16-bit offsets inside the resource descriptor, which theoretically
allows far more than 64 pins.

However, the current Linux GPIO ACPI OpRegion handler represents the
pin state as a single u64 value, which inherently limits the number of
addressable pins to 64. Thus, even though the specification permits
larger tables, the existing implementation already assumes a <= 64 pin
mask.

This patch fixes undefined behavior in the valid range [32, 63] on
32-bit architectures. Extending support beyond 64 pins would require
a different representation (e.g. bitmap) and is outside the scope of
this fix.

 drivers/gpio/gpiolib-acpi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 83dd227dbbec..d42f769eeb11 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1159,7 +1159,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		mutex_unlock(&achip->conn_lock);
 
 		if (function == ACPI_WRITE)
-			gpiod_set_raw_value_cansleep(desc, !!(*value & BIT(i)));
+			gpiod_set_raw_value_cansleep(desc, !!(*value & BIT_ULL(i)));
 		else
 			*value |= (u64)gpiod_get_raw_value_cansleep(desc) << i;
 	}
-- 
2.50.1


