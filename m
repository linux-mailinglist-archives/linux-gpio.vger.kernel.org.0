Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303F3379EF2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 07:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhEKFGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 01:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhEKFGe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 01:06:34 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A00C06138B;
        Mon, 10 May 2021 22:05:27 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n2so27819055ejy.7;
        Mon, 10 May 2021 22:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lihGSNM/MK5Li+Q6R5o1M4YyP4+yQiLVtLIt/qjFJZU=;
        b=t+wjXYVkgy53FjomWEutEsYXEoEkI9FXdfvx0ULt2+dz9sIFUCdVAspGI7VJmeW55E
         miJQrZQ6RaxwEyTDyMDWs45trO7FgbUMOnT3VWzasBQ+dChbeakr0SCkZcOjqB3RCmP6
         ZXYeihewUuyzfPTHtWXmlEg6wyqME+L4zbMm4pHNoEuU9boLdUlIlAav6kGRK9Nz5iY+
         YU0h4k/GUY5mqSH8HO+7C7qM/DY2ZUsfanArUoO9GkKAskTj2oUYZsYloZB9yg1W9hgb
         e3uLuRi6gJTtJ7YVjMg6CKRxHpJqNHujr0P4sVB7KfJTgDR1zZzO8+pO0jA4kcOf2BMo
         iEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lihGSNM/MK5Li+Q6R5o1M4YyP4+yQiLVtLIt/qjFJZU=;
        b=iL38LUtrP7ytvcl+KEihTCsGFM/BxMJlUTEoEJXlgGBIBQyONFo3cqq0h01kKzgpaK
         CJDQNKFikPMekIjHO65K3c2RcHraz9e+rxbPtwlx10Lpm7dx4Eu/GtycFBiV9Cx/ZSHx
         sPWcpRKdubvZ0lgufGsvzOoM3RZTBpqNW6eU/ID0JtZxE5kQunmLsNTjeDyzSFrpr1D1
         YKbX9fsrw22NeqOhidoE3j2h8ESiiAEwtrlO3clqhbz/nnRWowP4rp5inuiUFCFT70et
         yyvs00Q86Ec9ekvJYVAo7+XluRqIJ4wkYb5qd0gfvlDgL9RnvUtxARIqhCtvriiFsJgN
         wc3Q==
X-Gm-Message-State: AOAM532ehWqV/nu1r9ziz6rATGVsVhoZ0Uf85Nlp5OJxYSa+ZQKHVC55
        C0dl5N3jxpoJLGSbTGn8KvE=
X-Google-Smtp-Source: ABdhPJzqM9YNrmuN9wdPMgmg05Ls16o6Joxm6uMV+4TpB0/t0g1jYcoArddpzJDRXkbEW2waGMreww==
X-Received: by 2002:a17:906:9141:: with SMTP id y1mr30782293ejw.111.1620709526044;
        Mon, 10 May 2021 22:05:26 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g24sm3620302eds.41.2021.05.10.22.05.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 22:05:25 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] ARM: dts: rockchip: add grf register compatible for rk3066/rk3188
Date:   Tue, 11 May 2021 07:05:10 +0200
Message-Id: <20210511050511.5973-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210511050511.5973-1-jbx6244@gmail.com>
References: <20210511050511.5973-1-jbx6244@gmail.com>
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

