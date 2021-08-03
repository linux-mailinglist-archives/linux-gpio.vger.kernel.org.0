Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB053DE60B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 07:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhHCFNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 01:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbhHCFNo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 01:13:44 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E08C06179A
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 22:13:34 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id e21so22286038pla.5
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 22:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
        b=UTBe3IQVAlVhEdWXsxUvzz2ICfA2z/fzXCB4Q5r+4bdnmj6mJoVLFsQE2GZqliTgUA
         6raQ3ESffrnA6PFRdfN9nUwhzoiQlNbnvPQiGYKlHIzsoIpQEPi75Jq8wDIYDUI9+cBk
         ZSD5pN7WfoHn2au99FIOdL6aoYbAxI8arJ3dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
        b=D/14fNYam5YBx3J+wfYVo5hjWoOtCkC/vwBSCy1ZM8Uss6mRqVN4u8zpCPrYXQ0tsp
         3MbqzRFWb4WC5tDPmUUBS/kdWyMsT63wZjdM50A4FVs7hsiDTB2FZLYsG0eIl2/VCHu8
         XeItju+fXqu7JQBXhXs99gAVgkS/mU0crOvTLp3jC1gfqWXtHJc/aETG/ce4Ei/izK6F
         zw0t44evbrEdtJObUZcEGfcxGrTSbMJ+jc4DqHmgbt9HL8d8umg9ZLK01V8SJdVcqTUW
         dGVFb0mLnN4htAmS0jkhrV71jhkgVXjUySoDvvgEJwyonEbkueSthyFXY/j1vWvGANXE
         2drw==
X-Gm-Message-State: AOAM533Fzn0Ul15loWy6MJq8a4XEKGN2AyMDDO94z7vSvD0N6M4pGZSZ
        jRElsXRrg4i6DSRPipng3NNqoQ==
X-Google-Smtp-Source: ABdhPJzQt8TWRZsHH1uJM4CJVQw+lKk4RiXB/VDw+tt52D8vL7+IRXvqOexSWAwzK6UWFlXEaBzIUg==
X-Received: by 2002:a63:4e51:: with SMTP id o17mr949944pgl.126.1627967613386;
        Mon, 02 Aug 2021 22:13:33 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:c800:1b1d:5677:31a7])
        by smtp.gmail.com with ESMTPSA id x25sm115732pfq.28.2021.08.02.22.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 22:13:33 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm: dts: mt8183: Move pinfunc to include/dt-bindings/pinctrl
Date:   Tue,  3 Aug 2021 13:13:17 +0800
Message-Id: <20210803051318.2570994-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210803051318.2570994-1-hsinyi@chromium.org>
References: <20210803051318.2570994-1-hsinyi@chromium.org>
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

