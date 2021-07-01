Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209AC3B8EAB
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 10:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234760AbhGAIMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 04:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234941AbhGAIMe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 04:12:34 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791D4C061756
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jul 2021 01:10:02 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n9so778900plf.7
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jul 2021 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05/l1i0MzcF43S74GFX7zHVjcwxLfLdqVO0nUEpbDV0=;
        b=S3MMnrqXhNiKGF5J0TPCRduqD0uIK0JAXHkIojST/KHNV2Hl4cWZkVYFqQ++/p2DTp
         R+oe9Lpwcdeg1hwXaxadt+3kbOnJQqdp8+Nx1mAyLdK8qlWpa3ybpx3nugkStTe6zAR7
         wvbQmXdnS7/BdsqFi5Q1v36Xf77l+GnZQ2WIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05/l1i0MzcF43S74GFX7zHVjcwxLfLdqVO0nUEpbDV0=;
        b=VmmlFJ+fcHZJQh6ALMKFvLUdIeP43pUVWU3vWnQNI7e1GvhXvgXqE/Wwa3zVNSZnw0
         kiyyrDmTEQMVtBTf3EHvm4SA+joC+mKV/V2pDDvN9vpgaYBZKdaoCRI80uOYZ5RafKr2
         gNlI48kSnhRcAGRls54D9QT/A7XsLeVRYFZor3o+XnDsqv0Y6SYDxgCprLkmcXdBEmjL
         h0iagcoHlg/rPTKZ/yepyH+zej3l5a/CgiTKHx+cjM8DAkVrtyGTQ4g51l4zuQoKysmy
         wETcCIVSRAsgIIv9blo5y6kCCf5UeEqdAWZbOP65BqkFlGcfy088myoQ9Zn9sK623rv6
         9Hug==
X-Gm-Message-State: AOAM533enqhmFFpauLaOX/JdYLEXXcUHq9qlpcnELE5bQlH/Ys1lq5nd
        yz8QKvhl3m+PZFqU5iERj8kkuQ==
X-Google-Smtp-Source: ABdhPJyG0Ea3T12jyxm6vZmzBQnlz+cN3qJCWhrgNZuvdGCJTnAoQTyEUsEeYDaU6hrJms60UflVNw==
X-Received: by 2002:a17:90a:17e7:: with SMTP id q94mr42915950pja.117.1625127001737;
        Thu, 01 Jul 2021 01:10:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a18a:185:21d0:d5d6])
        by smtp.gmail.com with ESMTPSA id h8sm6846396pjs.45.2021.07.01.01.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 01:10:01 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        zhiyong.tao@mediatek.com
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for bias_set_combo
Date:   Thu,  1 Jul 2021 16:09:55 +0800
Message-Id: <20210701080955.2660294-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some pin doesn't support PUPD register, if it fails and fallbacks with
bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
modify the PUPD pin again.

Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
bias_set or bias_set_rev1 for the other fallback case. If the pin
doesn't support neither PU/PD nor PULLSEL/PULLEN, it will return
-ENOTSUPP.

Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2: fix v1 comments
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 7815426e7aeaa..10002b8497fea 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -926,12 +926,10 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			err = hw->soc->bias_set(hw, desc, pullup);
 			if (err)
 				return err;
-		} else if (hw->soc->bias_set_combo) {
-			err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
-			if (err)
-				return err;
 		} else {
-			return -ENOTSUPP;
+			err = mtk_pinconf_bias_set_rev1(hw, desc, pullup);
+			if (err)
+				err = mtk_pinconf_bias_set(hw, desc, pullup);
 		}
 	}
 
-- 
2.32.0.93.g670b81a890-goog

