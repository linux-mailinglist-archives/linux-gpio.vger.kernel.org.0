Return-Path: <linux-gpio+bounces-31193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB9jEuyreWmuyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 07:25:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1B9D685
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 07:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 350CC3010DA8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 06:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755853358BE;
	Wed, 28 Jan 2026 06:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kn8dsxb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516C30ACEB;
	Wed, 28 Jan 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769581502; cv=none; b=kexAfxR9f8boFe0BAGp37pjYQMCQHSo9sBMBGIU94wmPCXOevH8G9Zufo/J74YHCtzXDRrPKasbOhwTZb+BihZhtMFicSRwdURLub2BjCmgrayNTSJyardtCwc1P/1Ch5HnarYEZ4KWAtvr4QbpPPMLnbTZ7OT6fXYQDY1NnqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769581502; c=relaxed/simple;
	bh=NIKl+LmLChdSU3x3+tC72bXFlo1u0yAHeOBIQE3Ugh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNNs+cvq7O3vl61muXWekK4HSibJLu5UIG966p7QCk0SVHrQTq3EVbVBxjWXChDnUrB4DFBQrAMvRtJ1LOMSkYjs7Hj0O3zR/z2pUIDo3pHPsyE6sbyj6K+ZKkSPBmSFE2PgR6+TCmDIAHog7effOZZXinuZ+ffWi6o+z8NIi+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kn8dsxb2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=36pTNeA0z7lK++OvPBLCKeebVmsgDPwkZzQuPT3i1I0=; b=Kn8dsxb22WHEjMqMwyYc4Lnw69
	WY8TGJlMSB94p2n7HlXFO4tjozAKYk7pc6o63cIC7ZeD1JCDv6iEKwyljV8fEIZh66hcJQFtik7yg
	dNuxIDzjWXU37Out7c514nhxBc5aHDqhklGmTZbMfJNXfI/9GE/uIyhxzRqYSc+gJX89DIpyEHsd3
	EEqhBgwxa7Nhlgf7yQryrd8HSIcvXv99jRYkQWiixE14IOiLwjllp+QZpCcE/gdnQ/Hi3rwmgT5re
	RHZfxUaUcAIz4TN1EG/XtTbzyzkWslylnONMyQh223py47E9j+Angc/L/mLGPZ2vOsOYHVIAYKAQo
	/EzgcA7Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyz5-0000000FXJ7-43zM;
	Wed, 28 Jan 2026 06:25:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH] pinctrl: s32: correct kernel-doc bad line warning
Date: Tue, 27 Jan 2026 22:24:59 -0800
Message-ID: <20260128062459.402841-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31193-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,nxp.com,gmail.com,kernel.org,pengutronix.de,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,infradead.org:email,infradead.org:dkim,infradead.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2E1B9D685
X-Rspamd-Action: no action

Insert a "*" in the kernel-doc line to resolve a warning:

Warning: drivers/pinctrl/nxp/pinctrl-s32.h:18 bad line: this group.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>

 drivers/pinctrl/nxp/pinctrl-s32.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260126.orig/drivers/pinctrl/nxp/pinctrl-s32.h
+++ linux-next-20260126/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -16,7 +16,7 @@ struct platform_device;
 /**
  * struct s32_pin_group - describes an S32 pin group
  * @data: generic data describes group name, number of pins, and a pin array in
-	this group.
+ *	this group.
  * @pin_sss: an array of source signal select configs paired with pin array.
  */
 struct s32_pin_group {

