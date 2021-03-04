Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0FC32CB0D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 04:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhCDDoi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 22:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhCDDoO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 22:44:14 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90DDC0613A7
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 19:42:35 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id u11so15329160plg.13
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 19:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9Zk1ArnKgiQng2MWBVvqO/05T1WJkKR0dBPbHxZP+Xc=;
        b=WCI7rfGobOQo7ZIRzOvOR8E6h4m8BYK0/i2nOSBcXEiOL+UHoQjYcgaOqgrziZEXnu
         AUmIGYvHDDpMWD7ThHSCaT643Ylq/G3hx4fR3zsPHCRTihQ0JcxB2UMyDpWvRiPZCOEq
         3Px52NRCItEH/LPP8x6f98azKYLL0kHP4sJy0UcXyXA4vxmvawFSM1kOBfB0oE/G7J1s
         imANFYLtJI7tmoub7Or1RTo1f09mjHtXdq3gdqfOH32zcsPcuCu8C6zmqe69JMJqRA9K
         BfeOiF6xdiUD8j/nCWQsLxe42qy/PCevHlSYhNq8R6stq5OPHAKrkcjo3A2PE2f8KsnH
         GYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9Zk1ArnKgiQng2MWBVvqO/05T1WJkKR0dBPbHxZP+Xc=;
        b=UJheC8JRIy26wzOUFsmkek5zLwm0t3K0Up9xpt9p6y+/5mgKhit2XYAiNnnT77iUTB
         pXP0aUeP+Csc4gUycBAY+kzTsP0kAv8NAl5IIptF+si64kRuHHG3d1Ois9Bht3sgZUPc
         nNRj8qbu5p3kqgUMGVD7X3doSkG94tCvVEvcKNrLLziRP5bALCbGwBrl/2bHE+wbfimk
         ZpBxSjEUchzVkoOebtve+1RBwBJy2ZNVYcEHxHw0HFtm0b4idKLn/v0CRqYeMWdv6Se6
         PibokjrXDQChDjWIMo+hSs9KYR1g2tdTxEyx1EWi7mkpFwdquD+N/KL32l6Q3oLpTlCz
         m3LQ==
X-Gm-Message-State: AOAM532b0Nj3jlpBM/he+vXkVpo1OIiWORVKHIPIwNR3th4OloCGXfpT
        iO2Kx3Z+HLGiytf7LA7LH5kpt9/QSXmupchp
X-Google-Smtp-Source: ABdhPJzsnDrq+NKB04Vh8VktiH3DxPrBoZQLqc5w7qlpjTTBX7YkMv4Q9TC2pA6f066JihQfHzhZhg==
X-Received: by 2002:a17:902:c789:b029:e3:dcbd:843b with SMTP id w9-20020a170902c789b02900e3dcbd843bmr2062178pla.61.1614829355389;
        Wed, 03 Mar 2021 19:42:35 -0800 (PST)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id h17sm2403989pfc.211.2021.03.03.19.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 19:42:35 -0800 (PST)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] MAINTAINERS: Add entry for PENSANDO
Date:   Wed,  3 Mar 2021 19:41:41 -0800
Message-Id: <20210304034141.7062-9-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304034141.7062-1-brad@pensando.io>
References: <20210304034141.7062-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add entry for PENSANDO maintainer and files.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 973a937386fa..3f2eebda2396 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2246,6 +2246,15 @@ S:	Maintained
 W:	http://hackndev.com
 F:	arch/arm/mach-pxa/palmz72.*
 
+ARM/PENSANDO SUPPORT
+M:	Brad Larson <brad@pensando.io>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/pensando*
+F:	arch/arm64/boot/dts/pensando/
+F:	drivers/gpio/gpio-elba-spics.c
+F:	drivers/mmc/host/sdhci-cadence-elba.c
+
 ARM/PLEB SUPPORT
 M:	Peter Chubb <pleb@gelato.unsw.edu.au>
 S:	Maintained
-- 
2.17.1

