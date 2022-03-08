Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF814D146A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 11:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345670AbiCHKLP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 05:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345686AbiCHKLO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 05:11:14 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F1939815
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 02:10:13 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v4so16704437pjh.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 02:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loBNgvfdq/vh+q5b0xP2M4wY6ZA7RodjlaGOVqoQIgQ=;
        b=FT0q3vmjV4Ofixirx3vGOE4K1bSUTlVNj1zkmWaEB3EX6y7v5tGukfnLjgf/JM4mYu
         6HuQCZsYE/huFip+v5Ygfg+JBp7K5XS+cyFGhVfOCY4WJ09FItpUmUbz29q/U6oyX/LU
         VF3wg4h072C1MLIQjKushAzg7cYYjWfEhnqIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loBNgvfdq/vh+q5b0xP2M4wY6ZA7RodjlaGOVqoQIgQ=;
        b=N0nyiXDfNa0lsv5IoTQN1SDzWLgSM9vgZ5dnj7CyFnNecajt3re2I0CVT49BhEJPbx
         5hGMiE78eWtOXJrBhhcDjuejgp/GSgUVuHZliIcxQgv9xj0qDE+OHcTsmqa48qnTM5Jc
         NMtTy5bHCb59lDj+Cf5e+qNgD2g5aijIXYPOPS8BtRGZcn+HtevWOYSfTVtgqaDSGvU2
         P0lL+NfkCP5YqsK7pXfbtYytEue3NesQrqk8v9mE0WXmtIvbGwsguv3G4cYjcJBJ4SqV
         zFjfpjY06hXYf5ylM5b8E/IBbWsBX++TNx0ZqAplLcSOSZ8fGO5PCUoWqYmqWLnIk30h
         fUeg==
X-Gm-Message-State: AOAM533ZPNo0pm4TBfqZbvUYJ3yqmxgpHGB/Ivg09Oqm8AiNekIR1waT
        qGK0oe2zUoTFukbDf4VWGk7BoA==
X-Google-Smtp-Source: ABdhPJwF0uYyAvVJHLAKSPzAGWaO6LHCugVgwokBaJgUvBSb8BHs7+KBcJM96IyJnQmOWL8xCiZEuQ==
X-Received: by 2002:a17:902:bcc6:b0:151:f36d:2658 with SMTP id o6-20020a170902bcc600b00151f36d2658mr6808467pls.125.1646734212808;
        Tue, 08 Mar 2022 02:10:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
        by smtp.gmail.com with ESMTPSA id k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:10:12 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 04/11] pinctrl: mediatek: paris: Fix pingroup pin config state readback
Date:   Tue,  8 Mar 2022 18:09:49 +0800
Message-Id: <20220308100956.2750295-5-wenst@chromium.org>
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

mtk_pconf_group_get(), used to read back pingroup pin config state,
simply returns a set of configs saved from a previous invocation of
mtk_pconf_group_set(). This is an unfiltered, unvalidated set passed
in from the pinconf core, which does not match the current hardware
state.

Since the driver library is designed to have one pin per group, pass
through mtk_pconf_group_get() to mtk_pinconf_get(), to read back the
current pin config state of the only pin in the group.

Also drop the assignment of pin config state to the group.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index c668191933a0..3bda1aac650b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -732,10 +732,10 @@ static int mtk_pconf_group_get(struct pinctrl_dev *pctldev, unsigned group,
 			       unsigned long *config)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+	struct mtk_pinctrl_group *grp = &hw->groups[group];
 
-	*config = hw->groups[group].config;
-
-	return 0;
+	 /* One pin per group only */
+	return mtk_pinconf_get(pctldev, grp->pin, config);
 }
 
 static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
@@ -751,8 +751,6 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 				      pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
 			return ret;
-
-		grp->config = configs[i];
 	}
 
 	return 0;
-- 
2.35.1.616.g0bdcbb4464-goog

