Return-Path: <linux-gpio+bounces-159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34607EC5D3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 15:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EF7EB208A7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 14:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1663A2EAEE;
	Wed, 15 Nov 2023 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ctxSa+Gh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9E3FE55;
	Wed, 15 Nov 2023 14:40:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7424C1BCE;
	Wed, 15 Nov 2023 06:40:38 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5FC01FF809;
	Wed, 15 Nov 2023 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700059236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lh9pPS+jQCHhQyqizvMNEPc1YPfb2o7BPfYkbfXINT0=;
	b=ctxSa+GhCJ+4cxBCz+PeN/N+hHdbHgihBsYSey2iHNI2btKTKrVw6SAg6qVcFfHPkMaMiM
	oWr/PpA51cAzyYB9vryXjLErxsW7RwzXQpaf8R2rgReVBKjCHhZxqoxsFja/BbWqnSSPDO
	0/4iSVISNyQRIVpCBHTaK/tuezqKnqbbnWGoAM5vwi4qpYtB+BIhhVD7P8t+TEFqixy2iZ
	OQdamXVolCytolaBt88udQEnSblF7sWZQyLLLlBfto1yMimOJBZhyC53ToGtMwO8EYDCeZ
	rYRqfRZpSZ4igZIM0Pemmb3mfVmagAOW23zuEroitSZVUR/Dw12x6glEHFYYdA==
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
Subject: [PATCH v9 13/27] soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
Date: Wed, 15 Nov 2023 15:39:49 +0100
Message-ID: <20231115144007.478111-14-herve.codina@bootlin.com>
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

The timeslots checked in qmc_check_chans() are the timeslots used.
With the introduction of the available timeslots, the used timeslots
are a subset of the available timeslots. The timeslots checked during
the qmc_check_chans() call should be the available ones.

Simply update and check the available timeslots instead of the used
timeslots in qmc_check_chans().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index f2a71a140db7..8d71e63d0f21 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -914,13 +914,13 @@ static int qmc_check_chans(struct qmc *qmc)
 	rx_ts_assigned_mask = info.nb_rx_ts == 64 ? U64_MAX : (((u64)1) << info.nb_rx_ts) - 1;
 
 	list_for_each_entry(chan, &qmc->chan_head, list) {
-		if (chan->tx_ts_mask > tx_ts_assigned_mask) {
-			dev_err(qmc->dev, "chan %u uses TSA unassigned Tx TS\n", chan->id);
+		if (chan->tx_ts_mask_avail > tx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u can use TSA unassigned Tx TS\n", chan->id);
 			return -EINVAL;
 		}
 
-		if (chan->rx_ts_mask > rx_ts_assigned_mask) {
-			dev_err(qmc->dev, "chan %u uses TSA unassigned Rx TS\n", chan->id);
+		if (chan->rx_ts_mask_avail > rx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u can use TSA unassigned Rx TS\n", chan->id);
 			return -EINVAL;
 		}
 	}
-- 
2.41.0


