Return-Path: <linux-gpio+bounces-11855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A149ACC5F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 16:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69F2283348
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 14:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15191CACDD;
	Wed, 23 Oct 2024 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uq7T524t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970AC1C9ED6;
	Wed, 23 Oct 2024 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693823; cv=none; b=JAAWrSoM0DAaR0LsODuBN+x4//cVmOxUNSiym/iPtO/IphmNsrwzeyWa8MYcyzbx0iPyzp+DrO6kKt6YDfcTK7gWmiUKPnWiswPIalBppJycJ+yQLvUdRlSs5cE47Jj+tvIgN3tl6XV/Q40a/M8cfWe6Kv7FqbBm+nHSYtRqVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693823; c=relaxed/simple;
	bh=Q9hqRoQ4qEHP2CU6+WUPGiEkJgRQ1LIR8djjGXuPW14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4QXyIUs86iQvVitr6mZyw7Z9LqpFvy4QvipyZkpoOeme8yWHRa9fRHG+1Q9nKLyABEVlvhQnlz9f0R3ihc3LFzCe/hM1ufYx04X9IVRs7YXp05aZxNofa2w2d9CaUG+xB2zx1jWD5ibKCVZ26gebLmNXSg7Q36/X13QVeq/MC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uq7T524t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFA7C4CEE4;
	Wed, 23 Oct 2024 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693823;
	bh=Q9hqRoQ4qEHP2CU6+WUPGiEkJgRQ1LIR8djjGXuPW14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uq7T524tN/mBmd16+WFn6m/8nq0rOl7XauZCsySnWfoCD2ONdYf90ttMH3UyA1BzA
	 KnjRHaDjWRYdBVswhq1rjf6cZ8ZjkDoZkNB4LncSbwtGYAM+Cna4qUP8jRBcr0vMk+
	 4uTn1q/efpSdh6LiIyrWAcloGXWWq3EdkBGygY82rA3/QKE+bvAN4vB2MmFKRHIzdf
	 lOnb0/JkxFM0tW2U7l55MS4eXwbbTkwLhSdNncE/XqM7V/XKqrX4n0YpnsN1nVD3xy
	 hzhbYVg7HC6+DhMSpE6vgFwqhaPtEpbH8YfUg772CLC84EWESDcksJzplKHhxEpUDD
	 b1HlXL8HWkpyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 06/30] pinctrl: aw9523: add missing mutex_destroy
Date: Wed, 23 Oct 2024 10:29:31 -0400
Message-ID: <20241023143012.2980728-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit

From: Rosen Penev <rosenp@gmail.com>

[ Upstream commit 393c554093c0c4cbc8e2f178d36df169016384da ]

Otherwise the mutex remains after a failed kzalloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Link: https://lore.kernel.org/20241001212724.309320-1-rosenp@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-aw9523.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index b5e1c467625ba..1374f30166bc3 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -987,8 +987,10 @@ static int aw9523_probe(struct i2c_client *client)
 	lockdep_set_subclass(&awi->i2c_lock, i2c_adapter_depth(client->adapter));
 
 	pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
-	if (!pdesc)
-		return -ENOMEM;
+	if (!pdesc) {
+		ret = -ENOMEM;
+		goto err_disable_vregs;
+	}
 
 	ret = aw9523_hw_init(awi);
 	if (ret)
-- 
2.43.0


