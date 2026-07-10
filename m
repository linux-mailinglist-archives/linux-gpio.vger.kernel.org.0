Return-Path: <linux-gpio+bounces-39844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 95YWAXs7UWpYBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:35:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9573D62D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=czhy6zBn;
	dmarc=pass (policy=reject) header.from=disroot.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39844-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39844-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61356300B526
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CE537F8AD;
	Fri, 10 Jul 2026 18:35:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A928373;
	Fri, 10 Jul 2026 18:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708523; cv=none; b=FdX27dTV6CCixdxA4+U/lRtWVTH6rNINRf9NbAj1758k3Lfv+99RHYXwczEk3MLkBWLNBo9E0J8ekG/F07QQKNL1t3Fh9ADvE6XQaBUUqQeZFj/jBA/3IC65OSuVVonRiJXiierouRV0Qf4djVJslEfTh8dKEiL2IS+LpcilfMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708523; c=relaxed/simple;
	bh=OJFOEtomlUKrob8c1WEjI4Vz2MMTWoh83CnazceU5x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXMQah+u8YNoym6vB8CnOhLb4rwWK4yzTNE55fQ9zJrliRLYDKjyz9CqYTNrIQivFa7hADsCI5jyd1un6xV+iZjf2w8g9cfFxUuje0gFF4tduTcBqmQK5LORbe4e5C+2ipK4olesf83pGOfiQURvTeDJMHg+mOEhqk6SA9gHR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=czhy6zBn; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EEA0D86012;
	Fri, 10 Jul 2026 20:35:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK6z6iB-4mhU; Fri, 10 Jul 2026 20:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783708518; bh=OJFOEtomlUKrob8c1WEjI4Vz2MMTWoh83CnazceU5x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=czhy6zBnHVttfSJI25skbQgzi4ZJV63lS1OB9/Iykxuguoy5GA+jWBh2Sedh226ZG
	 rXvH1QgYvSXu6SCGucIdHjkmccmI5Ss/mpBQZQ3cy2uOGnJ/DnCTCyodeoYp0IRRfH
	 xSlR2LgQ9AhgK2CSP6kvV0ZIjDC9P32VaANckJU99gT5LmuVNB2erfu6AGHI7+7/Fi
	 CGPZAMCi5QEZ2tKZh/lhcYqlSkceCFd+SUYj6iCEq8dAQRJljgQ9n30WblcgxGYTlH
	 o0npjUS2iQvTZdxKjbfnZMt0gCXiCyOaKz+nJs6b/eYZKBngEPhaBL55GRoaILX8ix
	 XsLEJSdDX8jbw==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 1/2] gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
Date: Fri, 10 Jul 2026 23:34:38 +0500
Message-ID: <20260710183439.996923-2-adilov@disroot.org>
In-Reply-To: <20260710183439.996923-1-adilov@disroot.org>
References: <20260710183439.996923-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39844-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:sander@svanheule.net,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:adilov@disroot.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[adilov@disroot.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adilov@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,disroot.org:from_mime,disroot.org:email,disroot.org:mid,disroot.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15D9573D62D

In preparation for upcoming changes to how bank reads and writes
are defined in this driver, change the ioread32 and iowrite32 to
their __raw variants. The realtek_gpio_update_line_imr() function
is used by all devices regardless of GPIO_PORTS_REVERSED flag and
thus this is the only place where there shouldn't be any byte
swapping whether SWAP_IO_SPACE config is enabled or not and that
is only possible with __raw_readl and __raw_writel.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/gpio/gpio-realtek-otto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..491fde846d46 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -176,10 +176,10 @@ static void realtek_gpio_update_line_imr(struct realtek_gpio_ctrl *ctrl, unsigne
 	u32 reg_val;
 
 	reg += 4 * (line_shift / 32);
-	reg_val = ioread32(reg);
+	reg_val = __raw_readl(reg);
 	reg_val &= ~(REALTEK_GPIO_IMR_LINE_MASK << shift);
 	reg_val |= (irq_type & irq_mask & REALTEK_GPIO_IMR_LINE_MASK) << shift;
-	iowrite32(reg_val, reg);
+	__raw_writel(reg_val, reg);
 }
 
 static void realtek_gpio_irq_ack(struct irq_data *data)
-- 
2.55.0


