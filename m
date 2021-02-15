Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13DD31B786
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 11:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhBOKoJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 05:44:09 -0500
Received: from m12-12.163.com ([220.181.12.12]:41480 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhBOKns (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Feb 2021 05:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=errhG
        B/dNXQnBjvPfS6mCK4LM81vQByDgSK+Rbhb0fQ=; b=eksNk+Sc39fsBtEnsZvu2
        ewCtxZi1NuEAwU2ggZs+NBG7ogJ0AOHVIiBc7dAGHAEa3e8DSATPOVVStCI+fokV
        tF3CImjQRglQ19asrym495Tpj0cns58wBgowPStkhaNxDxZbbCe6ndZQhvkyEIMQ
        VFIKUAstiqDiwKbOB4vH80=
Received: from yangjunlin.ccdomain.com (unknown [119.137.55.63])
        by smtp8 (Coremail) with SMTP id DMCowABnqdySTypgUVn9Qg--.6622S2;
        Mon, 15 Feb 2021 18:40:20 +0800 (CST)
From:   angkery <angkery@163.com>
To:     linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, maz@kernel.org, etienne.carriere@st.com,
        geert+renesas@glider.be, matti.vaittinen@fi.rohmeurope.com,
        fabien.dessenne@st.com, marex@denx.de
Cc:     linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] pinctrl: stm32: add missing of_node_put
Date:   Mon, 15 Feb 2021 18:36:43 +0800
Message-Id: <20210215103643.898-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowABnqdySTypgUVn9Qg--.6622S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZF1kur15GryDZw1kCryUZFb_yoW8JF45pF
        sxCry3K39xt390kryjyw1UZryaga1xKFW8Kw4Ig34xXFySyFWDJr13KFyUXr4DCFWxXa90
        kFy7Kay7ua1rWFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrXo7UUUUU=
X-Originating-IP: [119.137.55.63]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbBRhQ6I13l+nA-mAAAse
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Junlin Yang <yangjunlin@yulong.com>

Fix OF node leaks by calling of_node_put in
for_each_available_child_of_node when the cycle returns.

Generated by: scripts/coccinelle/iterators/for_each_child.cocci

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 7d9bded..da72e3e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1542,8 +1542,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (of_property_read_bool(child, "gpio-controller")) {
 			bank->rstc = of_reset_control_get_exclusive(child,
 								    NULL);
-			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER)
+			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
+				of_node_put(child);
 				return -EPROBE_DEFER;
+			}
 
 			bank->clk = of_clk_get_by_name(child, NULL);
 			if (IS_ERR(bank->clk)) {
@@ -1551,6 +1553,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 					dev_err(dev,
 						"failed to get clk (%ld)\n",
 						PTR_ERR(bank->clk));
+				of_node_put(child);
 				return PTR_ERR(bank->clk);
 			}
 			i++;
-- 
1.9.1


