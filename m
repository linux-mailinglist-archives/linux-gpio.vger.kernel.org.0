Return-Path: <linux-gpio+bounces-39419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKfCLkLLR2q3fQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 16:46:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCF70391D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 16:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gOHDDi47;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39419-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39419-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E76E0311A16F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 14:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9634E3F8ED2;
	Fri,  3 Jul 2026 14:38:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020CF3F20E8
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 14:38:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089511; cv=none; b=UrqwLNNqctYph6QAKxDkedXEeKfUu/8wYqrKl1LKQlV+cxd1VevFepa9YMFOKnfObzAgTpdMFeAHrUS7ixV4tPbn2iafYJG3zZHQ07NOxx9wUr0y+VPTCj//vjk54vC+Gn+dKOaYcfaG1eVjJAVonqvQ6AlX0Q1bBYTGc1euhK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089511; c=relaxed/simple;
	bh=BITYDlpj14tweBpHr/KGE30g292NjbP2/XStdRq+Zyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUqKYC9mk7lipQ7AUqkEJ243j9M8ID2Gbh4UAAG6T66VsQ2FfFF4j53+Cluu+CYgbTXbW5AqKGBGhlYn6L8tPESDfqoRfpE6PFpFBSwBFNtrOf1TyvxOniYyi5enpI2X4w/xtfl9biL56OPH0El8Oqk6k+tuGaM7LK2w3VH6gsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOHDDi47; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c82538b6b0so4961595ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783089509; x=1783694309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJfTD+8hyPNNhxmGiMQGcKMmVfiKF9cAU/hUt4etC7I=;
        b=gOHDDi47/xGv0+ZFZgdzXFZSEajnaClZAoMAmgQCZXWjnCQGWo/oTSiKMPin2GXYAR
         DRWnn5dnHVde4RoG89bQukdahSlB0MHme4b90JXzZslXevumnfkSHJvgFoXzycIve1cK
         Av0QKMNycS+zKsOgxMGONPVyZIkk0wwiQtVOwF5sjBcGL9KGdOShR/h3dt51DzqUbIwe
         eq/AjTDO685bIPL8WUdJsFtut9s/68M9Q3jyMx3SJgZWNLxGTsREEsPtjZcIuvic8Fxu
         Xnx+G+rbO4SvrkkvX0NMMlMf2PfqJitCV4+Vd+mtWlHCKg+WDI8wtn21hy9MchbqFIB0
         rySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089509; x=1783694309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJfTD+8hyPNNhxmGiMQGcKMmVfiKF9cAU/hUt4etC7I=;
        b=jhwCtvhRJAP5rM2hynn6fTeCdfkA6ln2QTY7rMxM+n4XUi4k3ePzsnLJ6pt+DcMpEi
         amOqDFIXOHDFq6G0ligZCbkKlZw32Q12hoo3HGHkjQ0zDRLFd8zLwNdJ774NEg7QqWTx
         bkJMkknsAvLoXNQMgwx0RWd8TcmxS9E1tHM2tfjGa8JodSnwGU29QJFPA3FQxQElqMsV
         Ky8TRd6PZBgkqgAWB0kyXsBZZVLguBZv3xosAGel5nkGH0e/b4I+iTHTWOM8uwWtWsT9
         pT2l6Aax0iUesVEFCRpd6G2tJBZ1G/zu+Gom1K+BI8wmdUaj1V36k7bPbhdO3nSE/X/Q
         UPhQ==
X-Gm-Message-State: AOJu0YyZqBjhCFJ6ATxUPagltd/TwundQ6WdCI3KjHjWk614l7zmxmFL
	MDEdioX3YMX5J8jlzr3C5qGq9o1vemlPQU5lKuy2gjxVux7xfQTQLCLRPIZYT9e/dwoVKg==
