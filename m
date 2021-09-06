Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CCE401C89
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 15:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242693AbhIFNnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 09:43:17 -0400
Received: from smtpbg587.qq.com ([113.96.223.105]:38239 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242225AbhIFNnR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Sep 2021 09:43:17 -0400
X-QQ-mid: bizesmtp44t1630935649t50rakj1
Received: from localhost.localdomain (unknown [171.223.98.107])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 06 Sep 2021 21:40:48 +0800 (CST)
X-QQ-SSF: 01000000004000C0D000B00A0000000
X-QQ-FEAT: XokQyc2mVUwxcgEl0jCU/fg+0KFIgWBbOOIJVvdcnqT8CtXtQD7gQvFfsYpPb
        4OyjtSXZ41Uj23YWZoFr24L/WuOLZ/f5OK8izS+5cqPMwg0skXfBOvshPHhTv6/IO/qjYh3
        kNop1FxnTvjlI0IlpKve7HDiBN/SmxBXI155HXXTKSt+almvM9ZevKhxaKnNZFCWaBve2r6
        6y4eyVRKWi4JF6UXx437PhrHjOCph02qW99HI3DCZzl2nCvLGOx0BqCHP+/PJX8bhFZhAlY
        ldboUh6LAYG3S5a+7Veo01nm+2+1wRLWiWn/GDO8XVw9x+WzgjsvsKYSuMzT7ppbog1w==
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     linus.walleij@linaro.org
Cc:     geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] pinctrl: renesas: no need to initialise global statics
Date:   Mon,  6 Sep 2021 21:40:40 +0800
Message-Id: <20210906134040.96642-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam3
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Global static variables dont need to be initialised to 0. Because
the compiler will initialise them.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/pinctrl/renesas/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index f2ab02225837..ef8ef05ba930 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -741,12 +741,12 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 #define SH_PFC_MAX_REGS		300
 #define SH_PFC_MAX_ENUMS	3000
 
-static unsigned int sh_pfc_errors __initdata = 0;
-static unsigned int sh_pfc_warnings __initdata = 0;
-static u32 *sh_pfc_regs __initdata = NULL;
-static u32 sh_pfc_num_regs __initdata = 0;
-static u16 *sh_pfc_enums __initdata = NULL;
-static u32 sh_pfc_num_enums __initdata = 0;
+static unsigned int sh_pfc_errors __initdata;
+static unsigned int sh_pfc_warnings __initdata;
+static u32 *sh_pfc_regs __initdata;
+static u32 sh_pfc_num_regs __initdata;
+static u16 *sh_pfc_enums __initdata;
+static u32 sh_pfc_num_enums __initdata;
 
 #define sh_pfc_err(fmt, ...)					\
 	do {							\
-- 
2.33.0

