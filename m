Return-Path: <linux-gpio+bounces-151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D760C7EC5A3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 15:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 583FC1F27645
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 14:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF6B33CDC;
	Wed, 15 Nov 2023 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KrcrEFY8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03C33CD8;
	Wed, 15 Nov 2023 14:40:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7068E1706;
	Wed, 15 Nov 2023 06:40:27 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 19E93FF80D;
	Wed, 15 Nov 2023 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700059225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iw0he/eMliW08eqoSvHMYrNGnDe+h1GkLIEhwTKgW3w=;
	b=KrcrEFY8b8jyP7vnep/tWcobGg6jopjOKj1ItdyzONrXzwnWM9YuoRMJpIkUJQWYI0YDaB
	w+x+FA/dWBbyTuxz5vyA6cSqwf83Isg7QquoZl90OHA+OhfACg70un0l5U6KRNCxPXUOWK
	KAD7j5358qHpASqkKW5y5xjia6bcwdXlGsTcahxCg8JeDLxB+glNyr7KM4iB9OZyTWZcD8
	kVGHspd447eTqCFEwMvD5tIiMYLuiya0NZAUOb6/73jZGo6XgsNtOxDHGIYrj6tTHFFgYQ
	3NR+FTVJDvbVXvOGzn3SUIH+uaif7g28iU7qyG3UZqNguY3ei/S2zvRHF6Nwkw==
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
Subject: [PATCH v9 06/27] soc: fsl: cpm1: qmc: Add support for child devices
Date: Wed, 15 Nov 2023 15:39:42 +0100
Message-ID: <20231115144007.478111-7-herve.codina@bootlin.com>
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

QMC child devices support is needed to avoid orphan DT nodes that use a
simple DT phandle to reference a QMC channel.

Allow to instantiate child devices and also extend the API to get the
qmc_chan using a child device.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 91 +++++++++++++++++++++++++++++++---------
 include/soc/fsl/qe/qmc.h |  2 +
 2 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 27f2f16deac9..e716f13669a0 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1425,8 +1425,16 @@ static int qmc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmc);
 
+	/* Populate channel related devices */
+	ret = devm_of_platform_populate(qmc->dev);
+	if (ret)
+		goto err_disable_txrx;
+
 	return 0;
 
+err_disable_txrx:
+	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
+
 err_disable_intr:
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
 
@@ -1465,26 +1473,16 @@ static struct platform_driver qmc_driver = {
 };
 module_platform_driver(qmc_driver);
 
-struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+static struct qmc_chan *qmc_chan_get_from_qmc(struct device_node *qmc_np, unsigned int chan_index)
 {
-	struct of_phandle_args out_args;
 	struct platform_device *pdev;
 	struct qmc_chan *qmc_chan;
 	struct qmc *qmc;
-	int ret;
 
-	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
-					       &out_args);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	if (!of_match_node(qmc_driver.driver.of_match_table, out_args.np)) {
-		of_node_put(out_args.np);
+	if (!of_match_node(qmc_driver.driver.of_match_table, qmc_np))
 		return ERR_PTR(-EINVAL);
-	}
 
-	pdev = of_find_device_by_node(out_args.np);
-	of_node_put(out_args.np);
+	pdev = of_find_device_by_node(qmc_np);
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
 
@@ -1494,17 +1492,12 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if (out_args.args_count != 1) {
+	if (chan_index >= ARRAY_SIZE(qmc->chans)) {
 		platform_device_put(pdev);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (out_args.args[0] >= ARRAY_SIZE(qmc->chans)) {
-		platform_device_put(pdev);
-		return ERR_PTR(-EINVAL);
-	}
-
-	qmc_chan = qmc->chans[out_args.args[0]];
+	qmc_chan = qmc->chans[chan_index];
 	if (!qmc_chan) {
 		platform_device_put(pdev);
 		return ERR_PTR(-ENOENT);
@@ -1512,8 +1505,44 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 
 	return qmc_chan;
 }
+
+struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+{
+	struct of_phandle_args out_args;
+	struct qmc_chan *qmc_chan;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
+					       &out_args);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (out_args.args_count != 1) {
+		of_node_put(out_args.np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	qmc_chan = qmc_chan_get_from_qmc(out_args.np, out_args.args[0]);
+	of_node_put(out_args.np);
+	return qmc_chan;
+}
 EXPORT_SYMBOL(qmc_chan_get_byphandle);
 
+struct qmc_chan *qmc_chan_get_bychild(struct device_node *np)
+{
+	struct device_node *qmc_np;
+	u32 chan_index;
+	int ret;
+
+	qmc_np = np->parent;
+	ret = of_property_read_u32(np, "reg", &chan_index);
+	if (ret)
+		return ERR_PTR(-EINVAL);
+
+	return qmc_chan_get_from_qmc(qmc_np, chan_index);
+}
+EXPORT_SYMBOL(qmc_chan_get_bychild);
+
 void qmc_chan_put(struct qmc_chan *chan)
 {
 	put_device(chan->qmc->dev);
@@ -1550,6 +1579,28 @@ struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
 }
 EXPORT_SYMBOL(devm_qmc_chan_get_byphandle);
 
+struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev,
+					   struct device_node *np)
+{
+	struct qmc_chan *qmc_chan;
+	struct qmc_chan **dr;
+
+	dr = devres_alloc(devm_qmc_chan_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	qmc_chan = qmc_chan_get_bychild(np);
+	if (!IS_ERR(qmc_chan)) {
+		*dr = qmc_chan;
+		devres_add(dev, dr);
+	} else {
+		devres_free(dr);
+	}
+
+	return qmc_chan;
+}
+EXPORT_SYMBOL(devm_qmc_chan_get_bychild);
+
 MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
 MODULE_DESCRIPTION("CPM QMC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 6f1d6cebc9fe..166484bb4294 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -17,9 +17,11 @@ struct device;
 struct qmc_chan;
 
 struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name);
+struct qmc_chan *qmc_chan_get_bychild(struct device_node *np);
 void qmc_chan_put(struct qmc_chan *chan);
 struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev, struct device_node *np,
 					     const char *phandle_name);
+struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev, struct device_node *np);
 
 enum qmc_mode {
 	QMC_TRANSPARENT,
-- 
2.41.0


