Return-Path: <linux-gpio+bounces-18230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91426A7B3C5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 02:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A00C3B78D9
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 00:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ADA205E09;
	Fri,  4 Apr 2025 00:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2PTRacn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D718BC3F;
	Fri,  4 Apr 2025 00:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725225; cv=none; b=rTUC8dz+aA60KRD76mEn5KuGJsSdk2nVg+mJHQMhCp3XG9tlwL88WDI6TiYkH8DWgpnBa0iA3fST35+JV1VCyN965aD+bzVodjlsOp9Rbko61Kbr6MQ5P1B9G1qRlWAy1MEDEg6ZKeo48o7kyU+AQ0iyWVKCGguo5SHSbzZFmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725225; c=relaxed/simple;
	bh=pUnn8vxwCFbiCaLWH2BwJ1k4g9VEAMybinWn0xgiA9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qGx4SvJZpiP62y1kDmgmN7LMuKvcBQAFYujEVpwubhKII4GGVDGjv8qO5nglcbB9ci3b9fv1YKn6rmzldFnqy5czJZkVpEG4hDuaNxqHnPFDS831P8VDHjDejkXsiIqd4z1LqGSwMbn1oKetxL6tlLmrIJzaLhTVNccNCH22gSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2PTRacn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C60C4CEE3;
	Fri,  4 Apr 2025 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725225;
	bh=pUnn8vxwCFbiCaLWH2BwJ1k4g9VEAMybinWn0xgiA9U=;
	h=From:To:Cc:Subject:Date:From;
	b=W2PTRacniIuO6EmamsbjPZ8DIsAuDyoLvZ8PTd7yME04oRuhI2tQv+i8fLX2NUkji
	 RrBNiUQtUKNOCohIV1SxvnSG8wmwEIAroiforYC1l0/6/Miyxrm4LyNX/Q4NXZiHi7
	 n8/SOaunyfddEoiLXOv9pwlt8AjKYDIKnXU2PRrUElPiWcnfXpe4SFDQU7828Wn/8p
	 PW8GkTs31YrBnQgO0lXcuYjz6CcX9QcwuOG8WgFr8TOrT2uFfBu5DMp1QtmEydxbpr
	 Jys/SBizI61dxX1zhvRSnf5XpqfcvReYsja0S/PNUfr9XJjGEWf5g5ac8Ls9dqu6q4
	 yO7q1ZMFKCTdw==
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
Subject: [PATCH AUTOSEL 6.1 01/10] pinctrl: renesas: rza2: Fix potential NULL pointer dereference
Date: Thu,  3 Apr 2025 20:06:51 -0400
Message-Id: <20250404000700.2689158-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
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
index 12126e30dc20f..e94a6120e1e81 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -242,6 +242,9 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 	int ret;
 
 	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
+	if (!chip.label)
+		return -ENOMEM;
+
 	chip.parent = priv->dev;
 	chip.ngpio = priv->npins;
 
-- 
2.39.5


