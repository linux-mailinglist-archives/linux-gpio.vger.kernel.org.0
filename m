Return-Path: <linux-gpio+bounces-18229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF19A7B3AA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 02:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F128017C3E2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 00:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D771FECDF;
	Fri,  4 Apr 2025 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUR6Jv/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21C1FECC5;
	Fri,  4 Apr 2025 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725189; cv=none; b=VzlcBCUQmMsm+OpGx1PDg45IDZQaf1+iRweJ31SVjDYHafBybEOwALIEA3+3VC8b/iU7Srvz/m+dnjbjV6W2QNou+UZxn43eTaicB3YbRhb/AanID4qHEEpNkPErB18dQWG+OpoC424FCW7rNSiwlVuJXizysHSaz8/ksE8LRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725189; c=relaxed/simple;
	bh=19jQvQglCIX7UmwId0AixsHqVkVtQvrZZ4ovahq2e2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VC28VZRDfk+p7MFvJ186KFMNGC5+PphJ9v5+lWhKiAeRNtjdAli3xBscCLVRQSEjeosmaR02f+cS4xNTRL/6+lnUdd78GZUU7FPFUAsMLWHi6tTHJZwgHukXLozOTXQPzohrPQgQt/nW8zmG46TduiJUXuZjyfCxRfbcr6lcnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUR6Jv/s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E87C4CEE3;
	Fri,  4 Apr 2025 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725189;
	bh=19jQvQglCIX7UmwId0AixsHqVkVtQvrZZ4ovahq2e2o=;
	h=From:To:Cc:Subject:Date:From;
	b=VUR6Jv/sQavniKmERGSfDzAEElT/t2k2R6tvGmBTFflE/PNxtMEjmt+Rs5a7wxkvA
	 xycJrKa9f73PreTmXQxx0YBwlaRllkiVK07PXy1+4GXk4/MTHkM47S1eq/qNDC+8xo
	 GHWJ9wUMxGPv8MZHvAdvg/lGXErg5ZertVFDj5ggh4VQ/aGGpBWjNxqUYN1TfPWrvg
	 aQ1Wg14RxpC2nxEgl3tVJK4VhG8gM8nBRtO/bxvLO501I7B5MwUI1Pb/I05lorwFMh
	 y1rLCyApK2q/Tv2q4Jpcz+yk4TwA4fBjKQQSQgXd6TuT1lPb7Kw1f6VW04bAY3MRuO
	 yy0gy675zR72g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 01/16] pinctrl: renesas: rza2: Fix potential NULL pointer dereference
Date: Thu,  3 Apr 2025 20:06:09 -0400
Message-Id: <20250404000624.2688940-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit

From: Chenyuan Yang <chenyuan0y@gmail.com>

[ Upstream commit f752ee5b5b86b5f88a5687c9eb0ef9b39859b908 ]

`chip.label` in rza2_gpio_register() could be NULL.
Add the missing check.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Link: https://lore.kernel.org/20250210232552.1545887-1-chenyuan0y@gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 990b96d459671..c5dc63d9bd3fc 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -243,6 +243,9 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 	int ret;
 
 	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
+	if (!chip.label)
+		return -ENOMEM;
+
 	chip.parent = priv->dev;
 	chip.ngpio = priv->npins;
 
-- 
2.39.5


