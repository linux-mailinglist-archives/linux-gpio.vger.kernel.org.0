Return-Path: <linux-gpio+bounces-19621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5D2AAA82B
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 02:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A6C3A8D56
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 00:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584D934567A;
	Mon,  5 May 2025 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRN59nBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFA9345670;
	Mon,  5 May 2025 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484718; cv=none; b=Y/555RnPIv1SuncF6TiDGFrC9kR17hw30fmVWyD9AZ/vFkTWkXGHUBaXsDF4FFHkqzI5ANw3AHqTYbdYC9fkF/2RP+ZCaZtuUHQyrZkrsHTjdv4uTwq5vInL5gOhI3pbLJOU39f1floeZGrzvMip8w4I6AyINcRXx1afXImMhEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484718; c=relaxed/simple;
	bh=1YTU3ESkwdVv6RB5nNltndQ7yTD5PJSLow+2vvkOpvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUJnUdlAYdJie2QVJgx8CXfI3/bszD4SaL4Js4rrK32CeIGaE7cFOw6DvtmHi4EU6RsFdfzbUinOkfMmB4sdFVWrEcdhLE79ezFc8c+4N+hodioeRmjWww1MuUGY+PkxGAyte+YLTf5/jFmM2nL79ytB+edEcZmsMgeckz0dQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRN59nBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB86C4CEE4;
	Mon,  5 May 2025 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484717;
	bh=1YTU3ESkwdVv6RB5nNltndQ7yTD5PJSLow+2vvkOpvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRN59nBjlmXmr48hq8ZHw2i3Qp0sClywaTQe83HIPhw2o2PDi++8plGPRfK5x8vRU
	 mDwEva1XMKRofsEomRejajl1JQeEYTXf2lKDgPnPUoN/AmYPHaMpcGkAPCs9qIyQ7X
	 mfKT/oA+QgBp7cJIBtcJV1WDHZpqNYP2U1gi2y2C0AOl9qvIVyOAck7z71iWrsvYMd
	 blDI5bMambQbIXg/X8xqC/k+I4KRk0wpdXSgbeEBSPX320do3Cpu+J8bbChK3JrgW4
	 B+KldZxNDbmFYIE5Tr3jh8kFUTxce9buYPqg6BssM2kViCSR3oGEJTsAmG4oGB4CS0
	 /U3YwPqDIQjeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	pshete@nvidia.com,
	peng.fan@nxp.com,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 625/642] pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()
Date: Mon,  5 May 2025 18:14:01 -0400
Message-Id: <20250505221419.2672473-625-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@linaro.org>

[ Upstream commit 5a062c3c3b82004766bc3ece82b594d337076152 ]

This should be >= pmx->soc->ngroups instead of > to avoid an out of
bounds access.  The pmx->soc->groups[] array is allocated in
tegra_pinctrl_probe().

Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kunwu Chan <kunwu.chan@linux.dev>
Link: https://lore.kernel.org/82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 27823e4207347..edcc78ebce456 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -305,7 +305,7 @@ static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 
-	if (group_index < 0 || group_index > pmx->soc->ngroups)
+	if (group_index < 0 || group_index >= pmx->soc->ngroups)
 		return NULL;
 
 	return &pmx->soc->groups[group_index];
-- 
2.39.5


