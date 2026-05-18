Return-Path: <linux-gpio+bounces-37026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE1vFlLGCmqf8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B465683F0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8905301E1D8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CF03E2769;
	Mon, 18 May 2026 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdsIoJM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ADC3806A6
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090864; cv=none; b=IZ1rTiYoMLst7vFQeDvfLUxO4hkYWs3xXhBMz5ZN+JQMYew7Tz29M9MTYnZ94Q3I8h1567eHzS8CCby/YIHE46XmGjys7A6u+nycCCmK2QcVO6TeresyhMwPncA5Xb7GlNkUkZqz7IQHu7gSOOQG2OA0tglPLfIO5Yz3jEw4RZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090864; c=relaxed/simple;
	bh=iv39VAslRAqgad6LKrBKdc0Y2gyQhR958hGtPNBwDEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYx575+KJ4PgHt9ikGGbOEwZNrh+No6PtSAd/bydHXvJJBEQHH7OsVE/w5jIz/VprxOgrDYPpMZ24XqJMcjVCQU1EPCdq4YcUeVNPEV8J01yqXseOVgJTAM78ZRRJti/nLNRMPTADgZhscSwoIOlZl8w4FTUGAdK/mqnEaTtqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdsIoJM/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so14737505e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090851; x=1779695651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iV4KXyAPK+K+KWzEeqIiwRK0AcdSNjQuvN9IpFfq6U=;
        b=qdsIoJM/B+ozEXaiNBGGQtM61pt2v/z2YKCqEKvI9UkVIH3eMlMg+qywxpQx0uqYP+
         k5G9UccDVSQ+0k0Ubtvn59YqqGisr7wx531JGOvPX7xIrS5dynawka8Mkm7+tcTtLshe
         06llZrBQEGZz4iQvA93fBtHzzh7Z6y0qCmLxvtxovl+hLMDxC3TquW5O2/Ye2kgmLxVm
         JylqUG7f3CVjSRvkdCpIKNyiAylwaxdiveVHVQ8vLT7MUxqXpIWlpQUrwaKBqLUp82pO
         LY4UFxw6U+UsJW+8HlvQ7HGo+Egs6YY87CQBXZCSl/7CvgLVNTE4m70YPR64YmmsykIk
         27KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090851; x=1779695651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+iV4KXyAPK+K+KWzEeqIiwRK0AcdSNjQuvN9IpFfq6U=;
        b=sL75qoM2of1HCoGP4yo2eUiyqvylDV/72BpfJoblYvZOF3B7huUGH3i5cd2vuQGo1B
         P6w2GSCliCxJVCJ0+tZu5D9LH2Kfq2/CXFvl9uLIBVkWMjXMv7se1qUMGqxDJ0QO70DR
         TS7rBCy7HfkOvcdHr6vl0+EUWwu4vQ+4HuGcRBnvwj/FlBo7B8LOp+K6FjbPjm7RljMk
         te7VGbZr63ItyioD9VDBUXIqNtkXSoI9uXG1OVWlCfJSYky8E59p3hLjQGzH5vHZlK72
         Dv05LPNRa/0Cd0ZAMLWhWO8yz8VoHnsr2btPmg6vjqifIW12/nGtH6KBO2dPbIV53lvw
         s8xg==
X-Forwarded-Encrypted: i=1; AFNElJ9Hq2sBulCPH3BXrCFcm/oajo2Y3wkE4kJpJU/SnKFlSsdYnml1vvXQLnNdm3XkYJ72aMDPaN8fZYPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKwEsy4mBdOhuh+PwU/ib4Zg6X95XENl9j7JHjcW+XYnCpVBl
	2i8wqTyBRHxxOBx77UyxULMF67SZ8UNT5kie6hVxmho/DPLDM6WK0lwTf9dQMRQS2lA=
X-Gm-Gg: Acq92OHhc70316ArIxgr/7nSVZXHm4fHR4te1PbUgIqmSrGVrAdv+rHUJpP93R6Vtcd
	CirubHlDDEPtOsupFtx6NOQT6A9gi4drBQcQ1LMkQfW/vRC//nXNIG9KaFDVWiX6nXTAilA0wcl
	FnYbgsmvOhWl174ImAozaR9mckqDOXj0RaDZaVSr6GR+mqPNLFFIHGjZYOoXETg9htYOcfxO2BQ
	8a4ElobkZ2k+fy1RLnOXketIAq3ulB/cA/YrheDBg3vsXge301DspPVle9hbN9aJs2Pa9YaytoF
	52rRlLxF0R6ZHBq4J1DWqxESQy7GwApwPtyPod5AuGRDTM5YDkBoAQuZZCeuBQi7JAbu4mh3i2u
	EfxuRAJYjcogqzg+6FzBO6VvBIWLEe7Ttw4DL+ioXRAmXtWdTTArG4hdb0L4s6nSgaBmZN+WZpB
	/2CJI3rSDBkPAhxD0=
X-Received: by 2002:a05:600c:8b6e:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48fe60ecc24mr220895185e9.8.1779090851593;
        Mon, 18 May 2026 00:54:11 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:10 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 08/12] gpiolib: acpi: Divert OpRegion registration callbacks from core
Date: Mon, 18 May 2026 09:53:53 +0200
Message-ID: <20260518075357.112584-9-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518075357.112584-1-mscardovi95@gmail.com>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F1B465683F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37026-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 36 --------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index afd76301c41f..4802d4948f89 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1169,42 +1169,6 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	return status;
 }
 
-void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
-{
-	struct gpio_chip *chip = achip->chip;
-	acpi_handle handle = ACPI_HANDLE(chip->parent);
-	acpi_status status;
-
-	INIT_LIST_HEAD(&achip->conns);
-	mutex_init(&achip->conn_lock);
-	status = acpi_install_address_space_handler(handle, ACPI_ADR_SPACE_GPIO,
-						    acpi_gpio_adr_space_handler,
-						    NULL, achip);
-	if (ACPI_FAILURE(status))
-		dev_err(chip->parent,
-			"Failed to install GPIO OpRegion handler\n");
-}
-
-void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
-{
-	struct gpio_chip *chip = achip->chip;
-	acpi_handle handle = ACPI_HANDLE(chip->parent);
-	struct acpi_gpio_connection *conn, *tmp;
-	acpi_status status;
-
-	status = acpi_remove_address_space_handler(handle, ACPI_ADR_SPACE_GPIO,
-						   acpi_gpio_adr_space_handler);
-	if (ACPI_FAILURE(status)) {
-		dev_err(chip->parent,
-			"Failed to remove GPIO OpRegion handler\n");
-	}
-
-	list_for_each_entry_safe_reverse(conn, tmp, &achip->conns, node) {
-		gpiochip_free_own_desc(conn->desc);
-		list_del(&conn->node);
-		kfree(conn);
-	}
-}
 
 void acpi_gpiochip_add(struct gpio_chip *chip)
 {
-- 
2.54.0


