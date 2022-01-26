Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F8249C9AC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 13:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241317AbiAZM3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 07:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbiAZM3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jan 2022 07:29:35 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D456C06161C
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jan 2022 04:29:35 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c4c8:1afa:4649:d034])
        by baptiste.telenet-ops.be with bizsmtp
        id nQVZ260042MCa5R01QVZh2; Wed, 26 Jan 2022 13:29:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nChQb-00BUGn-0i; Wed, 26 Jan 2022 13:29:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nChQa-004bWm-MO; Wed, 26 Jan 2022 13:29:32 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] pinctrl: renesas: r8a7790: Restore pin function sort order
Date:   Wed, 26 Jan 2022 13:29:30 +0100
Message-Id: <f4eb545cedcd1a72f0f80ef85daf03e2e423e90f.1643199959.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643199959.git.geert+renesas@glider.be>
References: <cover.1643199959.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the du* pin function where it belongs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 0aa141069daf3389..9db9e61d96bcca5a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -4852,10 +4852,10 @@ static const struct {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
 		SH_PFC_FUNCTION(avb),
-		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(can0),
 		SH_PFC_FUNCTION(can1),
 		SH_PFC_FUNCTION(can_clk),
+		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(du0),
 		SH_PFC_FUNCTION(du1),
 		SH_PFC_FUNCTION(du2),
-- 
2.25.1

