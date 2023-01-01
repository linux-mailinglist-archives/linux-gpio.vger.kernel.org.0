Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20AF65ABF8
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jan 2023 23:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjAAWCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Jan 2023 17:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjAAWCB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Jan 2023 17:02:01 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB522AD7
        for <linux-gpio@vger.kernel.org>; Sun,  1 Jan 2023 14:01:59 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id x22so62947439ejs.11
        for <linux-gpio@vger.kernel.org>; Sun, 01 Jan 2023 14:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=;
        b=6tmSGZwjOUabk0Tay5+t+RCnJxuU/Q+E4bAuPZ5vkzcNaUtgRpVrZL3QZ2PGBDs5nZ
         MVicZkyjmjnyuhsNwYFAXrKghCMxmNeXdAWaFYzUGsxicEUrTolsYdv+Cgh+JQJ6QJbQ
         IRzFRnw5oDCIlXfud4JBKTrlTjIhMslkMJtBY9OQtGYJukpQyPnSTupRWot5HvIxj7sO
         wdwUkGa2wxua4BKqZULIASKBMVn8rTldahPxGcxy3I1e7H0nCJDPdn8s6mNjVAKlFe7H
         gNa40Bl5e72GGjlcg0mR1U1OS44xc93Gck2NxwMLRc7NEiyA0fb1OPB5unkmt+A+ztz1
         bing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=;
        b=bBXJHwyNh24/btvqxaHq/4GMfaKvNQ2zzCqs5AxFxp9m3/UA+iMOKF4Fl8vF4S20O5
         ldaaspDQJkPr3FfMSYN6VUvEx2GSfX/EVhH1yrDAfdPRgni3f/DrrdyTU9fxPNCok3Zi
         65mE1g+G4SWTxaKuva2/rm/ES7JAbJ2KMqAHfZW8luVO3dWKtkdLBBvSN+3P+7mFJT5R
         7B0M2qsodT/qFnfMGNb241R9qPxpjednoZHQSuCS6nnyGPWnBQzU3ir/VzsDEv9imbkU
         mnOfKff2MEpUeYNOaMiHDUhsX+rhA96Mce192PJmfCQnL1U+N+Mo7WmeJUbU+sH73wr0
         B6TA==
X-Gm-Message-State: AFqh2krbAvQPjJg+iNOywTqQTKa/qUXGlGvhTNFo8zpz0f5L9Y7inXUl
        LzN8Z4nlpPM8TorR87dBZMUhBGSN0FnrYd/fnKM=
X-Google-Smtp-Source: AMrXdXtgygK9dvnVdrlDMNTfpGZn77OgXyintLIQ1gNB5Dj1uLzbvkQ5s0f0tiODrRQ/1YQ/WBHIaw==
X-Received: by 2002:a17:906:f6d7:b0:7c1:5169:3ed6 with SMTP id jo23-20020a170906f6d700b007c151693ed6mr38129337ejb.48.1672610519356;
        Sun, 01 Jan 2023 14:01:59 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:59 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        linus.walleij@linaro.org, matthias.bgg@gmail.com,
        chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Subject: [PATCH v7 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date:   Sun,  1 Jan 2023 23:01:48 +0100
Message-Id: <20230101220149.3035048-7-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
[bero@baylibre.com: Cleanups suggested by reviewers]
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index a3c37944c6305..c119caa9ad168 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.39.0

