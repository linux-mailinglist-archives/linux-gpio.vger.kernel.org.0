Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF39C32CB12
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 04:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbhCDDok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 22:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbhCDDoY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 22:44:24 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1474C061793
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 19:42:32 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o10so18008021pgg.4
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 19:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hFDDuuLCKMVUPK4LrKSbpDVOykG8ODUpVOe4CV5ias0=;
        b=1opUXAsn2Kt8qlhlTkZuka8cdGg9pcFuMg87cVSygAl2xQ5X0EAshUWlvWYCdUXMp5
         AWhfN/NOGbE+AQh5ijSGOHHg3jjyH0fd4VMghuOm4V7uABp0spgfMvnIDwKRUAX869G/
         W56G2VbCRO4OEYFtODPVNbJjZh6mwMdU0ouuqzzVtGYppmVCCfeGoIO6RsLHVQHkLkNK
         1ZxI+fVL/wfF2uDsCHOF+HI/Pmd+UC/fXWbqWyKw/AcAenGrPGOFQ9s1JRoC3rGsGD9/
         Rok3iMUTJpkyj69iIt3abyN9gQAvOf7PIDT2Ax8l10B9yQWwO1UJZxh67pP+3qHp+l+d
         kX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hFDDuuLCKMVUPK4LrKSbpDVOykG8ODUpVOe4CV5ias0=;
        b=EyS+uJVIbx9y9yl2fbIoyOZiEaVwVxBUpkcI8+xgygbyLxKMLz/0YeYTtnFgzYaNSF
         giRri5cexOmX5I9iKuW815bVIloNa3HTIiz3Ap/pp0cI7brNdO4+O4shZrPFhWVUNJIz
         9dD8xIXSyb3GLI78uRJ1piithMZNEfTYGeArWfgHtg7fZlG1sw9XoqUJ4cl3/6102EqE
         5p5t9Me8IuYTlCWWdivCBQmTLXZi/BqXAQe8Z5KTFoFMQLfeD6oe+OoJPIIw15/utXkW
         a2BCTiazckhoKOtdM9VPpTpK4qz6rfSYQnOe1ip7rRV2XQgRrigZxW4OwNBKU+FAZiMJ
         uTKA==
X-Gm-Message-State: AOAM5339626ZLQB5lkOD2oasXetNp+n0FQNqHohRvVn9YXNilrPMWdtj
        AMXGHiE3KC2zI0EUAHhF8GmT+A==
X-Google-Smtp-Source: ABdhPJzLtFoQNkM8z+nPvDTwYRktUQTeKXYN+F/VF6vpP4GvYQVlLQkPZGGit0J8TlMHm+yaO6XMow==
X-Received: by 2002:aa7:8c0f:0:b029:1ed:4d05:218c with SMTP id c15-20020aa78c0f0000b02901ed4d05218cmr2256407pfd.21.1614829352253;
        Wed, 03 Mar 2021 19:42:32 -0800 (PST)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id h17sm2403989pfc.211.2021.03.03.19.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 19:42:31 -0800 (PST)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] arm64: Add config for Pensando SoC platforms
Date:   Wed,  3 Mar 2021 19:41:39 -0800
Message-Id: <20210304034141.7062-7-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304034141.7062-1-brad@pensando.io>
References: <20210304034141.7062-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add ARCH_PENSANDO configuration option for Pensando SoC
based platforms.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 arch/arm64/Kconfig.platforms | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cdfd5fed457f..803e7cf1df55 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -210,6 +210,11 @@ config ARCH_MXC
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
 
+config ARCH_PENSANDO
+	bool "Pensando Platforms"
+	help
+	  This enables support for the ARMv8 based Pensando chipsets
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.17.1

