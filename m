Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05927720416
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 16:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbjFBOOx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 10:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbjFBOOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 10:14:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0477C197;
        Fri,  2 Jun 2023 07:14:51 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96fd3a658eeso299094366b.1;
        Fri, 02 Jun 2023 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685715289; x=1688307289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SdY1XBopK8Oi5xQ9K6FBVkvAA4EKUmybJdPjjn8gDg=;
        b=PX/B96IZOdsrJ0w/qVpbX+gUDAI+OjL8tgr+gFQwC0YQXQUL8f5nwk0HYeKX6CdZKV
         0k6d75iGy0TbIq7rHTvHcpwp6lKiuKfiEbuGTJO5WCxeRN1NVrUhsc0fgarKnhBSBMvv
         temoEpqnh1HUUOSP9D6v7Ce6eORUTnwTtTq3PsZb8OB19dl1BSMwz5+9AT0GrodDxRl2
         wyd33YAdTiXWXpts1N3ZYyYDxe8/ODAyOq2xsaySQ1tS1oz0bIQDWY9g815r2vnKceF1
         0SOUoodBzEoR7RfzSwSo+7couU+/jM5jNcDqQYvYWOlh24HbwazpgKBdh9i7YUSs4RIT
         xA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685715289; x=1688307289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SdY1XBopK8Oi5xQ9K6FBVkvAA4EKUmybJdPjjn8gDg=;
        b=DK+MZRzhUJVeTqOEem3hD4wkCO5avRDsA67SZB6zm4Kt5UFkZAYbjbEFMzKsDu0Ol8
         +9ypSNlaYQ2/07sx41aZFaHkAEFMXmcTKwIX5qy88YfDFVnjFm5V6/xwXx97vdkTaLDr
         vRFtbZWIJPgUhUjL6VP6Oq8SUSLbS2NtHidR/Nqis6BK7GorlXWpFw5LmuLKNRbrkCm4
         F/oCMYe+MbuJ6U5TnITsEXY05tOpwS4Gdo2g3P/VAROYRQQrrZ2hdIydriaogoLm7hHL
         A9g8Pls4og8IpG9fJsJxZhQUCCFvkRMXY6a1WYDGZk3CXtjZURLNFDLnJU4mz8Q6LlpS
         MhKA==
X-Gm-Message-State: AC+VfDyY4e+p64koyXdcW+Z3zVnv+JHLxvHLMjGhOIR0CuYMg+sW/IF+
        5enz3ClEg+y+iUL6DyZl/pQjSlrefac=
X-Google-Smtp-Source: ACHHUZ5ShAwLDaQZbIQGlx8fDWCbowKs9NETDFPlS4l7Rs8c2oib0wPvpLsl2EfOqHHQS9FofvRs/Q==
X-Received: by 2002:a17:907:7203:b0:974:bd60:8096 with SMTP id dr3-20020a170907720300b00974bd608096mr1327972ejc.37.1685715289215;
        Fri, 02 Jun 2023 07:14:49 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a12-20020a1709063a4c00b009745c84b24bsm834151ejf.15.2023.06.02.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:14:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 0/3] pinctrl: tegra: Add Tegra234 pinmux driver
Date:   Fri,  2 Jun 2023 16:14:42 +0200
Message-Id: <20230602141445.3012550-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this is an updated version of v3 of the series, which can be found here:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=357257

This addresses some comments from Krzysztof on the DT bindings. However,
one change that I didn't make is to remove the list of explicitly
allowed pin group properties. This is so that the common bindings can
define the format of all pin group properties, but the per-SoC bindings
can then decide which ones are allowed for each IP version. I added a
comment to the bindings to explain why this is done.

Changes in v4:
- use unevaluatedProperties for specific bindings and drop unnecessary
  or duplicated properties
- move "$ref" and "required" properties into more standard locations
- use "additionalProperties: true" for common bindings
- only allow valid per-SoC pin group properties

Note that the driver patch applies on top of the function table fix that
I sent out earlier:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=357206

Once accepted, patches 1 and 2 can go through the pinctrl tree and I can
pick up patch 3 into the Tegra tree. Alternatively I can also pick up
patch 1 into the Tegra tree to help with validation. We're not quite at
a point yet where the Tegra DTs fully validate, so it doesn't matter
much which way these get applied.

Thanks,
Thierry

Prathamesh Shete (3):
  dt-bindings: pinctrl: Document Tegra234 pin controllers
  pinctrl: tegra: Add Tegra234 pinmux driver
  arm64: tegra: Add Tegra234 pin controllers

 .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |   59 +
 .../nvidia,tegra234-pinmux-common.yaml        |   66 +
 .../pinctrl/nvidia,tegra234-pinmux.yaml       |  139 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   12 +
 drivers/pinctrl/tegra/Kconfig                 |    4 +
 drivers/pinctrl/tegra/Makefile                |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra234.c      | 1969 +++++++++++++++++
 drivers/soc/tegra/Kconfig                     |    1 +
 8 files changed, 2251 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra234.c

-- 
2.40.1

