Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43816781D2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 17:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbjAWQkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 11:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233200AbjAWQjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 11:39:16 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E122CFE0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:38:49 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 18so15241179edw.7
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0xrDD3xcfCowjDtQONef23ZJknmqB0wlCixYluZ1Ys=;
        b=oaNwH+5XMsUaiNgWPF1Xozyst4lLtwAKhefYSdsFRfIniE5Ysxs+EzM0IFFqp2iVjz
         GlVnAzXgzb5LIY2D0Z0cflIQ17g9BvkTyNQ3ZJs8ukS05lKySphB2t7KG2k2HPStC2wv
         3U37/HoUIL0bfq2GUy46VpOA7M7HsTEo1RMykJnjqS6bLOUZ0wrK0X9aBT1K5B6pNbBW
         lnhbQ4uB0RzBsU48esTxGSzGrcNRL0RiSRbjpTjjrf1uA47TfOfTySE08BH3C5apMl3T
         C/RIpXE7a5pjxhd1WoFKvQHuipgDpcl3YewCyZkFXgqZ5/nX3QGKMJtvMXZ5zIm2rlWT
         awIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0xrDD3xcfCowjDtQONef23ZJknmqB0wlCixYluZ1Ys=;
        b=Jr8ZBZUB/1teW36nNPrdBXSXHCd35GYEw8662qVO5vOscGKe1cWbYA0QVCIKoqG/JC
         yT+gXsSDuvcjrDQzFoWcJoSzIAViQA5mPXwz6OnJ/+26MzKEE/KiC/OMc0tt4q3UQ/aU
         o+u2s5WY6E6IAa9YkGZn2Py/xv2JQzBTg47ogReorvYtUPnwo7jtZO7OUTrynRJCh7hI
         5mt5v1L8XxNIcHj3EQt4vhcG5W8bqpVHebEw0y+LO6w2WXGqFlTCv3B3teE3wSUSoC+C
         iNd6wVVId7VDIjMFDuMDPFvOADEPcI1bb2xvM2Z49N7OZTjtOxXrdN5wbm2Qvzze0zju
         DMcA==
X-Gm-Message-State: AFqh2koy3dulXCFwCIuKVSyQ9MpInQ2LMov3x12G28Pgl5THhVz9l+uz
        4AnL788WbzJfj9u9ZNeNnAEjLA==
X-Google-Smtp-Source: AMrXdXvtlhTYRpcRpSv2FajCyFKah6jQMJf8lvOVuXdoEzYk1bbjlbdfDNwCy1YucoGj8rGb8pC/xQ==
X-Received: by 2002:a05:6402:f05:b0:49c:d9c3:ca74 with SMTP id i5-20020a0564020f0500b0049cd9c3ca74mr29108363eda.13.1674491926273;
        Mon, 23 Jan 2023 08:38:46 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:45 -0800 (PST)
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
Subject: [PATCH v8 8/9] dt-bindings: serial: mediatek,uart: add MT8365 SoC bindings
Date:   Mon, 23 Jan 2023 17:38:32 +0100
Message-Id: <20230123163833.1007181-9-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
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

Add binding description for mediatek,mt8365-uart

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index fe098d98af6ee..303d02ca4e1ba 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -45,6 +45,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
 
-- 
2.39.1

