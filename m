Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E08F722B9F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 17:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235063AbjFEPnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 11:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234933AbjFEPn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 11:43:29 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BA8E7E;
        Mon,  5 Jun 2023 08:43:08 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b1a7e31dcaso52810131fa.2;
        Mon, 05 Jun 2023 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685979755; x=1688571755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4beMTTExN5BL3Gz91H7zB+KS//EVooTryMnr3GUzC7Y=;
        b=Ks5Xx89FWStk+fknD3Duogr2hx/Xc+huVPZuM9O1lJrLoZuElMx+A+EPH9h6yZ3tXC
         NGNXXxlfHL3OXCwBsos2Xp91U+rx7NUHIKt2ngJJ4JnjlP1CIl37oMBPq443cUH76mEi
         NG9OBHXzrezwam0cAPougItvv17frDm4Feysx7+QdHvWz/ZIFqmJOOyYJB96lMSf6xEj
         KAp7K2I6+Tm/pJPFTSnX9cCWA7/cDABKqEyhX4IexRxqNdCBwQ77fkbFdTgR4bvKYSzL
         jLw15GmVbKc1gU2YlzHPgXuXFYs0WLQaV36OgeGYuveKEFMsVvG5ccxKvcOOrOtYYYVn
         0YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979755; x=1688571755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4beMTTExN5BL3Gz91H7zB+KS//EVooTryMnr3GUzC7Y=;
        b=WcnB3SwC2uCMsgA9Ao4rLoD+fcgICHZ0ikhx6//3BNNTxir1qfxDqHhGqJUr0iitZA
         EXT73cEia9JgNsv6Ma9XjZsX+MOxoVQShcRLXNNgc8d/6kDAQPnm92unBkyhgFNIFTkj
         eKtoJFkHS3zvA3ZwYvmWOxmkQF/K03XxWXuhDhZzc2TV47f45fbU89jMzGyUp0Ai4u43
         RUzeOKlYMHH6rVsXMnMMhgdz5NUmAZ+tstPIRLu/ofPE97GIxbPuZK5MyXNda140Y/Hl
         O2SS3D7Vn0B72javuWAEu8n+q+b4BFedx+eN1xlFVExAoiAsuo5A6M6j8re/TcM/+Qij
         dAvA==
X-Gm-Message-State: AC+VfDxYhOT5nSPF7sagwEwwT/UKTSCk+dKqioavNibZJ1uNwzIiOoSM
        ZZC8Ejy2WZYeVw/d5RJRlo0=
X-Google-Smtp-Source: ACHHUZ4kmXzCHZ3Ybgbf3WsmQAc7+vZv61kos9D+bwvmZ4junBkt6SKpOwQGz39DgalB4YxsCMCZ0Q==
X-Received: by 2002:a2e:9d90:0:b0:2b1:b8ad:3456 with SMTP id c16-20020a2e9d90000000b002b1b8ad3456mr3726746ljj.50.1685979754615;
        Mon, 05 Jun 2023 08:42:34 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906398a00b0094edfbd475csm4358975eje.127.2023.06.05.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:42:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 0/3] pinctrl: tegra: Add Tegra234 pinmux driver
Date:   Mon,  5 Jun 2023 17:42:27 +0200
Message-Id: <20230605154230.2910847-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
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

Hi,

this is an updated version of v4 of the series, which can be found here:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=357888

This adds the missing DT bindings example for the AON pinmux controller
and addresses some review comments from Andy that I had previously
missed.

Changes in v5:
- add missing DT bindings example for AON controller
- use generic device_get_match_data() instead of OF-specific variant
- drop comma for of_device_id table sentinel entry
- drop unneeded .owner initialization
- drop redundant license text
- add missing includes

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

 .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |   78 +
 .../nvidia,tegra234-pinmux-common.yaml        |   66 +
 .../pinctrl/nvidia,tegra234-pinmux.yaml       |  139 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   12 +
 drivers/pinctrl/tegra/Kconfig                 |    4 +
 drivers/pinctrl/tegra/Makefile                |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra234.c      | 1961 +++++++++++++++++
 drivers/soc/tegra/Kconfig                     |    1 +
 8 files changed, 2262 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra234.c

-- 
2.40.1

