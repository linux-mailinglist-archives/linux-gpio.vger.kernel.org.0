Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89187AAB1E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 10:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbjIVH7r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 03:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjIVH7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 03:59:39 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D23F192;
        Fri, 22 Sep 2023 00:59:28 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 45C961BF218;
        Fri, 22 Sep 2023 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1695369567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x+RB2ITbfqKP6mO7lXP9MlFfW3RztOHoR8uJSPHnXIA=;
        b=WEMjZBlxzwK41hS8zjzlvato3t8EDTQUHjA7bwTASBJaJpSBtr7L72lqPrScVADR9Fb3gq
        ZZ0Zr8DeC6ZUx+cwIWmSJRZweHE6CYWEgR8FeG2J1UoO3cs4S4TxpP1i1UVPYFHsdNmTvq
        cSl3Y13YO481t+jxusQz0LXPq41hWiEtTg7IMTLZoOwXfuv4R8CZDk5J4ZemY3xO5c3eNB
        ZLib6V5aM5gAZ6lSqLMvoKzR00GpDOHGH//YOBKpItKSYupbCz3XJ9LJsj1dajVakJhUQs
        eYlZU4DHvEGWOki4pxjmMrUROFaXsgs2humfKREbFKR1oZJ+GYxmVR7sHfsrHA==
From:   Herve Codina <herve.codina@bootlin.com>
To:     Herve Codina <herve.codina@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v6 01/30] soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
Date:   Fri, 22 Sep 2023 09:58:36 +0200
Message-ID: <20230922075913.422435-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922075913.422435-1-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Running sparse (make C=1) on tsa.c raises a lot of warning such as:
  --- 8< ---
  warning: incorrect type in assignment (different address spaces)
     expected void *[noderef] si_regs
     got void [noderef] __iomem *
  --- 8< ---

Indeed, some variable were declared 'type *__iomem var' instead of
'type __iomem *var'.

Use the correct declaration to remove these warnings.

Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/tsa.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 3646153117b3..e0527b9efd05 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -98,9 +98,9 @@
 #define TSA_SIRP	0x10
 
 struct tsa_entries_area {
-	void *__iomem entries_start;
-	void *__iomem entries_next;
-	void *__iomem last_entry;
+	void __iomem *entries_start;
+	void __iomem *entries_next;
+	void __iomem *last_entry;
 };
 
 struct tsa_tdm {
@@ -117,8 +117,8 @@ struct tsa_tdm {
 
 struct tsa {
 	struct device *dev;
-	void *__iomem si_regs;
-	void *__iomem si_ram;
+	void __iomem *si_regs;
+	void __iomem *si_ram;
 	resource_size_t si_ram_sz;
 	spinlock_t	lock;
 	int tdms; /* TSA_TDMx ORed */
@@ -135,27 +135,27 @@ static inline struct tsa *tsa_serial_get_tsa(struct tsa_serial *tsa_serial)
 	return container_of(tsa_serial, struct tsa, serials[tsa_serial->id]);
 }
 
-static inline void tsa_write32(void *__iomem addr, u32 val)
+static inline void tsa_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
-static inline void tsa_write8(void *__iomem addr, u32 val)
+static inline void tsa_write8(void __iomem *addr, u32 val)
 {
 	iowrite8(val, addr);
 }
 
-static inline u32 tsa_read32(void *__iomem addr)
+static inline u32 tsa_read32(void __iomem *addr)
 {
 	return ioread32be(addr);
 }
 
-static inline void tsa_clrbits32(void *__iomem addr, u32 clr)
+static inline void tsa_clrbits32(void __iomem *addr, u32 clr)
 {
 	tsa_write32(addr, tsa_read32(addr) & ~clr);
 }
 
-static inline void tsa_clrsetbits32(void *__iomem addr, u32 clr, u32 set)
+static inline void tsa_clrsetbits32(void __iomem *addr, u32 clr, u32 set)
 {
 	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
 }
@@ -313,7 +313,7 @@ static u32 tsa_serial_id2csel(struct tsa *tsa, u32 serial_id)
 static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
 			 u32 count, u32 serial_id)
 {
-	void *__iomem addr;
+	void __iomem *addr;
 	u32 left;
 	u32 val;
 	u32 cnt;
-- 
2.41.0

