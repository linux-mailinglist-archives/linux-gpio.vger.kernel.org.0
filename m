Return-Path: <linux-gpio+bounces-18223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD7A7B2E1
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 02:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E74E417394A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 00:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A742628C;
	Fri,  4 Apr 2025 00:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIqNDv83"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7551F95C;
	Fri,  4 Apr 2025 00:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725051; cv=none; b=gyQG76ChOslO2RewQZrB8P+IoDg+UNOVnmSaK4Izve7V9SW36/zui74sLe4dGBgYzTAYDzFLJohVuFoNMcqOBxaLy9i78sBzips5JtzCniIH9BMSzutm7/E7imm1suTv9v8ce65aBzAGg4Nv9c92OMANfD6Q94IkjUpWHam3Jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725051; c=relaxed/simple;
	bh=fv93mNmTgll8s1lzzmMzuD6QI4oex6qpoMEo2aBam74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjPA0fFvBiPiwnW8P/CRlS8FBbmQbTsQocY1k/2L4nFCWgVBn1/jUIthZQb3stsApq7CBrA3918bm6hFA0D2siI3CF2Bb1uv52a/BNd4cICrGgOtXBREo/vogb1TNDZje4JSKK+yPKvCIR8P0/2dfRpigKq31NgQNy/AUCLT0ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIqNDv83; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EC6C4CEE5;
	Fri,  4 Apr 2025 00:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725050;
	bh=fv93mNmTgll8s1lzzmMzuD6QI4oex6qpoMEo2aBam74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIqNDv83rGZTbdrN/+DW0nhnoooa1o9MF6tVMUBe6w8A/kvSlV+G5/GGCYH1w1Sxs
	 LGQBQMxiZK74xvww2ZGKY+I/gBqPNPyj54AmflE3mGEiF8lElyQGuyWb3tuz+fQCEo
	 rlXyk0nVrdtR1iH3ke23A09HPxYLr8gDz3pZkA5EUOqqAeL0Y26HnnwqO4SguR7dnQ
	 K/umFnt7RlaHYZJujU8Dr1vb8Mz0BB1IVIIzFCxpDwlmFPkCuMLxhWBcGe1GTyQZ6X
	 NETWUEwXgzKrzaFoxEnilV1LIe/O0TZKYsEcxSAJG1EZPRyPzSN5kXbh1GQDpZ1yNb
	 2FY2Tms2kCyig==
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
Subject: [PATCH AUTOSEL 6.14 03/23] pinctrl: renesas: rza2: Fix potential NULL pointer dereference
Date: Thu,  3 Apr 2025 20:03:40 -0400
Message-Id: <20250404000402.2688049-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000402.2688049-1-sashal@kernel.org>
References: <20250404000402.2688049-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
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
index dd1f8c29d3e75..a654ede01f705 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -246,6 +246,9 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 	int ret;
 
 	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
+	if (!chip.label)
+		return -ENOMEM;
+
 	chip.parent = priv->dev;
 	chip.ngpio = priv->npins;
 
-- 
2.39.5


