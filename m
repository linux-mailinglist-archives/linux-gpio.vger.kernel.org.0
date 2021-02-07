Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D761312676
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Feb 2021 18:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhBGRpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Feb 2021 12:45:19 -0500
Received: from m12-13.163.com ([220.181.12.13]:38218 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhBGRpS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 7 Feb 2021 12:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=xRGMz2+Y98v+90gy3L
        YVUzAcWLPNy7FWsh6R8cGnp+E=; b=WTCyWP5fn7t9lJ5WOYxufV7nmpCgIWJbyF
        kddKV5jveaw4Hoa0Dk4+rLYrzMYAqAoP4dx4/AfvEYsHhFqFs+wzGkt4T4TdshDB
        cP5p2ix7nWD2KJ9DN6Pj3u5UwOH9rEqeJaJBslGWK3NaxsiniQaxWqNG4Y7GNRYi
        I3GCRr3T0=
Received: from localhost.localdomain (unknown [223.87.231.49])
        by smtp9 (Coremail) with SMTP id DcCowADXFDpRAiBgqDBEeQ--.361S2;
        Sun, 07 Feb 2021 23:08:03 +0800 (CST)
From:   alex_luca@163.com
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, alex_luca@163.com,
        Zhang Kun <zhangkun@cdjrlc.com>
Subject: [PATCH] pinctrl: renesas:fix possible null pointer dereference struct pinmux_range *
Date:   Sun,  7 Feb 2021 23:07:36 +0800
Message-Id: <20210207150736.24382-1-alex_luca@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DcCowADXFDpRAiBgqDBEeQ--.361S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW8Kr47ArW7urWfCw17ZFb_yoW3twc_Ca
        48ta4xAFW5C3Z3ur4xZF43Xr9FkF48ursYqrnFqF43A347Xr4YyF95urZ7G348Gw17XFWq
        yFWvqr4ftr17AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUHmh7UUUUU==
X-Originating-IP: [223.87.231.49]
X-CM-SenderInfo: xdoh5spoxftqqrwthudrp/1tbiThMyylUDHqWZUAAAsB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Zhang Kun <zhangkun@cdjrlc.com>

The parameters of  sh_pfc_enum_in_range() pinmux_range *r should be checked
first for possible null ponter, especially when PINMUX_TYPE_FUNCTION as the
pinmux_type was passed by sh_pfc_config_mux().

Signed-off-by: Zhang Kun <zhangkun@cdjrlc.com>
---
 drivers/pinctrl/renesas/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 2cc457279345..40bbc8366668 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -128,6 +128,9 @@ int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin)
 
 static int sh_pfc_enum_in_range(u16 enum_id, const struct pinmux_range *r)
 {
+	if (!r)
+		return 0;
+
 	if (enum_id < r->begin)
 		return 0;
 
-- 
2.17.1


