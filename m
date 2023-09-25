Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE967AD6D9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Sep 2023 13:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjIYLTW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Sep 2023 07:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjIYLTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 07:19:21 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA53DA;
        Mon, 25 Sep 2023 04:19:15 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68cc1b70e05so1552620b3a.1;
        Mon, 25 Sep 2023 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695640754; x=1696245554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dp5jcoInqQYy22jSYpvKWQ8vHBOtOjppvNcy2M0LqbU=;
        b=Mm/cXeN/GBKBnAAUP4yjaqxdeVj/rE3S9H9oFO3fugeiFdoRUbLdS5Mmk0oOzI8+IB
         D4bEzGwyaTqDayt+W3RJtKjeKnRotauCmUIswNk3nqsgs3QXSkJR5U4dx5FBaZSqfowB
         b3xUvtOE/RiiioAxDahcw3iM3qMyLiBgOBuKmfueSNp2gtuE800OhMLcKamKdc1vXNaK
         ji7gmYDVDpn/tk+lpfe3uakrrgPGQBwDPkOP//9dUktG+q2bzBoONZ+foZGCoEg05EC5
         qlWbY0ZTD9cu7sdaQZHseHhE52eyFrAAnlmEbX2YKcwDY61QKAbMxyboBGQvr0tohxcR
         xQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695640754; x=1696245554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp5jcoInqQYy22jSYpvKWQ8vHBOtOjppvNcy2M0LqbU=;
        b=iKVPQaAguy532/kskpZx/ifcSG4bhbD8JI/h6SuqVby0CqhpbVRW1K/kV1sV9E/IYd
         7VfkDVmRbL4WYXRFlEtC7dzMJfmRff5UAo1WJKKs6s56eNUPKNNLOcd/qbjLcKJthvBK
         llvp2UkMD1JIUVGpKr22Fup8E51Knm710irXZFXHcUUd2wRIQAg6T9hlwk5IOXTOAkVU
         D0sYmbnJ4IE01ulf72idy60ytmk92RVXVIXTDHu5CX3m0jEsxEgZg6C0j/pIkTck2qwb
         rk++2JLLm9f6MKjQVzT48C2CT+7Auc1Ws+xCnYMfV9zWgpQ/974hRhBvQYGfHWIZ0Wdm
         8JGA==
X-Gm-Message-State: AOJu0Yxf1mOjd0WGoFIzncn3BREUka5MOdKJkxUp4RoHlvxGGuA8upFD
        2tBL9kh2ccG4vNGrQVq5uKxLY3mu2AQ=
X-Google-Smtp-Source: AGHT+IEz18qXdFOWH69yw0kfpbb/x9hrwaonmv5T55Pwgt0BbyhRrOwy1FQsp2oymlp40FDLKyDfJA==
X-Received: by 2002:a05:6a20:4418:b0:123:149b:a34f with SMTP id ce24-20020a056a20441800b00123149ba34fmr10826845pzb.1.1695640754529;
        Mon, 25 Sep 2023 04:19:14 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fbad:220b:bad3:838c])
        by smtp.gmail.com with ESMTPSA id ce21-20020a17090aff1500b0026b3ed37ddcsm7697005pjb.32.2023.09.25.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:19:13 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     brgl@bgdev.pl, andy@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] dt-bindings: gpio: fsl-imx-gpio: Document imx25 and imx27
Date:   Mon, 25 Sep 2023 08:19:06 -0300
Message-Id: <20230925111906.926031-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

fsl,imx25-gpio and fsl,imx27-gpio are not documented, causing schema
warnings.

fsl,imx25-gpio is compatible with fsl,imx35-gpio and fsl,imx27-gpio
is compatible with fsl,imx21-gpio.

Document them accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Sorted by fallback compatible. (Krzysztof)

 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index d0ca2af89f1e..f73381cec2d8 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -21,6 +21,14 @@ properties:
       - items:
           - const: fsl,imx35-gpio
           - const: fsl,imx31-gpio
+      - items:
+          - enum:
+              - fsl,imx27-gpio
+          - const: fsl,imx21-gpio
+      - items:
+          - enum:
+              - fsl,imx25-gpio
+          - const: fsl,imx35-gpio
       - items:
           - enum:
               - fsl,imx50-gpio
-- 
2.34.1