X-Gm-Gg: AfdE7cnLCEke6Ekfjw6j954OTTZcGlGDJS/9YF2mg9/c8WV3wTepDemXwFBOW+p1Cqk
	vEI1dHvN7nEKzrYHw8mIjutH0weY6gdHOJtmdEw0LPuJwsWer2b9C01D5zYRc/8uuT4RF/Amrfn
	4ze6x4blFGyeaKTA2byI7ks2x04F1e/hWuXoRvtqnbo+17jj4wO7oiQ1C+9xxkcmStqd6fKd7Ac
	iZaMPyR3TnwzGfkEEw0wTleO2mtsoN8ozoCDG2q8TOzUTxW81RruaJ2h2Z2Yrecx/0t6iZ/1B06
	cXwo3VlaHFS9J+dUZRYyMeLgIdsMiC1IUlOHOtrfEF9l8Ya+ROlqAupGg3qOv0B8jrv/5n03lL2
	EVTDfUYznhELhDRjBPhm2+RIXI/9KHKA3QxLmbVzkK1VTeE7d5Q8FO3LygHl5KX4GQCjssfa2XQ
	qfaB64aTbhxl+YIZu5eam+dzeZ
X-Received: by 2002:a17:902:d490:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2ca7e92a25emr103976315ad.42.1783089508880;
        Fri, 03 Jul 2026 07:38:28 -0700 (PDT)
Received: from localhost ([112.65.12.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25febsm10658945ad.1.2026.07.03.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:38:28 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH v3] gpio: dwapb: Add robust error handling in interrupt handler
Date: Fri,  3 Jul 2026 22:38:22 +0800
Message-ID: <20260703143822.25285-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260703142749.24203-1-haohlliang@gmail.com>
References: <20260703142749.24203-1-haohlliang@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-39419-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:haohlliang@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[haohlliang@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haohlliang@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19FCF70391D

The current interrupt handler silently continues if an interrupt
handling fails, which may lead to interrupt storms. Add proper
error handling to gracefully recover from failed interrupt
handling.

When generic_handle_irq() fails, the following recovery actions are
taken:
  - Write EOI to clear the pending interrupt
  - Mask the interrupt to prevent immediate re-triggering
  - Disable the interrupt to stop further interrupts on this line

Use scoped_guard(gpio_generic_lock_irqsave) to protect the read-
modify-write sequences on shared registers (GPIO_INTMASK and
GPIO_INTEN). This prevents race conditions with irq_chip callbacks
(dwapb_irq_mask, dwapb_irq_enable, etc.) that access the same
registers from different contexts.

These measures prevent the system from being overwhelmed by repeated
unhandled interrupts while logging a rate-limited warning for
debugging purposes.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v2 -> v3:
- Remove duplicate comment

v1 -> v2:
- Add spinlock protection for register access in error path
- Protect against race with irq_chip callbacks accessing shared registers
---
 drivers/gpio/gpio-dwapb.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7b92b233fafe..dc9676eb1429 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -209,8 +209,23 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
 		int gpio_irq = irq_find_mapping(gen_gc->gc.irq.domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
-
-		generic_handle_irq(gpio_irq);
+		int ret;
+		u32 val_intmask, val_inten;
+
+		ret = generic_handle_irq(gpio_irq);
+		if (ret) {
+			dev_warn_ratelimited(gpio->dev, "Failed to handle irq %d\n", gpio_irq);
+			/* Clear the interrupt */
+			scoped_guard(gpio_generic_lock_irqsave, gen_gc) {
+				/* Clear the interrupt */
+				dwapb_write(gpio, GPIO_PORTA_EOI, BIT(hwirq));
+				val_intmask = dwapb_read(gpio, GPIO_INTMASK);
+				dwapb_write(gpio, GPIO_INTMASK, val_intmask | BIT(hwirq));
+				val_inten = dwapb_read(gpio, GPIO_INTEN);
+				dwapb_write(gpio, GPIO_INTEN, val_inten & ~BIT(hwirq));
+			}
+			continue;
+		}
 
 		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
 			dwapb_toggle_trigger(gpio, hwirq);
-- 
2.50.1 (Apple Git-155)


