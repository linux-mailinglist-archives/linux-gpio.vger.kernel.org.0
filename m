Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C66E48B7FE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242525AbiAKUPU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:15:20 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37702
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236743AbiAKUPS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:18 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2D3483F207
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932117;
        bh=lPhJuPIv3O/CdoWKkJQZ8TgTKphU5KVeriAN8qLF+3w=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=QhcYrAg8z8sUONc49JVwHWn3RSIprd9JULrePRaBbNanbQnuiGq5DD/P0+4psJNyn
         6TDKHyNgr3JzfiynGv0VsoieaezHjTDHkCksS5she7z2vd3rJcoltb2Haq5YC4MEjF
         Z1xOkwmh3yLIZ0ZgghYcqpFePUO36yc6etDa61Lz7YNQ4jEpIQbg0KEw8EK4C+i+v4
         YrOHthZ7HBUnwqgw3gBvuLGo8MHYmMka2lL98Ip8WpP5oGDZJaF8pYMub/bPNEj46t
         y//xRXUCNe0Utu5ZGdP9egKiVTjZzcTLasWdnbBCW5J+04cOH81QjNmNyOFYHchXPs
         U8CiVEI0w00Lg==
Received: by mail-ed1-f71.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso139581edc.23
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lPhJuPIv3O/CdoWKkJQZ8TgTKphU5KVeriAN8qLF+3w=;
        b=3aKCK7KMg3vz2m0Ze5S/8fL+fDSCwlznPErpSk5dY/7SAOjTXeldALFLnu1kFbEy5a
         XLJS5CAS9ffG8W67Xu2yoj2AnZcjFRViacc6LtGRXH5DmZtKei/ToGyJeneH9mNPxizl
         BZqBWo/C8iX/QepHnVtgRxA9e/yNWAKSulep4eJg1r3YdZrE4wxIi+jP9bG/B17hRG33
         6Y7c7zp/SqxEKxw1m7SLX63fLzHySwJlhgBXwzP/IEY3z6PpY9FqRrWKFyOnqMHEauGU
         fzv1AXF2tP8o0N7GrDITrd4KktUSH02suCU2jZSr6ps1k/0tUx/3FRJkxHbeQDXsBVeR
         dJJQ==
X-Gm-Message-State: AOAM531yXEnpJaCWP77KQoTCWshPpljxvrPD+iev393NSR7M7PTs1dgO
        5HJr/0EoVjEWpJpnX9ofk/I81Fd++lvzK2TSZ2q/4rMCPNJiKYx5NgxX5f+uzdRE7vGVV1deGol
        Ll+gHbg+t21DniuwgELSq2lpTb+0lTcQ2QRCQsXw=
X-Received: by 2002:a17:906:1405:: with SMTP id p5mr4956196ejc.113.1641932116249;
        Tue, 11 Jan 2022 12:15:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaxUmxBzgzWGTbTGdz1mYjm0oVEAku2/BN2r0BtcEZ2s0exOxr22WH6LCKYnzoXk7FithEBQ==
X-Received: by 2002:a17:906:1405:: with SMTP id p5mr4956173ejc.113.1641932116052;
        Tue, 11 Jan 2022 12:15:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 00/28] pinctrl: dt-bindings: samsung: convert to dtschema
Date:   Tue, 11 Jan 2022 21:13:58 +0100
Message-Id: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Changes since v1
================
1. Patch #1: add missing pin assignment (Alim).
2. Patch #2: correct double sizeof() (Alim).
3. Patch #7, #8: put label-override in proper patch (Alim).
4. Patch #24: Extend doc, change the 'if' clause for wake-up interrupts.
5. New patches: #25 - #28.
   Exynos850 and ExynosAutov9 seems to be different in pin ctrl interrupt
   handling, so they need their own compatibles.
   Please kindly review and provide feedback on these as I do not have
   details.
6. Add review tags.

Dependencies
============
1. Patch #2 ("pinctrl: samsung: accept GPIO bank nodes with a suffix") is
   necessary for DTS patches.

2. Last patches #27 and #28 depend on patch #26 adding the compatibles.

Best regards,
Krzysztof

