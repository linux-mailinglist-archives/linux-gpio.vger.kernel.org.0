Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B520879CB57
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 11:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbjILJQ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 05:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbjILJQP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 05:16:15 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F3D10C4;
        Tue, 12 Sep 2023 02:15:51 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0E2C7240012;
        Tue, 12 Sep 2023 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1694510150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jukl2xLaQ3GlmAAGOPZIhmqjuhwO6JzdGl8a45IH9MI=;
        b=QnGFBIWM4A5xEjf6Ts37OenuoXTYHiR0yMFf/BPpTVL4slrXxcCmVSyn50kOg8EdkFXVyS
        iQV/OIl7EQgRTiITNU4d+h5GHf7kp+rQfqUKZCM9brIkUN6fjaa+S3iJ0OKLuCDWdEv0/t
        j60xVk8RYBKLkcwsa/N2xxBqxNwSJryNvTkGq3oTS8UJGv5tqK/8PblajnKvKiFTDRSc2w
        P27f+Q0bMwbzlenya8YC0LtNeifVZ2Wb1rGGu2QDSDov2rSivQy8eDFgBKIQORIjAkjSDI
        0DT9gJsHzNa9hEv1CHcYJIE6cEONnJ4dkEfmJWlc0b9ANK/QBTKlWa4vGOymDw==
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
Subject: [PATCH v5 04/31] soc: fsl: cpm1: qmc: Extend the API to provide Rx status
Date:   Tue, 12 Sep 2023 10:14:55 +0200
Message-ID: <20230912081527.208499-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In HDLC mode, some status flags related to the data read transfer can be
set by the hardware and need to be known by a QMC consumer for further
analysis.

Extend the API in order to provide these transfer status flags at the
read complete() call.

In TRANSPARENT mode, these flags have no meaning. Keep only one read
complete() API and update the consumers working in transparent mode.
In this case, the newly introduced flags parameter is simply unused.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c      | 29 +++++++++++++++++++++++++----
 include/soc/fsl/qe/qmc.h      | 15 ++++++++++++++-
 sound/soc/fsl/fsl_qmc_audio.c |  2 +-
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 8dc73cc1a83b..2d2a9d88ba6c 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -166,7 +166,7 @@
 struct qmc_xfer_desc {
 	union {
 		void (*tx_complete)(void *context);
-		void (*rx_complete)(void *context, size_t length);
+		void (*rx_complete)(void *context, size_t length, unsigned int flags);
 	};
 	void *context;
 };
@@ -421,7 +421,8 @@ static void qmc_chan_write_done(struct qmc_chan *chan)
 }
 
 int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
-			 void (*complete)(void *context, size_t length), void *context)
+			 void (*complete)(void *context, size_t length, unsigned int flags),
+			 void *context)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
@@ -454,6 +455,10 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	xfer_desc->rx_complete = complete;
 	xfer_desc->context = context;
 
+	/* Clear previous status flags */
+	ctrl &= ~(QMC_BD_RX_L | QMC_BD_RX_F | QMC_BD_RX_LG | QMC_BD_RX_NO |
+		  QMC_BD_RX_AB | QMC_BD_RX_CR);
+
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
 	wmb(); /* Be sure to flush data before descriptor activation */
@@ -485,7 +490,7 @@ EXPORT_SYMBOL(qmc_chan_read_submit);
 
 static void qmc_chan_read_done(struct qmc_chan *chan)
 {
-	void (*complete)(void *context, size_t size);
+	void (*complete)(void *context, size_t size, unsigned int flags);
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
 	cbd_t __iomem *bd;
@@ -527,7 +532,23 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 
 		if (complete) {
 			spin_unlock_irqrestore(&chan->rx_lock, flags);
-			complete(context, datalen);
+
+			/*
+			 * Avoid conversion between internal hardware flags and
+			 * the software API flags.
+			 * -> Be sure that the software API flags are consistent
+			 *    with the hardware flags
+			 */
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_LAST  != QMC_BD_RX_L);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_FIRST != QMC_BD_RX_F);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_OVF   != QMC_BD_RX_LG);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_UNA   != QMC_BD_RX_NO);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_ABORT != QMC_BD_RX_AB);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_CRC   != QMC_BD_RX_CR);
+
+			complete(context, datalen,
+				 ctrl & (QMC_BD_RX_L | QMC_BD_RX_F | QMC_BD_RX_LG |
+					 QMC_BD_RX_NO | QMC_BD_RX_AB | QMC_BD_RX_CR));
 			spin_lock_irqsave(&chan->rx_lock, flags);
 		}
 
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 3c61a50d2ae2..6f1d6cebc9fe 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -9,6 +9,7 @@
 #ifndef __SOC_FSL_QMC_H__
 #define __SOC_FSL_QMC_H__
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device_node;
@@ -56,8 +57,20 @@ int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param
 int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 			  void (*complete)(void *context), void *context);
 
+/* Flags available (ORed) for read complete() flags parameter in HDLC mode.
+ * No flags are available in transparent mode and the read complete() flags
+ * parameter has no meaning in transparent mode.
+ */
+#define QMC_RX_FLAG_HDLC_LAST	BIT(11) /* Last in frame */
+#define QMC_RX_FLAG_HDLC_FIRST	BIT(10) /* First in frame */
+#define QMC_RX_FLAG_HDLC_OVF	BIT(5)  /* Data overflow */
+#define QMC_RX_FLAG_HDLC_UNA	BIT(4)  /* Unaligned (ie. bits received not multiple of 8) */
+#define QMC_RX_FLAG_HDLC_ABORT	BIT(3)  /* Received an abort sequence (seven consecutive ones) */
+#define QMC_RX_FLAG_HDLC_CRC	BIT(2)  /* CRC error */
+
 int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
-			 void (*complete)(void *context, size_t length),
+			 void (*complete)(void *context, size_t length,
+					  unsigned int flags),
 			 void *context);
 
 #define QMC_CHAN_READ  (1<<0)
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 56d6b0b039a2..bfaaa451735b 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -99,7 +99,7 @@ static void qmc_audio_pcm_write_complete(void *context)
 	snd_pcm_period_elapsed(prtd->substream);
 }
 
-static void qmc_audio_pcm_read_complete(void *context, size_t length)
+static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
-- 
2.41.0

