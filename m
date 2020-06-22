Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4974C203E04
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbgFVRc1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbgFVRcY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:32:24 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8013C061573
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so18868587ejd.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esraNk9vYcbt+aYhCal6Rv+dFZCSdTm7//1cm/DqNAg=;
        b=LhbGWaTFVPf141FJ+VrlM1gm9G0Yx9T8OzJsVp75vXKaqYFoXf5GmC8kpq2EpwwBbc
         WqOxWY+Tg9AsLYgOz1eO/LBiR+MVYTEfOkKxkgHAnxxI/56s2ggpsK/r/j/7SL1++AMP
         SDLZKqsstrA3w9vruCcX1oPVY8uC0Q6yXReSYG9DVhLmm+/Uqq6mmd+e1SYBBXOExrgd
         s9Qnj0Q1Hszp8W0gNV884tUzFLS+cHFswvbroJwNUn1qRoJIz/FwglnYHd4rTywkKgLw
         Q7b6HII+eeMzKJpkWXli3tFONXpY94d5smgvEkrme+nK5Rm88QCngPMJej+Qa3qer9do
         8iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esraNk9vYcbt+aYhCal6Rv+dFZCSdTm7//1cm/DqNAg=;
        b=jwkcmlRsk2sK/b0eKArP3uRy/IjqhwsJ4VHYVkERnxLHbJrw8mswfAeX3di9qEgBp4
         MU3w2qTylDT8jlV/mskrSquLAZXSPtLNJtvW4s2G+mGlADC+VjEe3GtWtWQSJfcyxWzo
         cPLtpkF8w2arf0TOD/3GCvbZnYmo1OukuNNb5BibbW7dJgBW6QNmHnhXqK4frbHZ2ky7
         29ahs58521Vt44MknFq9+0E9gLzBr+uPRI+/x/JLn7nilObg1Adl4j80jnRTGu1JKaXw
         ICjCe2ooVdDYJAz1xGrDRVE1mvj3obxids6GdOfW2v0Twsc/eVmTn4f/6ZZe4UOhR11P
         9Lbg==
X-Gm-Message-State: AOAM5312fwi+oEmvEEZZb+aZMS8XuK25ETR0TquRRFKcnp/tJPow9zOq
        nvkTbe5CfTU9Dv7G9tgNlSzBMQ==
X-Google-Smtp-Source: ABdhPJy+SFPlroEIO3VTMMRuyksrmrJdFlyJ5PCayo2U6g0j3Kq28XVgQDvES259MOoHErSiuzhQNA==
X-Received: by 2002:a17:906:e05:: with SMTP id l5mr17849171eji.318.1592847143378;
        Mon, 22 Jun 2020 10:32:23 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z1sm4747386ejb.41.2020.06.22.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:32:22 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 3/3] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
Date:   Mon, 22 Jun 2020 19:29:51 +0200
Message-Id: <20200622172951.524306-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200622172951.524306-1-drew@beagleboard.org>
References: <20200622172951.524306-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This requires AM33XX_PADCONF macro in omap.h to be modified to keep pin
conf and pin mux values separate.

pinctrl-single.c must also be changed to support "pinctrl-single,pins"
with 3 arguments (offset, conf, mux).

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 7ff11d6bf0f2..dafd6e8b42a1 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -278,7 +278,7 @@ scm: scm@0 {
 				am33xx_pinmux: pinmux@800 {
 					compatible = "pinctrl-single";
 					reg = <0x800 0x238>;
-					#pinctrl-cells = <1>;
+					#pinctrl-cells = <2>;
 					pinctrl-single,register-width = <32>;
 					pinctrl-single,function-mask = <0x7f>;
 				};
-- 
2.25.1

