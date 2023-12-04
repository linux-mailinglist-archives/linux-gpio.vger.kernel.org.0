Return-Path: <linux-gpio+bounces-994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81400803F5C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 21:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC8D0B20B53
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 20:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC54533096;
	Mon,  4 Dec 2023 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqaCNQo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789335EE1;
	Mon,  4 Dec 2023 20:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF78C433C9;
	Mon,  4 Dec 2023 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701722001;
	bh=rd8BmPu27v75Rg65UrLZRuh/0JMkbcbIdVmUTxGWlAw=;
	h=From:To:Cc:Subject:Date:From;
	b=FqaCNQo45I5cJ3LSoXcYJKE0oPQ9fE/zDsLrlPWRCeaCD51yNAhsDmEMIcATtGOGp
	 4pPNrz7NYtJqQTBPj28SlwV3WihMCUgSst1F/I/nZDYH96H9dRR+0fUrIMOwj/pRNq
	 pkzhCvl9/HucnKEhrvuN7x/W1m5OrAILKaQeeET6qhKq7JmB3c+J926ofZ2jQnlODf
	 V0r4HauDLPI5V1Os+1aPlLkwsXpPnB2r8bGhyblsDdWLDdQVcdCn3/23uR6v0eJ8pb
	 L5c0DpyUtXNq4FPHMpnWSO6N7kBTQ4Ay1x7g/C9VpLrhKB7qAuovp3nrjg5ncITwUR
	 NhfiuNvGI9iww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chester Lin <clin@suse.com>,
	kernel test robot <lkp@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 01/32] pinctrl: s32cc: Avoid possible string truncation
Date: Mon,  4 Dec 2023 15:32:21 -0500
Message-ID: <20231204203317.2092321-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.4
Content-Transfer-Encoding: 8bit

From: Chester Lin <clin@suse.com>

[ Upstream commit 08e8734d877a9a0fb8af1254a4ce58734fbef296 ]

With "W=1" and "-Wformat-truncation" build options, the kernel test robot
found a possible string truncation warning in pinctrl-s32cc.c, which uses
an 8-byte char array to hold a memory region name "map%u". Since the
maximum number of digits that a u32 value can present is 10, and the "map"
string occupies 3 bytes with a termination '\0', which means the rest 4
bytes cannot fully present the integer "X" that exceeds 4 digits.

Here we check if the number >= 10000, which is the lowest value that
contains more than 4 digits.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311030159.iyUGjNGF-lkp@intel.com/
Signed-off-by: Chester Lin <clin@suse.com>
Link: https://lore.kernel.org/r/20231107141044.24058-1-clin@suse.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 7daff9f186cd8..f0cad2c501f76 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -843,8 +843,8 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	if (mem_regions == 0) {
-		dev_err(&pdev->dev, "mem_regions is 0\n");
+	if (mem_regions == 0 || mem_regions >= 10000) {
+		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
 		return -EINVAL;
 	}
 
-- 
2.42.0


