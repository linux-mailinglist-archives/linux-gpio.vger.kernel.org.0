Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BCA47E4D3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348907AbhLWOm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348918AbhLWOmR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:17 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9180C06179E
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiE2600i1rdBcm01qiEMt; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a8x-Jq; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYf-RG; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/60] pinctrl: renesas: Rename SH_PFC_PIN_GROUP{,_ALIAS} args
Date:   Thu, 23 Dec 2021 15:41:14 +0100
Message-Id: <495fd5cd910d59489f4c1336e4a02da3679b5ffb.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename the arguments of the SH_PFC_PIN_GROUP_ALIAS() and
SH_PFC_PIN_GROUP() macros, to better reflect their purposes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/sh_pfc.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index d355e60244c6e5a8..d6292a79282f198e 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -49,14 +49,14 @@ struct sh_pfc_pin {
 	u16 enum_id;
 };
 
-#define SH_PFC_PIN_GROUP_ALIAS(alias, n) {				\
+#define SH_PFC_PIN_GROUP_ALIAS(alias, _name) {				\
 	.name = #alias,							\
-	.pins = n##_pins,						\
-	.mux = n##_mux,							\
-	.nr_pins = ARRAY_SIZE(n##_pins) +				\
-	BUILD_BUG_ON_ZERO(sizeof(n##_pins) != sizeof(n##_mux)),		\
+	.pins = _name##_pins,						\
+	.mux = _name##_mux,						\
+	.nr_pins = ARRAY_SIZE(_name##_pins) +				\
+	BUILD_BUG_ON_ZERO(sizeof(_name##_pins) != sizeof(_name##_mux)),	\
 }
-#define SH_PFC_PIN_GROUP(n)	SH_PFC_PIN_GROUP_ALIAS(n, n)
+#define SH_PFC_PIN_GROUP(name)	SH_PFC_PIN_GROUP_ALIAS(name, name)
 
 struct sh_pfc_pin_group {
 	const char *name;
-- 
2.25.1

