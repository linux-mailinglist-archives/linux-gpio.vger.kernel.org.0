Return-Path: <linux-gpio+bounces-31556-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEm6FaRWi2lIUAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31556-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:02:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29911CE44
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BE32301C15B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 16:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46F6366DDE;
	Tue, 10 Feb 2026 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVOIEg6+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7787F15624B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739352; cv=none; b=Bk6C29p0AfTRkaTLLKHtgorjUOyb7KfCLp8/HAY4S0A/vvnd6cwrGftqZeTxWOAPkoNCx9eKIFpB2k+qCgerLuFDAPKCWa69MGgO/c3qwYWTf81pIfhJ97cyuzuY/ahxHDujFEpcg8X1Nf2bzlwh0pfqSRCPzHy+fs3Xj1ApQv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739352; c=relaxed/simple;
	bh=fec3McZNvmJ47b77yyWd0YxDuShcKCVYivhxRV31paQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tu4TvvNupX+FyTugzYdfkFjw/hg3Ecd+IT/VZsiv16SxyV2ThKhz2RYhbGzteAamX9DAiESQWrBW4nctQ5DaaZEh7Dq+a6cKQ0Q8SEjhS/ZCFuromflgvB0NoLyi/2h3a8glOHeaeQ63QlgxQCIiDdSnKIhpRe3Rvp6KsIg5mmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVOIEg6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2ADC116C6;
	Tue, 10 Feb 2026 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770739352;
	bh=fec3McZNvmJ47b77yyWd0YxDuShcKCVYivhxRV31paQ=;
	h=From:Date:Subject:To:Cc:From;
	b=QVOIEg6+gMBzSIyTk2vLkdFeRAPNwNP4l9bm/Wvri9CaCcPQ8PdiOkPmwRuimHB7L
	 7t8MnXdd25EqATAIGhxrdxwXzOcY7vjxw+UQlcc+rKXew1CuVJO1CoAfkDlEmqspGE
	 bH/2ujiXDQbSrU4zcrIChc472FBVLmhlBe7TewYTKeX5qgS6r8jbE8ZJFoP3y2ZH0w
	 o56BSm5ygRXq2F5udW76SuaB0hxsz8PU1hxW3ZX7oyyhfHltwN+tcGCQ4lLAfq8ogV
	 Iw8W90LiOQhZXGWDvEsLTtcX84Oow5Vw2X7fGC3PnMdIJORM6Ybyglfhii/pF6qtTi
	 VXFbr5KPWGn3w==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Feb 2026 17:02:29 +0100
Subject: [PATCH] pinctrl: Fix spelling problem
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-speling-fix-v1-1-c980b9bf873c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkEtgvpKdDDdbCFMXIhA+nvSc
 QZmKggVJoFZVSh0s/CVGphOgT9cioQcGoPVdtTWaJRMJ6eIOz+4ucl7E4bg+wCtyIWa/m/L+r4
 fDYQSk10AAAA=
X-Change-ID: 20260210-speling-fix-ba9cc1d4dc3d
To: lijiazi <jqqlijiazi@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31556-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linusw.kernel.org:query timed out];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE29911CE44
X-Rspamd-Action: no action

The grammar is off. This fixes it.

Fixes: 6e4f3db8dfcf ("pinctrl: just return if no valid maps")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/devicetree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 0b7f74beb6a6..5b3904d39e3b 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -175,7 +175,7 @@ static int dt_to_map_one_config(struct pinctrl *p,
 		 * return.
 		 */
 		dev_info(p->dev,
-			 "there is not valid maps for state %s\n", statename);
+			 "there are no valid maps for state %s\n", statename);
 		return 0;
 	}
 

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260210-speling-fix-ba9cc1d4dc3d

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


