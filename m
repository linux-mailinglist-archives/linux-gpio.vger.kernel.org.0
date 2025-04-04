Return-Path: <linux-gpio+bounces-18227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35BA7B35B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 02:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C58173D0C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 00:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9391F5408;
	Fri,  4 Apr 2025 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzPf8vrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49061F4E48;
	Fri,  4 Apr 2025 00:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725147; cv=none; b=AXwI7N/1qaHivpurirks3vLDPIDgC90e5FbNpbP68efgGmXNzGnQllHDbuB1Up0HRuG39jE3kyG6csLNZwqmUyaS5uunAA2hpAQse8OwIUACmfGy02KAmyjucuB2u4EoXwGyTuQ47t6VR0BMxj1FupyYxjqMPbQG9b2/Rs9yD4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725147; c=relaxed/simple;
	bh=OZJ8hheOS8Ry/K/+nWGhn/y10IT0LzxBcz3eLA7JdZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qgB/y3+hjHqHu/p2NbJu0WW4i/3Gqz5HgE6UIaRhwHmMkX5eMKHr8fhtMKbE4hfM4cd7Ie2KH9JBiHBq51sgtqRRepsQkCACVEwDboj0AGifZhlB1B2/vVH/5aXAyfW75IMpOZsfxjp2nijN0h1XbGr7Iesu/oxd+K8DCMOs2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzPf8vrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE99C4CEEE;
	Fri,  4 Apr 2025 00:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725147;
	bh=OZJ8hheOS8Ry/K/+nWGhn/y10IT0LzxBcz3eLA7JdZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzPf8vrWiFfNqMm92UAgpFDALaE4EMejz1gIfZ1IGk/C1q/6dMxu2BRDaI8otPIaz
	 ikq9uoFpNQuE2Nl1Lueb5g3p7h45I79HDD8lG0YLwux1m+MEdCDms+yzi1mR9Bi7T9
	 hklWvQ1e1FPou62SZLlLywAtI1Z/cwh57MaBf1L3uMhwia1soD4C9j+I8s4ewTk7B6
	 6JKDMYER0Iu+vZqeupVywIEGKuex90DG3esxHd3iw+FLJWawKJSYTVmr+TRVDQyF5P
	 fnNoDuxohMVm8wMAgonDy1Uk0+XE5alrCARTFZZicC40Us20fPWv90Ou4/AeR3SreC
	 TDDloR/Bg8lXQ==
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
Subject: [PATCH AUTOSEL 6.12 02/20] pinctrl: renesas: rza2: Fix potential NULL pointer dereference
Date: Thu,  3 Apr 2025 20:05:22 -0400
Message-Id: <20250404000541.2688670-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000541.2688670-1-sashal@kernel.org>
References: <20250404000541.2688670-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
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
index af689d7c117f3..4b94c8b917d0e 100644
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


