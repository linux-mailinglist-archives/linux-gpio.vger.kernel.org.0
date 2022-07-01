Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D915B563680
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 17:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiGAPFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 11:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiGAPFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 11:05:08 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA897A5;
        Fri,  1 Jul 2022 08:05:07 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id fi2so4550642ejb.9;
        Fri, 01 Jul 2022 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XyG7pVB+BWkSEILuApybwvIv5TWweJG/YFmaKnGvDs8=;
        b=GkH9eF8aeiaz/mE+MhnMAQlvEBNDPJT5nf1+ieBvlXSwdRBHnmd1dNDoveeFCXYi9e
         Qm4jFeuOByLw1NYi0+K4MqOIQsJgtXUqDtSyp9d4DypQTgknP8Tr+Ubs/qoQXd9iEioX
         eBo258I/RPgFUnM76IFEBBJt5BkATZsG6FAJaTm1mqLn+dD4gJLo8fc2491R302zEegL
         BwcnFxrSsXTqtY95cxyVVuaEEy5+MsDXVFGrncyTivbCcRiPCgq0tNllXNuz6F7pPxY9
         /sxLBpgYxR5/sO5AyaVVO2MGYfTRJ3cmogrEGJkYR2mS3tJiI9UlOjZDDz5vIesfDQnH
         Y6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XyG7pVB+BWkSEILuApybwvIv5TWweJG/YFmaKnGvDs8=;
        b=l/4dGqggBhwFrVc40fe1n9khb/Sz5J2LmnkkaL2frt4UYkf6C5qNdWZDVZe/9rEi/N
         JWkSoWZHfqvRBCCRU24cMJcMqhXl3aUKGQOpy7bNPauX8cJXtxpJYn5XYT4vHuFrsJQ5
         Pr3jDPcad+Gt1EyZ02YAzir2EMbullhZj/+JfSUCihSfkVc71ireojdqlATD43vdpJJk
         vozyckHBmWaqtor3F2bjc8eptexASFMvr+amwdJPB6d+MC1F5Y56UV07boiU3aVsLKqk
         NqXTK0SVa3HFIvxizLpLdewlPkcqWDrfKfyNPx0f0Zmqv1VRVHE6Lg6zTZaW+m5+2rOq
         SupA==
X-Gm-Message-State: AJIora8b5RcAMh13w+IGBWxhkmkRVCYqvzsb2a62Iiev3uPATKl9Ekki
        FRv0FTHOyTdwXqeBvlkNaog=
X-Google-Smtp-Source: AGRyM1vyYh5MdkvxvBq8TOIRHx1Vmdi6lzWt5t4as9pzfnz5mEgNuyTqiF2IxQRGaNSU6tmB28AC7A==
X-Received: by 2002:a17:906:528d:b0:726:38df:6f70 with SMTP id c13-20020a170906528d00b0072638df6f70mr15068799ejm.61.1656687906087;
        Fri, 01 Jul 2022 08:05:06 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t25-20020a056402241900b0043589eba83bsm4771446eda.58.2022.07.01.08.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 08:05:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 0/4] pinctrl: tegra: Separate Tegra194 instances
Date:   Fri,  1 Jul 2022 17:04:57 +0200
Message-Id: <20220701150501.443296-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

Thierry

Thierry Reding (4):
  dt-bindings: pinctrl: tegra: Convert to json-schema
  dt-bindings: pinctrl: tegra194: Separate instances
  pinctrl: tegra: Separate Tegra194 instances
  arm64: tegra: Separate AON pinmux from main pinmux on Tegra194

 .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
 .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 -------
 .../pinctrl/nvidia,tegra114-pinmux.yaml       | 264 +++++++++++++++
 .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ---------
 .../pinctrl/nvidia,tegra124-pinmux.yaml       | 287 ++++++++++++++++
 .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 ------
 .../pinctrl/nvidia,tegra194-pinmux.yaml       | 320 ++++++++++++++++++
 .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 --------
 .../pinctrl/nvidia,tegra20-pinmux.yaml        | 203 +++++++++++
 .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ---------
 .../pinctrl/nvidia,tegra210-pinmux.yaml       | 232 +++++++++++++
 .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 --------
 .../pinctrl/nvidia,tegra30-pinmux.yaml        | 268 +++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  13 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c         |  33 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h         |   2 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c      | 286 +++++++++-------
 17 files changed, 1758 insertions(+), 996 deletions(-)
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
2.36.1

