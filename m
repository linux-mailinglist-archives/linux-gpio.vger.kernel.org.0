Return-Path: <linux-gpio+bounces-34951-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKMBLU2p12noQwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34951-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:27:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC183CB2A8
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C4993008457
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3431327B32C;
	Thu,  9 Apr 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="fGiKEsYI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698F40DFA4;
	Thu,  9 Apr 2026 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741256; cv=none; b=QUQE0P7TsWRIb8MnE0SwLNM5d2Oj0QLLEZztuSdicU5jmZA+dR/SIjNgSbIIEDLh39uKUIzo4gW24JdksDBLzQ9NFgOZBgFJi3cQuvw5PKlY96ZAbFNypyoQlMoGCqdxWZH/8zy6P0I1EAmuGB/h0lS4rSnL3i71oOw3TicVnuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741256; c=relaxed/simple;
	bh=QVGgy9FCZdktz5EZIp48pU14WW2kGSyI9jNxNO3iheo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blS0S2xN3MuyUSUNire2qxdfED2rBCLXNe9AuKz2qev+x7xuZXUPGt4+Li3hOh10eFxfkIEKITAqQ3dtBajEleAtL28Ogzt29QdDV3eUWfMIAPBmWW9MGSHd9z7shLeutvn2QNcicn49pI0/Qvz02cYVDZXVcnDHNFKk9MchkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=fGiKEsYI; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 34589607C1;
	Thu,  9 Apr 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775741253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f1Sc1Zx4mgmF8p47InuqbAp8dKDMOOHe+MdMcqY/fZk=;
	b=fGiKEsYIY7iS1f1r8LLt+RsiqVz0/3uTX38vU0Ylql6mfxpHwm6xVLfrAf74JpBrE/JgRg
	b3PRMu6u1HjJORmQyZ4a2S7k1KfVpuYSNbqvKGOSfd2pY3BDcvkx87Mbo8bd8Z82J0/Y50
	dd+otpo4WHYIcL/eAVomo7Ze4OMmNME=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 117E71226C0;
	Thu,  9 Apr 2026 13:27:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH v1] gpiolib: fix trace on missing gpiochip->get_direction callback
Date: Thu,  9 Apr 2026 15:27:23 +0200
Message-ID: <20260409132724.126258-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailerdienst.de:s=routing];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34951-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[public-files.de,vger.kernel.org,makrotopia.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[fw-web.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@fw-web.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[mailerdienst.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AEC183CB2A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frank Wunderlich <frank-w@public-files.de>

if gpio_chip.get_direction callback is not implemented (e.g. pinctrl-moore) there
is a bunch of traces because of this.

Just remove the WARN_ON to avoid traces and restore previous behaviour but keep the
sanitization active.

Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86a171e96b0e..302cbd7989f3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -420,7 +420,7 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(!gc->get_direction))
+	if (!gc->get_direction)
 		return -EOPNOTSUPP;
 
 	ret = gc->get_direction(gc, offset);
-- 
2.43.0


