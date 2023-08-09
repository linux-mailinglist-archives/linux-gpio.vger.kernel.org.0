Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735CE7760D3
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Aug 2023 15:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjHIN3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 09:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbjHIN3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 09:29:12 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67192694;
        Wed,  9 Aug 2023 06:28:44 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5F4CE40005;
        Wed,  9 Aug 2023 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1691587723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uQ3917j1QKFVMchC0NDh3He7Mv7+pQN1Yb6zVv0V+kU=;
        b=SXZToSvzE1w64d83tMR/QLXpD5slx30H3QyLV+KDIIsbCslMvqhBmRB2n43d0St8txi0/u
        W3Kh65tsSG3S8JSVESV+elCqgemNzMjew3bHv5u2iwz+60Dm2AchLF69Zds89xu8r5OflU
        S92wyLjFdBvenAuhij7pVjQhd34cO57LTCIwIPZpwP5NQbYsvDyR+wWmAOe06PCbFKp5gR
        N4FqKhkDubGuTklmPvyouzpbBQI+PwNbF+gem4Z9iuvqZ3g47JvMeumd4BEUi7TcOc2Bwg
        GxUJWozEcaHOKMZKqRBQmVnLcTrJzhooB18+C/4aeH3+HTIkR/5GXUlyQ8pO8A==
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
        alsa-devel@alsa-project.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 17/28] soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and stop()
