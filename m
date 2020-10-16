Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18ADF290CFF
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 23:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409714AbgJPVAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 17:00:05 -0400
Received: from mxwww.masterlogin.de ([95.129.51.170]:58494 "EHLO
        mxwww.masterlogin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388893AbgJPVAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 17:00:04 -0400
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Oct 2020 17:00:02 EDT
Received: from mxout4.routing.net (unknown [192.168.10.112])
        by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 30C102C45D;
        Fri, 16 Oct 2020 20:40:47 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
        by mxout4.routing.net (Postfix) with ESMTP id 4B95B1009C6;
        Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1602880842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+oJ/of7Qw64mg5bDPdUBki6EV+Di1DJQKZsfwVaB1Kc=;
        b=eUe9lvGqDR4qOexUreKNT6xAZ3cq5G+LK1YXUcwEXLPnxsZS5z6JSL4vhsIwXo4dvtkjZC
        W1/vc2hfU4vbmMTBzwMtwuGtESH6qDP1L22A0AkgiY4beFqtZ6jzNgMKfOtmZ/hI0uEAiG
        SQeRDbehoA6haIxXmXWDYPUhOc9Qd2Y=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de [80.208.213.194])
        by mxbox3.masterlogin.de (Postfix) with ESMTPSA id AF64036023B;
        Fri, 16 Oct 2020 20:40:41 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC 1/3] dts64: mt7622: enable all pwm for bananapi r64
Date:   Fri, 16 Oct 2020 22:40:17 +0200
Message-Id: <20201016204019.2606-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016204019.2606-1-linux@fw-web.de>
References: <20201016204019.2606-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7622 only supports 6 pwm-channels so drop pwm7

third pwm (pwm2) is inverted and connected to fan-socket

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 1cc4dcb0008c..ad5b1592182d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -414,10 +414,15 @@ mux {
 		};
 	};
 
-	pwm7_pins: pwm1-2-pins {
+	pwm_pins: pwm-pins {
 		mux {
 			function = "pwm";
-			groups = "pwm_ch7_2";
+			groups = "pwm_ch1_0", /* mt7622_pwm_ch1_0_pins[] = { 51, }; */
+				 "pwm_ch2_0", /* mt7622_pwm_ch2_0_pins[] = { 52, }; */
+				 "pwm_ch3_2", /* mt7622_pwm_ch3_2_pins[] = { 97, }; */
+				 "pwm_ch4_1", /* mt7622_pwm_ch4_1_pins[] = { 67, }; */
+				 "pwm_ch5_0", /* mt7622_pwm_ch5_0_pins[] = { 68, }; */
+				 "pwm_ch6_0"; /* mt7622_pwm_ch6_0_pins[] = { 69, }; */
 		};
 	};
 
@@ -537,7 +542,7 @@ mux {
 
 &pwm {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pwm7_pins>;
+	pinctrl-0 = <&pwm_pins>;
 	status = "okay";
 };
 
-- 
2.25.1

