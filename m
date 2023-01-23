Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1DCB6781A7
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 17:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjAWQip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 11:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjAWQij (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 11:38:39 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF35F2BEE5
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:38:37 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id rl14so28724155ejb.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=Xg40aRWcadavBhA30H+HUY1A8uOsHmLruRjzjO1N+e2rkfn7lIkOxFQPKj0yvvnpCW
         df6wDGLlFncB3rM7gzp3E4OeURwUiS1fQITjyYylL04mFdGF1AM+ecTquyM7WgTaNOJI
         edwZeXlP4VCX+1mRk9HVlAg+oUnnGHXPu8Z0kw7/amMJ5T2G6JjKYA/n4eZA7Hw0Ej13
         BPRqqKh7W0msqX5UkvJ+cKF9gjHllGWDUm8DiLGh1jnnth+e4TWhwUIbyaVu9as4LjKT
         E8WY+GkpVIZq3x0dfbIJAFhY5YOl8D0dWnz7yw2vyW/VXIkpbjNVDKNyClwSgPlZgLW6
         oETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=5Ix2AJX0tkWpQr5xb7KQY8IfrEE3E6a5S7N9Zrd0Bxf9Zo5lRjHSdfmZlxl6LW8QDb
         4KD4paN4GlB2Tl06F8QMY97p/vrMG0jGpyNpqYKB+dtR2xRBEIaX2msIwsg2kMwBUhwJ
         cGPNJx+yC0RM/PWRU2yD2TDsagK+H1ImUV63i0FLDgApGYxq3XT82QYOEADSTqkukccy
         /ReBZ4dZgcSYXEAgoTdquyxH37rzwcGpFiFJoi+pI3CyOuzw3+J1T2DqKaxpa82dWs2o
         ayyirs3r8k1oACyMsOCTkao4r8E3zX2keDNTqnktxQL70hPLPjjt7LxvBu7wl65bXj3N
         wZtQ==
X-Gm-Message-State: AFqh2kqxymnzrS5iyAz1WzTsROqng9TitJaKc+Al4rSX90BJSIlijOZL
        6J9Ehv6uU43slZuh+Rt1+Mg0Tg==
X-Google-Smtp-Source: AMrXdXs8VvJu8lJI1oIw6i5DZVBXTHaTyPtTbXduMOGDi58vDAO1b04D7zJkGNudQJqatLF3RsGpKw==
X-Received: by 2002:a17:906:b009:b0:877:8ae7:2e44 with SMTP id v9-20020a170906b00900b008778ae72e44mr15517453ejy.5.1674491916569;
        Mon, 23 Jan 2023 08:38:36 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:36 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
        daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        andrew@lunn.ch, gtk3@inbox.ru, sean.wang@mediatek.com,
        zhiyong.tao@mediatek.com
Subject: [PATCH v8 1/9] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date:   Mon, 23 Jan 2023 17:38:25 +0100
Message-Id: <20230123163833.1007181-2-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
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

Add bindings for the Mediatek mt8365-evk board.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2275e5d93721b..ae12b1cab9fbd 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -244,6 +244,10 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek,mt8365
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.39.1

