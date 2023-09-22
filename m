Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963B87AA8C1
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 08:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjIVGIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 02:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjIVGIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 02:08:09 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66288FB
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 23:08:02 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bffdf50212so28331051fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695362880; x=1695967680; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATQufBNbcXFkZmil1MnT/r/hXYDjTU/4NuEdLcc8JTo=;
        b=l699rsK9Phf4Xn4k4imcX9TnWvGgsMZP9SmLEPuHBjWtVHhXQflI8lgH3j61mxMuX0
         w9Bc7x/dNAL4UlAPuHav/nk2T/7nPUZ8702ahwkvTSUqq7Vq/kUrcK58oynBqdrW5BkX
         Sa8pbKlDOv8o1gP2RUQBVHqJQxSjkx/y/Kv4MXs0bde6GafrNzt7nk38IyNK+/yzW2DT
         VyPVSgCydqFxVF8C945J5+hZV67O6keKn/6AHLADBVQjsuxd7CCTob1c50TH/bIW9hc1
         W1c21TxL5GQpC4p7pdyXWM5isXcmfrKG+oJdpghFGlEpSQ9DtUa8q4I0qpptm74FOFiR
         LRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695362880; x=1695967680;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATQufBNbcXFkZmil1MnT/r/hXYDjTU/4NuEdLcc8JTo=;
        b=Q5U8J90sNgL8gbwHIaY5XGeM1vDcDS/YhG5rOauaFa9Ca9ipv5sAJVD2OrqTKPaSkd
         1/3k3wzxDe5gaejjMh3WcYQY9srhSlq79N6OKum2nx6b67fm0w0fQ153tRBJ2Yq9DCUX
         UmnAouMLVJnaH+RpB3DPZrSPoBRf7A3PnddvSBz/80C3lWsAMW8SD6MksMw/ck5OcB82
         NcRiCu7xgdAI4sdyBIMMJUXj5phCVxZyFIDL2IsXFP/LFGHgS0ZaVzljG8DLN5vySRdC
         WrEYpxHKcTNMoO1zEBnZZ4unYQiLmiRaZLs8qEcaywvDL5cRsxagPepEw/h4IFvHPaX/
         wHlw==
X-Gm-Message-State: AOJu0YyrSpGS5XaUwQbBMWtM3GiKjjIwRvZlF22TiQ1gw6exUWNcHxCK
        WuOyPukoCq3LUAnoLvFIwu/hyw==
X-Google-Smtp-Source: AGHT+IHeYRzOOUP72mWc4KIVtAc59HTLZGpwZ0ffTWvHbWpzrXNk2EqAvpcwHRxm3odwxvYxq99V7Q==
X-Received: by 2002:a2e:8683:0:b0:2ba:6519:c50f with SMTP id l3-20020a2e8683000000b002ba6519c50fmr6372127lji.52.1695362880343;
        Thu, 21 Sep 2023 23:08:00 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id w22-20020a05651c103600b002b9f4841913sm754329ljm.1.2023.09.21.23.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 23:07:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] gpio: ixp4xx: Handle external clock output
Date:   Fri, 22 Sep 2023 08:07:55 +0200
Message-Id: <20230922-ixp4xx-gpio-clocks-v2-0-0215ee10976d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADsvDWUC/32NQQqDMBBFryKz7hQdUzRdeY/iwqRJHComJEVSx
 Ls39QBdvgf//R2SiWwS3Ksdotk4sV8L0KUCPU+rM8jPwkA1tbWkBjkHkTO6wB714vUrYWd6ol5
 aoVQLZRiisZzP6GMsPHN6+/g5P7bmZ//mtgZrvHVCClJWCjENC69T9FcfHYzHcXwBVz0M7LUAA
 AA=
To:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO block on the very legacy IXP4xx GPIO can provide
a generated clock output on GPIO 14 and GPIO 15. This
provides a straight-forward solution with a flag for each
clock output.

More complicated solutions are thinkable, but I deemed them
overdesigned for this legacy SoC.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Fixed formatting pipe | in bindings
- Fixed som blank lines in bindings
- When we will just blank out the clock register settings,
  don't spend time reading the initial value.
- Link to v1: https://lore.kernel.org/r/20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org

---
Linus Walleij (2):
      gpio: Rewrite IXP4xx GPIO bindings in schema
      gpio: ixp4xx: Handle clock output on pin 14 and 15

 .../devicetree/bindings/gpio/intel,ixp4xx-gpio.txt | 38 -----------
 .../bindings/gpio/intel,ixp4xx-gpio.yaml           | 73 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 drivers/gpio/gpio-ixp4xx.c                         | 40 +++++++++++-
 4 files changed, 112 insertions(+), 41 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230921-ixp4xx-gpio-clocks-7e82289f4bb3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

