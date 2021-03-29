Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B2C34C1B5
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 04:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhC2CAR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 22:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbhC2CAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 22:00:03 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B89C0613B1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 19:00:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id g10so3661943plt.8
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 19:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wXmpX1Ba7zilYfDg6F+tuPGtDeVeYI/YYDUBGdsu7tk=;
        b=AxRGEDFyw/UtTuPO5DVJUZJe4AEJ0El99ECXhiG8HGGJOCiObbxXdzUtPaaMwrV9/Q
         DolwwYdicOco7JpQNIkAYVO94NuH18DIAeb6g1gLzZJCo1vHv+57tNtTAMY3cA0+Mn6t
         hstCX+2gx8/aW+3c3l6297BAGnTTxKEsPTr1ur1gm69T1kicmQrbUHCSRjg/kblNG50b
         /TfghkHYG2E4/EqUUuxjW5moyIRbdHmtJ2SyJSOSR1XGPsNdnYXpkDC6FXom704pGPrv
         WLKKuytpa4ex5XldX0/Q+gYUMsJYHdhRyxYYkKYtY1zreVTLN8WucwgunzPfnB0znz7c
         QaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wXmpX1Ba7zilYfDg6F+tuPGtDeVeYI/YYDUBGdsu7tk=;
        b=qdBSIRy4xfw1TOP5VDMhLz09N6DBBnKIEVLq0I65X7NHB0ydr8pKB4lUJNRo98tj0D
         y/9ZFrWQ2KAWmG+rZFawJ9oIobV0ydsa5v5Z/9umSPVsSInrbC0av8zsXJ1feuYMKWU2
         YKmckYZ4YJxQPhAXz2yayRb9PfEHYxFydbtWdUDWm5Ft5oFcphMrOPCKDye2uBv2eZWW
         8wqoUH8L2hWG1dFFh4buhRnryXwHG4m+3yLnPFSB669kyGY1nPtY5atFFMsFUkw11GWm
         tmhJApEr2n5qNOdYGbBjjKzRmNQtDIGltXvzMkxEgKFZM9OFLqSQvFzppqeIj1s+ZZm0
         mPgA==
X-Gm-Message-State: AOAM532GCs2ys7A3TKC7TAPTgoh1EUmNw8/8P8B21w26uFKGlWu7UWW3
        6DtkUTScBjjW6E0s37vnB1GTtQ==
X-Google-Smtp-Source: ABdhPJwsqAXpJ1UUfDcfY9udZQbv53YVF+GAQNvtzSr2Pfm6MH2KKQ3MejypxRUKBNNz0r3tKYdctg==
X-Received: by 2002:a17:902:442:b029:e7:1dfd:421a with SMTP id 60-20020a1709020442b02900e71dfd421amr15134386ple.7.1616983202837;
        Sun, 28 Mar 2021 19:00:02 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id w37sm14728027pgl.13.2021.03.28.19.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 19:00:02 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] MAINTAINERS: Add entry for PENSANDO
Date:   Sun, 28 Mar 2021 18:59:37 -0700
Message-Id: <20210329015938.20316-13-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329015938.20316-1-brad@pensando.io>
References: <20210329015938.20316-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add entry for PENSANDO maintainer and files

Signed-off-by: Brad Larson <brad@pensando.io>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb2a3633b719..272c7a7fde75 100644
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

