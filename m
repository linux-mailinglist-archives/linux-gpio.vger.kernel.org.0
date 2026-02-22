Return-Path: <linux-gpio+bounces-31996-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHrTFSY3m2mVvwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31996-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 18:04:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E247116FD48
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 18:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DADD0300CFEE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 17:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D7E2192FA;
	Sun, 22 Feb 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j5jaS0wC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E022153D8
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771779850; cv=none; b=fWWVfyXUz9pF4ue1FjZOi5V8kfsO2evX2MzSIy0umLnCl7UTy7Sy42iaZdGbxS4c5UUUduYKTtinpfNqEYQ8Q+XTYY5G3Kuww+qm3pOapQBN8t5RySmeoupgZSlxEvZp5unjP1mS/UWNEiFeSDODDTukkK/qcuUJYPMkzkOsjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771779850; c=relaxed/simple;
	bh=SZgju69i87xbF4RhbhcfGtmQGiTnQGdScjWUYDlcKMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKWvlozYuYjYJHbR31saMo8GTlH8Xc6jBMGWUz38x7IkDB9ve6H64TFymPvkDsXaehGHWMhlYEk8S1+UxOItRFBJjpr5G9H09G4Kf0gECmpfggslQ0OfvpWpBfsjJ0lYOY4Fsuo93c68IMF/6Pt9L7+Vt28KPQYzINqa4X9raxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j5jaS0wC; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771779836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a+jpSTFU4zQAmg50THb4DMTZKCUO/u6TXWQmfS3x0/U=;
	b=j5jaS0wCutBkxpCqwwufZmddahejy9tP0Z7FAW6FJd1FvCHGA4HJLROSyblLse6d3uXoSC
	sIOXfmgD23ZSTIss2rcC6gMGEpC2PgVlu/amkpuEMCx4MbZa/VuDXfX9BHLEWP4Y1XEivV
	sUJSJPWWnSpJZY7Lr162ugXRWPW8J0Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: replace snprintf("%s") with strscpy
Date: Sun, 22 Feb 2026 18:03:27 +0100
Message-ID: <20260222170327.281576-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31996-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E247116FD48
X-Rspamd-Action: no action

Replace snprintf("%s", ...) with strscpy() for direct string copying.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpio/gpiolib.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3abb90385829..8d1a762f9d11 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 #include <linux/srcu.h>
 #include <linux/workqueue.h>
 
@@ -107,7 +108,7 @@ extern const char *const gpio_suffixes[];
 		if (con_id)								\
 			snprintf(propname, sizeof(propname), "%s-%s", con_id, __gs);	\
 		else									\
-			snprintf(propname, sizeof(propname), "%s", __gs);		\
+			strscpy(propname, __gs);					\
 		1;									\
 	     });									\
 	     __suffixes++)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


