Return-Path: <linux-gpio+bounces-39241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxy7MvjYQ2pykAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:55:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7D6E5A11
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U8Ko4K8v;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39241-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39241-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B1C5303642F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E55D43D4F4;
	Tue, 30 Jun 2026 14:51:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034043C07E
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:51:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831114; cv=none; b=hHwJWgv2TVNgvUH3SkRcAlrtro8THDgAClfhtmHqnx8mWaDTjA+nTCxZXta2ta4LbpMpks/Qm2Tg2rpENgQHMU/9pFpuft4130PxuZ+NmFCE3BSe3AdZuDRsAuUUAKhL7SOuf0Yud3zkWdRlnilUkx1kkDQRawfetVe5QPdCM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831114; c=relaxed/simple;
	bh=FdovKUpFthtZZd1VKz32OjC4jJoe0pHkBeBAKLTHx8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrID8/m7ps42jkvTUl36pULRwhjlw5dDVz7yyNU0miH2HNQ6Lrf60KFTV8nsSyDTL7cpvsmTLJqtcI4yEIhwGv+w8mA2EUvEnFzeMNzPgYscV/AEZ4o4pZlFSPLiXeHCdw0VEHyOmtEtnDR4R2yVFkBojUwhzn+UfBZAYafU+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8Ko4K8v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05561F000E9;
	Tue, 30 Jun 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831112;
	bh=f1WivIUCU+WuFrvhVAT0FbfccEAElJNp/y6Npyecngg=;
	h=From:To:Cc:Subject:Date;
	b=U8Ko4K8vq1/ZuomZOuoGdBogeNPBPEfgYMUGh47o4FmPhG9BmIpFhhJ2G4UQEZRFJ
	 QNatX8O1sPQHiCLa4P84tUbL0K086ymgCAiw9Wm/y8QlgGg+mCiV2v+CK3y1m8r3hX
	 RnGrQscWiTUCSNfUuPRgFo0YK7zo8EkFyfMuRh+pSppGsixHB3dlgXpfHEy0TDRBuL
	 UQDbKgFRUCRnMswmta4Sczl9ZujJL2lkzSRkIs6YKYidKgiGp4985o6pJp7XPLlH+2
	 y4CW3eMZv3C20knB9pjhvNFQG6ZXKIcz/pA1QoW6MECP210/LHDkLkM+bNAnEpF4Vh
	 FciTpXINKFnNg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?q?Richard=20R=C3=B6jfors?= <richard.rojfors@mocean-labs.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe
Date: Tue, 30 Jun 2026 17:51:48 +0300
Message-ID: <20260630145148.4081967-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:richard.rojfors@mocean-labs.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39241-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vz@kernel.org,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vz@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EB7D6E5A11

Out of memory situation on driver's probe is expected to be reported to
the driver's framework with a proper -ENOMEM error code.

Fixes: 35570ac6039e ("gpio: add GPIO driver for the Timberdale FPGA")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/gpio/gpio-timberdale.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 78fe133f5d32..ec378a4220a7 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -228,7 +228,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 
 	tgpio = devm_kzalloc(dev, sizeof(*tgpio), GFP_KERNEL);
 	if (!tgpio)
-		return -EINVAL;
+		return -ENOMEM;
 
 	gc = &tgpio->gpio;
 
-- 
2.51.0


