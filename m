Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1547AC36C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 18:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjIWQCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 12:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjIWQCk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 12:02:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58260A3
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 09:02:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5041335fb9cso6069749e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695484951; x=1696089751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WV53zmIgHmL/yFU/dQEcGYpvwnBSr4yD4SRIekzGo4A=;
        b=MWN/NUODoPu4BGIA6hCfmPGmOyDZpcLczw8BzDgOiW4MhOS/4ysb0RWTJp0yRnoarE
         BuPNVTkMgsH/yfn2xTD/EAAHpJRtjIJ4Wp3IG2KHH84HbxpVLdZUfoOsLwggTF0Ca/XS
         2yVi/ASLZmg54/e4rPhpC4Zojs+eT+1wom50gDZPNX3R3wlJmkfcpLtWorGGQvwco5L5
         MqRBhV0MkHLYp/c9mLjl+XUVn2wfkvnGu05tj5RYEvGGW0Y1Ey82RUzbK1V7BIQ2+BZ4
         W5PCUs51n7QmoyWBdFQCScebBFpiA3QSyxwjnF9LSIoVpgo7w5vggiWqX+zWD66pYrS5
         E++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695484951; x=1696089751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WV53zmIgHmL/yFU/dQEcGYpvwnBSr4yD4SRIekzGo4A=;
        b=Bwoz+Otij2arcoBJvV4Lmpj3LO5Z5ICawvMmmEjxp/K1X8fTNDYev0sIxBh71/TZPw
         PWlVeVteIVKGTej2+isbw/oU5r85mDIvwt1QvGbhGmBT9o6YNghPzpxMt6beL5bjA2D5
         0obkDSMYRDkcdSsfW3L7Z3W3CWM2m/AqWRByIm5CdkOC7pLWSfyYLcK6qnSrHF3ZuSVG
         aYHnZEiBYf42mQa0muGf7MXLs1qlHGWSiFYcH/zy27rYnl7k/KuEX/jo6IOhDNzP1Lir
         5rLw1hBCOLTEdgPBWBVpGD609gqR73UFgmZ3u+eapkXc9R03zBstbNxl7fryH8exNrjj
         /5+Q==
X-Gm-Message-State: AOJu0Yx/jrnFyPbnDk0bYR9rdYdQMl2/j60xSZ+Z+ZbHor2ur3G2+Sms
        nxi09YuvVqy3UOwXbJGXwtkhrw==
X-Google-Smtp-Source: AGHT+IHpnXQL98R6AQ2JP2iGTBnSBc+FmieHCabkb3dnh43+mZ+mmqmQIr6CD9ITKQsufpcqvfCZnQ==
X-Received: by 2002:a05:6512:39d6:b0:503:3808:389a with SMTP id k22-20020a05651239d600b005033808389amr2418411lfu.11.1695484951524;
        Sat, 23 Sep 2023 09:02:31 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v30-20020a056512049e00b004fdde1db756sm1132835lfq.26.2023.09.23.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 09:02:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] gpio: ixp4xx: Handle external clock output
Date:   Sat, 23 Sep 2023 18:02:27 +0200
Message-Id: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMMD2UC/33NTQ6CMBCG4auYrh3TDkWoK+9hXPAzwERCSWuaG
 sLdLaw0MS7fL5lnFuHJMXlxOSzCUWDPdkqRHQ+iGaqpJ+A2tUCJmTSogOOsY4R+ZgvNaJuHh4J
 KxNJ0uq4zkQ5nRx3HHb3dUw/sn9a99h9BbetfLiiQkBfaaKw7o3V1HXmqnD1Z14vNC/hp4E8Dk
 yFR5URKmuLcfhnrur4BQl2lX/kAAAA=
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Changes in v3:
- Make sure to only manipulate the clock bits if one of the clock
  DT properties is set. Devices we can't test may rely on HW defaults being
  preserved in the clock bits.
- Link to v2: https://lore.kernel.org/r/20230922-ixp4xx-gpio-clocks-v2-0-0215ee10976d@linaro.org

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
 drivers/gpio/gpio-ixp4xx.c                         | 49 ++++++++++++++-
 4 files changed, 122 insertions(+), 40 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230921-ixp4xx-gpio-clocks-7e82289f4bb3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

