Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426AD6072D0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 10:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiJUIsN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 04:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiJUIsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 04:48:04 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1E311CB43
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:47:58 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n12so3690302wrp.10
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDtPL7fkaCFAp3KfpjYgG/R3mid8Rw0WiVwoN+Pwb6M=;
        b=SaC3/AqQNnhlmygAxmEsqoIpED788Sg1O1M4mwdd4LihqskwD53Z6+rBAQeyAnWRdj
         RQNg4nM9PBDydzEFc6h2iv/9blckNa10wbzhdMNXMkmC/RLGrSrtVuM5TWa0dqw+Rtnq
         3E2oGhW8JqFgXhYHhWM17+zM/RsRtsiv8CI6hWtgxGHFWRhwwfRSvdr9ApnTqI5AK8VI
         P658S8m8K7vDQu1YFxYPG6zDQ0d7XsYZNJvyw70S7wQbtvIL7/0y13uvNLDwmzucLJeQ
         m19AGGxUyJzLzfmVKhpMaOFTWsfjwwPeXUifg3fooY9nNUqJQhAFzNsv2/FmoymE/Jdh
         kOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDtPL7fkaCFAp3KfpjYgG/R3mid8Rw0WiVwoN+Pwb6M=;
        b=cRxQNe8wEdh45qnmKig1IozvX7mhOHRslD6DCQVKBEyj9cF9OCo2yYOLGgpqLmRlG6
         qYI7nSBVPuErp3ASUBJBZ6u2nQqSKf3bJjtVvKqGegSj+xPwJCuK6sivyAdOh50/5OxM
         6k/z985C/Lke6XN4a0YNLi3HflOyIY6gzgwb8rzbMpp0poBDKtKX26rxHg20bgBNTaTt
         M8L93dvfNPTt8GVx/an3sEV3c33OwhJ/Jguy27cSvPwFFv20UY2qIEQMSNrcBtb9AxTX
         xzl1kBjtK55estRJlU2ii2zpb3PwTT27RyfikreMBS/6Y38SMIYI5hbxO3jl/pDVhZg7
         f8Dw==
X-Gm-Message-State: ACrzQf1v5bAM1I4x782M7JnchU9Ho9YOGk09lW7PWjw3GTmCCanDA9mw
        nbVwx/efCdVgg33rT3E3C5Sffw==
X-Google-Smtp-Source: AMsMyM7zvf0JLCBhMlobPuIA2iHhJ1o+FgclTU3OJG8WbwhWecxsKXKVKWubyy7f0Cz1XxndijfJaw==
X-Received: by 2002:a05:6000:1d82:b0:22c:ae77:c8dc with SMTP id bk2-20020a0560001d8200b0022cae77c8dcmr11751829wrb.413.1666342076824;
        Fri, 21 Oct 2022 01:47:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c0b4500b003c41144b3cfsm2040233wmr.20.2022.10.21.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:47:56 -0700 (PDT)
From:   bchihi@baylibre.com
To:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com
Cc:     linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v2, 1/2] pinctrl: mediatek: common: add mt8365_set_clr_mode() callback for broken SET/CLR modes
Date:   Fri, 21 Oct 2022 10:47:07 +0200
Message-Id: <20221021084708.1109986-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021084708.1109986-1-bchihi@baylibre.com>
References: <20221021084708.1109986-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Balsam CHIHI <bchihi@baylibre.com>

On MT8365, the SET/CLR of the mode is broken and some pin modes won't
be set correctly.
Add mt8365_set_clr_mode() callback for such SoCs, so that instead of
using the SET/CLR register, use the main R/W register to
read/update/write the modes.

Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 15 +++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  8 +++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index f25b3e09386b..076ae0b38e3d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -330,6 +330,21 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		return -EINVAL;
 	}
 
+	if (pctl->devdata->mt8365_set_clr_mode) {
+		bit = pin & pctl->devdata->mode_mask;
+		reg_pullen = mtk_get_port(pctl, pin) +
+			pctl->devdata->pullen_offset;
+		reg_pullsel = mtk_get_port(pctl, pin) +
+			pctl->devdata->pullsel_offset;
+		ret = pctl->devdata->mt8365_set_clr_mode(mtk_get_regmap(pctl, pin),
+			bit, reg_pullen, reg_pullsel,
+			enable, isup);
+		if (ret)
+			return -EINVAL;
+
+		return 0;
+	}
+
 	bit = BIT(pin & pctl->devdata->mode_mask);
 	if (enable)
 		reg_pullen = SET_ADDR(mtk_get_port(pctl, pin) +
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 6fe8564334c9..11afa12a96cb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -216,7 +216,10 @@ struct mtk_eint_offsets {
  * @spec_dir_set: In very few SoCs, direction control registers are not
  * arranged continuously, they may be cut to parts. So they need special
  * dir setting.
-
+ * @mt8365_set_clr_mode: In mt8365, some pins won't set correcty because they
+ * need to use the main R/W register to read/update/write the modes instead of
+ * the SET/CLR register.
+ *
  * @dir_offset: The direction register offset.
  * @pullen_offset: The pull-up/pull-down enable register offset.
  * @pinmux_offset: The pinmux register offset.
@@ -252,6 +255,9 @@ struct mtk_pinctrl_devdata {
 	void (*spec_pinmux_set)(struct regmap *reg, unsigned int pin,
 			unsigned int mode);
 	void (*spec_dir_set)(unsigned int *reg_addr, unsigned int pin);
+	int (*mt8365_set_clr_mode)(struct regmap *regmap,
+			unsigned int bit, unsigned int reg_pullen, unsigned int reg_pullsel,
+			bool enable, bool isup);
 	unsigned int dir_offset;
 	unsigned int ies_offset;
 	unsigned int smt_offset;
-- 
2.34.1

