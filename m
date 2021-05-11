Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528D8379EF5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 07:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhEKFGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 01:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbhEKFGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 01:06:42 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656C6C061574;
        Mon, 10 May 2021 22:05:28 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r11so6459053edt.13;
        Mon, 10 May 2021 22:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=60Lo7xpvw9UYiOl5jHY1jyhH6Kp5rVQT5uk6x+ikYXU=;
        b=pjQO8ugBczY9ILfH5Ui6UlNeLY/hw0v2Wri0bS7ozgYFH7Rw7zZ2L+Ocuz6mTii+5M
         s7scXBV+9K7VzAh1xOi1X81cAx/a8eRzcoKJeYeJD4XTAbY94W/rpTUnNxoj6bK5iwVn
         RCxL2BKbUzyxZpsGCNKyoSWgPwrByD7gwvkJpetY3sD6qDwDrrj297WF1X64ArPugqfW
         KxP9ah9+vSu1cCc4kInCQrJuw3yYb8tHIgqbBf65v1hCMRhalDLL29C1ZFC5nXaDdZus
         8FVzJSKIM9mflu7XevZtKrPU5j5De0skFtRRj1wlsi3hHHTBIIxLgNrauhBnTdWWs7/Z
         2+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=60Lo7xpvw9UYiOl5jHY1jyhH6Kp5rVQT5uk6x+ikYXU=;
        b=Dswy63rAq/mpd14V1QxeO/koPNO/HOkda8JbbYGU7PZZaUtJZwJ/Ja+Ts+hW60xu08
         NKmPJIAHPkcSM/Pxtr0mkhtS1p/Zz1cCREui03L7V/JVO21V0oXEB8vErifqK0LuxHaw
         OkXF4qit4erKL2fTM6JcXIVTwvozC+O20n6Ww7ENh/K6xJB1w6fVlJr2dsK4It34QAb8
         ABsdRpufGbTWqrRD2znDD/PfwyuXhQMJ5aCyTqvRyynQY3I8h/29MI1QiuY8poSzu1Ry
         1OJim3cjAC8/X0XQWMnfj30QNhIAcMPmooiEJ7a9BjZhT173mMGKyZqWFKIFubnVklrl
         aDYA==
X-Gm-Message-State: AOAM531CZdTyER5XnN59Kuy9HggBnBm4QXFMrlnBaR4QaJajx/KPN6PA
        D2EfW97lVZG7mmbGJnHB9bU=
X-Google-Smtp-Source: ABdhPJw7kqDOZphNYsS6zYAyisU/b00uYXV8iECUQs30s1WPz+PYOUmr7Ei3q1Xd9QTuux1I5TbZgg==
X-Received: by 2002:a50:ee86:: with SMTP id f6mr33839634edr.154.1620709527251;
        Mon, 10 May 2021 22:05:27 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g24sm3620302eds.41.2021.05.10.22.05.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 22:05:27 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: rename grf-gpio nodename in rk3328.dtsi
Date:   Tue, 11 May 2021 07:05:11 +0200
Message-Id: <20210511050511.5973-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210511050511.5973-1-jbx6244@gmail.com>
References: <20210511050511.5973-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A test with the command below gives this error:

/arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml: syscon@ff100000:
grf-gpio: {'compatible': ['rockchip,rk3328-grf-gpio'],
'gpio-controller': True, '#gpio-cells': [[2]], 'phandle': [[68]]} is not
of type 'array'

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

