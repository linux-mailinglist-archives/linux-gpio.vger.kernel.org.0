Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151C37AAB9D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 10:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjIVICr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 04:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbjIVICb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 04:02:31 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9063519B4;
        Fri, 22 Sep 2023 01:01:16 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 929811BF204;
        Fri, 22 Sep 2023 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1695369675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eP8so5+40OVF0V/I6f05agR/9uxTfpFGxdMPV+noKD8=;
        b=HucHlG3nlZXvoAc9dKAUaQeunTHEyRBcBbhH1GCoWbl71z/+o5gyx7qZFnz6CfmpPB1huD
        n4pqtLfSM4eS6Fvi8R0wpuet9h5RyF+VmU4hU218NsLYdN3+qehKc4tmEoWAUyAvztWK2Q
        hir8XotjVg8b0FlufcwfTJYoYW02p5Gk59Ow789yCeSkFM2dety5MLZKlDIkrloMo3K/0s
        AF365UbMTmDP/yU26g4HyuRkL2R+YJHfIcUV1/oLA95yhE0513VgTdHY/gghUfjduWCkFH
        E3wPkJz31BRR/z2434cJGPbV10TRiIuf3Pw478Uyo8AMk36199hnFUn3N89hsA==
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
Subject: [PATCH v6 28/30] MAINTAINERS: Add the Lantiq PEF2256 driver entry
Date:   Fri, 22 Sep 2023 09:59:03 +0200
Message-ID: <20230922075913.422435-29-herve.codina@bootlin.com>
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

After contributing the driver, add myself as the maintainer for the
Lantiq PEF2256 driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b987f2c8633..d8f2433e326e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11876,6 +11876,14 @@ S:	Maintained
 F:	arch/mips/lantiq
 F:	drivers/soc/lantiq
 
+LANTIQ PEF2256 DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
+F:	drivers/net/wan/framer/pef2256/
+F:	drivers/pinctrl/pinctrl-pef2256.c
+F:	include/linux/framer/pef2256.h
+
 LASI 53c700 driver for PARISC
 M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
 L:	linux-scsi@vger.kernel.org
-- 
2.41.0

