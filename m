Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40452681C1
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 00:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgIMWuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 18:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIMWuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 18:50:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8858AC061787
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 15:50:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so17053456ljd.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 15:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxlAyo97wxQgbGRZa/IhWDwvPK81lO+ghbIt/dVSdiY=;
        b=YsvNQgTecwvMyekXICSf9LTdDnDPBDwT/Zi78Ia4qVNCCsosqmkKCXayWDzPNclvmq
         QHJ+90ElCr3wmZ8W7bMJk9zZB07szFQnsVKegJR/7CnqSfuj9ypP9qNM2J0eAtN9mPgU
         isyutLdRrrKFTbrrD8NS6nF5/l27bf6t/X68zqBQuUFAEv7gJOOJ2xwf8v5PssFSVpN/
         XfczdQH+hkYO8a/YRtSBM0kzij+dUe8ykztU6FPq3+sPxJHOR6awr4MG30lOiTi5C/M9
         +qtsiHVPY1lnEXSDLRReZ7JekAP9ZujukdELPX+R7vtN15IIs5WzDyQ0JpPKOncehm34
         B/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxlAyo97wxQgbGRZa/IhWDwvPK81lO+ghbIt/dVSdiY=;
        b=G4Ucz68wJhi1IiccbSwpinb62sYN3QLO9dwtpEBDI1HVywCUs6NIToMKMnHb2e0k8R
         iPq5NqgB0j2pRtpSv2igSsb3uYfW4qgkxMTvruTrKIE6mK7xzv7Y3xotNBQg/vyJHPBA
         m/J+/uA3fXdEQqYIePfRUFoSlVOVX6OK5iFp69YUdzbbaipdm8Ce3oCc1/BpRISg0XyM
         2wTv9Iw50TlnvGhG4qAFv7r4zIhTugWSfN4KUcm3CrJD+6eIAxlR4fWKaS1MGdJz23aP
         z/Z9F8L4+J2lRRfpzl3KTkZ20rniHLmbiNWDwe9FdqFzbB3VEpScFA11Pk4o9W1P8y1y
         egSA==
X-Gm-Message-State: AOAM531Q9l5V1wtxJgHxunouXeGXNr/eI6/L8IGVr9mH2OpjJt/7ENOn
        O/+4VNtm7ugX7wZdkKdDhg+uLw==
X-Google-Smtp-Source: ABdhPJwWc1T6Zd5iTzCuT7zAKaTPAum8c58ds3N9rXRn6WJqWKA3AY8uuLBbSfEHNYWCjLpP9eAvLA==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr4276635ljh.88.1600037408497;
        Sun, 13 Sep 2020 15:50:08 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id z141sm2859241lfc.171.2020.09.13.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 15:50:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Date:   Mon, 14 Sep 2020 01:50:05 +0300
Message-Id: <20200913225005.30218-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
180 GPIO pins).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index a660f1274b66..4f7dae61b089 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
 	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
 	[180] = UFS_RESET(ufs_reset, 0xb8000),
-	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
+	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
 	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
 	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
 };
@@ -1320,7 +1320,7 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.nfunctions = ARRAY_SIZE(sm8250_functions),
 	.groups = sm8250_groups,
 	.ngroups = ARRAY_SIZE(sm8250_groups),
-	.ngpios = 181,
+	.ngpios = 180,
 	.tiles = sm8250_tiles,
 	.ntiles = ARRAY_SIZE(sm8250_tiles),
 };
-- 
2.28.0

