Return-Path: <linux-gpio+bounces-146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E47EC592
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 15:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E251B20C05
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671CB2C847;
	Wed, 15 Nov 2023 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b2q7eO3n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004F2FC36;
	Wed, 15 Nov 2023 14:40:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52A5AB;
	Wed, 15 Nov 2023 06:40:18 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6DEBBFF819;
	Wed, 15 Nov 2023 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700059217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntzG6ybotYjozkAeYHyWB4F1x10leAK3nGo8q37pzGw=;
	b=b2q7eO3nLewI3RYpBon72DLCQHmYUR2TykmiajTdXE1bJKJBoOcbt6DKDQ2LT1+p1Z7Fzc
	L8+QipIFpmG/ewidhDUOvzVJsA++fNbPoVsw7yyURyGwLLaC54P6qq+5INSsExgCjAOyiN
	di/yKlOdALhUsDOravlufMpPgG06/KVg76NCWlSzhZWvqoKjr3FXod/Mfu2U+ERV5XJE/Z
	MorbrmJ8oha0q/DhjOXj2tPgegPEYGdf8Gi8JlgEhoC6EOPygb72qOa9lZdRS1EYfOZ2TK
	oKo5M2oX9jinzmVUKwzd++JHOf/sVwc2yqY97TTNUqczizLgXmj8vWPpgZofDQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
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
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v9 01/27] soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
Date: Wed, 15 Nov 2023 15:39:37 +0100
Message-ID: <20231115144007.478111-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115144007.478111-1-herve.codina@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

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
index 3f9981335590..6c5741cf5e9d 100644
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


