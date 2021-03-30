Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF83E34E34B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 10:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhC3IkH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 04:40:07 -0400
Received: from m12-12.163.com ([220.181.12.12]:34731 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231481AbhC3Ijq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 04:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8yDcz
        dMrd5NinK+fgDO57txeiD55po9jM0BzukzBidc=; b=mTheZg7eMK1V+KWlOP4yr
        wpOFHY/N2mem6wV1ZjwxwCsk5w9QzO21UKzHH1qaNA4K2GZ/p4J8rTnDqfyE8NdT
        nqVfE26foccq442LlT1TqagZP63381Qp4dkrg9Kp+vVc/CQqnhvcH5Qa6BkV7kVZ
        yN3wQU4Hh6KNvdBP7+BGz0=
Received: from yangjunlin.ccdomain.com (unknown [119.137.52.39])
        by smtp8 (Coremail) with SMTP id DMCowAAHDg6r42JgWtZ5XA--.134S2;
        Tue, 30 Mar 2021 16:39:11 +0800 (CST)
From:   angkery <angkery@163.com>
To:     linus.walleij@linaro.org, grandmaster@al2klimov.de,
        baijiaju1990@gmail.com, zhengyongjun3@huawei.com,
        jrdr.linux@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] pinctrl: ti: fix error return code of ti_iodelay_dt_node_to_map()
Date:   Tue, 30 Mar 2021 14:26:55 +0800
Message-Id: <20210330062655.1027-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAAHDg6r42JgWtZ5XA--.134S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4UWF45tw1kKF4xKw4rZrb_yoWfWFX_ua
        y0v34UXrykK3WfZF1DKr4fZFy0kF4kur1SvrnYqay3Zry7J397Cr97Xr45Ww4xW3yxAr9r
        Zr12vwn3ZrnrCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Ab1UUUUUU==
X-Originating-IP: [119.137.52.39]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbBFA9lI1aD+3qKGgAAsZ
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Junlin Yang <yangjunlin@yulong.com>

when devm_kcalloc fails, use -ENOMEM instead of -EINVAL,
and consistent with other devm_kcalloc return values.

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index e584826..4e23827 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -511,8 +511,10 @@ static int ti_iodelay_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	pins = devm_kcalloc(iod->dev, rows, sizeof(*pins), GFP_KERNEL);
-	if (!pins)
+	if (!pins) {
+		error = -ENOMEM;
 		goto free_group;
+	}
 
 	cfg = devm_kcalloc(iod->dev, rows, sizeof(*cfg), GFP_KERNEL);
 	if (!cfg) {
-- 
1.9.1


