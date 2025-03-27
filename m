Return-Path: <linux-gpio+bounces-18035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C1A72937
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 04:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7748A7A1428
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 03:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DAD1AB52F;
	Thu, 27 Mar 2025 03:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Z8/uZSuX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C861AA782
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 03:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045907; cv=none; b=lJziDZ4hiSRlugVneACv4oJ5BbZJRdR+rAR98KlgLCwLYLeA5po6MCmGzqJfxtdPs7LKa1bPDuCREbl6VyvWLJNCB7JKl7Nad3f3lE+Z3iQOYolmOpS/NorNrlqToaZ2YhZjJCoYH/aGBYIao6nSUEA/IBh0ob11n/HBLMlyWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045907; c=relaxed/simple;
	bh=bBtwfOWw9auRgx3ODhsYSdlBCmUQo7JqiLxVxmF32Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bjh0+D/6sdim+mmLjAOQbCvMBJeApTEEOJoW9OwTnVaToZPXqXxok9znS9u1sqZgE06dzxqCMTduknJjuctAFemprxizR9nJfe1Q6ya3gUl3kfc7d+Tqs7ve35WgehLHzxMRaT6iLgRKoTt7RldJKhjBwGV5dSvlrVMdb8VA04c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Z8/uZSuX; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from hwang4-ThinkPad-T14s-Gen-2a.conference (2.general.hwang4.us.vpn [10.172.67.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 990633FF9D;
	Thu, 27 Mar 2025 03:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743045444;
	bh=OjwbA9Whq4MGYPONVxyp1tC8rv3zVN1f6+9H0eLEc6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Z8/uZSuX3qKkqg45rovq6kvV6acomRD5dmJVgdeIzkUsW0YSgoZgzxzBnC5zixRCc
	 mVu5pWdJ3h7BHcXqTaNUrhUrCDYeUgNFT66dx7WLCrYdb8bFCc/9ieU/WHx5xeSXXm
	 9lonuiZ/Lo3X94nHwzy3+sMe61Mw7sr+yFgte7X6alhBoNDEDaTeMMrjGZqhYGDu3l
	 rQmKmCfO915JWtek1AIURnmvbdrWnxdqSADaz07oLSoC1TBCbmDP4vpTv1jO7HUfa0
	 F+GPT4WM0zkxdqEE4bwMYAJr7DdwS+CYoa30GVQQ6X2VLYCavxTE32PRFj3l6PlfZm
	 iSrNoOBreV3ow==
From: Hui Wang <hui.wang@canonical.com>
To: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linus.walleij@linaro.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	gary.bisson@boundarydevices.com,
	hui.wang@canonical.com
Subject: [PATCH] pinctrl: imx: Return NULL if no group is matched and found
Date: Thu, 27 Mar 2025 11:16:00 +0800
Message-Id: <20250327031600.99723-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if no group is matched and found, this function will return
the last grp to the caller, this is not expected, it is supposed to
return NULL in this case.

Fixes: e566fc11ea76 ("pinctrl: imx: use generic pinctrl helpers for managing groups")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 842a1e6cbfc4..18de31328540 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -37,16 +37,16 @@ static inline const struct group_desc *imx_pinctrl_find_group_by_name(
 				struct pinctrl_dev *pctldev,
 				const char *name)
 {
-	const struct group_desc *grp = NULL;
+	const struct group_desc *grp;
 	int i;
 
 	for (i = 0; i < pctldev->num_groups; i++) {
 		grp = pinctrl_generic_get_group(pctldev, i);
 		if (grp && !strcmp(grp->grp.name, name))
-			break;
+			return grp;
 	}
 
-	return grp;
+	return NULL;
 }
 
 static void imx_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
-- 
2.34.1


