Return-Path: <linux-gpio+bounces-172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A78857EC60B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 15:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CE65B20C22
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 14:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A923EA99;
	Wed, 15 Nov 2023 14:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mMf/1O3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50E3BB28;
	Wed, 15 Nov 2023 14:41:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFD1171F;
	Wed, 15 Nov 2023 06:41:01 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 492FEFF820;
	Wed, 15 Nov 2023 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700059260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ysg7h1PUHm7UOv27Tdv/l4knAulSkq2gkBV+9dzYtw=;
	b=mMf/1O3ArtQzW3/JIXnGnCAFSFNxtq5ZzU4oiqOzcGKc/QAGt9QQgjc9IsvS3C/TDqgLkd
	wyILROSDd1t4ie86mHYQnc23BGxy0EhuK+IfGkAl3kFkmWuF/bjim++fS+rzi7GfyBNeTv
	S3g7FzfUee3LonFuzCsVSG+Ey6dAPb9JnN8LF1JclYxGyvdoXQGvmgy+4KX8iyBrbWiPZD
	QCixosIrWm/5Mjos5cKJuEbBGTX+vpuAEYoT5QPztmQEtVsry4JGg6o35ctgqhfIkhmgVC
	0hgrVRkI1GlK1pSetMlaHYEDNYX/CVp7tMYDmivcqwmhArHVVNjKv0uPf+DrIg==
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
Subject: [PATCH v9 27/27] net: wan: fsl_qmc_hdlc: Add framer support
Date: Wed, 15 Nov 2023 15:40:03 +0100
Message-ID: <20231115144007.478111-28-herve.codina@bootlin.com>
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

Add framer support in the fsl_qmc_hdlc driver in order to be able to
signal carrier changes to the network stack based on the framer status
Also use this framer to provide information related to the E1/T1 line
interface on IF_GET_IFACE and configure the line interface according to
IF_IFACE_{E1,T1} information.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/wan/fsl_qmc_hdlc.c | 239 ++++++++++++++++++++++++++++++++-
 1 file changed, 235 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
index 82019cd96365..9bfb506a90cd 100644
--- a/drivers/net/wan/fsl_qmc_hdlc.c
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/framer/framer.h>
 #include <linux/hdlc.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -27,6 +28,9 @@ struct qmc_hdlc {
 	struct device *dev;
 	struct qmc_chan *qmc_chan;
 	struct net_device *netdev;
+	struct framer *framer;
+	spinlock_t carrier_lock; /* Protect carrier detection */
+	struct notifier_block nb;
 	bool is_crc32;
 	spinlock_t tx_lock; /* Protect tx descriptors */
 	struct qmc_hdlc_desc tx_descs[8];
@@ -40,6 +44,195 @@ static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
 	return dev_to_hdlc(netdev)->priv;
 }
 
