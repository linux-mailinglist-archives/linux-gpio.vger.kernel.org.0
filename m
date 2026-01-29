Return-Path: <linux-gpio+bounces-31316-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DXnGWe/e2mnIAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31316-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 21:13:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D976CB42CC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 21:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 366D0300B9AD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 20:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFA3330B2B;
	Thu, 29 Jan 2026 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZH2QOv4e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8E3254A2;
	Thu, 29 Jan 2026 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717601; cv=none; b=pIuRVC9z/Ik/QfGR9cPKWkF/Xe1QvyR4uA63E276/7/t8U2r9RuU4YFgQ0ZWpZmfaG8u/dXfF2TPPHeGGftj3ks3mr/7cq0mY90nZ+77KnmFhuC2MzI6ngehm1KyUl1gYbKzg9FYqkkGLsVGVozEG4OHXrMwvwnPcxvQ9+nTXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717601; c=relaxed/simple;
	bh=RdjtsMcnX2o1C5c9vkJkDiZ2Aglam7vGt6A/5D1H8Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIbAU88uBzlPLkr0/4WJDvXQL0/8ap9ZSUKqFcXoVW2XHAuykdil7CMJBMcmB2DA35DmPbWqT9TApIsmr5Z3qmsKsjkUEymddGABCwgj5ZfqjunwvPc9Qfp1MfBV/wl1SPnLS1kE+yfardsWCyuKqSNYnJ6x/nTzX4liLigEnh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZH2QOv4e; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0AEB1C00032C;
	Thu, 29 Jan 2026 12:13:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0AEB1C00032C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769717594;
	bh=RdjtsMcnX2o1C5c9vkJkDiZ2Aglam7vGt6A/5D1H8Gg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZH2QOv4eYuzg9CRUZbiuGPKHIgdhxSXeIDdGhXFgb5TepoRvUj/BR9mVU+G9RN6aN
	 JtzbNTh71rOjC7JERAJNivLd0I57yQmg6u9x6aIc2hpKYxUCuxiqMkS/K/QvYwFkjw
	 Pll01BE43b03NnQUb+/sJI5/EOEHaAmGpoh8Qgc4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D493522D76;
	Thu, 29 Jan 2026 12:13:13 -0800 (PST)
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
Subject: [PATCH v3 0/2] gpio: brcmstb: wake-up interrupt improvements
Date: Thu, 29 Jan 2026 12:13:10 -0800
Message-ID: <20260129201312.634819-1-florian.fainelli@broadcom.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31316-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.984];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:mid,broadcom.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D976CB42CC
X-Rspamd-Action: no action

The last two patches improve the handling of early wake-up conditions
and makes it more robust so we can use those during "s2idle".

Changes in v3:

- added Linus' R-b tag
- removed useless comments

Changes in v2:

- corrected the patch implementing irq_mask_ack to write properly to the
  STAT register, this was not the case
- create a separate helper to write to the IMASK register to make the
  code more readable
- remove unnecessary cast of unsigned long to u32

Doug Berger (2):
  gpio: brcmstb: implement irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

 drivers/gpio/gpio-brcmstb.c | 114 +++++++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 33 deletions(-)

-- 
2.43.0


