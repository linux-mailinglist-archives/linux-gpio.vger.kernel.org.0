Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961B23DFAA8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 06:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhHDEkw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 00:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhHDEkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 00:40:51 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305A7C061799
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 21:40:38 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so1837575pjh.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 21:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
        b=C6y5SxeHxcQPbiYJNEuZUOdXAMN0f3Xc8xH9Ygbn/hNDSn14ghCz0sGQpITHos0BQa
         JrE3C1CglA2pwcaHfx7/EB6VvB87KaT0YahU+WcFsOJAhonOJmDG0QEomSkc79ULEe47
         N4E2PLpRaZTHaXuiPsG2pcdkhjy2EjYudYnaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
        b=js2VP6+vK6wWRnzVHxcTmhz0AAEkS8LBQI5Iixd9INeg9iiJ5dY0HTTq/WPVDoJerr
         wrCL7Lxxlgi7Dx6f/gqon2FZW8i5aCffjlSgrLs9ANsPACXN/cNLAZ5hkKE+Q/YTFsQG
         dhksiN49RvuZtv7hFztyza2xvxjh/1I6qKtmNuvY4RTf/z8nk8bhrC7nJeGs0L4fH3QD
         xy8WW6OZJL8A2NopOKQD83Mjp7MW2WaVZiwIW+sBevojB3s3pdH+0gefvoR6E7KG/ejB
         ApO2o3UJ6oCeWOTlG07mfd92d0geWXSMH4CfQzowI/TiKyAHsl09IfhZQ8L9ihAaCLTC
         YEcQ==
X-Gm-Message-State: AOAM5337v60WuThMz/qOmCh98yI0Vum8wHqFx4Txq3uwQM1WU68KAymh
        MKyj7vOXSj8Upp7DhKh3epGC3w==
X-Google-Smtp-Source: ABdhPJwRCZNNwOft/vBDSjHy8F7s60+dQbATz9EE8dK0AkmsFjq5q4WBV9dh1tP917W4u9TI2KWUaA==
X-Received: by 2002:a05:6a00:a18:b029:382:e172:653e with SMTP id p24-20020a056a000a18b0290382e172653emr25615508pfh.19.1628052037658;
        Tue, 03 Aug 2021 21:40:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:6fea:f7c3:8233:dc51])
        by smtp.gmail.com with ESMTPSA id t9sm1075355pgc.81.2021.08.03.21.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 21:40:37 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to include/dt-bindings/pinctrl
Date:   Wed,  4 Aug 2021 12:40:31 +0800
Message-Id: <20210804044033.3047296-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move mt8135-pinfunc.h into include/dt-bindings/pinctrl so that we can
include it in yaml examples.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm/boot/dts/mt8135.dtsi                                   | 2 +-
 .../boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {arch/arm/boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 0e4e835026db0..a031b36363187 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -9,7 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/mt8135-resets.h>
-#include "mt8135-pinfunc.h"
+#include <dt-bindings/pinctrl/mt8135-pinfunc.h>
 
 / {
 	#address-cells = <2>;
diff --git a/arch/arm/boot/dts/mt8135-pinfunc.h b/include/dt-bindings/pinctrl/mt8135-pinfunc.h
similarity index 100%
rename from arch/arm/boot/dts/mt8135-pinfunc.h
rename to include/dt-bindings/pinctrl/mt8135-pinfunc.h
-- 
2.32.0.554.ge1b32706d8-goog

