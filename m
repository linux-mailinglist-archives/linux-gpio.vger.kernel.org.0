Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0304F373C8E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 15:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhEENlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 09:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbhEENlk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 09:41:40 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A5EC06138D;
        Wed,  5 May 2021 06:40:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id zg3so2908005ejb.8;
        Wed, 05 May 2021 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lihGSNM/MK5Li+Q6R5o1M4YyP4+yQiLVtLIt/qjFJZU=;
        b=mEyY35O2TgaSv5n1e1AO9BB17dK4YsG5Oc5NeCy+V1bEp0HejaBNF74DuCIr3JPXHh
         60zWeXixB6jZWofZEeLame1XKoFyz8g5XuBYNtaM8yMAwVsJ+AysdGf/KQJQeOFzYNVR
         6zuLsjjI4832ZF1vyewTnVTpq+BcvKQavTzu2fWdLsIBK94GEuyjiUnfCrrP7EqXTYzN
         f1GGrOBlP9654jNhN/M8WLxcbAjG/UYH8TDsQPXG+CSaEK83PJw3S/Lj0y8yo7V5qIfl
         YF1v5Tc3XTVLhIVfmbgYErumsJqqqsH52yBQXzosJ66/a6KSOyCB4syzDTfzGDevuTYY
         cUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lihGSNM/MK5Li+Q6R5o1M4YyP4+yQiLVtLIt/qjFJZU=;
        b=E1F+n4T2MgQrYF2MJLXgCMNsAm2GD/VYDA2MxgHHMxQ2S6dHEMV0QZZGCT+Z0IRRf/
         cP21xXlMDfdJYDyBaFdQmp8s2XpnNC3pDA7CWeU5/WlUC6kwGD1Hg6FVPBASxqMbJ3iW
         8NK01jmeJbNj5oux+IAgAiQknXj28hhUiHZ/RRjo2JfMNlCzBHyxqGm4QEyf9Mfm/Rc8
         2FKRZuN8LEFlOvHh4Fk32tqiYLrXUwBOGsRQuThDUP1SEB89+B3ARDU2rAOz4UkRjkUC
         p4ZdMdB9EoOOwXmsYTSdwGfGutfgViB3RgqvBJlRxTOdP0xqrZeCV+WFkUyugURx7e+m
         i2dA==
X-Gm-Message-State: AOAM532+ChYpIY4ppUpFiHmZk4SWiHHIze56Fh2olzKNuhXDt9RzwYA+
        wAOjG71qWo8/aFJ01RB7pADSpM1ZMTNnfQ==
X-Google-Smtp-Source: ABdhPJyKXXDNvfO8leOsdVrYe5pL1L3f3tbyunePMfkdlUVautJzeCi1/Jm2OVCaPk7OPAdpiUSu6A==
X-Received: by 2002:a17:906:5811:: with SMTP id m17mr27420695ejq.221.1620222042560;
        Wed, 05 May 2021 06:40:42 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t7sm15397264eds.26.2021.05.05.06.40.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:40:42 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: rockchip: add grf register compatible for rk3066/rk3188
Date:   Wed,  5 May 2021 15:40:27 +0200
Message-Id: <20210505134028.13431-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210505134028.13431-1-jbx6244@gmail.com>
References: <20210505134028.13431-1-jbx6244@gmail.com>
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

