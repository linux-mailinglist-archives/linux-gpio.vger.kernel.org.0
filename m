Return-Path: <linux-gpio+bounces-35948-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEzABwXS82mM7gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35948-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 00:04:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DD44A86EE
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 00:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 053443018AD2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 22:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B053739EF36;
	Thu, 30 Apr 2026 22:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqZkIWy2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E27346A1D
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586670; cv=none; b=INO/kvKRAdDsb2Zysg7bnW1EOFICoGOWhhVFNtw146zW9HdrkGQ3HyOMpQOOAK7wYwmziBpkjuXTH/dHSYxj+iHW3CSL7kX4NVSIEJnSAxXeOmrbq/0ViK2HL1qPZB6SZrIvVHf4HGSD923MK03Ri4NVd8y6DgMObTun24sRiBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586670; c=relaxed/simple;
	bh=FzT8M5UU1weUXaINx90b7t49VGOaivvhZQQlTWbJv7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXTOs0kckbMqE4qHiWvcmjRTs9b3zU+vUecrgrhUhpcTYNU48+NS9EG7XGhoUkEpED/9KpMzKLNxJy+2/iVRBS7rb7Br2jWy+3Zdfcm6Cg4tTjwmvcWftlRj3O02k956xgMVeDw9lKBijU1tqoLNvQ/vSYX/zEHyfnC839AEbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqZkIWy2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1128530a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777586668; x=1778191468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aWrznEs6/axBvcga/bF04l+nJ16I8rpklN4FoR4hQI=;
        b=dqZkIWy2arcWHy5SN0fs66zaFXgp19TKoQbYkOPyVeGm8r8EanSs/BSCKvcfYhQjbS
         +wIahNGVsMIE97vMTSp4v4gOTmm/9CQ6ClKxr3cj54KgTHq4DF+Kg8UEWq1b25udF0kB
         pNvhI7IZI0fE3ob+xYnkmSnIiPdu6+L8tE7oyhOZ07Y0tFQkW8u1EeIrG+a8VtstiTf1
         DT+aXktmlPtfKss4uvW2N7uVDPvBqPYObQRL40qCt7x3NFQoOQ6GZf1QfhADF0UpuZMt
         EdyR1Dm/3eiQ7Cq5ffYXK2P1TxKIyLT6FvQBkery+V9l71VmUCv8sGpq/whrfAYEMbg0
         mz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586668; x=1778191468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aWrznEs6/axBvcga/bF04l+nJ16I8rpklN4FoR4hQI=;
        b=pGE+TTb0pY8EQkPEB3X76GlK5qEE8nZbUQX9Y4BmCD/avEGlaq5/N7uLq7hHTiqBmy
         FweWCSbHVgSwYk1x14+Ge/sodEA3JZ3yY88HT9LxNKee6PcjTSztq/eHGr9mFtHmHVEd
         6Phu1sZHm2Udu6I43YWVaem7f0wVHtMlnjMfv6xOd8ZrJSZkO3vweM6vIraTZ7VBQQki
         mOr2rliNWAMWWBpqcm0Y2mL0+cDX+tUakCGFMsgMcHKoiakHxK97hR7ve6lWYiQaR7f4
         ajtqThMxeuBjlCg02KBl7+2I9Btj4vPzESQ1ZR8/A5BUx+PVPxd7BsjxI3jZvMeicnmy
         /gXw==
X-Gm-Message-State: AOJu0YydZv/Ts8ogLajrBQ0cwt24ZC2871iL4EOaBS1AcV/a+uOoGEv2
	CpHN5ruXbuwGdoBDpsbo0d9YE/3NfAZ+7APcBZbM7/bEZEWt7QaXdmN8fzNGuDKt
X-Gm-Gg: AeBDiesrhfkC4oc79yrsXHua9aSIs+8BmMWX6CNJ5UbXKwUaQp/79xGqRLSupG3wR+q
	pbFT04Dt5wSgTfXhcUQ9qtIgp30O/tR7yD15hFx5OLaBqtswp0IqVLU6hp8UlNKKmzgOue1wezR
	ijLVcnKASG1lwkbOc0D7GQaX3Zr1Penq/qoVdU3LsP8+SvUeuKoQI2XuTsZeiMj+si4STsgV3Lo
	FFZnN4ZXUlD65XQiMSTtw9Rv+7P1Nk0gme/koq8zoei/q28foIlChBVu3TmPc0p+TZ01YfntAY+
	rcRWPixBEXPbAHelE6j80B0GwtJkG1KZQD5XFS8EwH3DTEQz+MwPgn4I0Vyx8s5ccuePGS+iZVU
	wkiCawNr9zLteWYULag3sT+J+6dA3EjZuW6kqiHZd7XHCz5Jwx0fXiFWCRW0cfaad7TC4azx+Uf
	fB60uvrlaS///TVPAbea7xg79ILTNNgiH8IEy3CuG4FDrVBnXD+GqJf454Loyt9LI30tas6WlZ9
	oq7ND2jw06XVjQRrCGgx1OQhSRTWWEPtQagFgLQiFwzgj4WOlbGF2z4
X-Received: by 2002:a17:90b:2e42:b0:35f:b9ea:8fa5 with SMTP id 98e67ed59e1d1-364c30e2dc9mr4448720a91.20.1777586667823;
        Thu, 30 Apr 2026 15:04:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dd3e9a3dsm1431791a91.16.2026.04.30.15.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:04:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: sophgo: allocate power_cfg with priv
Date: Thu, 30 Apr 2026 15:04:09 -0700
Message-ID: <20260430220409.74885-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 74DD44A86EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,outlook.com,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35948-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use a flexible array member to combine allocations and simplify code
slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index c3a2dcf71f2a..154ba9a4f08c 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -27,8 +27,8 @@
 #include "pinctrl-cv18xx.h"
 
 struct cv1800_priv {
-	u32					*power_cfg;
 	void __iomem				*regs[2];
+	u32					power_cfg[];
 };
 
 static unsigned int cv1800_dt_get_pin_mux(u32 value)
@@ -417,15 +417,11 @@ static int cv1800_pinctrl_init(struct platform_device *pdev,
 	const struct sophgo_pinctrl_data *pctrl_data = pctrl->data;
 	struct cv1800_priv *priv;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct cv1800_priv), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, power_cfg, pctrl_data->npds),
+			GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->power_cfg = devm_kcalloc(&pdev->dev, pctrl_data->npds,
-				       sizeof(u32), GFP_KERNEL);
-	if (!priv->power_cfg)
-		return -ENOMEM;
-
 	priv->regs[0] = devm_platform_ioremap_resource_byname(pdev, "sys");
 	if (IS_ERR(priv->regs[0]))
 		return PTR_ERR(priv->regs[0]);
-- 
2.54.0


