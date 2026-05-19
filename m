Return-Path: <linux-gpio+bounces-37115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLJdFcALDGo5UQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:05:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C88295789C5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAA3F300B297
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E3C3B38AC;
	Tue, 19 May 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYqobdPY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D193B2FDE
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174049; cv=none; b=o+efnZJSK1kSXehcEWNWRxhKL4UZgGXpq5HXzBKPx5uSkVwdrfLTQ6armXZV+n7GPxUKEAK9ugXPqrKHpZuzqKBZAcur1sJtwG+x+WE8kSS1YLb9pCHSfXoAVj/xzLdt5f/uDwjR7/yKYozXLGn2AjV7GDxs8YCBFExqaPBRuug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174049; c=relaxed/simple;
	bh=ZO+sueJVrR69Zhx9fYyKQVNvrfhpta1Aq5px2+ybHl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7L2XqN0nZK5s/wppMwAoBwtNT1VTW/yrdSveeRTmClpJPtHKJAw4N0KCZFII806w0O97zT3zYZtPFWOh6LCrrdDWmaNFmBOxyO/oRZHqlWfDDTTTnXYmoTzdC6BPHstVCtrV+dR5foVkGkpITHNHFMSVwl5AQhvRosXKyWJKLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYqobdPY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so34665125e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174047; x=1779778847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaZKCHeIzJcYq9VGQ5atd5s4RbOR0sd+cuGJOBOqccs=;
        b=SYqobdPYf3U9cm+blOFuda9VMItNavprmCoFhDxJRbqEaLZj+OArQ4CaywgKRotCd9
         0CV9Rm5rAEDR8uY1S/bW2sqM07of+hXOmwZ81thO5mLoGJr0a26rTqgY5wsRX1Wx5dYg
         LBADCVhzel30E1gU94rEp/PrzhLKcmDdLPbKZL3b+gTYe/1zBPJBuFG+zidQPuKo0y3O
         ywz4zKvjDaNA0JsdpdGuVmJVWRVZL+rekhpK63hV9RZmSSnbOj5646mvpbKMHF0+tq7L
         P7MiGQ17qiJcDG17U0kDcSkroDq+skGF2WDFz9F+khKN54epcAe2dU/jpUV76bpOTcty
         rk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174047; x=1779778847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZaZKCHeIzJcYq9VGQ5atd5s4RbOR0sd+cuGJOBOqccs=;
        b=MY9oEXeWFgOcY9egIkJFUAUrGziSbsM+F5YnrWhKt4Hmf78j/7S25OEEKAs2uM1AWd
         qXqNBs427OMUiZPBoEHKLjzuhCI3Z9N+FBAcggwBHp8+V/Bx91Bti1bPR34ZRifkKzyb
         SOVJKO33ZY5a5zeyfCSWklZdcwrBhiHXXnFEN8jFEYEl3XhJfwZkAIdzx9H6g52+JRv8
         cwqB9m0kk77kQw/a88iSVs9Chfx3UFqCtWEonn0+B/zLU8ipcJhM6gFIZNV1SlDb88cW
         2kJtWreqmE7tgIozdrafF3058xDa654upIF8eLiEoXQY6hiMgbt7Isz8Pcu71eb+piMi
         OYMw==
X-Forwarded-Encrypted: i=1; AFNElJ8/EC3sJqTUfxmM5XBEhNPE1SBQlvHusPGOse5t4h7zDCE90BhdS0cUFEbs+wNhjvkUvP4VqzAMmsKC@vger.kernel.org
X-Gm-Message-State: AOJu0YykopgnS37qhiTxhN9UJ1xvEJYtpdu8UbspA3I4pX8MnnNfhdqb
	aYvqZgnpDVUvPVc873TlVtv6jMLkjfwR3nkGNzfuKIZIVNNSpnbKUpLK
X-Gm-Gg: Acq92OEB70JkSp2ToSmaZZ6dxR2OTDF12PYSJx2NmrlgddaKrbfNaxlvDnwphIm95fl
	1/A4xbREBJJ/zCPQu3LsxP3W/iTzXGEPDVXQ+TPAYs8XT3t6sRPtjSoDPEGO869cnUDZyVnfIcp
	7qjCrgVVYx7HsSpws4decADV0/RW7+pYrRM359vTr1h5bT8ZW10F0khaOSQS3VvX+SQPDNGlw0g
	+C3lF5ExDuGfsSrZvUKXWzhFXNd+xkH2lZR3gPOyFrFTVAJgJ8K3sZ3WCWU4hpPR87B6F2+tz5j
	zQRIN+c+cfpWS9gqQJow4fK20srZ+gS1cN6hS/RMKlmYYLxn+FMmLk/7X06QyRoYJlELNN/VPxE
	fAi/+SFRiijxnygUDRvahL76o4IMCV0MZEyzbQkLN6IHIfN8HXA+vezTzC05ow7pp1u+6ofH2DM
	pA3LoN2XRgBCpvSyWU7NU=
X-Received: by 2002:a05:600c:a406:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fe632a02fmr239198495e9.22.1779174046426;
        Tue, 19 May 2026 00:00:46 -0700 (PDT)
Received: from G614PR ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm149177055e9.4.2026.05.19.00.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:00:45 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mscardovi95@gmail.com,
	westeri@kernel.org
Subject: [PATCH 2/2] gpiolib: acpi: Fix resource leak in OpRegion cleanup path
Date: Tue, 19 May 2026 09:00:31 +0200
Message-ID: <20260519070039.9280-3-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519070039.9280-1-mscardovi95@gmail.com>
References: <20260518103302.GO84797@black.igk.intel.com>
 <20260519070039.9280-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37115-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C88295789C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If acpi_remove_address_space_handler() fails, the cleanup function
acpi_gpiochip_free_regions() previously returned early. This leaks
the connections list and all requested GPIO descriptors.

Remove the early return statement so that connection cleanup and freeing
of descriptors are always executed, preventing memory leaks in teardown
failure paths.

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index d381631ba6f0..b6f2af23b204 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1239,7 +1239,6 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 	if (ACPI_FAILURE(status)) {
 		dev_err(chip->parent,
 			"Failed to remove GPIO OpRegion handler\n");
-		return;
 	}
 
 	list_for_each_entry_safe_reverse(conn, tmp, &achip->conns, node) {
-- 
2.54.0


