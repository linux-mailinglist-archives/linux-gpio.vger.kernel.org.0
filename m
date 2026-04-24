Return-Path: <linux-gpio+bounces-35495-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O1oC5Zb62lGLwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35495-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 14:01:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E645E23E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 14:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D940C300574F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85673C13FC;
	Fri, 24 Apr 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSQW7sjJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540843BE644
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031969; cv=none; b=qr73hX3QSQEliX/uevpcyePI3UE3iTQqr4rGdmOg9ixaTaZiW8Zl0FeuPFhP8czh1kBoBnY1LuFXN/742xwCVTjg1O3JTetjvY6qEeQDbQkU6LfhwG3IyMdBPiB8ErYPoTjTOEXLB5qTPvtTBE3mmFkcvAVO66Nox51NU57UXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031969; c=relaxed/simple;
	bh=jDWLv4kS5IIsQPbU9CDx+EPbYVNBVukoZWMhqKV7stc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sM7h2vmFmnUGVEDgbISqpLMNs2yM5w/q0PZrus7NCnvBLvs9PtLqwo1YbbIP8woiMnF2hJTQAfZdBRMLHy9BOrRgwu1+pATOBbLfZFQ8D+kjQFiWYVIvS/5LRusZMWyEWfwfbHjRVHIlCuTk3G7fHI1L13gi3UUfkDbDOLoJFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSQW7sjJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so55732145e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777031967; x=1777636767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GV2DkfsEOZr/YRNGCag/YAFJsAJhuzY/Xg/dnWFXV0=;
        b=kSQW7sjJC9DqeQAlSurglObLlLRTDEeVfBDRig8y+/A7+mSuwjcm2Q5sw42/JT0nqX
         a+4XH/kTS4bytYfM0d1jJeGu/STlI6fOBv5qZxcTEIEmX5XBe+1j8Tn8npLPUF2/hHOa
         53h9kKYGQfKHCusl4v7oKGnbsQHDd5QYRkS0WMPzLoVJAf+qUBH2wsWllqgVZrhUE1hI
         618LsQxFHj9Y8zmEhTxdVskwyFKf5q1UngqGNm9vPp2QysxNBod0K6NsRZM/0CcRVkqM
         2vMUU61C4xOJjNUGPch3/cWRnuzydtiK5Nvw7PLf5uzpdH+W3TjoZgYORoBfQpa6V3pN
         4CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031967; x=1777636767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GV2DkfsEOZr/YRNGCag/YAFJsAJhuzY/Xg/dnWFXV0=;
        b=tJ3HYQO6WYlgo29Lhjrh/PY9ARQXzGrA14FK2yQtaNsRIpSPUD7t7cDR+3oA8xOqfq
         H7jD0ppUBDXj8pDziiWY8CCouSwF8E4Bpiz5MftW93+J7ZgfLpncyoWC9RWbj1zANAG4
         CZ2nCx5xvRw8g8NO5vuUz5fIOFtgRDcd1gFY0mf3zO8Alm9Bpup04moiaWbOBy8nPBs1
         Y1o0ceNB1Sbg5h80QYwyKgjkQ26Hl19yaIDktQBZYj1+OHbQ18wiWmO434q1P3oq70Gq
         dHUjg3hLQg6tE3d7QGQye1/koEaBLkdhg0J3FFq1En46cX5VzcwuJjeymzNZ1qqAcJu/
         37Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+YdXTOGMKJw5C/FUny6Z2cV3RSB9WSB/omQ5xah2soNB7Ud4oWtdnYAskxWBvk15M3jCS4WHSuMPKs@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFENxuHHJZnh3SBnq/+xV1T4vggFf4ia9kJj+H9GW+C5eiyQB
	XJKcdnuvmf96HwS1Zypwgzr2+gxME/KWkU6yDpKrc8HBji8bRNihsOQy
X-Gm-Gg: AeBDieuaQ0bUC0MivuD/Y4Am4fyCibgT6tm4nC3ZPEaNXpiBOViB8bLNDVSb3b95MED
	R7jH3TlRmSjIkn/H6HkC4ReY3ayNHdY/mtUpnrim2x6mHJf+ACkJqLoBWM+OXuZ6fOpYJndXQnt
	stBy97xgLRp7GoKtpVjA2lw2vLPk7rWWOpuU7s80aaE7qKsfcHGshgQ4Wfu9MYshNetoC05m+37
	YNW5ilLUYeDjDvqR2P09jbG+/sK5+ZyrJsiqEk+udP3CmA51RgdKUZu/139DDOu18616vWvvdoe
	Cei7ycFSNFQI+5Z4HyJiFv21fV8MLCSBmGdOLb59l6GQs3sNC9wPz0axuHjgRYGShs1wO0S1ZxU
	iy+BJfN6tFmZp8JKF6VWd6TX08gqNjDmSoWX5Yz7vBWsSsosfbRwclbqtyqAHzHvFynQPL0YWtm
	gFL83PQ4Mf2QPAMyNbsuVnEFEUquqmZ1zYU+6wz8sw6dZD8pWOABD0le/UlHT4kSKoW+cea1KB
X-Received: by 2002:a05:600c:5297:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488fb74a431mr499837235e9.8.1777031966554;
        Fri, 24 Apr 2026 04:59:26 -0700 (PDT)
Received: from ST.. ([102.187.193.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm24193952f8f.21.2026.04.24.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:59:26 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: ep93xx: use handle_bad_irq() as default IRQ handler
Date: Fri, 24 Apr 2026 14:59:20 +0300
Message-Id: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7E6E645E23E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35495-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohamedaymanworkspace@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Replace the temporary fallback handle_simple_irq with handle_bad_irq
now that the driver operates with a proper hierarchical IRQ setup.
This ensures unexpected or unmapped interrupts are clearly flagged
instead of being silently handled.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/gpio/gpio-ep93xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 1f56e44ffc9a..8784e433e1ff 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -323,8 +323,7 @@ static int ep93xx_setup_irqs(struct platform_device *pdev,
 	}
 
 	girq->default_type = IRQ_TYPE_NONE;
-	/* TODO: replace with handle_bad_irq() once we are fully hierarchical */
-	girq->handler = handle_simple_irq;
+	girq->handler = handle_bad_irq;
 
 	return 0;
 }
-- 
2.34.1


