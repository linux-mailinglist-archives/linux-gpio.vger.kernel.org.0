Return-Path: <linux-gpio+bounces-31682-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gVQVDgT+j2mwUwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31682-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 05:45:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54C13B131
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 05:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F50D3006034
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 04:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AA52F616B;
	Sat, 14 Feb 2026 04:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vkjg9ed8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC966299937
	for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 04:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771044350; cv=none; b=FCv3r26nYv0PMvsDjzQ9SMpZudvxU7M4CPvQ23thJ5HA7CHyxqLjshfHeW1eEaz4boJghs0whqX4ef97nRdDJ363BlKGpz1SGaFmjNI6wFbyJtKCYmRiJpaAz+7OBKe9SFRP8i635VIYoBXYV1ZB0GM3AZjw3DBrQ4CEiT+J17Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771044350; c=relaxed/simple;
	bh=o/GV5jieQ1nfLMF3Kw74P6li2KB/ycvzwnF/hdIeyP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qe09YTG6YJFaahP+iCT+S06IxTQrgqUWDQUbjJd+5ta/+/DVNWMvrN8gMP0CHINSwdESbwqSiC7bVU0nNY9UM8Ocm/vlvZlTLgwzlLOqcNjdQZJuqDjEYSe7wEJ59vLLykbZGnJPH55Amfe60raubxLw+hAV61txWYb3+X335lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vkjg9ed8; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad9238d8fso1598151d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 20:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771044349; x=1771649149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R43m5m1ez1GonWOxLG/dVD5h7A9CUwXvLk5pXGze70s=;
        b=Vkjg9ed8CNNTXxgQ+ueU8tL2WddHUZ3dIR86GTMuuYRXSNMrQoENP1TomfwD+AKqmR
         eAmdyf5ZqtCmfWHWKTtUmztOKeL4lX4qAFNcEhBP5Pnpg5j9hHRBnuvQcgweG7I8z3a4
         TKDSUbI0gzvBTsczVQdrMIxfxVAUBDtoY08qTGGEPruNU2rnIgJnOTfRdP7ICdc5JtLY
         JSI76AX3sm6W280/tDnaTLecOLhKBebfG6be3UwanAYyDE+TWXH0BHF8tCidEt0SYsC8
         eFcqJSAcbRqJo3m/bH0m1jJmICGA/jP1+n2eRIZChigu9USecD0lPXjDnAKnuXpF5eq7
         i+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771044349; x=1771649149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R43m5m1ez1GonWOxLG/dVD5h7A9CUwXvLk5pXGze70s=;
        b=VpmBIAqViFamd3b++eUvjTo0LfOI0JygU5XTw4BvV4bGF9wQOr85USXT6U6urGXXTS
         NUAO1RfKGp04VL3ZH5xRnD+u+2WP4v4fTaB7VmuZ7TZ8p2PVU7Qg1R8MH6FKstXozL7h
         p6t503oOS4dBIQ8MnfvzJgiKr2CRp5C22cm9Jp+msQzXkWQiyWlyksm4ars8DicsLoha
         Zv8bp34SkgC88+FU+aibR3uuJVia/vwzqHj9SeLXnXZ/g5FT0P/aeu8u3FdZulvcP7zi
         QBQMjbnghw4f6Co2Xh6tNtE9ZyxtQrBsbyJnCRdnTevrdNb68KNgGv4OA46pQQw8jiR8
         ty/w==
X-Forwarded-Encrypted: i=1; AJvYcCXM9njaNl3R+fXUG1lUI28OP0HVqswqfTEIhUfDN21FvuHVtcJVREaKC1JbCEFP4+BDe91UW8sVTL5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyLM/Vl3bZI8wCFz1QMijFLkK4K9AHWgHW5RLqf2n4S4sjlcMlT
	HRh6/t8BxUecOnEzpPeKNI7Q62RpCdOlVTsAMtEiW75+pUayCADClKIY
X-Gm-Gg: AZuq6aLjuYCP5Pde/yLmV0hEMga1XxmUtVWaTy0NlPYvkRsPXl9PHna7G8+cf4I+qj3
	5iLIuihptKgzpOLsYZWSBBV93d9wWENS19PzKSZE3km36x0pn4OqbNb+NB4/irocUooqcusMgyb
	LiQgZy8qnB3Cib3p71nz1OOZ3wnRgLLWRz7vwWHEdNeWg02Dte//XouNYogqOG3crIY2jDM4x4X
	vdn9XBKrSDLNUrY7RFH3xjgGWqWTN6cE+SeCn2WaCdBp2LgMYogNYiSI1kSM884uu20YUQqYE/i
	54b/CsDkzTCVAnPrttrems2QG/Cw7Ag7jyCRikIP3DzNMSfwHFJnK9kHBPsylIyRr8KHRHg/6AO
	gitlSEzvaxP4+96YDbhZR1AJFMbeke5LUtJtqzJu0afKxnbrzYAly10ttMK7ozxQo8s84+BBd23
	rUhiXK5vC63hB50LFn2+2pIYlnYuF3AzsTF+dcWeo1kp+kFq3X6DBS+7FOJweDn0R/CkdDLncVi
	7NPUtEin6AjUp+vtsCoBQ2NzHH9t5PccNU0W2LYpcnBrQr/Roa+Pw==
X-Received: by 2002:a05:690e:14c9:b0:64c:2114:17a2 with SMTP id 956f58d0204a3-64c211418c1mr1742970d50.62.1771044348735;
        Fri, 13 Feb 2026 20:45:48 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22eb2059sm570067d50.10.2026.02.13.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 20:45:48 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: nomadik: Add missing IS_ERR() check
Date: Fri, 13 Feb 2026 22:45:31 -0600
Message-ID: <20260214044531.43539-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31682-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E54C13B131
X-Rspamd-Action: no action

The function gpio_device_get_desc() can return an error pointer and is
not checked for one. Add check for error pointer.

Fixes: ddeb66d2cb10f ("gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpio/gpio-nomadik.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 97c5cd33279d..e22b713166d7 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -430,6 +430,9 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 #ifdef CONFIG_PINCTRL_NOMADIK
 	if (mode == NMK_GPIO_ALT_C && pctldev) {
 		desc = gpio_device_get_desc(chip->gpiodev, offset);
+		if (IS_ERR(desc))
+			return;
+
 		mode = nmk_prcm_gpiocr_get_mode(pctldev, desc_to_gpio(desc));
 	}
 #endif
-- 
2.53.0


