Return-Path: <linux-gpio+bounces-32141-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLxbDr/SnWk0SQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32141-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:33:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FED189D25
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D5B03043AD4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2795E299931;
	Tue, 24 Feb 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7SqFnLf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF081C01
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950778; cv=none; b=BsxhVA9hY10rF1kv0AZ0WpL0b+NoH/HbiH35pC5IO1ZVDZQWRYl++DeYC34HEeT4aGk9WXcK/SHL8RrA9RrYAl1fYE0StIkNnEk25Z32Aa9XP0uBtieZuW7zL4PBLBba6l68sr/w4MlgVwbLLqZs1MdNbhEJ1Uw/zC3JID9Mi1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950778; c=relaxed/simple;
	bh=YS/sXiuj2czShLDQXAAPbRvZRuP6Pa4lzIjqWXq2+0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qsFvUYRjpKV7oTud0L5O0vjRJ+Ovg1OrpzT15pnOkE2zNFC162eu2tlqvVXiTb5oT0GSqHwpOLNCsbHChTIfwxdc8ziLYpqJBqSJsPMi+oVQWc7hR0+kc5PUCekKoZnt0kHfOZlfagNb/4G1nDK7lvtFlQWZUF+JlfLCWslzNC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7SqFnLf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a79ded11a2so39569775ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950777; x=1772555577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8MyfCwShsdn38owSIBBapSosmGxnp1Wb39JER6IFqU=;
        b=c7SqFnLf+1eIcjlVv9sb4cQKYAipCjOj0VbLcDrb/NSDSqMBJLp7s3Ye3DdPQGfaTa
         kGupdr4jBdK3Sfqqfjc+pIoBG6HSC+3AYk2f5FCYtwRGXUG8blAQl6KPw8FZXsQLdp+f
         4Sz5RhXp8Hvv/CFKYigxFLjlDaxeT9qQWANDdCgqk1uym0o3i3ljTPrtTCzV3pKa5MGa
         nHeEH9ZSKAtOreQje/vUKbA1Xe88lnj6rYts6T8lNh4jODS11/yAA0g5OI8LtAXxjMCf
         pLiTDRxzU+rMppNNG/k5vppvXwhXBuV3YPy9IBRQCjkygd1GTklMsCZqxDp9Ps6/nblT
         orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950777; x=1772555577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8MyfCwShsdn38owSIBBapSosmGxnp1Wb39JER6IFqU=;
        b=fbsI6/Tk20VkH6mVN3zeRM+fk2pvV93bIZ+L2CdBa+lA6qNOSPoYVWHva9MaR+sAxk
         Vp/+pSFQjAl2eOJlt+LbHcZFT8N7GiB82u6AvDI5DgmmIsI0GKkS8QbEKaqCw2G5UgjA
         Car+L5fqXkgrF4GCt96xjEzZakBVkQ2hJ8UQGTYxpSnBFsdq6HqaBvOPuNaUfHlBLVaI
         D14rIWPpye2GbUeUranvlFAg8zBuEKccb0gsWfGEEF5H8putEmUMKVgAuSC6FusE/E+V
         oUekkCoit49Lb1fugBPEnjgbE0pm/33Qro9ngAMsJatj7EuWZCIyFv/zpybdjyvJieFY
         OKiQ==
X-Gm-Message-State: AOJu0Yy5+Tus0g2smU7CPdxRIrCCifAC/SVliVWbYyWTu/2D1vxd9k4z
	Yqr/uD5mYoTLbGZqefOENGvj6pYFytbf9NAFPWUeDyQJv5E15K9BRj7Nyy902ZFv
X-Gm-Gg: ATEYQzwJfyYB3lbsNPzyjSy+ARNU4mJagyr7XSWNtnGRPNojRnVlZCvtv0+UZSRMDD2
	Aw4v6PM/l++h4jloaYpJobPlHQDz1L77K9/iqB39LKQCU46GTAmOx2p6k9m+uJGb8HPaG6Sdx7E
	2rD8A/DSmxcC3HfSAal+sNtADG92b024HAMu7LKidSYHgKYLz3Fco7zRMAiPmXz9oL8g1ZvpHM+
	gcx03pJKyIdx9AkcSLjeONJ2fyWLN6JZLHwP1sAmJkBUu1XTkiZKf5WNMoUdMRMz6N+r8PGD6Al
	/eX6fhJgmDFRD3cJoDZJKYxWXFYgM4wUuHPv5vrK2fiNL/pKdtqSh1oiXVDXOkiaDqgkNSFFL6o
	lj27W5jSKaWFnnuYN8D+dJi06wxsyJRLMIDrmGWPV0L7qPzhCJO/LnonuhKAdrqzzzNtUoBVZUC
	eTAc7THZQT6pPvSOOR2wJX3Nol3m+EjXT5cD5DR1HjQhaIHb4Cdm90rl0l5pCPjhHXz3/KUiJqE
	LLKrPfFA5aH0A==
X-Received: by 2002:a17:903:1212:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2ad744edbf3mr139834775ad.36.1771950776865;
        Tue, 24 Feb 2026 08:32:56 -0800 (PST)
Received: from pranav.. ([2401:4900:ac8a:db5:a27e:9711:3a:8bfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750591e2sm109058115ad.91.2026.02.24.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:32:56 -0800 (PST)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: linus.walleij@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback for GPIO device lookup
Date: Tue, 24 Feb 2026 22:02:34 +0530
Message-Id: <20260224163234.653438-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32141-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranavkharche7@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90FED189D25
X-Rspamd-Action: no action

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 drivers/gpio/gpiolib-swnode.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4..d6ab5bf0d2f1 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -43,23 +43,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
 	if (!gdev && gdev_node && gdev_node->name)
-		/*
-		 * FIXME: We shouldn't need to compare the GPIO controller's
-		 * label against the software node that is supposedly attached
-		 * to it. However there are currently GPIO users that - knowing
-		 * the expected label of the GPIO chip whose pins they want to
-		 * control - set up dummy software nodes named after those GPIO
-		 * controllers, which aren't actually attached to them. In this
-		 * case gpio_device_find_by_fwnode() will fail as no device on
-		 * the GPIO bus is actually associated with the fwnode we're
-		 * looking for.
-		 *
-		 * As a fallback: continue checking the label if we have no
-		 * match. However, the situation described above is an abuse
-		 * of the software node API and should be phased out and the
-		 * following line - eventually removed.
-		 */
-		gdev = gpio_device_find_by_label(gdev_node->name);
+		
 
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
-- 
2.34.1


