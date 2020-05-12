Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA371CFF5C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 22:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731170AbgELUfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 16:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728882AbgELUfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 16:35:36 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA314C061A0C;
        Tue, 12 May 2020 13:35:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e1so3599768wrt.5;
        Tue, 12 May 2020 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=I9uvG2eCuivrXNCRIMZW/mu9KPh6v7hx44Xi50W3e7M=;
        b=SIYsMCCpNn9yTurKHtC9iaFOvGRu2pSw4QAtSl6kVos739KlbXvBFbl6wwuJYTfwfh
         Qrfz2hCU+q8L58f4ZFCWTKAyn83O5P9Z/WnrtTMP1/3rb6geJNlw4kiBzQXvOav7indi
         az5I2I8lUCLDpd+TB9b94PKqgdReAg02RWeXZiMqjU9mQjDJHQuueFZvdbPNMhi8mQpY
         jD2a86Mwd1cocsWcImudYIrO78SMZR8GLP1Z9b+KqouGHYmiHNj+WXNEYVTpnYPa1ORP
         AqijUUxHr2gAwe0Wa3ORtu8tZ3i2G57v9VxHMieGZcuh96NFSBYe7oUkewZMYPTyzocO
         iFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=I9uvG2eCuivrXNCRIMZW/mu9KPh6v7hx44Xi50W3e7M=;
        b=JrX4UUIIbMJWVCl5vLxZONJfum+LE4ZsCoc8/fyBYRM6BImbXzXN7T3eTApnAwaO2F
         0NC1/fwjqFKNtRRS5iMAjZFMML39kqP4GizfpspUQSF96oKwxwRL1Om/gJLXEpldB9SU
         JH+uapPec8hBUnmc7mh4Mic/N8MTGmmkV9nssL2Ee+ThMrxW2qJEsW3Vx4376mcfAxyA
         ntZZ+gUeLg8p3I8hwAT3iYHkv9jQ8VIITpYwjsWzNAj8B9GR1j7wPeHg0b1VhIDKXJxa
         hTBCnQToMKZQbSbq8QdSGRofQwMyQStMijVhP5QIrfPaLPYcJxM/9ABuxF1Q1AwZVZ2j
         12Lg==
X-Gm-Message-State: AGi0PuZX5Blc8YHcqqzCmGArvEAbvm0ztTAhNUnq9Cj1USDhnZprCbjr
        CSW8Y309LYGzCzlFgTSBmnU=
X-Google-Smtp-Source: APiQypKWLZsLTHLSTYERhLF5tW5EgNJ4+bDKF6Dsed3mTcw4kEbRCC24LhQ+8c+LiLB3dde9aQzP6Q==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr18769535wro.301.1589315733685;
        Tue, 12 May 2020 13:35:33 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k131sm418219wma.2.2020.05.12.13.35.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 13:35:32 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: rockchip: replace RK_FUNC defines in rk3326-odroid-go2.dts
Date:   Tue, 12 May 2020 22:35:22 +0200
Message-Id: <20200512203524.7317-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The defines RK_FUNC_1 and RK_FUNC_2 are deprecated,
so replace them with the preferred form.
Restyle properties in the same line.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index fe253669b..46826b6e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -543,18 +543,15 @@
 		};
 
 		soc_slppin_gpio: soc_slppin_gpio {
-			rockchip,pins =
-				<0 RK_PA4 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 
 		soc_slppin_rst: soc_slppin_rst {
-			rockchip,pins =
-				<0 RK_PA4 RK_FUNC_2 &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA4 2 &pcfg_pull_none>;
 		};
 
 		soc_slppin_slp: soc_slppin_slp {
-			rockchip,pins =
-				<0 RK_PA4 RK_FUNC_1 &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA4 1 &pcfg_pull_none>;
 		};
 	};
 };
-- 
2.11.0

