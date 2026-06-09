Return-Path: <linux-gpio+bounces-38138-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9O5/KJNiJ2p6vgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38138-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 02:47:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3065B6BE
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 02:47:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=trailofbits.com header.s=google header.b=ga7cN1Us;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38138-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38138-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=trailofbits.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD72F303CD64
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 00:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5D5275870;
	Tue,  9 Jun 2026 00:46:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44A23A566
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 00:46:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780966005; cv=none; b=VoQS9gLqqAsKmW1wFyoVkDXb+dEyN5lJrpS8mXPLjXsH9UspcSlVQHy1C2PJD5np+yojURBw1u85C0e4MG/0bZ9B1qY/JTN0cdVLT690aUzqpsEpXEyu3FlrWlDhgvkTQxt/MVWLrIP9ej1AYIVt77c9iU04/kIzaSLAeJ5yPgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780966005; c=relaxed/simple;
	bh=kALJx7QILgJJyNlQ+tiVKCOySe9QkKe4mxIWdEociow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cl9clJvA90O7l+uX/ivOmVTzBMpHzBjkkRxFYvFl1Ms1bsqSqEmzzjFq69XvZgu9BATtU/LbcSzSexDeA5zx2aEsiVoxYPzOMyoPBiudu0OjQKJkJjgafxF6GSBZTVdMamXo4VmsVCFZ6dlWW6DYJpZkrCJu9ehKcnCnnZ9VThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=ga7cN1Us; arc=none smtp.client-ip=209.85.219.51
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccf0fa0aacso70447886d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 17:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1780966002; x=1781570802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ILOAyHOSlhfccfCUKsknVm/mrdYrM592Xo+LHudDXg=;
        b=ga7cN1UsSfrrVwRbNHjaI3IKeNKlPAPtzJg311edytjcnOIl220dHzeEra9wr6HXCy
         jf+fG5q42EGXWX9FP96uTuNSdAemx23R10wT9umjVzK+z9Ue9WdJ2HBjeM+KPVlydKGQ
         C985GCae766seJ/kXWyNrAXHwNgy4UU5wsafVDLVaucWOdYD7PEXZSRWmQS+KO5riII4
         Z98FAkp778VI0W2h+tI0tok09d/Um3ZgGRblP7PhPC5ctzLecRy5GRU09dXZdPkUWHOR
         3ui7mgyRwlYRtSx8opIHS9GcaNRDd+2FI2p8Bm5g0qe3M8KtX5krQa36k1AjcdP1ZuiW
         C8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780966002; x=1781570802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ILOAyHOSlhfccfCUKsknVm/mrdYrM592Xo+LHudDXg=;
        b=f8SLC6nCh9vykwSCOvPbE08iKeg7Xu9L9Ti7JOHK9CZxooG5I1c/dYsjU6iH/Q4Jq2
         f0WuVGKP4lhj9edvxBqbDYBhoPfoBzy4TuIRWj7U8rJPydfjNI6apaSzTFODiZNjxIv0
         bGjdIM1j5flXxUya0z0GhQcKdqenVlWcme3SuXZVMpYC62o89bj0JM7D87Xv3DVDTas0
         VDfz1gP2J5e3vGY472C+oVDYH49FidG8rJEwk73mExUz2wtZcLI2OE5w9uFJAi7pbsG0
         qBCbhEe18Mz8QE3J8FCanPHFGZsSqnexzdYotchVQdINP80l5loaelFCLuFz8murLp7+
         ZpgQ==
X-Forwarded-Encrypted: i=1; AFNElJ898ig8d9tczPdT1VL3yRwJPkc03xrQy99EZgsO/RTNHpsHzCoYylSj4TvjZlav7nNYDaZR2VOeoAyG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2oqId//s77jKhmBeIXYyPOGNUqg7yS5V1NpZANdNOM7yR9e53
	65FewW8IV8nzvIymm7NUXYNA43zInS0wsA2X8YNbQ7pmoijisKb7I7yrWmfK6F3DxS4=
