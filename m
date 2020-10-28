Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D976329D799
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732649AbgJ1WYo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:24:44 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:41692 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732582AbgJ1WV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:21:56 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLsc85sg3zMv7nV
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id lTGf2300h4C55Sk01TGf1z; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-000pDZ-Ii; Wed, 28 Oct 2020 16:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H8m-67; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] pinctrl: renesas: Remove superfluous goto in sh_pfc_gpio_set_direction()
Date:   Wed, 28 Oct 2020 16:16:30 +0100
Message-Id: <20201028151637.1734130-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit b13431ed6eab808a ("pinctrl: sh-pfc: Remove incomplete flag
"cfg->type"") removed the last statement in between the goto and the
label.  Hence remove both.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pinctrl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 212a4a9c3a8fc1c7..f8d5fae66e862fd6 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -460,12 +460,7 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	}
 
 	spin_lock_irqsave(&pfc->lock, flags);
-
 	ret = sh_pfc_config_mux(pfc, pin->enum_id, new_type);
-	if (ret < 0)
-		goto done;
-
-done:
 	spin_unlock_irqrestore(&pfc->lock, flags);
 	return ret;
 }
-- 
2.25.1

