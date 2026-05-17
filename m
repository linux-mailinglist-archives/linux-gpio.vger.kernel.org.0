Return-Path: <linux-gpio+bounces-37002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFx6EtNICmpizAQAu9opvQ
	(envelope-from <linux-gpio+bounces-37002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 01:01:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A92AF5643A3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 01:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87F6C3019826
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 23:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D991342173;
	Sun, 17 May 2026 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFId5WgA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC06DCE1;
	Sun, 17 May 2026 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058889; cv=none; b=RPszyKZIozfqhXp1Ht45v7/evPj05Nd7RqELbxXWRylnNJhwhspl5DvZI7bU70v1qTlVp5ZANZF/YkC2ptxLIlL+wiLnxbOnUqj3lJcWXNh/1IlDyLLYx97eXZha6cMdIa3Xcxdxk5sdtk3IELNokcdat1mL7HhkqDnEIThTeVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058889; c=relaxed/simple;
	bh=PXj0YT9DfvlaiccZD4MZdAB687enGDb+b+4HXe9qvqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PK4YjN7GhWQPTpISdfW2u1/pxMmHBE3dxesStmOPA+MEMsKSZEvYih1dNbqhXQuyz7MEldS7/zUP6fABH1PSGJ2rIkInG+ETnEQGfh1Jarx+ZpNRiFW7nZYpQYSPeMnqhT9l+ML5WGObXddTs1cp/KyyBugPtAjpafmiifUIShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFId5WgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE0BC2BCC9;
	Sun, 17 May 2026 23:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779058889;
	bh=PXj0YT9DfvlaiccZD4MZdAB687enGDb+b+4HXe9qvqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OFId5WgAyKyhmxY8pdp2+dKsMyITGfpLWNoYQu8vV9gOnw5ZeqQDvrwcrapBPsE9x
	 M4Icd4MKnqIY99UCgNQNNQasz4owodKLnLPp9ykfYAABxlH1CWuB9AHVtOVPUs/0Om
	 c30nuBfB7yBUcPhKtd+pGSqX/sqQs0DKWZ83Z1I6i9HdiPmYnRqRFZBhnoMrqj8SsN
	 AIVQNE67zV7oIFeDtzCk4HCem/o0DKtep09tDM9utEYjfPGECetfcb/i6sBsD7coZH
	 7S/6rH5qyYeoVzbb3IcV8P8XAW7d8udiFaWu+pLvOKEGoKl8jJFiRH6fWvljAoqQ9A
	 Y4IDcPiGBlRKw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 18 May 2026 01:01:20 +0200
Subject: [PATCH 2/2] pinctrl: starfive: jh7110: Avoid ifdeffery
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-jh7110-v1-2-fdb0daae5a4b@kernel.org>
References: <20260518-jh7110-v1-0-fdb0daae5a4b@kernel.org>
In-Reply-To: <20260518-jh7110-v1-0-fdb0daae5a4b@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>, 
 Hal Feng <hal.feng@starfivetech.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: A92AF5643A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37002-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[esmil.dk,starfivetech.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

Use IS_ENABLED() inline assigning a variable instead of ifdeffery.

Cc: Rosen Penev <rosenp@gmail.com>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/linux-gpio/CAMuHMdX7t7VHTzybjYo3s8SU3XLEH9GKsxmLBbh7p4D1CT3H_Q@mail.gmail.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 3fb9aa8ddf07..ec359cb873c4 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -845,6 +845,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 	struct jh7110_pinctrl *sfp;
 	struct pinctrl_desc *jh7110_pinctrl_desc;
 	struct reset_control *rst;
+	unsigned int num_saved_regs;
 	struct clk *clk;
 	int ret;
 
@@ -857,15 +858,12 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-#if IS_ENABLED(CONFIG_PM_SLEEP)
-	sfp = devm_kzalloc(dev, struct_size(sfp, saved_regs, info->nsaved_regs),
-			GFP_KERNEL);
-#else
-	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
-#endif
+	num_saved_regs = IS_ENABLED(CONFIG_PM_SLEEP) ? info->nsaved_regs : 0;
+	sfp = devm_kzalloc(dev, struct_size(sfp, saved_regs, num_saved_regs),
+			   GFP_KERNEL);
 	if (!sfp)
 		return -ENOMEM;
-	sfp->num_saved_regs = info->nsaved_regs;
+	sfp->num_saved_regs = num_saved_regs;
 
 	sfp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sfp->base))

-- 
2.54.0


