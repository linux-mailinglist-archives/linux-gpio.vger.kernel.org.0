Return-Path: <linux-gpio+bounces-9657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BAA96A0A0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CE651C23E12
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E4D13DB88;
	Tue,  3 Sep 2024 14:29:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230E7E563
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373784; cv=none; b=VeqXqhASq2cMp0j851Uw15AMCzzD+khVTgB7oOb076VeJdrqnG/iTXAFTt6mHJ6kpL4gnB7ssXc22TVFZAfeuRx2xlCVSHELN4iJop49+p3r7l//PBuPtkLUxRkUnH+rfZpHCjV5LB54vkCWNRiM3rrWcXhWdKm7h0qZXEdIvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373784; c=relaxed/simple;
	bh=3jqNPn7KlVaRvnogk9KQ5TV+irPRO5LH3Jbns/XW9Zg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aquJkjEMhpPrcY1CZ/DM3dF/THOjCcwYypthZR47Uqbm0CRurXYhYVhE2fVrb2onIUfnmaLIidplqJu5kITDAU5/RISbO6AQHR0xtd3k0pR4fkeBMVqzDOSQ86cEnY7shsA/3W7a4vm7YqjcgqWD57EjbabTzT9KaQOSDj+Yivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wynzt2fH8z18N58;
	Tue,  3 Sep 2024 22:28:42 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id A022718009B;
	Tue,  3 Sep 2024 22:29:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 3 Sep
 2024 22:29:38 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <linus.walleij@linaro.org>
CC: <lizetao1@huawei.com>, <linux-gpio@vger.kernel.org>
Subject: [PATCH -next] pinctrl: Remove redundant null pointer checks in pinctrl_remove_device_debugfs()
Date: Tue, 3 Sep 2024 22:38:12 +0800
Message-ID: <20240903143812.2005071-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant, and using IS_ERR is
safe enough.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 314ab93d7691..4061890a1748 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1971,7 +1971,7 @@ static void pinctrl_remove_device_debugfs(struct pinctrl_dev *pctldev)
 static void pinctrl_init_debugfs(void)
 {
 	debugfs_root = debugfs_create_dir("pinctrl", NULL);
-	if (IS_ERR(debugfs_root) || !debugfs_root) {
+	if (IS_ERR(debugfs_root)) {
 		pr_warn("failed to create debugfs directory\n");
 		debugfs_root = NULL;
 		return;
-- 
2.34.1


