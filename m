Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7E5197632
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 10:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgC3IHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 04:07:33 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:10545 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbgC3IHc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 04:07:32 -0400
X-Greylist: delayed 546 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Mar 2020 04:07:31 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5e81a66c798-0a7d3; Mon, 30 Mar 2020 15:57:32 +0800 (CST)
X-RM-TRANSID: 2eec5e81a66c798-0a7d3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
        by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95e81a66be31-380c6;
        Mon, 30 Mar 2020 15:57:32 +0800 (CST)
X-RM-TRANSID: 2ee95e81a66be31-380c6
From:   Ding Xiang <dingxiang@cmss.chinamobile.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: nomadik:remove unneeded variable
Date:   Mon, 30 Mar 2020 15:56:26 +0800
Message-Id: <1585554986-26521-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ret is unneeded, just return 0.

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 95f864d..4c56483 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1340,8 +1340,6 @@ struct nmk_cfg_param {
 
 static int nmk_dt_pin_config(int index, int val, unsigned long *config)
 {
-	int ret = 0;
-
 	if (nmk_cfg_params[index].choice == NULL)
 		*config = nmk_cfg_params[index].config;
 	else {
@@ -1351,7 +1349,7 @@ static int nmk_dt_pin_config(int index, int val, unsigned long *config)
 				nmk_cfg_params[index].choice[val];
 		}
 	}
-	return ret;
+	return 0;
 }
 
 static const char *nmk_find_pin_name(struct pinctrl_dev *pctldev, const char *pin_name)
-- 
1.9.1



