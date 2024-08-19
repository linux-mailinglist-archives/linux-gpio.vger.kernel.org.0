Return-Path: <linux-gpio+bounces-8788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E65CE95615F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 05:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C9EFB21779
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 03:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B619813B592;
	Mon, 19 Aug 2024 03:09:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F73634
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 03:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724036987; cv=none; b=CIGfm6Ru4/P0xdjcfE+QwLsZWDv/F5Ah4VUbuSYycFKsGQcqjjPeu+WDV6XGdVXKuY24a3wBm0ZRglxPHcQZJXT4Eyv+RgSxi5g2mNvB7JmuXpGAgT8p48SXPwBJTqWPz6vreqsOVXJYQEvK8eqFxZNQd/BkiuIc7vJLZz+3N60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724036987; c=relaxed/simple;
	bh=CmsQPEpoeXB/ChZeq1efgsVDXesSsP8qS/CkLt11opM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tX9RNwM7YjyvvOFF9Mn79WhEbvD71DyzxA0cj5PRPupLjefTI5Lp6GqSgodkpak4acvyzae16g8qtTQVTWwIac5b8ZNTrCowhXI+1AIcpMtwVUyYd91g/kJzH7Rrgli2GahCGaU5M6K7Et2DRA2VI7+p9TAj/Izog7HvpqrFlpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WnHD91QnHz4f3jHk
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 10:51:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 2C3D91A07B6
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 10:51:36 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
	by APP4 (Coremail) with SMTP id gCh0CgAXPoQys8JmCk1eCA--.51495S4;
	Mon, 19 Aug 2024 10:51:36 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	dan.carpenter@linaro.org,
	tony@atomide.com,
	haojian.zhuang@linaro.org,
	liwei391@huawei.com,
	yangyingliang@huawei.com
Subject: [PATCH] pinctrl: single: fix missing error code in pcs_probe()
Date: Mon, 19 Aug 2024 10:46:25 +0800
Message-Id: <20240819024625.154441-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAXPoQys8JmCk1eCA--.51495S4
X-Coremail-Antispam: 1UD129KBjvdXoW7GF15GFy3tw17WF43Cr1UAwb_yoWfWrXEka
	y8WrW7XrWjgFs2g34jy345ZFy0kF4UXr4vyFnava4a9Fy7Zw1UJrWv9rnxC34fGr4Ygr97
	tr4kZw4SyF17AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UZSdgUUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

If pinctrl_enable() fails in pcs_probe(), it should return the error code.

Fixes: 8f773bfbdd42 ("pinctrl: single: fix possible memory leak when pinctrl_enable() fails")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pinctrl/pinctrl-single.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4c6bfabb6bd7..fcac0c03905c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1911,7 +1911,8 @@ static int pcs_probe(struct platform_device *pdev)
 
 	dev_info(pcs->dev, "%i pins, size %u\n", pcs->desc.npins, pcs->size);
 
-	if (pinctrl_enable(pcs->pctl))
+	ret = pinctrl_enable(pcs->pctl);
+	if (ret)
 		goto free;
 
 	return 0;
-- 
2.25.1


