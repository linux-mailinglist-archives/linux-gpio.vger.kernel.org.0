Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE3034C197
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 04:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhC2CAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 22:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbhC2B7y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 21:59:54 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9500C0613B3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:54 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id l76so8438596pga.6
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hFDDuuLCKMVUPK4LrKSbpDVOykG8ODUpVOe4CV5ias0=;
        b=xKlytlsBzwGNAFwU1VhNkhjcwEyCmNQIczCp06u/q0KfQvgaZZuEhz3WOEDFHmETZ6
         rBE/162JqmYTWIthPZTVvFwj/m1RFqtfRGP8IKYTIh1yeGtYIFYUx7vHvNUqC1SsRj9z
         5Mw0CDoa8E4TceroBJh/bEHhN03w06O1s4cZY3mWw+oUFE2FUe7WFw9PUmKVRDXW5nJ9
         eXwWMFVNAyrVEQoqMjzpFp+AD84fMz+MhqQwF2ODOP9JeLnhSO8jv4IAhaCVSz/XV4jE
         SLNVg9l2ShQKdRudkdiF3xQZxu5qOFy5IDoCq2U2Ij5S22mjJZmR1PYJK0B4VgH/u5Fw
         /Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hFDDuuLCKMVUPK4LrKSbpDVOykG8ODUpVOe4CV5ias0=;
        b=EF93zHjgtmjL6344uHA1v/UPVXG5e6efovcovNgqwiie0tvFF7rlMe/4gj6VR/FZzu
         EepN5XOCZhKvUgenxgCb/T0MEOQ3GafLZI34RN2JDQmtA9XGHpjMUEsxFBysENTZ9R18
         0o2lOM+5ntTwj+urBrCWe6Xt8LvRDjS5IjH5xoaoQbL+q4Fhkel0/juPDgsp2UN4zJH+
         E8PrBXbYRRU/I/6/o2FOfemVN0HodlA8oqVxHsjkN+Ac4S7hCQIbTInRE1eXZCIdujoD
         tpJFpWcyu/aXnQrgccxoq090LUkFCAndxFlzgPWMax1j3SZnlZlAVMdp2dN4dMoSF5OB
         mLjg==
X-Gm-Message-State: AOAM533WOtBzB8eyRM8IWHw+hD6LIKWCc9PRIz1xh0zurNuqr2ij0eah
        AkJiMa4EaxhO0aDiBEZnFx/ANg==
X-Google-Smtp-Source: ABdhPJwej5FvA3qbg7diAr+YwUP02ukL5pGxFmtmHovYsBxZ5iVBfQwJDwqkiski1VTrQ0GBw0n7Hg==
X-Received: by 2002:a62:7782:0:b029:1f5:b56f:525e with SMTP id s124-20020a6277820000b02901f5b56f525emr23413452pfc.20.1616983194208;
        Sun, 28 Mar 2021 18:59:54 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id w37sm14728027pgl.13.2021.03.28.18.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 18:59:53 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] arm64: Add config for Pensando SoC platforms
Date:   Sun, 28 Mar 2021 18:59:31 -0700
Message-Id: <20210329015938.20316-7-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329015938.20316-1-brad@pensando.io>
References: <20210329015938.20316-1-brad@pensando.io>
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

