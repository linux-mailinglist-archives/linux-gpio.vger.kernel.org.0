Return-Path: <linux-gpio+bounces-31183-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIn2AJgzeWmlvwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31183-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:52:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1269AD4A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0716300B471
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 21:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A396D33123D;
	Tue, 27 Jan 2026 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PvnxrkrX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888B32D45C;
	Tue, 27 Jan 2026 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769550739; cv=none; b=p11fnbFUZsi6fQj1NIbvBD0DbTgNzIZHxTWRwszKKg/C2miVmlP7v1ZCVhQpb87AICSeB/HqPYfXhunE7lfSFVS0ZS89N+mj4vHhLQ3R4O4P/s0t7gDVRRlrHyKo/odiZoRvFnYAYn1vI4Ms6c0d4aOCUpCqY35jUoUZol2fccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769550739; c=relaxed/simple;
	bh=JnfNS34/V851rQP+oN95QQoE9EKEKbvWuHol2CHK5QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3ppSsjJRtmtcqlTyZG0foQsI+7kIqDkaXdF+7J09e5Vo/860efLpg5/IwxC0Scn3ltqGhHvJeEG3Z6cg9rLfLsEkBGURXxJepmUFuJNfYLKVrcQynRNiDxSlNJKRDsgT4okrk8wnGqsPECrltloWKKdQEeJFjPL9ihebpkzsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PvnxrkrX; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C2E70C002FC7;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C2E70C002FC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769550419;
	bh=JnfNS34/V851rQP+oN95QQoE9EKEKbvWuHol2CHK5QQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PvnxrkrXTfhtRNNjZxyv9ajKEDuUA82o4HcNwdrd/GPpyQF57e4dVhho+UU5udApU
	 QZdT4/nnu13MdhBn+P8xX9QEe2JLmXCKa9xzfWSE2aS1NkB6W2wo4V/wmRxxm2b3rW
	 e1DCARpJPaU7HCbgMgW6Kn+9fLGCiI75zW7Mm5p4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3401B199D0;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
Date: Tue, 27 Jan 2026 13:46:53 -0800
Message-ID: <20260127214656.447333-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=dkimrelay];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31183-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.978];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,broadcom.com:mid,broadcom.com:dkim]
X-Rspamd-Queue-Id: 8D1269AD4A
X-Rspamd-Action: no action

This patch series corrects the HW interrupt to the bank mapping logic to
be more robust and do not assume any particular order.

The last two patches improve the handling of early wake-up conditions
and makes it more robust so we can use those during "s2idle".

Changes in v2:

- corrected the patch implementing irq_mask_ack to write properly to the
  STAT register, this was not the case
- create a separate helper to write to the IMASK register to make the
  code more readable
- remove unnecessary cast of unsigned long to u32

Doug Berger (3):
  gpio: brcmstb: correct hwirq to bank map
  gpio: brcmstb: implement irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

 drivers/gpio/gpio-brcmstb.c | 127 +++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 38 deletions(-)

-- 
2.43.0


