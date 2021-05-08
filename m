Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADED13771D4
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 14:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhEHMjG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 08:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhEHMjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 08:39:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164CBC061574;
        Sat,  8 May 2021 05:38:00 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id s20so12170898ejr.9;
        Sat, 08 May 2021 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lihGSNM/MK5Li+Q6R5o1M4YyP4+yQiLVtLIt/qjFJZU=;
        b=XVc75WjvW/jXr7GuRFMgl/B3ocJjMgjsDoJZ5q+7GftnPXK3j78llifPHua6QuRpZe
         S2JRRUpTf7UQhm+iD/XerHK074jsk29Ml37iabWv3AY3UWKX0LNaidX3uX+9R4vSU0YF
         7lGmHzKVjbcR5N0ohi3qDlGqiKNEEoLzD+pGRxpcQQyOroR7QwF3eEunhT+xThnvwTuW
         wYYCpNxNdQEoY1m26l9R/UEH7qGV3hafQRUe++DY/bowSr6b5m07Xxtk8UjDDqqfO7iv
         Sm5O6DWFcDX66kJZfwqZSNmorCRwvG0CSpXD01STw6PhBVRVY66XWVH2/KsP4jblCE/6
         wbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lihGSNM/MK5Li+Q6R5o1M4YyP4+yQiLVtLIt/qjFJZU=;
        b=Bifxa/I8S2gFQZqbhkaOKhZvf6Mu6bTZKFUOVKHb9BOViXQ+HnNKxms++cw1IFDicU
         L1hgTBcEwLzqwCZDr6JtiTIvCrsiltkkrXXF8dfjsVOIVx2KGU+9T6KhAxacHNSeYGyf
         r63JAu0L5SDUgP0+w9DHYRfcNPiF1rpScJOLWO/+q7p5jwUzNWC7szVAhueBUjqCQR/k
         0OBnuzn4ND6HoqcKDQyBQN9tHtd2p51MWq27N8wqoZTktXmEcfdMJOxo6rKcvmGYYPz0
         sJCusjjXfKRmYrOfh8N/12pFP8jy5EC2R+BvNtSjli9qqbzVdQItZ3QQ+he06yQfybSa
         6WyQ==
X-Gm-Message-State: AOAM530gVVrM5gImSkr3Paz535IQuTWPKacSChxsR+ZNuKdz44h+drgA
        3fWp9lVcrYWpyiU3FYG+UYVeefBuwZNE1A==
X-Google-Smtp-Source: ABdhPJw+I2BXdRO/wZHRFmSoPEASrhK4I2mvvljtsAA/6vDmqlY2s/nB2ChHFF/orhy2YWYGsKCo0w==
X-Received: by 2002:a17:906:cc5d:: with SMTP id mm29mr15327654ejb.362.1620477478844;
        Sat, 08 May 2021 05:37:58 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q25sm6262618edt.51.2021.05.08.05.37.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 05:37:58 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] ARM: dts: rockchip: add grf register compatible for rk3066/rk3188
Date:   Sat,  8 May 2021 14:37:42 +0200
Message-Id: <20210508123743.18128-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210508123743.18128-1-jbx6244@gmail.com>
References: <20210508123743.18128-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With the conversion of syscon.yaml minItems for compatibles
was set to 2. Current Rockchip rk3xxx.dtsi file only uses "syscon"
for the grf registers. Add "rockchip,rk3066-grf", "syscon"
compatible for rk3066/rk3188 to reduce notifications produced with:

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mfd/syscon.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 755c946f1..c34bc59c9 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -256,7 +256,7 @@
 	};
 
 	grf: grf@20008000 {
-		compatible = "syscon";
+		compatible = "rockchip,rk3066-grf", "syscon";
 		reg = <0x20008000 0x200>;
 	};
 
-- 
2.11.0

