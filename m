Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45F47ACABE
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Sep 2023 18:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjIXQOT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Sep 2023 12:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXQOT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Sep 2023 12:14:19 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F0F83;
        Sun, 24 Sep 2023 09:14:13 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c60c10db16so599275ad.1;
        Sun, 24 Sep 2023 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695572052; x=1696176852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XCyKX51cNk6AwikCXxgUKM7FaSB4aCTyWjenyDue4A=;
        b=dQzArYlLA0nnZt9e7CndlBzhJWksPuOe/MNRIjPXiw/FxzUSpSSArPYmW4Tidpdbav
         LedNaRty1Nl7hC+IgLaYqYGzpBimKsJOe/LQU5TDr9jMoqlhlDhywLA7dqvwFTn8EChr
         6Q3fZ8djrcOskgUlX904gIEVGLzwrecymHbJtKWsMMdqvhHkU0TTesXCQv0HoCJz6S+P
         eT+fO4RmoJak48t5jhAx544Fo2YRyibIvhggUGlRS6bBzxn/bGI9nokIcX67c2MHN4zF
         sGoWNNkKo1jKryguKe07VshqZVT/YIaLZS+K0VpAmntxyjwO5vb5AmjDFh47MpB+0Ym0
         h7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695572052; x=1696176852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XCyKX51cNk6AwikCXxgUKM7FaSB4aCTyWjenyDue4A=;
        b=syba2JTeIkZe79aWOZUDtVEl+FbljdCVTAJRbgoSvgPgO4o5fTeXMoTf2SaGDmQvy4
         pHdBhXLmwd7vLTXKhp2KSBX5d+YQLgsD1wHdDDoVmmbRR68lMZNJIxAOjQszLuCzHKmP
         VuSdH7C22Tu5fWFhbUnyCXGy3Yj+74rPvuDErcJNXiaq+kwFTrtebazs0vI7VPQTfGsz
         Een7PCAlscA64U0EyluivGvV4gvgWgKNAd92wGplzqXo4y9f7odXmg7y5meISyrQBEHQ
         dLJBEy0I/625TQNpbb9mzlAmofmKj4H0WxCoYfSXed09xoxOZ8Kq3RJ9xtkPNqpt01Ml
         BiIw==
X-Gm-Message-State: AOJu0YzcZh9HI4Ih4JzOBWqNHggoqMBpIQQf/EsBeZ9iIrcwxhlRIcvr
        DIm7rfAYfw83Jhs++s0DXnY=
X-Google-Smtp-Source: AGHT+IH2wbuGmXdLswSNMpZK7/5YOZvUra+dVjvCawq3qsG/PPmMdA6DZheP0yLpdNY7o7K9ATWtGg==
X-Received: by 2002:a17:903:2345:b0:1c3:a4f2:7cc1 with SMTP id c5-20020a170903234500b001c3a4f27cc1mr6319381plh.5.1695572052324;
        Sun, 24 Sep 2023 09:14:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1456:78d8:9605:879e])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902ed4d00b001c61512f2a6sm976248plb.220.2023.09.24.09.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 09:14:11 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     brgl@bgdev.pl, andy@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: gpio: fsl-imx-gpio: Document imx25 and imx27
Date:   Sun, 24 Sep 2023 13:14:03 -0300
Message-Id: <20230924161403.698833-1-festevam@gmail.com>
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
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index d0ca2af89f1e..e716c6170643 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -21,6 +21,14 @@ properties:
       - items:
           - const: fsl,imx35-gpio
           - const: fsl,imx31-gpio
+      - items:
+          - enum:
+              - fsl,imx25-gpio
+          - const: fsl,imx35-gpio
+      - items:
+          - enum:
+              - fsl,imx27-gpio
+          - const: fsl,imx21-gpio
       - items:
           - enum:
               - fsl,imx50-gpio
-- 
2.34.1

