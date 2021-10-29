Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AF64404DD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 23:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhJ2VY2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 17:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhJ2VY2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 17:24:28 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D7EC061570;
        Fri, 29 Oct 2021 14:21:59 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id h20so10650257qko.13;
        Fri, 29 Oct 2021 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7yVckty5p/EV21n48/dXnRFMYmZ7LcCmfku0IFTskI=;
        b=Cp2KN2hQspepxD6g73KMAa1hNtZ4RvSsejofN9KHU4EYlgGu0h+Y0GnFgqm/maiTfK
         jloy1qbf/iMYC3LZ7gw36Mfx4v9vOYKSVdkba86MNXZI8c3QaipFeRcgyn/vpyLA6p+D
         BlUXwJTLpz7I9eJqb3CsgPriHDYNur0WRS3aqhjFKA2bZuWsI4S7S7tMDek9VudTnAb6
         zcQG0mA5Ki6U+Z1VBQyHeC9Hs5Az1TTXJ7/8Mntq5sTvy38TFxgu30/pv9ki3fy8iKkj
         LNRfb4lQ7gTSXT0LEiK/zVeXrPnfjiHbPXOgm2n794kVYqFrylb0R0ktYf7cV6RAGfSu
         kuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=z7yVckty5p/EV21n48/dXnRFMYmZ7LcCmfku0IFTskI=;
        b=XcAAamL6+BUc+jlDGjqVp6m2hYR/iudrkrAh+wZivCRBC3NavwBx/3bZMNpOdDQQJt
         X1besgXyRkde/0bxGbsitYjWH6MIOPrayRtF9XTM71xNJ8lrMUxZ1SjxL7Sk937850+V
         KwJiXr1vW6zoMRlCpWsN0f4BD7VoScvEgVP99g82tfbnjRTKaOIPgMOE8l9nch0ohGHf
         KXRZGiHLt6sb0F3rxGZyzBFLdgBmfIwJebSRSPW9MaylZr4OGw5GxjqidMp95SF5E77Q
         8ySw4fo6wpB8WsERe3rNCOqsYpqLsLj8ufz7P1QH+FOo1+VX76wYwJi7/j8Rq18pmdN1
         Zd2w==
X-Gm-Message-State: AOAM533MAjsnb44wjtXrTxu7+rNdTgu84+sRuICV2CgZoDzJwspLmYm/
        OK1i3S5oAEGmnQHitnB6VTU+fq758OEKUfdGa4Q=
X-Google-Smtp-Source: ABdhPJwUx7gsoBynRrmACjiin57ysUdf42t0pD6NQ8LlVg+NSZQ9NFn3u8wksgMPHSZ9aTQWCPx2mQ==
X-Received: by 2002:a05:620a:2a04:: with SMTP id o4mr11583582qkp.330.1635542518409;
        Fri, 29 Oct 2021 14:21:58 -0700 (PDT)
Received: from ubuntu-mate-laptop.eecs.ucf.edu ([132.170.15.255])
        by smtp.gmail.com with ESMTPSA id u6sm1264258qtc.86.2021.10.29.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 14:21:58 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     andrew@aj.id.au, linus.walleij@linaro.org, joel@jms.id.au
Cc:     linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, fazilyildiran@gmail.com
Subject: [PATCH] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON for PINCTRL_ASPEED
Date:   Fri, 29 Oct 2021 17:21:57 -0400
Message-Id: <20211029212157.14230-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When PINCTRL_ASPEED_G* is selected,
and MFD_SYSCON is not selected,
Kbuild gives the following warnings:

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_SYSCON [=n]
  Selected by [y]:
  - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 [=n] || COMPILE_TEST [=y]) && OF [=y]

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_S>
  Selected by [y]:
  - PINCTRL_ASPEED_G5 [=y] && PINCTRL [=y] && (MACH_ASPEED_G5 [=n] || COMPILE_TEST [=y]) && O>

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_S>
  Selected by [y]:
  - PINCTRL_ASPEED_G6 [=y] && PINCTRL [=y] && (MACH_ASPEED_G6 [=n] || COMPILE_TEST [=y]) && O>

This is because PINCTRL_ASPEED_G* selects PINCTRL_ASPEED,
without selecting or depending on MFD_SYSCON, despite
PINCTRL_ASPEED depending on MFD_SYSCON.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/aspeed/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
index de8b185c4fee..b0bae6144fc2 100644
--- a/drivers/pinctrl/aspeed/Kconfig
+++ b/drivers/pinctrl/aspeed/Kconfig
@@ -11,6 +11,7 @@ config PINCTRL_ASPEED
 config PINCTRL_ASPEED_G4
 	bool "Aspeed G4 SoC pin control"
 	depends on (MACH_ASPEED_G4 || COMPILE_TEST) && OF
+	depends on MFD_SYSCON
 	select PINCTRL_ASPEED
 	help
 	  Say Y here to enable pin controller support for Aspeed's 4th
@@ -19,6 +20,7 @@ config PINCTRL_ASPEED_G4
 config PINCTRL_ASPEED_G5
 	bool "Aspeed G5 SoC pin control"
 	depends on (MACH_ASPEED_G5 || COMPILE_TEST) && OF
+	depends on MFD_SYSCON
 	select PINCTRL_ASPEED
 	help
 	  Say Y here to enable pin controller support for Aspeed's 5th
@@ -27,6 +29,7 @@ config PINCTRL_ASPEED_G5
 config PINCTRL_ASPEED_G6
 	bool "Aspeed G6 SoC pin control"
 	depends on (MACH_ASPEED_G6 || COMPILE_TEST) && OF
+	depends on MFD_SYSCON
 	select PINCTRL_ASPEED
 	help
 	  Say Y here to enable pin controller support for Aspeed's 6th
-- 
2.30.2

