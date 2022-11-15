Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3FB629309
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 09:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbiKOINr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 03:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiKOINq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 03:13:46 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBE862E8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 00:13:44 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d3so16529824ljl.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 00:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWVs7EbRSlre+gfNBqhXug7CO0tvSkRo4hqQhqk9r6A=;
        b=NkH4fRxxdcMubWlSLIQvFd0XLN1kI9VOeIckGL3D7x8K2pdsNRU9IReAQQsTpWxzMc
         wOdQqW3e+Sq1o2k4MSvXY1M9wJ9BEoMsQhP69rf92+MXns6KEaj82Viih5QUTD2AJ0fn
         Xg0+t62IO6l4QLexpyf3hBcJmIzLrFOQq/FmJ8jGEIkdOAZ9cr838gJSVl0WB0E+H032
         tmmxer2Jakhk4VTl7FJLmoy7/bFSbw72t/j+Cvksxs2tPiySULVJOaa0yV0l+zlsEVBb
         A/vl4TjgEoFVG6rM7AJGo5dj04eoAUt35HMg77rete9mgAExvwgPgbYxG0Bn3aHGaqC+
         VUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWVs7EbRSlre+gfNBqhXug7CO0tvSkRo4hqQhqk9r6A=;
        b=jCni+bgw7xuIHtjzxd8NjOiZY7BIEmrSkpTrrRmWHt8DKn++z+XixNCoFcZvlTCoh/
         uU64aSESz/SUlgr4uHiZldfoCT3VIrv/XYGTt5jZ1/eUIjLgHe6mnmvrax7mrfpqPT2e
         IjKK3HYMxkuUWKro4u8eICIYiBcygCdLxBvnz9OgIMz6Wg5YQmIzYuG4xB/1ErBdaVf/
         ZgAsU4pBYQkJUC0lKXtMz0wzH8mdEFxxnMcMrwYwh4Ez78CgCunxqL8W4sZgHa8WZAfR
         j7C9S7o5mEKfJDOwOOIwcdz3PBIvwjanZiXkoBSHQXn/7lYq/MnmtbIbAr35uQrCROd0
         +YWQ==
X-Gm-Message-State: ANoB5plfvtOmWOXAZpcWmAcCBt0C64P9grJNHyjMd+g2NamadWC+oAgj
        NldE2z6PWmYEMfQ1MRl9S9Piz9jyXUcpgQ==
X-Google-Smtp-Source: AA0mqf60ufMv9Cx/rWii/1XkohFJSi2ydgPSF3cac1jEhiy1XcBeYPlCrzWr2ENBB6+G/Y/gQ8vccg==
X-Received: by 2002:a2e:80da:0:b0:277:5c6b:7653 with SMTP id r26-20020a2e80da000000b002775c6b7653mr5474308ljg.398.1668500022791;
        Tue, 15 Nov 2022 00:13:42 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id bi39-20020a0565120ea700b004a91df49508sm2134371lfb.177.2022.11.15.00.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 00:13:42 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] pinctrl: mediatek: Export debounce time tables
Date:   Tue, 15 Nov 2022 09:13:40 +0100
Message-Id: <20221115081340.2180495-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The kernel test robot complains that in certain combinations
when building the Mediatek drivers as modules we lack some
debounce table symbols, so export them.

Fixes: e1ff91f9d230 ("pinctrl: mediatek: Fix EINT pins input debounce time configuration")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index e94ee802c603..65d312967619 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -52,14 +52,17 @@ static const struct mtk_eint_regs mtk_generic_eint_regs = {
 const unsigned int debounce_time_mt2701[] = {
 	500, 1000, 16000, 32000, 64000, 128000, 256000, 0
 };
+EXPORT_SYMBOL_GPL(debounce_time_mt2701);
 
 const unsigned int debounce_time_mt6765[] = {
 	125, 250, 500, 1000, 16000, 32000, 64000, 128000, 256000, 512000, 0
 };
+EXPORT_SYMBOL_GPL(debounce_time_mt6765);
 
 const unsigned int debounce_time_mt6795[] = {
 	500, 1000, 16000, 32000, 64000, 128000, 256000, 512000, 0
 };
+EXPORT_SYMBOL_GPL(debounce_time_mt6795);
 
 static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
 					 unsigned int eint_num,
-- 
2.34.1

