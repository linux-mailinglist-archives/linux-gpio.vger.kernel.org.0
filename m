Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72E197B3256
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjI2MVK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjI2MVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:21:10 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654BC1AA;
        Fri, 29 Sep 2023 05:21:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-536b39daec1so1445884a12.2;
        Fri, 29 Sep 2023 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695990067; x=1696594867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gr+D2f+RuJ9QcHfvwlUN0SCdJUZFyKEX1E9oKGFtxkc=;
        b=gBdL8R//kuhm9S2TG1GqnA4EnTAgF1BaV443CfGx5N2BKgFbplguLazVusB9adHeYY
         WOvJ2zvmbPKf32Uuu78xN7Bt0T6XJtvBAIiTzVYIQ7EekzLljHlklICr7XWS33CstfhE
         QQBcyF5wL8RGFBYM23MziZWuFQM7v1RRliXk8I0tIxbHCORRkhWQVnrBZWGV32Ias2y+
         fk65PPyj/KOINNQS9IWXGX9ElAHXeNsYi87Jv7VldH6ZEAQvyu37xBBbeyHRuMnfH5DZ
         owZuMduuCwkzhYA3oTyK1JDL6HXtpgdswTwS60EAeNOnnTtiAwafCVSQqXvm/rHC/tkT
         iROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990067; x=1696594867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gr+D2f+RuJ9QcHfvwlUN0SCdJUZFyKEX1E9oKGFtxkc=;
        b=IGDKJIEKt5cdxm2wo9Wv8m+266rjqCIJmSt9weymqXzC3aKScr3dUA1FqjqbopcAGM
         jMH+pHV+MUyCWTR13BiMCw+30HI3rQ+LTY1u6k2rAYKGLrjUDkYLsDxB1bW9Zm3F938H
         NjWkecWs5WguDoCAWxKVYQxopKHWTUa3887OuNJVjzZFwdJu0MOydsE2ZeJwASIqCiDi
         uIPhfd80k0LyfmcO0U3R4xND4LWapl3pEJPG4sDQUGUZilL/CXW60Z7YZHC+tgswao/0
         MZ9g88AtH6OrSxqRqmeauR+ZGTS6pZnUw5kRoPgH5lgGRfwA1HuRuBRzbTkLkkrwPuX9
         rWHw==
X-Gm-Message-State: AOJu0YwRjemNlxbQdh0C1NGXWbTe9Gj69WwHu1pQ/DPW2sO/xY49whpk
        NCrZzICV91OtDWBeG/X5aE0s2pZpxDY=
X-Google-Smtp-Source: AGHT+IEsJNKJaVkzzUTwbtVfTaNWyFdl5AQ9G/WzvWAUUz2p9lU1YkVzcyZKDU1tDdQfkXJJQvV51Q==
X-Received: by 2002:a05:6402:704:b0:52f:4c92:69ee with SMTP id w4-20020a056402070400b0052f4c9269eemr3624175edx.36.1695990066463;
        Fri, 29 Sep 2023 05:21:06 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id da11-20020a056402176b00b0053495596f42sm3767244edb.30.2023.09.29.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 05:21:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] pinctrl: tegra: Display pin function in pinconf-groups
Date:   Fri, 29 Sep 2023 14:21:01 +0200
Message-ID: <20230929122101.466266-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The function that a pin is muxed to can be read from the top-level
pinctrl-maps debugfs file. However, this only reflects the values that
were specified in device tree, so they will only show deviations from
the hardware default setting. Display the current pinmux setting in the
per-controller pinconf-groups debugfs file along with the rest of the
per-pin configuration settings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index a4002b430f0a..c9fd3910bb3b 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -639,6 +639,14 @@ static void tegra_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		seq_printf(s, "\n\t%s=%u",
 			   strip_prefix(cfg_params[i].property), val);
 	}
+
+	if (g->mux_reg >= 0) {
+		/* read pinmux function and dump to seq_file */
+		val = pmx_readl(pmx, g->mux_bank, g->mux_reg);
+		val = g->funcs[(val >> g->mux_bit) & 0x3];
+
+		seq_printf(s, "\n\tfunction=%s", pmx->functions[val].name);
+	}
 }
 
 static void tegra_pinconf_config_dbg_show(struct pinctrl_dev *pctldev,
-- 
2.42.0

