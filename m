Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9452581816
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 19:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbiGZRIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 13:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbiGZRID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 13:08:03 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3831EEE7
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 10:08:01 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id g2so12981677wru.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jzo7E3iuffF68CMucGWsT/yGzhnjiXcilx74DK/3MzI=;
        b=PJwcnD/GOZLAyqo5HYBp+ugAHaWK3jD+s39TePD+rKuCuI6iI14Xay2w+UOL0js0v6
         LSBHiEPB44Ii2OaSGoDqNOVSO6rNg69fZ7u0WIM6Le6oRMF2IRUbOBE0P+5dIMhS9yGa
         QC+F0XyZryu1sFqAVoIRgh46Ge6GRHy1WkUhbRG8gjFB5aNyx26K2hN41i4YG7PvuOCR
         qf2apmc2qvQe6Azfk9JX5P9HelPwx7VJwIQamSA2IvtkS0pvhPy9Hm+mGBmhrdG9C2hq
         YvnISfSwHYV42XaarrfP6SM31clvkoOOFn/3MvggwSxR06Rcuh2QbKN3LYeFiRPBr0y1
         VnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jzo7E3iuffF68CMucGWsT/yGzhnjiXcilx74DK/3MzI=;
        b=p9dr/wdUE5yAjcMrjTf7+2tn5qxUvhM5k362pc/VtBAuEVeBY5kx47rxad1KRVwZ9k
         TcdNN0jTe+YJwebVgNUJ9UF4UFXyZbBaz5zGtvJ+DL4JILNWTNF4TrNwqH2shsv2FDfb
         +IjcQnv6IxXyMf5dNaaZMLaz5qvP8P1y5S89r3mPn8e7Nk2gqIL0w65lju/DA1aq/mt7
         VGaD3zuc19aX08fyavT0qMX9ms97bjoBfjdGLbr/dC666Y7u2RS6sAOUgqU156JDL6Gg
         PTec1CvlqWQw48IDkhd0v2OKbrcjF4fKW71PT08765k/Vlk/yKzNgyplTMTxqpz71RRS
         B8Fg==
X-Gm-Message-State: AJIora9/bI8ER9Ya9TZiT8AmkK70/bMVo8zg8d8bnZ5yJogihBv42OLa
        2QUXJdWaVB05Sqe8HFVpseTJ/A==
X-Google-Smtp-Source: AGRyM1tirn6tXbKRAXaMvkLrwVqgAF4lGynuVfCpdqZGZCoxCIG6G3hqB0PYq/iIx1kid07GWxSsVg==
X-Received: by 2002:adf:eec2:0:b0:21e:61cd:64c7 with SMTP id a2-20020adfeec2000000b0021e61cd64c7mr11543092wrp.324.1658855279436;
        Tue, 26 Jul 2022 10:07:59 -0700 (PDT)
Received: from henark71.. ([109.76.124.168])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm14859618wrv.94.2022.07.26.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:07:58 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atul Khare <atulkhare@rivosinc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: sifive: add gpio-line-names
Date:   Tue, 26 Jul 2022 18:07:26 +0100
Message-Id: <20220726170725.3245278-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726170725.3245278-1-mail@conchuod.ie>
References: <20220726170725.3245278-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Atul Khare <atulkhare@rivosinc.com>

Fix device tree schema validation messages like 'gpio-line-names'
does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
sifive,gpio.yaml'.

The bindings were missing the gpio-line-names element, which was
causing the dt-schema checker to trip-up.

Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index 939e31c48081..fc095646adea 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -46,6 +46,10 @@ properties:
     maximum: 32
     default: 16
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   gpio-controller: true
 
 required:
-- 
2.37.1

