Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7D3565C7C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 18:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiGDQ6J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 12:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiGDQ6J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 12:58:09 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EE665D0;
        Mon,  4 Jul 2022 09:58:07 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id fi2so17675127ejb.9;
        Mon, 04 Jul 2022 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2Q9FRLaZUKXMdeyBBzo8wh6+gFlGM+LoHpN9PIw1WA=;
        b=QrBi+MNGnPDdmvRfPNSwtoDZm0dlusfdRMi7fljLaHI5Dvc1G5U5pm11u38QM1qmII
         Q6eRtPj349iHGwc16bekIZLYyuKhOIXFyvshpycQxGDxv6KucPJEReTn+9OzYYomUwlM
         hHkF49R3zsOdHmmrVZMJZKc7ww9R46/IyytJaq14ik2R81Q40Fzi/xR565qmh54kVGTH
         jnbU/pdTnvexXHeo0TbsSzZhbjo8LZNyR2yNRueSzNIyDU4Lqnw+tPPYdjrXYIBJ8Rg5
         Crd7pz6ou5XhJsVxNzwbcUlYxmKXae/eVmhlPsK5ph6C2eR/SDClTLPHVpydxQCoJurX
         iHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2Q9FRLaZUKXMdeyBBzo8wh6+gFlGM+LoHpN9PIw1WA=;
        b=osgg9GMiTNP2OESqD9wrEre4K3lmIoHOTRJkn8vqnhlJGcS9CtAyA01kvpLz+PjDJ5
         xbJ1yxXR/YYFclrV+YSampXgjHLbV8/WsdXJIEalOqtgUjrO7+kbQezqzzJDDb+TiFFM
         4Bi8DhzS02xoCGGc2WpZ67ORNQ7e+Ad0IV0t+hXFzzU9RNyDeTlCZ7okBTo2UXoaMdjZ
         K2v4RmBZ/ueXx/P5LOFnF3F1EVt2E+HKBdpDzxtTiwucI10nXd1d6Uut2pEMKHSGkAfv
         RS8I5hWiE7uH2ZobN/QrbrT/FwFS8QsRMOPXzUzEqh4GoLBfbqQMYKbq9vtIJH7emRy7
         MmtQ==
X-Gm-Message-State: AJIora8Xu7lf3Ddezc6xr86yeIzNIPmlEPxByGlA55aNHkhQJBddq1BF
        vPOKCLt7TvDXgrnnzeY2BScVgZDVKg8=
X-Google-Smtp-Source: AGRyM1uyUuLStaDKcy0XUJgIQi/tMB9+vnxla3vzwtYrCGaTWWGuShZIEYQc5NgWmxphKLDXXJcYig==
X-Received: by 2002:a17:906:752:b0:726:a6c2:b242 with SMTP id z18-20020a170906075200b00726a6c2b242mr30265671ejb.33.1656953886366;
        Mon, 04 Jul 2022 09:58:06 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c20-20020a056402101400b004358cec9ce1sm20880584edu.65.2022.07.04.09.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:58:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/4] pinctrl: tegra: Separate Tegra194 instances
Date:   Mon,  4 Jul 2022 18:57:58 +0200
Message-Id: <20220704165802.129717-1-thierry.reding@gmail.com>
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

Changes in v2:
- address Rob's review comments on the DT bindings

Thierry

Thierry Reding (4):
  dt-bindings: pinctrl: tegra: Convert to json-schema
  dt-bindings: pinctrl: tegra194: Separate instances
  pinctrl: tegra: Separate Tegra194 instances
  arm64: tegra: Separate AON pinmux from main pinmux on Tegra194

 .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
 .../pinctrl/nvidia,tegra-pinmux-common.yaml   | 195 ++++++++++++
 .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 --------
 .../pinctrl/nvidia,tegra114-pinmux.yaml       | 162 ++++++++++
 .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ----------
 .../pinctrl/nvidia,tegra124-pinmux.yaml       | 182 +++++++++++
 .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -------
 .../pinctrl/nvidia,tegra194-pinmux.yaml       | 285 +++++++++++++++++
 .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 ---------
 .../pinctrl/nvidia,tegra20-pinmux.yaml        | 107 +++++++
 .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------
 .../pinctrl/nvidia,tegra210-pinmux.yaml       | 146 +++++++++
 .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 ---------
 .../pinctrl/nvidia,tegra30-pinmux.yaml        | 176 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  13 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c         |  33 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h         |   2 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c      | 286 ++++++++++--------
 18 files changed, 1437 insertions(+), 996 deletions(-)
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
2.36.1

