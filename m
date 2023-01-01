Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E4165ABE5
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jan 2023 23:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjAAWB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Jan 2023 17:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjAAWB4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Jan 2023 17:01:56 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C2F114F
        for <linux-gpio@vger.kernel.org>; Sun,  1 Jan 2023 14:01:55 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id m18so62892929eji.5
        for <linux-gpio@vger.kernel.org>; Sun, 01 Jan 2023 14:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=Pp9O2j/6k/ED7Zy9xSUA1swB+79DjfeS1LLO8QUVSOUPDQhjdFTI6HmVbOByk7Qfqw
         8R7sM+pohS75N0A70uGkCJFlkQ/8pwH29SjEpGRk46LJ3qxd5WoZtm5tJmKQdGl9srWi
         7a5jn2kUoe1csEEqMhrGDiIkBGk09Q39P3hsoSY3/vjKme+mg6PMfdXnVuicGbfXNci7
         641q5iHZSeFgiChjefUUhedBqDsaadwRYCGwivJZJwDM4Jj7U31V9T3+ntsmOj2kPVO+
         /18q4h50FzwMtslvoR9puJ6h8Xq15nFuWO78RNR+xGYoGaHaDjBtMAdTH+MR1fFJbmbv
         4wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kf0xOoeDeJQWB1TH03nWqIDkbfzo3q+4qiIvdKLrU4=;
        b=ktXN4gtJKkXAQtvPTPRkcHd9SfBCi8VP11egLffrgAxpKvPe39fb83eh+viegnWQSQ
         N1Ul4yl5KeE1oiDf/LcgX2z/ZC+uUG/F9dzsDJzBDU9ORaIHVCGAzwtzku2g66AagHe1
         aa3gTuBS+itJySpUFntwP00dbNzEWjiAaIiiwF4bk8yO8i7QH3S6f3FyVbYjBgQZvlFl
         UOnGztbutEV2HvXGEETZtYv2I4RxQczr4JY5id1ZjiwUlWyy5i8SSpI6TZlKWv5OwOPd
         3rT21NHHM9UVr9qlIu2CaxWZLPZgvOq293OaANPvDBHKvgAUSQXcPpmWaye+cdONzadx
         E6Jw==
X-Gm-Message-State: AFqh2kq7kGzs3Cl5003TAJQM8/QrTz0agQybGhgZ9w9Wdny082ULd+T7
        Ns6k90MkDT8HYyt6C18BIv07Og==
X-Google-Smtp-Source: AMrXdXt5vQTH9/i/RsawNBgObbyJcwyNurkF7NWps0XcMCUu+231BiRRvMAEvco/haTYcbRF07Kang==
X-Received: by 2002:a17:907:c315:b0:7c1:b65:11d with SMTP id tl21-20020a170907c31500b007c10b65011dmr29974534ejc.12.1672610514090;
        Sun, 01 Jan 2023 14:01:54 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:53 -0800 (PST)
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
Subject: [PATCH v7 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date:   Sun,  1 Jan 2023 23:01:44 +0100
Message-Id: <20230101220149.3035048-3-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.39.0

