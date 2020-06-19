Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56162004A9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731887AbgFSJHf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 05:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731854AbgFSJG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 05:06:57 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EACC061798
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 02:06:53 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l12so9390568ejn.10
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EF3uQr3RQED1YKYkNKEVE2Xoq5JyRRd7hiTR6pRsTG4=;
        b=hbsAZmXNE2TaOrADyfhZ4LncxAlKOcWNbKLbDeF2rsahruJQCNzLprdZsGdbsUDjbq
         qrzTvHV7mlFcoGs5wRL1DmgYNtpfTYJn4yUmv3wLcxZn6ifXoTmBYaKDalxxjprE4H75
         OFcrYnlQQb3DyBgekcLt/QElT7wo5S4Fx2JoOrZuAHEe640Rad0m9k1WfJvRz++zkTS7
         c4Xc2hdrnjqNTUCgQk4kqi9gGZAT/y0MHgN+y3t734xefMs29v8NjuC/JpsypOd6R2t4
         Si6ZesNDYvk6F49qAjkeO/QV73MqqosehLo+mhVjGQDVaAiRozB3VWBJFDg8zbopksMe
         ClXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EF3uQr3RQED1YKYkNKEVE2Xoq5JyRRd7hiTR6pRsTG4=;
        b=dSaKsmdzRolqIvXWPRmvrSM8i9K+0F9874hO/9oYLM9zpxBSaRDsp0DBoaQ+a2Ug6C
         NSTUoUwy2DpklOQ82sEvI/Qpqg06eArAs0z3quezkpJDUZI+RefHRy66vAKBlv7ZwR9z
         1myb/GytPeXdjyHtHDZwGWbo6cMl8p+OE7/fYN8rqfyNe0Dh6a7+OnVF3sjG7Mi9wUxC
         Hrq8Ybc7//tp4fprC8ftzn/eoNON5UIU1kH3vN0gIeNVMJ342BVJ8vmqJSIV3hdDUMk5
         cbdVWjyfo7zovBaw+hd2EOZZ2a2IEwmJx+QbhTxt+H8YNa75SkdRcbPRmCLyfEFoEH/s
         ZtJA==
X-Gm-Message-State: AOAM533PJpd763s0t21QJJP59m+EkAlh9oHfOKWs/BN1qV3SZ3lEgEoZ
        Zz2XMi9oqkG4F1LFpKhoUAYfBQ==
X-Google-Smtp-Source: ABdhPJwcHprUUq00PuchIFIQbAmYwvW8uI0PLiIJTeBXZedE5iHqZtnO5Gza2w34X9TiFWfp14Ftgg==
X-Received: by 2002:a17:906:2615:: with SMTP id h21mr2624881ejc.84.1592557612232;
        Fri, 19 Jun 2020 02:06:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c68:7901:5c06:6064:338b:4004])
        by smtp.gmail.com with ESMTPSA id dm1sm4653650ejc.99.2020.06.19.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 02:06:51 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2 2/3] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
Date:   Fri, 19 Jun 2020 11:06:07 +0200
Message-Id: <20200619090608.94948-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200619090608.94948-1-drew@beagleboard.org>
References: <20200619090608.94948-1-drew@beagleboard.org>
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
index 340ea331e54d..f9b99cfa93b6 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -290,7 +290,7 @@ scm: scm@0 {
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

