Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D6547E4A6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348866AbhLWOmR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348868AbhLWOmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:15 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB29C061757
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqiD2600H1rdBcm06qiDqL; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a8y-Rn; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYm-Rs; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/60] pinctrl: renesas: Add generic support for pin group subsets
Date:   Thu, 23 Dec 2021 15:41:15 +0100
Message-Id: <b56c4257aee1eab698bae2cf7a08aa05775c0a77.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is fairly common for the pins in a pin group to be a subset of the
pins in another pin group.  Add a macro for defining a pin group that
refers to a subset of an array of pins.  This allows pin groups to share
pin data, and thus save memory.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/sh_pfc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index d6292a79282f198e..6f7fe21c982e5f48 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -58,6 +58,18 @@ struct sh_pfc_pin {
 }
 #define SH_PFC_PIN_GROUP(name)	SH_PFC_PIN_GROUP_ALIAS(name, name)
 
+/*
+ * Define a pin group referring to a subset of an array of pins.
+ */
+#define SH_PFC_PIN_GROUP_SUBSET(_name, data, first, n) {		\
+	.name = #_name,							\
+	.pins = data##_pins + first,					\
+	.mux = data##_mux + first,					\
+	.nr_pins = n +							\
+	BUILD_BUG_ON_ZERO(first + n > ARRAY_SIZE(data##_pins)) +	\
+	BUILD_BUG_ON_ZERO(first + n > ARRAY_SIZE(data##_mux)),		\
+}
+
 struct sh_pfc_pin_group {
 	const char *name;
 	const unsigned int *pins;
-- 
2.25.1