Date:   Wed,  9 Aug 2023 15:27:44 +0200
Message-ID: <20230809132757.2470544-18-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809132757.2470544-1-herve.codina@bootlin.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to support runtime timeslot route changes, enable the
channel timeslot entries at channel start() and disable them at
channel stop().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 175 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 163 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 610be2b8855c..00408da14cb4 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -177,6 +177,7 @@ struct qmc_chan {
 	struct qmc *qmc;
 	void __iomem *s_param;
 	enum qmc_mode mode;
+	spinlock_t	ts_lock; /* Protect timeslots */
 	u64	tx_ts_mask_avail;
 	u64	tx_ts_mask;
 	u64	rx_ts_mask_avail;
@@ -265,6 +266,7 @@ static void qmc_setbits32(void __iomem *addr, u32 set)
 int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 {
 	struct tsa_serial_info tsa_info;
+	unsigned long flags;
 	int ret;
 
 	/* Retrieve info from the TSA related serial */
@@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(&chan->ts_lock, flags);
+
 	info->mode = chan->mode;
 	info->rx_fs_rate = tsa_info.rx_fs_rate;
 	info->rx_bit_rate = tsa_info.rx_bit_rate;
@@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 	info->tx_bit_rate = tsa_info.tx_bit_rate;
 	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
 
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+
 	return 0;
 }
 EXPORT_SYMBOL(qmc_chan_get_info);
@@ -683,6 +689,40 @@ static int qmc_chan_setup_tsa_32tx(struct qmc_chan *chan, const struct tsa_seria
 	return 0;
 }
 
+static int qmc_chan_setup_tsa_tx(struct qmc_chan *chan, bool enable)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Setup entries */
+	if (chan->qmc->is_tsa_64rxtx)
+		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
+
+	return qmc_chan_setup_tsa_32tx(chan, &info, enable);
+}
+
+static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Setup entries */
+	if (chan->qmc->is_tsa_64rxtx)
+		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
+
+	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
+}
+
 static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 {
 	struct tsa_serial_info info;
@@ -719,6 +759,12 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
 
+	if (chan->is_rx_stopped) {
+		/* The channel is already stopped -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
 	/* Send STOP RECEIVE command */
 	ret = qmc_chan_command(chan, 0x0);
 	if (ret) {
@@ -729,6 +775,15 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 
 	chan->is_rx_stopped = true;
 
+	if (!chan->qmc->is_tsa_64rxtx || chan->is_tx_stopped) {
+		ret = qmc_chan_setup_tsa_rx(chan, false);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: Disable tsa entries failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
+	}
+
 end:
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 	return ret;
@@ -741,6 +796,12 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
 
+	if (chan->is_tx_stopped) {
+		/* The channel is already stopped -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
 	/* Send STOP TRANSMIT command */
 	ret = qmc_chan_command(chan, 0x1);
 	if (ret) {
@@ -751,37 +812,82 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 
 	chan->is_tx_stopped = true;
 
+	if (!chan->qmc->is_tsa_64rxtx || chan->is_rx_stopped) {
+		ret = qmc_chan_setup_tsa_tx(chan, false);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: Disable tsa entries failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
+	}
+
 end:
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
 	return ret;
 }
 
+static int qmc_chan_start_rx(struct qmc_chan *chan);
+
 int qmc_chan_stop(struct qmc_chan *chan, int direction)
 {
-	int ret;
+	bool is_rx_rollback_needed = false;
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&chan->ts_lock, flags);
 
 	if (direction & QMC_CHAN_READ) {
+		is_rx_rollback_needed = !chan->is_rx_stopped;
 		ret = qmc_chan_stop_rx(chan);
 		if (ret)
-			return ret;
+			goto end;
 	}
 
 	if (direction & QMC_CHAN_WRITE) {
 		ret = qmc_chan_stop_tx(chan);
-		if (ret)
-			return ret;
+		if (ret) {
+			/* Restart rx if needed */
+			if (is_rx_rollback_needed)
+				qmc_chan_start_rx(chan);
+			goto end;
+		}
 	}
 
-	return 0;
+end:
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+	return ret;
 }
 EXPORT_SYMBOL(qmc_chan_stop);
 
-static void qmc_chan_start_rx(struct qmc_chan *chan)
+static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
+
+static int qmc_chan_start_rx(struct qmc_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
 
+	if (!chan->is_rx_stopped) {
+		/* The channel is already started -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
+	ret = qmc_chan_setup_tsa_rx(chan, true);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Enable tsa entries failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
 	/* Restart the receiver */
 	if (chan->mode == QMC_TRANSPARENT)
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
@@ -792,15 +898,38 @@ static void qmc_chan_start_rx(struct qmc_chan *chan)
 
 	chan->is_rx_stopped = false;
 
+end:
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
+	return ret;
 }
 
-static void qmc_chan_start_tx(struct qmc_chan *chan)
+static int qmc_chan_start_tx(struct qmc_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
 
+	if (!chan->is_tx_stopped) {
+		/* The channel is already started -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
+	ret = qmc_chan_setup_tsa_tx(chan, true);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Enable tsa entries failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
 	/*
 	 * Enable channel transmitter as it could be disabled if
 	 * qmc_chan_reset() was called.
@@ -812,18 +941,39 @@ static void qmc_chan_start_tx(struct qmc_chan *chan)
 
 	chan->is_tx_stopped = false;
 
+end:
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
+	return ret;
 }
 
 int qmc_chan_start(struct qmc_chan *chan, int direction)
 {
-	if (direction & QMC_CHAN_READ)
-		qmc_chan_start_rx(chan);
+	bool is_rx_rollback_needed = false;
+	unsigned long flags;
+	int ret = 0;
 
-	if (direction & QMC_CHAN_WRITE)
-		qmc_chan_start_tx(chan);
+	spin_lock_irqsave(&chan->ts_lock, flags);
 
-	return 0;
+	if (direction & QMC_CHAN_READ) {
+		is_rx_rollback_needed = chan->is_rx_stopped;
+		ret = qmc_chan_start_rx(chan);
+		if (ret)
+			goto end;
+	}
+
+	if (direction & QMC_CHAN_WRITE) {
+		ret = qmc_chan_start_tx(chan);
+		if (ret) {
+			/* Restop rx if needed */
+			if (is_rx_rollback_needed)
+				qmc_chan_stop_rx(chan);
+			goto end;
+		}
+	}
+
+end:
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+	return ret;
 }
 EXPORT_SYMBOL(qmc_chan_start);
 
@@ -992,6 +1142,7 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		}
 
 		chan->id = chan_id;
+		spin_lock_init(&chan->ts_lock);
 		spin_lock_init(&chan->rx_lock);
 		spin_lock_init(&chan->tx_lock);
 
-- 
2.41.0

