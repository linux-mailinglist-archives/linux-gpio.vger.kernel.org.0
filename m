Return-Path: <linux-gpio+bounces-31443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHbGDOJ3g2mFmwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:46:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E1EA6EF
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D499302811F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 16:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7116131B111;
	Wed,  4 Feb 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="kc9IJovm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA802F6160;
	Wed,  4 Feb 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223415; cv=none; b=irItfWcSJZC7p1G6VR/IQECiEWyQwr4N2UwKiris1id04SMXfTLVBNxmZk9i9NwOFvIXrSxye3WvVr0YOPbv1UGH+8/REFbYD/GoHoB6hBC5j5ocYW+oH/JGi3w9zctG5/9RnkXkPf/uN3xEFveU3E+RyJimXfMfWSswPbDAJGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223415; c=relaxed/simple;
	bh=aQ6io+2IWsIte0MsWzzpbJF5HbgYitCJkmM4x6GAIfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWbpLkekyWCZG3PJ4zqHhgV6EjJv6P7751+BeXUhJvPB838hXPDzuQhGyuSjQ4nBF5iZ69S6pwd1O32GkVPxwIkzcFnMRGX/aaSCqokgIAcHyhxPDT8Ma+43o6j5zHZJD41+trgJnEIeBhWBf9Pu/vNElfQOj/vcs3s0NQ0gnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=kc9IJovm; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 91E18C0131A0;
	Wed,  4 Feb 2026 08:43:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 91E18C0131A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770223414;
	bh=aQ6io+2IWsIte0MsWzzpbJF5HbgYitCJkmM4x6GAIfY=;
	h=From:To:Cc:Subject:Date:From;
	b=kc9IJovmyU+rs/rSt5OKjWnvlTHXadbVRIq5M1fs2ndJWGnbpZqs9NaVJXV3SArKJ
	 fbOJtmj1s5Ydew3q+xuAjmb00jPkvc9i3PTqMuIzqIm6HTLxky08vOc3Gl1hYt+FD4
	 QWHRwt60+60t2eJscwYhQii/22lIFnbNx4CCxhbo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 700031B85C;
	Wed,  4 Feb 2026 08:43:34 -0800 (PST)
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
Subject: [PATCH v5 0/3] gpio: brcmstb: wake-up interrupt improvements
Date: Wed,  4 Feb 2026 08:43:30 -0800
Message-ID: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31443-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:mid,broadcom.com:dkim]
X-Rspamd-Queue-Id: B24E1EA6EF
X-Rspamd-Action: no action

Changes in v5:

- collected additional Reviewed-by tags
- utilize irq_hw_number_t in brcmstb_gpio_set_imask()
- clarified that irq_mask_ack/irq_mask/irq_ack are functions

Changes in v4:

- Provide a leading patch that utilizes irqd_to_hwirq(d) to fetch the HW
  IRQ number
- Utilise .irq_mask and .irq_mask_ack notation in the commit message

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
  gpio: brcmstb: implement .irq_mask_ack()
  gpio: brcmstb: allow parent_irq to wake

Florian Fainelli (1):
  gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq

 drivers/gpio/gpio-brcmstb.c | 125 +++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 38 deletions(-)

-- 
2.43.0


