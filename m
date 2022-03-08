Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7DE4D1455
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 11:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345681AbiCHKLV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 05:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345700AbiCHKLO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 05:11:14 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5387342A0C
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 02:10:17 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cx5so16724633pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YCEYLzINbSJ27Mxc1gQH0RSj42l80KVWvId+vHnO050=;
        b=VFlI3NcvOJtijZK9dnSyiiARFam7LJ8qmOTLKNc6BwqUaKaUlKU4+8f3icJASzdiix
         OthB+gk44a6lieASchFK+lLJcJ+pUaxnkcomxmj4/ef/plXlIWS42RAYtXU1/9+aRBkL
         h4lX3waAzusF3Hgh0IGsk99Q5//h4ggK0BCFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCEYLzINbSJ27Mxc1gQH0RSj42l80KVWvId+vHnO050=;
        b=gsaF8eatKYQiCAiuM415Fm0s2nyxAnVbYFdLMR1+vmYC7Ph9UN/THfcnb6sOHEwSm3
         PeTGrwHrKGHIPAZTaDWQJofzMgsTwbipoNOCG+3+ImcONUUm4hF/hCCl+GYreI3jOvvJ
         aoAIN7BYZmc71dMggMVyO9XeTSxTYXsRbH8F0M1QY9XemT9bUzRwInXDO7rqiVDsLCUo
         E3XKcKodQk+MqhAQZO7MfF6vNiS5SLzOh6m5niV3DKxEHkRMUe5aCgHcVeehomfpWHny
         Tks/aN1OYnfZg93ZgEhCsm4C7bp7CyALQQ78yzvzjfAy9vouvPIPMw2+2wVPI4MUfu8A
         JnPA==
X-Gm-Message-State: AOAM531qjJwESKcRC2vjqDWCnERZUuzL9alzwCw6wpM20GOgaxZf9JH3
        /1Tley2BuHmsa4l0gvpZgVLV8g==
X-Google-Smtp-Source: ABdhPJxvlMwg053TxzUU1yh1e9ywYI4FTa148KhAT6lQrsDtI61chzmA/3TvSGQDlNZ1lmoCT8ZRig==
X-Received: by 2002:a17:902:ef4d:b0:14f:e82b:25fd with SMTP id e13-20020a170902ef4d00b0014fe82b25fdmr16531295plx.80.1646734216854;
        Tue, 08 Mar 2022 02:10:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
        by smtp.gmail.com with ESMTPSA id k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:10:16 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 06/11] pinctrl: mediatek: paris: Skip custom extra pin config dump for virtual GPIOs
Date:   Tue,  8 Mar 2022 18:09:51 +0800
Message-Id: <20220308100956.2750295-7-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Virtual GPIOs do not have any hardware state associated with them. Any
attempt to read back hardware state for these pins result in error
codes.

Skip dumping extra pin config information for these virtual GPIOs.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 38a00a906daf..39487e0c2726 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -581,6 +581,9 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
+	if (mtk_is_virt_gpio(hw, gpio))
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
 	if (pinmux >= hw->soc->nfuncs)
-- 
2.35.1.616.g0bdcbb4464-goog

