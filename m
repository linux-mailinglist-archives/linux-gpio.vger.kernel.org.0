Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9614B7681
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 21:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242618AbiBORmj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Feb 2022 12:42:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237032AbiBORmj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 12:42:39 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A7E8A31C
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 09:42:29 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D7CC6405D9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644946947;
        bh=SiDXwW19FJN8pW9aFNLOMTMKt2M32hD/m+v/+010wfI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=aYs796KZF7Ua0SK9A8NX41zcogbAsg1G5VefBgGWu4c6D6/V1FkYxInjaDQBP4IhM
         EoNtpyMsbrSncOTa4ElC6583iZvYDSZ43w9bM+7VuWrfIB6ZTIAzX5wBFONHum/aL1
         kUKgnYy2m3eoIUfUdERdYLOcGzSB+PN4dobQJwuXrJLuXKITzTRTWxltqav0lHStnD
         +seUe0gTvbJBFEKQaAj2g7+6V/zSoHN3wseIW0xpn4jsNvtB5zbbzF2iJ6+lab4Pcm
         TEjErpghZpt8HWySOpkI2XP/cFWzb4hF7ccdjg4rXReX0h2ihYOGRFhYsh+lILrmw2
         ++np5aBCpku6g==
Received: by mail-ej1-f70.google.com with SMTP id hc39-20020a17090716a700b006ce88cf89dfso2748260ejc.10
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 09:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SiDXwW19FJN8pW9aFNLOMTMKt2M32hD/m+v/+010wfI=;
        b=tHy4llajNxtR6hD+WXb3m/7DLEnrFafGwCHpt21sSXOJjIStNy21TI0iG+yx6X+UYz
         afWt+LnwMf3auKY4Lxb2qFiYFmy69IwcSoyavm7TNGAEZ/1Lu3vzzxXdbuZoKyy4+T8Y
         B3xjMatFUV2QIU08l+o3MvrgYH+flvT/QaEPAO5dRsRxgyB50Wdzfa9WkRvVt0KETz0P
         bWCagyeR4XvSfTsy7IDMcOW++H0/nCOWLlM9R5/0l/mNJHkJkf6J0pZrx3gPjTHFs0yl
         tIC+DgIB3S/s9bboivuLJFlCTAZfyUJ3YEwnYqQR9DHwCLNezrbFUC6byqIqwqmXvu0h
         3o0w==
X-Gm-Message-State: AOAM5334XCzbSlBWVWrjFkcGVRRDvcvFdee7UnpCV2YpAun+I5yPdTi/
        1MFwYQYmrTjWet8tlm1FImLTma0Plx+Sxi0+c3MqW+iqeZf8VQKst/fDyMUY+Ugamca18Dru/x1
        +S6tqyf0F9FvfaAIbtEXxQseV2AJ0wLhteemdyTE=
X-Received: by 2002:a17:906:9750:: with SMTP id o16mr153936ejy.766.1644946947402;
        Tue, 15 Feb 2022 09:42:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLI/tC+CkdcaVGl9luIU4vkop2V0YQT2cTA8hb6YgaHTY7Nk9gE95CNESjuz9heDNDC0+BVg==
X-Received: by 2002:a17:906:9750:: with SMTP id o16mr153918ejy.766.1644946947238;
        Tue, 15 Feb 2022 09:42:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id q8sm240797edd.10.2022.02.15.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 09:42:26 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] pinctrl: samsung: pull for v5.18
Date:   Tue, 15 Feb 2022 18:42:20 +0100
Message-Id: <20220215174220.11054-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Parts of this pull was shared with ARM SoC guys (tags/samsung-dt-pinctrl-5.18):
https://lore.kernel.org/lkml/20220129115352.13274-1-krzysztof.kozlowski@canonical.com/

This pull request is on top of it, in a fast-forward way, no rebases.

You can pull this one alone, or tags/samsung-dt-pinctrl-5.18 +
tags/samsung-pinctrl-5.18-2 together.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.18-2

for you to fetch changes up to 3652dc070bad335d6feb31402bb4ab1ad58d5cb6:

  pinctrl: samsung: improve wake irq info on console (2022-02-01 09:13:30 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v5.18

1. Fix OF reference leak in pinctrl driver probe error path.
2. Correct list of handlers for Exynos850 ALIVE and CMGP pin banks.
3. Accept devicetrees with GPIO pin bank definitions named with a
   "-gpio-bank" suffix.  This is necessary for later Samsung pinctrl
   bindings dtschema.
4. Convert Samsung pinctrl bindings to dtschema.
5. Add support for Exynos850 and ExynosAutov9 wake-up interrupts.
6. Add support for Tesla FSD SoC.

----------------------------------------------------------------
Alim Akhtar (2):
      dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
      pinctrl: samsung: add FSD SoC specific data

Krzysztof Kozlowski (5):
      pinctrl: samsung: drop pin banks references on error paths
      pinctrl: samsung: accept GPIO bank nodes with a suffix
      dt-bindings: pinctrl: samsung: convert to dtschema
      dt-bindings: pinctrl: samsung: describe Exynos850 and ExynosAutov9 wake-ups
      pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups

Martin Jücker (1):
      pinctrl: samsung: improve wake irq info on console

Sam Protsenko (1):
      pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios

 .../pinctrl/samsung,pinctrl-gpio-bank.yaml         |  52 +++
 .../bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml |  81 +++++
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  | 106 ++++++
 .../bindings/pinctrl/samsung,pinctrl.yaml          | 393 +++++++++++++++++++++
 .../bindings/pinctrl/samsung-pinctrl.txt           | 383 --------------------
 MAINTAINERS                                        |   2 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  73 +++-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   7 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  89 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 10 files changed, 781 insertions(+), 406 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
