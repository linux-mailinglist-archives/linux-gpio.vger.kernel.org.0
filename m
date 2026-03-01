Return-Path: <linux-gpio+bounces-32355-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBrcFB+co2k3IQUAu9opvQ
	(envelope-from <linux-gpio+bounces-32355-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 02:53:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 341551CC23C
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 02:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C15AE308A589
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Mar 2026 01:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF00310645;
	Sun,  1 Mar 2026 01:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h4WQPJWH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0492F28FF;
	Sun,  1 Mar 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329704; cv=none; b=bbPqUa0oWaZNZ9fGVFGk6h1thqdlkwPQvMiTkLE1FUnkm44Qf42qiRanTAakjY5PtBoioIvewxlq6Fnq/owwVoDsM+iUT1Eg8bkeUjYbzSL2YTKYu9vvtw2BSu2CAWSFJEp27gi4yqlJzNQKgNzJLv9bW+gd6LoicNuy8FjMnqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329704; c=relaxed/simple;
	bh=1EFPLW9KMeNmK/VwUcc/pB71JUIFqjR0Y6iuBB9c9JI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oplYTyEvKPMmqaqapNcY8P0RjpjMd/O1Yxg55SX43yXb1OJGaZXRqASi3iz+JN9j8RhckyM2Q/+WePKQzMla3t6Ndbn2ejkVMTuF8/DTV3qKFXVAKLeKUYS+cKixNcpa9em6ONN9pjEMW9b9L+Er7vycqF9j/ltCbrEcmz757lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h4WQPJWH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=N2HpYocLz/q4h1A70ya/gJs/CUWh47DPdEVN0RU25jY=; b=h4WQPJWH1IpDAc4j4g4TG0GhLJ
	HAup0TTrJ2OPgqewUeTrPFykibtSdpMs8NFU2nyfaDnY7bEHQiT9obgG5ZLDjQCI0QzvKVXTodk5Y
	+Kf8RDLIuJB8/tzOyOq/X65s8GeOvoTWkgrEs9YTNmpmf7lBqw3EaXC5UUJiaZYMFT/6tehiILW+7
	SrCeoBNrm/Gf11dbTly8sf2tpvq91BCgs1EV6hzF3SeoURZZ0claQodjAjgbeN2Gw5Uz3yCbSHDdC
	ZxZ+ufWMMzP7oFF9CJbblpgkGMpZHU8SlSTAnOFGkgefzdcv6Ak6WTL5TjWXxJ/wAPZRSKJgWOFUS
	bZGrkXcQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVuw-0000000AeVR-45Xx;
	Sun, 01 Mar 2026 01:48:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: Timberdale: repair kernel-doc comments
Date: Sat, 28 Feb 2026 17:48:22 -0800
Message-ID: <20260301014822.3133268-1-rdunlap@infradead.org>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32355-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:mid,infradead.org:dkim,infradead.org:email]
X-Rspamd-Queue-Id: 341551CC23C
X-Rspamd-Action: no action

Use a ':' after struct member names to avoid kernel-doc warnings:

Warning: include/linux/timb_gpio.h:22 struct member 'gpio_base' not
 described in 'timbgpio_platform_data'
Warning: include/linux/timb_gpio.h:22 struct member 'nr_pins' not
 described in 'timbgpio_platform_data'
Warning: include/linux/timb_gpio.h:22 struct member 'irq_base' not
 described in 'timbgpio_platform_data'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org

 include/linux/timb_gpio.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260227.orig/include/linux/timb_gpio.h
+++ linux-next-20260227/include/linux/timb_gpio.h
@@ -9,10 +9,10 @@
 
 /**
  * struct timbgpio_platform_data - Platform data of the Timberdale GPIO driver
- * @gpio_base		The number of the first GPIO pin, set to -1 for
+ * @gpio_base:		The number of the first GPIO pin, set to -1 for
  *			dynamic number allocation.
- * @nr_pins		Number of pins that is supported by the hardware (1-32)
- * @irq_base		If IRQ is supported by the hardware, this is the base
+ * @nr_pins:		Number of pins that is supported by the hardware (1-32)
+ * @irq_base:		If IRQ is supported by the hardware, this is the base
  *			number of IRQ:s. One IRQ per pin will be used. Set to
  *			-1 if IRQ:s is not supported.
  */

