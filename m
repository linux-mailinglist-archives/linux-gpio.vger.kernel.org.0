Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8C0716221
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 15:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjE3NhD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 09:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjE3NhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 09:37:02 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F86A1;
        Tue, 30 May 2023 06:37:00 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so2529951a12.1;
        Tue, 30 May 2023 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685453819; x=1688045819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0IWIqkvCL18T9qeOtu9NAQt+OvEofJMXnjblcNmSjY=;
        b=IyReP3q8IxnCSaJs0VU0mJ/YfofrvlenASA7XMfhGyL0VL7qiz6RLkDUPFz//scKQj
         ufIrgg1ZxzFUpRDqlXtkZw7a8MAcsrWbyLhNBxUGF/M5sE8UCKqLFrLcIsMlrvJhadMy
         tNt89YyHdTniRqYz/baPSmNOpnibtebm2hJ3osqpsTK1+CWJWfDFo8T6cOzs/RIjDFSa
         8u0FkEIIO4hLHeMvD9ly08rRuLISQ57X+vjXCdKisFreJNwls06r+BtOTZN5SwQ/MEkH
         UdcilrAxqJXM6OyvnXZBAyzFk7zCTJWx6m8jdT+E3TZJlUxzqun7QclbrwtjSj4qPeZU
         JY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685453819; x=1688045819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0IWIqkvCL18T9qeOtu9NAQt+OvEofJMXnjblcNmSjY=;
        b=Q9uTKKfAoXFV9GYEUGmzIAvlPK6+24vMo24IUzr2blUlkSbbRMYMRtW0EVifwgNV1V
         T13xobj2gWirVqD6QfzoTxmHt1BYTg78N1Db2cbHn0UrCOPob+wI4MzMR1MwrJHZMIDk
         QyocAwGlFwN+KqqyP3gNY+xP4MOtA0MXOtTgA6qKWQbp+pZ+ro5hC8RfCcgfcj7cp+qD
         StTvyF/3ZtwSgkIkXbmMCdS5v4egQ6cmcTdsjikAR3jjD5PfTGC8iiTYcq8kLfwdTYVd
         yiMdq7rxgLxsdd0tcafe7L63DcThMl+ZXW1JPL6FRFab58r1dDfOPXtJ3vtz3e19Lu1/
         Wq4A==
X-Gm-Message-State: AC+VfDwibABuneIufoxxCdH+CiGP19rK/2kpN6fhJQzBwjUD0Z+bes7g
        VWyX/sX5PJAYwKGMBghBRlJ2hT7+S9Y=
X-Google-Smtp-Source: ACHHUZ7aR6lQs3L4LjqWBy2qx1L3csAHgpKgAoWPIujOHePrHL+ALGRZ9P80yzz/BhEwnNvLzbZYnw==
X-Received: by 2002:a17:907:9712:b0:94a:4739:bed9 with SMTP id jg18-20020a170907971200b0094a4739bed9mr2374976ejc.13.1685453819127;
        Tue, 30 May 2023 06:36:59 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qt11-20020a170906eceb00b009655eb8be26sm7373130ejb.73.2023.05.30.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:36:58 -0700 (PDT)
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
Subject: [PATCH v3 0/3] pinctrl: tegra: Add Tegra234 pinmux driver
Date:   Tue, 30 May 2023 15:36:51 +0200
Message-Id: <20230530133654.1296480-1-thierry.reding@gmail.com>
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

this is an updated version of Prathamesh's v2 of the series, which can
be found here:

	https://patchwork.ozlabs.org/project/linux-tegra/list/?series=345256

The most prominent change is the split of the device tree bindings into
multiple files to make them more readable, as agreed upon with Krzysztof
during review.

Changes in v3:
- split up device tree bindings into multiple files for better
  readability
- do not permit underscore in pinmux node names
- use correct #address-cells and #size-cells for DT nodes
- fixup a typo in the gpio-ranges property name

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

 .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |   61 +
 .../nvidia,tegra234-pinmux-common.yaml        |   65 +
 .../pinctrl/nvidia,tegra234-pinmux.yaml       |  141 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   12 +
 drivers/pinctrl/tegra/Kconfig                 |    4 +
 drivers/pinctrl/tegra/Makefile                |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra234.c      | 1969 +++++++++++++++++
 drivers/soc/tegra/Kconfig                     |    1 +
 8 files changed, 2254 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra234.c

-- 
2.40.1

