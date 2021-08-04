Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7D43DFAAC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 06:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbhHDEky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 00:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhHDEkx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 00:40:53 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A15BC061799
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 21:40:41 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u16so1692352ple.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 21:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
        b=UX/UnOCuyTy3v0EXWLKoH7U8OPmiSc7yDpkVnsooOzcdNs1JtQ8bqMip4c0QiCTz4J
         3d17+yVN+tI+xJuUOin0E6/AhuuqqCwUpcvPim+x/pZ5zGNQHbK3mbWnNOEZGua1IVB3
         hQVtMuMxAv9QD8xQ1hzQWJaNjmNO/QmmwzuqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
        b=dH9pZvNq+fqM/w/wuOf/EDhON5v0lcI5reBb4GLrkxJH4+8QFoRusijHbEp4VOodxS
         OLeu4JQ0ccb0+gtJfs1/+ucbN7nFoLi4i8xckCgtJVFeYkdvJTxj/DKlwpc784zabYms
         Q3IA+7GJNu6crUDdO7mDbRpaIaCEgX5KIv9yKNYvG5eV6aeyOvBtJijInewjwAlXfwOp
         khLsZHZFVZ1gbBN7K9d/qHsTr7a1ICNdX0EtxJejZezT3j2/MG4SYNXATzblztZUjjY6
         5CibJlnS/446Luf21nldeZsQvudl+G1AxyZ76T5DRZXWMHoovcN2yGq9G/s4ODFL9NnR
         Ywlw==
X-Gm-Message-State: AOAM533aTIz8XTpbzR8DlfANQ+VqXrrCyGfkU3g9X/qeM3m0frPazt3B
        uIVAkcA+7SRKtaWdqKv+7efF6g==
X-Google-Smtp-Source: ABdhPJzu19nFqHAGY81WXc9rtIkcm7bpgnmaMZ5pk54JQzeoIfqI2plg+3Fu2VljFyZVRq6bHTRChg==
X-Received: by 2002:a17:90a:e647:: with SMTP id ep7mr7909438pjb.145.1628052040736;
        Tue, 03 Aug 2021 21:40:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:6fea:f7c3:8233:dc51])
        by smtp.gmail.com with ESMTPSA id t9sm1075355pgc.81.2021.08.03.21.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 21:40:40 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] arm: dts: mt8183: Move pinfunc to include/dt-bindings/pinctrl
Date:   Wed,  4 Aug 2021 12:40:32 +0800
Message-Id: <20210804044033.3047296-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210804044033.3047296-1-hsinyi@chromium.org>
References: <20210804044033.3047296-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move mt8183-pinfunc.h into include/dt-bindings/pinctrl so that we can
include it in yaml examples.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                        | 2 +-
 .../mediatek => include/dt-bindings/pinctrl}/mt8183-pinfunc.h   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {arch/arm64/boot/dts/mediatek => include/dt-bindings/pinctrl}/mt8183-pinfunc.h (100%)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c088..1933045da95de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -14,7 +14,7 @@
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
-#include "mt8183-pinfunc.h"
+#include <dt-bindings/pinctrl/mt8183-pinfunc.h>
 
 / {
 	compatible = "mediatek,mt8183";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h b/include/dt-bindings/pinctrl/mt8183-pinfunc.h
similarity index 100%
rename from arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h
rename to include/dt-bindings/pinctrl/mt8183-pinfunc.h
-- 
2.32.0.554.ge1b32706d8-goog

