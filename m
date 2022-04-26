Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06BB50FDEA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 14:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241434AbiDZNAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 09:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbiDZNAe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 09:00:34 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698EA220C3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:57:25 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k2so4920817wrd.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DfCMVq1S6gm4GOhj5i7iFzEdFjObyfzkJ5gxl6qupp8=;
        b=jvjMZ+opru9KXy8+E0R/AUv6yAKn2a6A8ERvBEy4gjlspmyMOP82VUGT9SgtvM0dRA
         yCMsYJ3hJTCtbciObQMMZdpRJTfoGaVUmOAZH+qp66HwShj4HodftvtBJrS35fwgo5Z0
         ofo1Xz1LSE69ov+X8QgzHhN6hha8dSVku5omWRFuiksopusuc2xlcuietBGK7DqDVfLp
         DiYjDPxN7Nuh5suHupTei82DjWsr98EtbbAeeT2IAyTKYOm7iCjoyV+O5ec1dADkSU9E
         QIvlGnKlCJR+5etlc6oi9J5xT34mzVIOw8UrupkH56BOHYcZubZ9XEWWKLfB1xeUeklB
         NSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DfCMVq1S6gm4GOhj5i7iFzEdFjObyfzkJ5gxl6qupp8=;
        b=TGuqmcCMxiq8cgjxUBoGfskIT6sN/cDSKKMnYCWn2Xxu/K83bOFCj7c0OMr/4INTWK
         QYbFlI9zQSU2AAC1fU5dWmxTSkIUi7dRv+stOjrhJFNxb33ggZHqFA64QyXHVlloZj5Z
         SxZeIYFlqwI9OEpCBGH3izvyktku2OsX3ossjymYohTR8grr9sg08VvtOEogiHLCCLi3
         /ydKkS9th1ymosK3FInVSDB2MWh7cvzBE+Qe/0nqAneAIpSFl4XjcWh9m6CAG/qJQZAv
         0y7bP2ZKT29/q41FDenPNBEuAK0DKYjL9FEMaA7mbB6Wr1JrRetgUoJJYK10lAyC0tmn
         lusA==
X-Gm-Message-State: AOAM5308zMPge6mVWO5VxPofQ5lSZDFzYtG99/uAJVVC8qDbqmlpTScd
        o/yABgqOQdyBTtu8nkU4AVE1iLA80aXZlw==
X-Google-Smtp-Source: ABdhPJwZgVn/PbNaQMdyC0fSdHiJ/8dQDWK+MoRT9HtNWAky3m1A7R0Z6zQxbTNn2Ffhv4OI6EmneQ==
X-Received: by 2002:a05:6000:1a8b:b0:20a:aaf7:75e8 with SMTP id f11-20020a0560001a8b00b0020aaaf775e8mr17692637wry.66.1650977843929;
        Tue, 26 Apr 2022 05:57:23 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:3df2:df58:a205:f150])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b00393f01c8f00sm3235261wmq.47.2022.04.26.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:57:23 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Youngmin Han <Youngmin.Han@geappliances.com>
Subject: [PATCH] pinctrl: mediatek: mt8365: fix IES control pins
Date:   Tue, 26 Apr 2022 14:57:14 +0200
Message-Id: <20220426125714.298907-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
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

IES26 (BIT 16 of IES1_CFG_ADDR) controls the following pads:

- PAD_I2S_DATA_IN (GPIO114)
- PAD_I2S_LRCK (GPIO115)
- PAD_I2S_BCK (GPIO116)

The pinctrl table is wrong since it lists pins 114 to 112.

Update the table with the correct values.

Fixes: e94d8b6fb83a ("pinctrl: mediatek: add support for mt8365 SoC")
Reported-by: Youngmin Han <Youngmin.Han@geappliances.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index 727c65221aef..57f37a294063 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -259,7 +259,7 @@ static const struct mtk_pin_ies_smt_set mt8365_ies_set[] = {
 	MTK_PIN_IES_SMT_SPEC(104, 104, 0x420, 13),
 	MTK_PIN_IES_SMT_SPEC(105, 109, 0x420, 14),
 	MTK_PIN_IES_SMT_SPEC(110, 113, 0x420, 15),
-	MTK_PIN_IES_SMT_SPEC(114, 112, 0x420, 16),
+	MTK_PIN_IES_SMT_SPEC(114, 116, 0x420, 16),
 	MTK_PIN_IES_SMT_SPEC(117, 119, 0x420, 17),
 	MTK_PIN_IES_SMT_SPEC(120, 122, 0x420, 18),
 	MTK_PIN_IES_SMT_SPEC(123, 125, 0x420, 19),
-- 
2.32.0

