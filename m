Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53B06199B2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 15:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbiKDO0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 10:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbiKDOZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 10:25:48 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7D832047;
        Fri,  4 Nov 2022 07:23:51 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id n12so13617562eja.11;
        Fri, 04 Nov 2022 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iRiJ/zmitaPiCB9EUD2c2I3QHrHtja7vxHPfhsPIi8=;
        b=Gkq5iA+S8zPP5clf6RNZq5BU8iGgZlpoHtjt8PgJdO5aU4/pHVZuuyDQHw/LqwVjud
         p2Ufg4Q0CxGIhIp/Ji/5m6ewdCvJMwNt6G3g4qlSEms8CCiao/iSGgXS4a9+lIpGTNEq
         7Ggyfg8TXg2tUi+ATGF1DWeRqhcdCnvCCBbQE2W2OZQ9X/81T7fqXPmQcXCiGfgr3iYe
         qn6KIlk2CdkW7vQVH1syzVs6xufMnkWDtpOREuTjpNgP0zzx00Pl3rbBmlmFpyW5rOIe
         cZtHEpkQW/EkZlk1+lkZF6ZzGknCP2Dhnb34iVN/UmOKj30FgzxglP1rqIDLzsBND5LO
         NRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iRiJ/zmitaPiCB9EUD2c2I3QHrHtja7vxHPfhsPIi8=;
        b=BAyMpUshaOegQLlAN0pRt9RqHibfgcupvzE//IWXNpAWp9Po8mOtUmKZzs5/RMzyUm
         5nC6aEF7XGvQzuhafnekIf1UluWTsuRayFA5dBCop1rKkpVifKBxSYQjhJRJkrpxgBxi
         H99ts1XbtLhLoTv1ZJ4xvrI4r67SFvP9PCZIA+mb/9FYw/2ivMMJ220/uDM9mF7MuwBW
         sIyizJl6oKRAG1ijA92E/Voqqy8An3+YurGhlzsdOcdL5HkXL+MvgM/hWlSfsXjjEcvg
         wKq8FaFdYhQzeHzljCdow5uD1WTpp5b8DvcDB14jG5lX8t3PIjouKJSr44HsuT2JhuNw
         H0sw==
X-Gm-Message-State: ACrzQf1mjTxhIx6TIkAm/FZ2Nw9NspuocmHY5y6efn0W4yTT+ojKz/5L
        xSZd83vr6iE3vPh3kYZ+aoE=
X-Google-Smtp-Source: AMsMyM41wUgwoWk+KRm/NzQaNvZqM9qgFAY74hdoUiWSlQO+ccmOUZrOatQCpvvLNPLLadFy2nJ4sA==
X-Received: by 2002:a17:907:2cd4:b0:7ad:e5b7:a530 with SMTP id hg20-20020a1709072cd400b007ade5b7a530mr23060564ejc.489.1667571829772;
        Fri, 04 Nov 2022 07:23:49 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bk22-20020a170906b0d600b0078ca30ee18bsm1922483ejb.95.2022.11.04.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:23:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/4] pinctrl: tegra: Separate Tegra194 instances
Date:   Fri,  4 Nov 2022 15:23:41 +0100
Message-Id: <20221104142345.1562750-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This patch series changes the pin controller DT description on Tegra194
in order to properly describe how the hardware works. Currently a
simplified description is used that merges two pin controller instances
(called AON and main) into a single DT node. This has some disadvantages
such as creating a complicated mapping between the pins in those pin
controllers and the corresponding GPIO controllers (which are already
separated).

As a prerequisite, the first patch in this series converts the device
tree bindings to json-schema. A second patch then adds an additional
compatible string for the AON instance (along with more details about
each controller's pins) and finally patch 3 converts the driver to
cope with these changes. A fourth patch makes the corresponding
changes in the Tegra194 DTS file.

Note that while this changes the DT node in an incompatible way, this
doesn't have any practical implications for backwards-compatibility. The
reason for this is that device trees have only reconfigured a very
narrow subset of pins of the main controller, so the new driver will
remain backwards-compatible with old device trees.

Changes in v3:
- address more review comments by Rob Herring and make validation work

Changes in v2[0]:
- address Rob's review comments on the DT bindings

Thierry

[0]: https://lore.kernel.org/all/20220704165802.129717-1-thierry.reding@gmail.com/

Thierry Reding (4):
  dt-bindings: pinctrl: tegra: Convert to json-schema
  dt-bindings: pinctrl: tegra194: Separate instances
  pinctrl: tegra: Separate Tegra194 instances
  arm64: tegra: Separate AON pinmux from main pinmux on Tegra194

 .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
 .../pinctrl/nvidia,tegra-pinmux-common.yaml   | 178 +++++++++++
 .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 --------
 .../pinctrl/nvidia,tegra114-pinmux.yaml       | 155 ++++++++++
 .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ----------
 .../pinctrl/nvidia,tegra124-pinmux.yaml       | 176 +++++++++++
 .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -------
 .../pinctrl/nvidia,tegra194-pinmux.yaml       | 284 +++++++++++++++++
 .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 ---------
 .../pinctrl/nvidia,tegra20-pinmux.yaml        | 112 +++++++
 .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------
 .../pinctrl/nvidia,tegra210-pinmux.yaml       | 142 +++++++++
 .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 ---------
 .../pinctrl/nvidia,tegra30-pinmux.yaml        | 176 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  13 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c         |  33 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h         |   2 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c      | 286 ++++++++++--------
 18 files changed, 1407 insertions(+), 996 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml

-- 
2.38.1