Krzysztof Kozlowski (28):
  pinctrl: samsung: drop pin banks references on error paths
  pinctrl: samsung: accept GPIO bank nodes with a suffix
  ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
  ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
  ARM: dts: exynos: override pins by label in Peach Pit
  ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
  ARM: dts: exynos: override pins by label in Peach Pi
  ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
  ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
  ARM: dts: exynos: align pinctrl with dtschema in Exynos3250
  ARM: dts: exynos: align pinctrl with dtschema in Exynos4210
  ARM: dts: exynos: align pinctrl with dtschema in Exynos4412
  ARM: dts: exynos: align pinctrl with dtschema in Exynos5250
  ARM: dts: exynos: align pinctrl with dtschema in Exynos5260
  ARM: dts: exynos: align pinctrl with dtschema in Exynos5410
  ARM: dts: exynos: align pinctrl with dtschema in Exynos542x/5800
  arm64: dts: exynos: align pinctrl with dtschema in Exynos5433
  arm64: dts: exynos: align pinctrl with dtschema in Exynos7
  arm64: dts: exynos: align pinctrl with dtschema in Exynos850
  arm64: dts: exynos: align pinctrl with dtschema in ExynosAutov9
  ARM: dts: s3c24xx: align pinctrl with dtschema
  ARM: dts: s3c64xx: align pinctrl with dtschema
  ARM: dts: s5pv210: align pinctrl with dtschema
  dt-bindings: pinctrl: samsung: convert to dtschema
  dt-bindings: pinctrl: samsung: describe Exynos850 and ExynosAutov9
    wake-ups
  pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups
  arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
    Exynos850
  arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
    ExynosAutov9

 .../pinctrl/samsung,pinctrl-gpio-bank.yaml    |  52 +++
 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  81 ++++
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 106 +++++
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 392 ++++++++++++++++++
 .../bindings/pinctrl/samsung-pinctrl.txt      | 383 -----------------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  10 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi     | 165 ++++----
 arch/arm/boot/dts/exynos4210-i9100.dts        |  30 +-
 arch/arm/boot/dts/exynos4210-origen.dts       |   2 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi     | 226 +++++-----
 arch/arm/boot/dts/exynos4210-smdkv310.dts     |   4 +-
 arch/arm/boot/dts/exynos4210-trats.dts        |   6 +-
 .../boot/dts/exynos4210-universal_c210.dts    |  12 +-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |   4 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |   2 +-
 .../boot/dts/exynos4412-itop-scp-core.dtsi    |   2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       |  30 +-
 .../boot/dts/exynos4412-odroid-common.dtsi    |   8 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts      |   2 +-
 arch/arm/boot/dts/exynos4412-origen.dts       |   4 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi      |  44 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi     | 252 +++++------
 arch/arm/boot/dts/exynos4412-smdk4412.dts     |   4 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |   2 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi     | 220 +++++-----
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |   2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  22 +-
 arch/arm/boot/dts/exynos5250-snow-rev5.dts    |   2 +-
 arch/arm/boot/dts/exynos5250-snow.dts         |   2 +-
 arch/arm/boot/dts/exynos5250-spring.dts       |  20 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi     | 148 +++----
 arch/arm/boot/dts/exynos5260-xyref5260.dts    |   2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  22 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi     | 170 ++++----
 arch/arm/boot/dts/exynos5410-smdk5410.dts     |   4 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  89 ++--
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi     | 194 ++++-----
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |   6 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |   2 +-
 .../boot/dts/exynos5422-odroidxu3-common.dtsi |   6 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  89 ++--
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi        |  60 +--
 arch/arm/boot/dts/s3c6410-mini6410.dts        |   4 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi        | 210 +++++-----
 arch/arm/boot/dts/s3c64xx.dtsi                |  16 +-
 arch/arm/boot/dts/s5pv210-aquila.dts          |   2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi          |  40 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts     |  12 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts         |  16 +-
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi        | 226 +++++-----
 .../boot/dts/exynos/exynos5433-pinctrl.dtsi   | 211 +++++-----
 .../dts/exynos/exynos5433-tm2-common.dtsi     | 259 ++++++------
 .../boot/dts/exynos/exynos7-espresso.dts      |   6 +-
 .../boot/dts/exynos/exynos7-pinctrl.dtsi      | 176 ++++----
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    |  52 +--
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   4 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi |  50 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |   2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  87 +++-
 62 files changed, 2261 insertions(+), 2003 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt

-- 
2.32.0

