Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F587C4A0A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 08:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344451AbjJKGPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 02:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345263AbjJKGPg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 02:15:36 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999A0F1;
        Tue, 10 Oct 2023 23:15:22 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0102AE000A;
        Wed, 11 Oct 2023 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697004921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ACSV41BkWA0fKq39dfPL/AXLiyPkmOTVZUoZxLiKbNE=;
        b=IbIJhfrkOtprMz7BRcc4IHbyMgPN0Dwn+nQWPO7rws2dJKYWaI7RpcZI9EEwF9ohJeNzEP
        vz0kRbPIdZYb8lYib9zjssDJDVIkOOqMGRkGHLx34ZL78WzKVpv7Oh/k//i4pEY+YSdq+z
        dZRneYkJBpnPrgh4fiP7kNQZ1y98R8fy1iFqvK4DRauVHgPI3/4euPFQQOC4NUZ5mNPH0p
        HiUNH4H4KoiZhXEXrSoQorQBYTEtjvqt2DGY5e2VyWp5wE5jBskbpunkHv/usok7LF1Xx9
        ifNq32az/BH0C3mjveW0EI1LE3LvownQmN/G1wbtF0K8Z8dr54aaMTG7gved7Q==
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
Subject: [PATCH v8 09/30] soc: fsl: cpm1: qmc: Add support for child devices
Date:   Wed, 11 Oct 2023 08:14:13 +0200
Message-ID: <20231011061437.64213-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011061437.64213-1-herve.codina@bootlin.com>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
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
index 459e0bbd723d..5da15a25600e 100644
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
 
@@ -1467,26 +1475,16 @@ static struct platform_driver qmc_driver = {
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
 
@@ -1496,17 +1494,12 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
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
@@ -1514,8 +1507,44 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 
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
@@ -1552,6 +1581,28 @@ struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
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

