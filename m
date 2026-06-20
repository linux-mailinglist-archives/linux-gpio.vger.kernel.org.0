Return-Path: <linux-gpio+bounces-38738-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6MoIbq3NmoVDwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38738-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 17:54:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BC6A928F
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 17:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PF7bCSmS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38738-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38738-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84DB03039029
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 15:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6486E397AF2;
	Sat, 20 Jun 2026 15:53:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473E397692
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 15:53:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970807; cv=none; b=F5s/2EHZMy3cg8x9MIhDjjkldyhuei0cN9nlK39gE34KSeRXmvVyl7FhicFbldv6X03IOPC/mxDXlC0G/7CiesZ8hUjVwVrt8Zs/cQtziuLlPUZNoSQj7wJD/WHnhheYjpha7RK0c/gOZZ5YOosT5xAEuFahDIsaP2uf0bPhIl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970807; c=relaxed/simple;
	bh=DlgWLEzGgG0nUyN9ICtW/q8163w7vFFOvs9xVKURyBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UarYbQ2AMPpSmSwuhbcUGfKe5YJD6qDUrog/J8k/xCqO0SkG0fenn2/gYE5/eDeE/BW64K979Ur0lkaoYEn1RmGBRWXaYkdV/PSst+MTZ9rCjv106S8Ip/RDzsxhg9cCWD6cA3pVLKzbKPT8jB/IvgWG7y8NZnJg4xMf6ka89D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF7bCSmS; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso25642655ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781970805; x=1782575605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99ux+NmuUXucZal6I4fcMAQAAFgyJ7Vb7HpRZz/S0uk=;
        b=PF7bCSmSV2CZvnExFontBouG8n2GZkngd7/UWYRnwsbmc5k/Xv0JV4DoKWzIljUAS7
         prwisRt3UPjcBpai2nHL0CV4SJCMNYmDwV5foWR6nZLN88hmOUu840+oodqo/mcoqngV
         Aqdq0YUnQdETMzTSGIJ1GL+yIrX5IT/SbTUZXhPM1JIQz0h0ZaVM8LvfO8AaqC7DNlSm
         5zfQG63w604+UUOJrAGirEuzVB5Q8QYaPZkTJlIOUf6uhmjI3xLHO/FRyJCSmX6yencG
         LI+jV0xsURJtoP+gZZN2O1/Kx5bT+SvZT/s8xrW7pUvXyPxP6nh22zBX2TpHLWfV9yPN
         lrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781970805; x=1782575605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99ux+NmuUXucZal6I4fcMAQAAFgyJ7Vb7HpRZz/S0uk=;
        b=aYD6eVpJ4nOmnprGjsTg90G2Noi8JGIVOpUIrwO5bCy+m8BLlhxNKn29BuGbozwdLs
         VSSP7QEti4IT/TR6bGABnmgxeI6ExNRLGMep8ncxjA8U4lmJdfzSNsw56I+F3S30b+1L
         oywdhfR5+2qk+mIIezdN4BeAqQ6YE369qRzkgBhQIIeumxbVlJGTRwgMjbXsfmOGvEpG
         9z9SrWCM2KLcagRaBaOwuQlGiSr8drZZw+UVaFicNv25mU+zWJJuZxJqNivnoGg9tGsS
         7tQMu23xuPUPn8nIr2YNMJX/TJAUzluSMk8V+eEIWzlWi6xCxQAy1S/SFtjlH25bVs5j
         Wr4Q==
X-Gm-Message-State: AOJu0Yyd+5KU9GprkXoO3QziriQtTab0PET6K7rLhXm8dm3PZTeiBCu9
	Jhfnv0BPmrZyTd54ySK2NwEuBBdBYaORE5vl5rqGCHYTxvkjHc2UPKM9
X-Gm-Gg: AfdE7clC1y924KCMB+/d9tzLNxt3+e5mzBy7B/0++rbUZYniequcCXHtKDkIgFR+pgQ
	lzvvFrMezHtuDxEwWS9YQJJr5d7cYmZDXIyqUhUdYY5tzd7L7xfab7THtuiieaOEDylkfIq2L6x
	U54YGC46g35AvsCFoEnCAPlXzRg6dTRBOIJnUyHp6r5CNS/1GQq5AYVarnG4hhZ1Y5N7x8Cy0vk
	ibtizN5kvdRH6UQ4Mwcxcf/mUTBfWLTZ9V8Dnfdu4xPW+hOrufWpjI1i4ZEu86WL5SBKBUTyroq
	83or5+NufP5SC9ndU4ajNHvlG+uOXF8T7zOnmWU3jLYR7GFCA73DBXZOvZLam/D7HSdZ+eIADj7
	9iXCTAwn19Dp+70iTOuBo7HH5MRn1ejQli3EYlIhd5vfgJzeNIM5W1Lx7fLiZKW/thOKt+fd3l+
	V5eUvjGrdkanKqJdps7cbcHPCGtLYEbJ8gkZOsZ4dqbZs=
X-Received: by 2002:a17:902:f688:b0:2c1:f262:494d with SMTP id d9443c01a7336-2c718f622d4mr84491185ad.19.1781970805414;
        Sat, 20 Jun 2026 08:53:25 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:8e0e:956e:b09c:23cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdcb6sm26221285ad.57.2026.06.20.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 08:53:24 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] gpiolib: initialize return value in gpiochip_set_multiple()
Date: Sat, 20 Jun 2026 23:53:19 +0800
Message-ID: <20260620155319.79994-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38738-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:u.kleine-koenig@baylibre.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 073BC6A928F

gpiochip_set_multiple() falls back to setting lines one by one when the
chip does not provide set_multiple(). If the fallback path receives an
empty mask, the loop is skipped and ret is returned without being
initialized.

Initialize ret to 0 so an empty mask is treated as a successful no-op.

Fixes: 9b407312755f ("gpiolib: rework the wrapper around gpio_chip::set_multiple()")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..cd2a619da456 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3778,7 +3778,7 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 				 unsigned long *mask, unsigned long *bits)
 {
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 

