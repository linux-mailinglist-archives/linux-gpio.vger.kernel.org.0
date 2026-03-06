Return-Path: <linux-gpio+bounces-32628-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH4dDqN1qmnRRwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32628-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 07:35:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1121C1DC
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 07:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD783047DF3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 06:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159EB37104F;
	Fri,  6 Mar 2026 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kt6VwjYZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD07BF4F1;
	Fri,  6 Mar 2026 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772778857; cv=none; b=Rbrart8A1iT34FVmhA1taVFffUNTYx5pke3QI1WIfo3gd7JtGjSEbe+t6Q2b/1WCsQ6gxkfbU4o3Zb7CtNfw3LSWX0bf85C6/ioFxd1tRO84ugeycMo4PVORqBqdpqEtYC2XtxSUnIRLK/uPzD41K9ZK7xJ3TbaxC3WATDYzasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772778857; c=relaxed/simple;
	bh=a5MDdRQMdPD08Yx/j+cXRAe4kzKmmZ071KzUoqxNQ0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dhKMq9rn3wNU/VTJsNMo/cKCp0xbimv/NCvu9+CHWyDQX+StIkiGCjAiqC/l2inxiKlyublLMwr/SSw3+fdSx6FeB+PANFuAqMFWfDMU/BhfyQtDU9XFiSfBNfEPZ5yjShn4aVLNW9xZgTg/mVMErTL+VygPRZFi4BGUUoK2AHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kt6VwjYZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6hZ4DwrgxKKMvXFnBoZ5aiQGEK0hIbg/1QhQgDrgppk=; b=Kt6VwjYZQzl5ZWoFB82+NYEb06
	s+cCEp+Jv9WJJgPqGTSuVGTHGK0rBMs92zqOl8YDUDxbOjNuI9ltJPmIuA9MVF3A+kWNaOJRs86lf
	Ca6PwmUrpnUfA6ikLZOIwLwOa18x4xyX/act7ObIHyUJZD+ks0qRgq8DjmmtCnRfPQBL2fAL7m/62
	xvAkhvfpwweiPbBiTdce3BfcGF+Yau4eB0IGqo8OljG1Ct5O+4Q2vquqw4ap1ryxVeJ9R+0awU2Yg
	Ng8Ae0TIpEhiprAmRlX4z2xWw5gxBGrRw5lwdMkuigPazvahY8YH2K4zsmW7csUvSKdqtpxIv41yF
	0ZD2Cqnw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOlI-000000035V4-0WVa;
	Fri, 06 Mar 2026 06:34:12 +0000
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
Subject: [PATCH RESEND] pinctrl: s32: correct kernel-doc bad line warning
Date: Thu,  5 Mar 2026 22:34:11 -0800
Message-ID: <20260306063411.2041232-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4C1121C1DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,nxp.com,gmail.com,kernel.org,pengutronix.de,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32628-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,pengutronix.de:email]
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

--- linux-next-20260304.orig/drivers/pinctrl/nxp/pinctrl-s32.h
+++ linux-next-20260304/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -16,7 +16,7 @@ struct platform_device;
 /**
  * struct s32_pin_group - describes an S32 pin group
  * @data: generic data describes group name, number of pins, and a pin array in
-	this group.
+ *	this group.
  * @pin_sss: an array of source signal select configs paired with pin array.
  */
 struct s32_pin_group {

