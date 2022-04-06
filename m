Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314344F6ECC
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 01:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237987AbiDFXj0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 19:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbiDFXjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:39:20 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724D01FF42A
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 16:37:17 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id o10so3352134ple.7
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MgwUzux9l9MfjkfiPyLThjf7TEJ7a+1kv720LXWdL0c=;
        b=h3rzaO/ehbfZ3kl2FGqKxW6CKni734T3jpG3x+dhqbWIx0ekxvMJytn06tsYtavlKS
         p7odvwy7v3WOQFdQ+vTa6dwdAxbRBySInSfsw4+BBw6Xok7WEWgHy7uuYd4mkVKhJI3A
         QYge0VgdY5Ua0NStPSbitgP35D1VdCR1LWosIfyACxiSrcYRr/4TBTjBGpFXZNF7PHAN
         ZgDm6vBGthjIXGD7vnJZhMg1USt7k6pniK5j4hENo9d8uyBLlAVJiXOlkyUrAH4dVzGw
         qST0RXzc1ZnJqNsu9iRuwPVHItUL0EN323XjyJzmygDPKZZuVOZjk7ULU1eLwL71oShJ
         iOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MgwUzux9l9MfjkfiPyLThjf7TEJ7a+1kv720LXWdL0c=;
        b=wVmL4J1o6htCzLQekSw5WMXGtF0r88Ymimm1RvQP7/iBKHjUNEALkwth/wkHm1K/nB
         R6RNeRsytb5CrMn8S3FAf0zdzl3cx9bUN4mAYck8MkUCoaI8m/IwMNTj0b93Gy7qKw7I
         WRpux+YRgTQ5MG5y2ZSP0S/CalLaCljUuK4vSEGukkePPXF0Op0qN8f3U+aIsThvfbSq
         kjWoO/HPwtPvZVmbFA80X1+7pVZ9sPJNvy1qSmymHQdpDlOnDwY48AwjaST/Z9ixFsar
         +hVjtg4vk/iDKgcscCL+o1rA7t3tcX2D7CJ8HrJS3JinxkRXqBr5gZ1NB9HKMHWPkgpA
         axgA==
X-Gm-Message-State: AOAM5306k3BpcefB1PMYaet+YLuq8njSTuRNfhwRZCZ6XF3Rbjp8tBDB
        OJHV374Ar4eKGExWcjkxCNZ5xg==
X-Google-Smtp-Source: ABdhPJzBI/AgQUtI42LRmJQIG6o/7UZtBtE27V6Ss9Y15BjgUkXheWJ0cSmnrjtHxtCg+5UlMXWc5Q==
X-Received: by 2002:a17:90b:1642:b0:1c6:c6d0:fbfa with SMTP id il2-20020a17090b164200b001c6c6d0fbfamr12403634pjb.218.1649288237042;
        Wed, 06 Apr 2022 16:37:17 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090a7f9500b001c97c6bcaf4sm6903667pjl.39.2022.04.06.16.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 16:37:16 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, dac2@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] arm64: Add config for Pensando SoC platforms
Date:   Wed,  6 Apr 2022 16:36:44 -0700
Message-Id: <20220406233648.21644-8-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220406233648.21644-1-brad@pensando.io>
References: <20220406233648.21644-1-brad@pensando.io>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add ARCH_PENSANDO configuration option for Pensando SoC
based platforms.

Signed-off-by: Brad Larson <brad@pensando.io>
---
Change from V3:
- Fix a typo on interface max speed

 arch/arm64/Kconfig.platforms | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 30b123cde02c..e3b5557e1049 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -203,6 +203,18 @@ config ARCH_MXC
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
 
+config ARCH_PENSANDO
+	bool "Pensando Platforms"
+	help
+	  This enables support for the ARMv8 based Pensando SoC
+	  family to include the Elba SoC.
+
+	  Pensando SoCs support a range of Distributed Services
+	  Cards in PCIe format installed into servers.  The Elba
+	  SoC includes 16 A-72 CPU cores, 144 programmable P4
+	  cores for a minimal latency/jitter datapath, and network
+	  interfaces up to 200 Gb/s.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.17.1