+static int qmc_hdlc_framer_set_carrier(struct qmc_hdlc *qmc_hdlc)
+{
+	struct framer_status framer_status;
+	unsigned long flags;
+	int ret;
+
+	if (!qmc_hdlc->framer)
+		return 0;
+
+	spin_lock_irqsave(&qmc_hdlc->carrier_lock, flags);
+
+	ret = framer_get_status(qmc_hdlc->framer, &framer_status);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "get framer status failed (%d)\n", ret);
+		goto end;
+	}
+	if (framer_status.link_is_on)
+		netif_carrier_on(qmc_hdlc->netdev);
+	else
+		netif_carrier_off(qmc_hdlc->netdev);
+
+end:
+	spin_unlock_irqrestore(&qmc_hdlc->carrier_lock, flags);
+	return ret;
+}
+
+static int qmc_hdlc_framer_notifier(struct notifier_block *nb, unsigned long action,
+				    void *data)
+{
+	struct qmc_hdlc *qmc_hdlc = container_of(nb, struct qmc_hdlc, nb);
+	int ret;
+
+	if (action != FRAMER_EVENT_STATUS)
+		return NOTIFY_DONE;
+
+	ret = qmc_hdlc_framer_set_carrier(qmc_hdlc);
+	return ret ? NOTIFY_DONE : NOTIFY_OK;
+}
+
+static int qmc_hdlc_framer_start(struct qmc_hdlc *qmc_hdlc)
+{
+	struct framer_status framer_status;
+	int ret;
+
+	if (!qmc_hdlc->framer)
+		return 0;
+
+	ret = framer_power_on(qmc_hdlc->framer);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "framer power-on failed (%d)\n", ret);
+		return ret;
+	}
+
+	/* Be sure that get_status is supported */
+	ret = framer_get_status(qmc_hdlc->framer, &framer_status);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "get framer status failed (%d)\n", ret);
+		goto framer_power_off;
+	}
+
+	qmc_hdlc->nb.notifier_call = qmc_hdlc_framer_notifier;
+	ret = framer_notifier_register(qmc_hdlc->framer, &qmc_hdlc->nb);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "framer notifier register failed (%d)\n", ret);
+		goto framer_power_off;
+	}
+
+	return 0;
+
+framer_power_off:
+	framer_power_off(qmc_hdlc->framer);
+	return ret;
+}
+
+static void qmc_hdlc_framer_stop(struct qmc_hdlc *qmc_hdlc)
+{
+	if (!qmc_hdlc->framer)
+		return;
+
+	framer_notifier_unregister(qmc_hdlc->framer, &qmc_hdlc->nb);
+	framer_power_off(qmc_hdlc->framer);
+}
+
+static int qmc_hdlc_framer_set_iface(struct qmc_hdlc *qmc_hdlc, int if_iface,
+				     const te1_settings *te1)
+{
+	struct framer_config config;
+	int ret;
+
+	if (!qmc_hdlc->framer)
+		return 0;
+
+	ret = framer_get_config(qmc_hdlc->framer, &config);
+	if (ret)
+		return ret;
+
+	switch (if_iface) {
+	case IF_IFACE_E1:
+		config.iface = FRAMER_IFACE_E1;
+		break;
+	case IF_IFACE_T1:
+		config.iface = FRAMER_IFACE_T1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (te1->clock_type) {
+	case CLOCK_DEFAULT:
+		/* Keep current value */
+		break;
+	case CLOCK_EXT:
+		config.clock_type = FRAMER_CLOCK_EXT;
+		break;
+	case CLOCK_INT:
+		config.clock_type = FRAMER_CLOCK_INT;
+		break;
+	default:
+		return -EINVAL;
+	}
+	config.line_clock_rate = te1->clock_rate;
+
+	return framer_set_config(qmc_hdlc->framer, &config);
+}
+
+static int qmc_hdlc_framer_get_iface(struct qmc_hdlc *qmc_hdlc, int *if_iface, te1_settings *te1)
+{
+	struct framer_config config;
+	int ret;
+
+	if (!qmc_hdlc->framer) {
+		*if_iface = IF_IFACE_E1;
+		return 0;
+	}
+
+	ret = framer_get_config(qmc_hdlc->framer, &config);
+	if (ret)
+		return ret;
+
+	switch (config.iface) {
+	case FRAMER_IFACE_E1:
+		*if_iface = IF_IFACE_E1;
+		break;
+	case FRAMER_IFACE_T1:
+		*if_iface = IF_IFACE_T1;
+		break;
+	}
+
+	if (!te1)
+		return 0; /* Only iface type requested */
+
+	switch (config.clock_type) {
+	case FRAMER_CLOCK_EXT:
+		te1->clock_type = CLOCK_EXT;
+		break;
+	case FRAMER_CLOCK_INT:
+		te1->clock_type = CLOCK_INT;
+		break;
+	default:
+		return -EINVAL;
+	}
+	te1->clock_rate = config.line_clock_rate;
+	return 0;
+}
+
+static int qmc_hdlc_framer_init(struct qmc_hdlc *qmc_hdlc)
+{
+	int ret;
+
+	if (!qmc_hdlc->framer)
+		return 0;
+
+	ret = framer_init(qmc_hdlc->framer);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "framer init failed (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qmc_hdlc_framer_exit(struct qmc_hdlc *qmc_hdlc)
+{
+	if (!qmc_hdlc->framer)
+		return;
+
+	framer_exit(qmc_hdlc->framer);
+}
+
 static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size);
 
 #define QMC_HDLC_RX_ERROR_FLAGS (QMC_RX_FLAG_HDLC_OVF | \
@@ -313,6 +506,12 @@ static int qmc_hdlc_set_iface(struct qmc_hdlc *qmc_hdlc, int if_iface, const te1
 
 	qmc_hdlc->slot_map = te1->slot_map;
 
+	ret = qmc_hdlc_framer_set_iface(qmc_hdlc, if_iface, te1);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "framer set iface failed %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -320,11 +519,16 @@ static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
 {
 	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
 	te1_settings te1;
+	int ret;
 
 	switch (ifs->type) {
 	case IF_GET_IFACE:
-		ifs->type = IF_IFACE_E1;
 		if (ifs->size < sizeof(te1)) {
+			/* Retrieve type only */
+			ret = qmc_hdlc_framer_get_iface(qmc_hdlc, &ifs->type, NULL);
+			if (ret)
+				return ret;
+
 			if (!ifs->size)
 				return 0; /* only type requested */
 
@@ -334,6 +538,11 @@ static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
 
 		memset(&te1, 0, sizeof(te1));
 
+		/* Retrieve info from framer */
+		ret = qmc_hdlc_framer_get_iface(qmc_hdlc, &ifs->type, &te1);
+		if (ret)
+			return ret;
+
 		/* Update slot_map */
 		te1.slot_map = qmc_hdlc->slot_map;
 
@@ -367,10 +576,17 @@ static int qmc_hdlc_open(struct net_device *netdev)
 	int ret;
 	int i;
 
-	ret = hdlc_open(netdev);
+	ret = qmc_hdlc_framer_start(qmc_hdlc);
 	if (ret)
 		return ret;
 
+	ret = hdlc_open(netdev);
+	if (ret)
+		goto framer_stop;
+
+	/* Update carrier */
+	qmc_hdlc_framer_set_carrier(qmc_hdlc);
+
 	chan_param.mode = QMC_HDLC;
 	/* HDLC_MAX_MRU + 4 for the CRC
 	 * HDLC_MAX_MRU + 4 + 8 for the CRC and some extraspace needed by the QMC
@@ -420,6 +636,8 @@ static int qmc_hdlc_open(struct net_device *netdev)
 	}
 hdlc_close:
 	hdlc_close(netdev);
+framer_stop:
+	qmc_hdlc_framer_stop(qmc_hdlc);
 	return ret;
 }
 
@@ -455,6 +673,7 @@ static int qmc_hdlc_close(struct net_device *netdev)
 	}
 
 	hdlc_close(netdev);
+	qmc_hdlc_framer_stop(qmc_hdlc);
 	return 0;
 }
 
@@ -503,6 +722,7 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
 
 	qmc_hdlc->dev = &pdev->dev;
 	spin_lock_init(&qmc_hdlc->tx_lock);
+	spin_lock_init(&qmc_hdlc->carrier_lock);
 
 	qmc_hdlc->qmc_chan = devm_qmc_chan_get_bychild(qmc_hdlc->dev, np);
 	if (IS_ERR(qmc_hdlc->qmc_chan)) {
@@ -531,10 +751,19 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	qmc_hdlc->framer = devm_framer_optional_get(qmc_hdlc->dev, "fsl,framer");
+	if (IS_ERR(qmc_hdlc->framer))
+		return PTR_ERR(qmc_hdlc->framer);
+
+	ret = qmc_hdlc_framer_init(qmc_hdlc);
+	if (ret)
+		return ret;
+
 	qmc_hdlc->netdev = alloc_hdlcdev(qmc_hdlc);
 	if (!qmc_hdlc->netdev) {
 		dev_err(qmc_hdlc->dev, "failed to alloc hdlc dev\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto framer_exit;
 	}
 
 	hdlc = dev_to_hdlc(qmc_hdlc->netdev);
@@ -550,11 +779,12 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, qmc_hdlc);
-
 	return 0;
 
 free_netdev:
 	free_netdev(qmc_hdlc->netdev);
+framer_exit:
+	qmc_hdlc_framer_exit(qmc_hdlc);
 	return ret;
 }
 
@@ -564,6 +794,7 @@ static int qmc_hdlc_remove(struct platform_device *pdev)
 
 	unregister_hdlc_device(qmc_hdlc->netdev);
 	free_netdev(qmc_hdlc->netdev);
+	qmc_hdlc_framer_exit(qmc_hdlc);
 
 	return 0;
 }
-- 
2.41.0


