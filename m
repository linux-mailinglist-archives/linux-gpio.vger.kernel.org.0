Return-Path: <linux-gpio+bounces-36389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ19GtK3/GkqTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:03:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0491D4EBC44
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C28A3052B5E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9563D45BD4C;
	Thu,  7 May 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="px4K6q4V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066AC4508FF
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169419; cv=none; b=lZUL8XDOam13Di3lgdgUM3l6la9kcVYWKb/N3yLDKuqudpdFAh5h2AAW8h7pEJxntMRbvMXleje1YqRbrNHAZ0VaFBADP5xkA64ZMjjiiYw8uAsqfvqvyx1Ii1FHs1cjZj/CtWeEIk9wvGuBpyzyt9YiT9FbC2Axd6ShMRWY/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169419; c=relaxed/simple;
	bh=kCWj/tihXQyj2JmnfTQXy+jrNeLIqAeRIffTZPiuv4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr6ISl88B6+6JZ5AtqfZpSrvDkwfiQbYwZkG7AsyJdWfMykcOfdz+lYZhtfG66Hn3+JS+x4LFkYyiP9nlnl1Fuuix5idfcCN2EF5NqMmyzHoQ+zlS5nA636jYhM7CALeFaZ4b1ib8ZDNIxtIfcRnWtTr5lQKFYXWkjym3uKJoWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=px4K6q4V; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43eb05b1875so642353f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169416; x=1778774216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjkaLOp1lKw94U0v3DXhZH965s0rAW5C1WAv92gzk9U=;
        b=px4K6q4Vz3ZsCk6NibOYvrQfC107fLNOwzU1iqTUlB+TdfHo3UJVdU+rutdw977ahI
         tS35CgPqhaZVz8jhY1JuIuX2xBtmN9BM2nx4GvHQSgtNQFdxP0Db0dxp+m8/iiPeI7HL
         8Bkvp4NSGHAystoI/8ouPSJdQVR32mMkU/Yksi9mOXepbey+x6TAGEl/xnZL+5GS65yB
         bkyvrSLePrKsFZl2VKZlqvBMV1zw37TOyKx8i/YXsq9Mlg57lyMO/ZeX3aoe/IHzI3wr
         b4kICpjsjrpo2wAwMRHFKjUGOrHCkVcdSBqhIZLITgliM81yPmTxBgHxi4QMFY8JZwjR
         B/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169416; x=1778774216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjkaLOp1lKw94U0v3DXhZH965s0rAW5C1WAv92gzk9U=;
        b=dK5pcIjoHdP3f6Nd3r+cEWq21Gjz1nLIL/kGxnSxPF0woWyo8S+CztQoenGmQbanaq
         N+fqrhqQSKIMZ2O94f8On2AmiX/PNc4gFFSAH+vSo6ZpF9kIS5PMJtPDe8uMs121y897
         32UKS2QHGJ2QDlq0GGquhLWJjy2n4zAbDQObtRrTeSSjRTzuyUt3lhBJhgK6pzR0ry+L
         WZliUgNwRz5AYjAQY3oVgtMhSnUoUWtw0tsUtufyprHWTG590Y0OMmLvF34OZ9GFQYke
         9me7IAyoPGq84TTnGEmh+gffQt2otaevkcFsVvJ8wDNXVTFR89TuIzDGGhTODArMS4Sq
         1koA==
X-Forwarded-Encrypted: i=1; AFNElJ8RVi8N1X6YwPD/XRqXID8h2cTx1Mu6Npad/6XxhyLeVHtH2L8DSnePZTN8Cbp+fW1uYHtBxPE6cYPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3HOs1Oac0ED9l2bZeKunCell0+oS/G+N/ekBK8ubOmM4Up4kI
	zc+mvEyY7efmh59JARwyjj8b+tCKkZOJfvIWGnG8LOsjh78kpFb0y9vg
X-Gm-Gg: AeBDieseac4S5PtBvofOoRrtNxFzND/6cp8NLo0mWAchXCQtp8h0kijwhhNX7YKfwFH
	jgFMGuD3tdypEBB0eTdD7KpGjKyKGOvSqMZjvBmhKznHMUkZh/D+EX9AKDOr2f7xB8WS/vQHM1I
	1yGQtgjApGlyT1kCDf6nCR4kPevGI8/O0zFFuJ/ptA3auuw9KD1aVpQpJgfMf911nRPph8GvfDu
	jf0t8OXV4g4W6HtXH+FJJrZzizOmyYXLGiWmJT5wm5XNq+6rcz9VTbVta006qPZjB34b5nWBqCw
	+0UzcM7iDrRWvx80FPjRs+F9eth8xwhl4A1SzZUc+/eJBD+L1xNDZtsW2bxHN9M5w7SNpcsyhDT
	ebn+20HRZJ+eBh3sPDywtUAl+ozLV98qILhmnSX7Xas11TJ3MJkf9Lp0G0wZyHhwILSpCkrOKC6
	5JnrkS9/7dSKyvbcE=
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4515da967c3mr13748901f8f.37.1778169415965;
        Thu, 07 May 2026 08:56:55 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:55 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 3/6] gpio: acpi: ignore out-of-range pins in acpi_gpiochip_alloc_event()
Date: Thu,  7 May 2026 17:56:44 +0200
Message-ID: <20260507155647.403964-4-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 0491D4EBC44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36389-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

---
 drivers/gpio/gpiolib-acpi-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..e53d68578024 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -370,6 +370,11 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
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


