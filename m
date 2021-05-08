Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CE53771D9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 14:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhEHMjH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 08:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbhEHMjD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 08:39:03 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFBEC061760;
        Sat,  8 May 2021 05:38:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id f24so17661263ejc.6;
        Sat, 08 May 2021 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kKYG8ob0N102i49XdsyoJlNpypHz4XdicUmmY8YrBm8=;
        b=SZXbeqJYH4Rvw5YTLCZ684jtQQ9XkKWV/PLa+f2/6q2APp41GjQCtU3xBrw1ONDjBh
         +WUQ0y5zObLWZw71SxP3ozGubUgdZGZAmv+TmkhSCwz8BOJgSwjqhNrJRh9dCsa+Lcxa
         +hfpja3I70Ti5RclTugVGp2qQ5YsyQB9XnGBvrDCsfap8smU3vpT0NnzjIjRqBYouuDt
         uHBr5UxpxvQfOTL7hXJvOAPJlM7EHxYTZppq16qbRG17cIJHiIy2OGZruKMcymObgMet
         YAKP7QLlKb9IlPyx3yQg2Z03PQqCGVKYEyeTwQkiYws/7lYLPYbKnfIz0DpChvqPJDWP
         vatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kKYG8ob0N102i49XdsyoJlNpypHz4XdicUmmY8YrBm8=;
        b=fD/B4Q7Nsu7FVVmiWO6w0xtBk7t7UwBIv1NOCae7IvexAPnBahxzNBlOyZk4KKtXjG
         BLHl0HNY6iIpPza6dbDPZSzYNvS5Pd/B/2VpTPEtAJ33FDs1xgI6xrv3vYebpQ6Objtr
         9xLkRchxcPfmmPs6lbtaaDKGY8lPk/KarfZqWWGDiVKZY7Pi39mEAv2Lroy3UE7Bz/4Z
         U6Z/yAzNflczZhAe8K2nErtiZ5Bm0YEwWfIrNZnKV/qOFQQFJmSB42cknVvg+OGrlzZ1
         BiVN7QkXtH/GfZZ4zroPfH72GzzufHw7IudSLaUMktv4z7TP9Q6FEa7LVV+725t35Cnp
         fCIQ==
X-Gm-Message-State: AOAM533c/+kqnq35fuBK/kJsQpo3ObABwPmRRdddgqzYObZ0wdN3wtsX
        KJqZ9dvYtBushVbZBIg1Lv4=
X-Google-Smtp-Source: ABdhPJyribyIKpHanX97X8mGzuRPy4EQuIN3hdClvLQ3RrA1Um+6A/V8iGIVuTzkj9mNHnvOipR5RQ==
X-Received: by 2002:a17:906:a103:: with SMTP id t3mr15664038ejy.334.1620477480152;
        Sat, 08 May 2021 05:38:00 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q25sm6262618edt.51.2021.05.08.05.37.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 05:37:59 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: rename grf-gpio nodename in rk3328.dtsi
Date:   Sat,  8 May 2021 14:37:43 +0200
Message-Id: <20210508123743.18128-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210508123743.18128-1-jbx6244@gmail.com>
References: <20210508123743.18128-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A test with the command below gives this error:

/arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml: syscon@ff100000:
grf-gpio: {'compatible': ['rockchip,rk3328-grf-gpio'],
'gpio-controller': True, '#gpio-cells': [[2]], 'phandle': [[68]]} is not
of type 'array'
From schema:
~/.local/lib/python3.5/site-packages/dtschema/schemas/gpio/gpio-consumer.yaml

Due to the regex "(?<!,nr)-gpios?$" anything that ends on
'-gpio', '-gpios' gives a match.

Rename 'grf-gpio' nodename to generic 'gpio'

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=~/.local/lib/python3.5/site-packages/dtschema/
schemas/gpio/gpio-consumer.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 4ce49aae7..2e458fb87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -291,7 +291,7 @@
 			status = "disabled";
 		};
 
-		grf_gpio: grf-gpio {
+		grf_gpio: gpio {
 			compatible = "rockchip,rk3328-grf-gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.11.0