X-Gm-Gg: Acq92OFGqXBahbnTZtOzt+TkZGvhMgRf7ETOU5djcWgw9dUTXG96DLgxxlPWdosnEhg
	h6dgSZayFYmi40afuG+VQ2YFJiCQuaMVUn5vD4Gs9ZrXnLlpbDwP1ICQ5CZdBG4VNQNonGpqEn7
	KX+nu4Absqkc1xdVLEKdFgOgMzOcnqZI0/B5szmLS76S+CAnajF2DpG/ccCMUeC96x7nPRf8umL
	AhE4kAdylxWDp1JZhxTXi0/+KfuQ1K9YqLGiU4l3oH4hxr60WNAWRaQFZH0tvxj8tOvc5R30XVj
	ro/qInJy91ZUL/fqSr2FkC5uJO6ottG5xW+KVDJ+nh9lWn1PmsXOpMPrCwLvQxCggZopH29b2Ut
	Lzz0J6+bPxPFqpEkHtnAshI9aqdkaShrZAPPLc22IZWTi8tUP2HVyikqKLyR971sfeOG5f2RTbQ
	seFgmHRDvEPTno1dh0opbXuOGWhAkhO+f7jgOKNA==
X-Received: by 2002:a05:6214:1029:b0:8cc:ead5:f377 with SMTP id 6a1803df08f44-8cee6273f83mr226081666d6.38.1780966001921;
        Mon, 08 Jun 2026 17:46:41 -0700 (PDT)
Received: from localhost ([161.35.96.86])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-8cecd2682f8sm183337366d6.43.2026.06.08.17.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 17:46:41 -0700 (PDT)
From: Samuel Moelius <sam.moelius@trailofbits.com>
To: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mockup: reject invalid gpio_mockup_ranges widths
Date: Tue,  9 Jun 2026 00:45:38 +0000
Message-ID: <20260609004538.1240091.3fba33a20b88.gpio-mockup-ngpio-u16-truncation@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[trailofbits.com,reject];
	R_DKIM_ALLOW(-0.20)[trailofbits.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bamv2005@gmail.com,m:sam.moelius@trailofbits.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38138-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sam.moelius@trailofbits.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sam.moelius@trailofbits.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[trailofbits.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,trailofbits.com:dkim,trailofbits.com:email,trailofbits.com:mid,trailofbits.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F3065B6BE

gpio-mockup validates only that each second gpio_mockup_ranges value is
non-negative before creating the mock chips.  The fixed-base form uses
the second value as the first GPIO number after the range, while the
dynamic-base form uses it as the number of GPIOs.

gpio_mockup_register_chip() stores the resulting number of GPIOs in a
u16 and passes it through a PROPERTY_ENTRY_U16("nr-gpios", ...).  Values
greater than U16_MAX therefore truncate silently.  For example,
gpio_mockup_ranges=-1,65537 creates a one-line mock GPIO chip instead of
rejecting the invalid request.

Reject zero-width, reversed, and over-U16 ranges before registering any
mock chip.

Assisted-by: Codex:gpt-5.5-cyber-preview
Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>
---
 drivers/gpio/gpio-mockup.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index a7d69f3835c1..91ff789c4fa6 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -17,6 +17,7 @@
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
 #include <linux/irqdomain.h>
+#include <linux/limits.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -578,7 +579,7 @@ static int __init gpio_mockup_register_chip(int idx)
 
 static int __init gpio_mockup_init(void)
 {
-	int i, num_chips, err;
+	int i, num_chips, err, base, ngpio;
 
 	if ((gpio_mockup_num_ranges % 2) ||
 	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
@@ -592,8 +593,19 @@ static int __init gpio_mockup_init(void)
 	 * always be greater than 0.
 	 */
 	for (i = 0; i < num_chips; i++) {
-		if (gpio_mockup_range_ngpio(i) < 0)
+		base = gpio_mockup_range_base(i);
+		ngpio = gpio_mockup_range_ngpio(i);
+
+		if (ngpio <= 0)
 			return -EINVAL;
+
+		if (base < 0) {
+			if (ngpio > U16_MAX)
+				return -EINVAL;
+		} else {
+			if (ngpio <= base || ngpio - base > U16_MAX)
+				return -EINVAL;
+		}
 	}
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
-- 
2.43.0


