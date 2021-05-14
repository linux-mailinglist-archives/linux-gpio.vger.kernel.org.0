Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C5F380E66
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 18:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhENQru (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 12:47:50 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:44672 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230268AbhENQrt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 May 2021 12:47:49 -0400
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 May 2021 12:47:49 EDT
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id hapRlnFGlpK9whapVlGQyv; Fri, 14 May 2021 18:38:28 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621010308; bh=8nQDG6vC1szipD11G21qDci50418cKRMFqznBJX7giw=;
        h=From;
        b=ykxeE09f2pnfajedVkeEknAh+2ERHKba9xIcIYS09mHLPCrYNstMnRz/AXrKg98iZ
         6/6y3djlwQ17+0A5xbtNznFYdx/oUQX991f1IPH2suI7aU88khKIBOPmXTIMWRKJLm
         9uqjyIGHLwo+eVwFR6bWQ0fZUn9PtYjj4y3Hm1a/yORjb1xN9e3N+hP8oTgjOzAQ0Y
         qHswCPwpGQPQ2QLeFaRL0dr5QJ0l5vAnxmKc5WmU7JpTIyUigZZ1+bUdEXRGMK50eU
         4ExODJgYZ9ghVsxS49GB34IK95gSbXxMpqP4xPmIAchRKJ/b/6sikU4ZCL5XQVk9tA
         UUe7bmiFhHMlw==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=609ea784 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=KfjgPZeWCF2tvFJtEhQA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] pinctrl: single: config: enable the pin's input
Date:   Fri, 14 May 2021 18:38:18 +0200
Message-Id: <20210514163818.12178-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfJOb6TVjy4+GHqUGueOCUInhWSrMa1UIYRCaQkM6RJIgqh0evmhrQiliElV71tOev98m2PJgBz7IJ2r+fPWZ3yLh2Q0eUZP1Rbeu3MRw1ZyOuO1XfXGi
 LFEt4kryXhnVWVxrq8Ykh52Xd2zIoTGrhNpgcr/TYbVP58SbV7weAefcv5O/e3ZJVQg2wF4wfkdL1JxvwlJYQLJAtrFC0cXeqfZ+YhW0CsOB7Xv+NVb6w3RV
 fGm5LgDCd/sP13goFzGVSLcV8ZPoQF3EfRr33LDEeanALIuJNEHwfUc5ftC+3we0uWFfEPZSWwGnDTK5FiF7nRp7R/amNyC+uw+r11w1+ZUMnr22LHluzIvl
 wAKXzUfwxEUlP2Gl1Nv9kXvjR1XgQGhu9iga8syZni7VJfcPfZzqnZfU1fJk02zLIBuTBT23x9x3eI+Z1Fe+G0dcZwu6ZZN8cQzr9Ab4CefbUJE6o3jxCsmm
 3zM8Dyd9R4eexHMJJnMT9MJKJ0KG5jEXatCtrg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It enables / disables the input buffer. As explained in the description
of 'enum pin_config_param' this does not affect the pin's ability to
drive output.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/pinctrl/pinctrl-single.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2c9c9835f375..4e7cdb9ee855 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -534,6 +534,7 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_DRIVE_STRENGTH:
 		case PIN_CONFIG_SLEW_RATE:
 		case PIN_CONFIG_MODE_LOW_POWER:
+		case PIN_CONFIG_INPUT_ENABLE:
 		default:
 			*config = data;
 			break;
@@ -572,6 +573,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			case PIN_CONFIG_DRIVE_STRENGTH:
 			case PIN_CONFIG_SLEW_RATE:
 			case PIN_CONFIG_MODE_LOW_POWER:
+			case PIN_CONFIG_INPUT_ENABLE:
 				shift = ffs(func->conf[i].mask) - 1;
 				data &= ~func->conf[i].mask;
 				data |= (arg << shift) & func->conf[i].mask;
@@ -918,6 +920,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 	static const struct pcs_conf_type prop2[] = {
 		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
 		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
+		{ "pinctrl-single,input-enable", PIN_CONFIG_INPUT_ENABLE, },
 		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
 		{ "pinctrl-single,low-power-mode", PIN_CONFIG_MODE_LOW_POWER, },
 	};
-- 
2.17.1

