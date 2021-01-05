Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049B72EAC5B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 14:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbhAENxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 08:53:39 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10390 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbhAENxi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 08:53:38 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D9DSc61chz7QY0;
        Tue,  5 Jan 2021 21:52:00 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Tue, 5 Jan 2021
 21:52:44 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Ye Bin <yebin10@huawei.com>
Subject: [PATCH] =?UTF-8?q?pinctrl:=20nomadik:=20remove=20unused=20variabl?= =?UTF-8?q?e=20=E2=80=98wake=E2=80=99=20in=20nmk=5Fgpio=5Fdbg=5Fshow=5Fone?=
Date:   Tue, 5 Jan 2021 22:04:20 +0800
Message-ID: <20210105140420.55841-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix follow warning:
drivers/pinctrl/nomadik/pinctrl-nomadik.c:952:8: warning: unused
variable ‘wake’ [-Wunused-variable]
   bool wake;
           ^~~~
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index d4ea10803fd9..abfe11c7b49f 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -949,7 +949,6 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 	} else {
 		int irq = chip->to_irq(chip, offset);
 		const int pullidx = pull ? 1 : 0;
-		bool wake;
 		int val;
 		static const char * const pulls[] = {
 			"none        ",
-- 
2.16.2.dirty

