Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF135290D03
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 23:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409785AbgJPVAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 17:00:05 -0400
Received: from mxwww.masterlogin.de ([95.129.51.170]:58492 "EHLO
        mxwww.masterlogin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390164AbgJPVAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 17:00:04 -0400
Received: from mxout3.routing.net (unknown [192.168.10.111])
        by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 39AF52C456;
        Fri, 16 Oct 2020 20:40:46 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
        by mxout3.routing.net (Postfix) with ESMTP id CF8A4604A2;
        Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1602880842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MLMOMEv1DZCcr4q6lo8XvM0Y6vneu4kR0PkQI7AZltg=;
        b=BdVkPMOpG9iiyC7QKDD4gHRnuePVaLjbO4gl0aA/PbSCSBrWL59P3KoKWssXGq8LEeWCH0
        9gsEhTwtU9g/0fuTysMQk/aC2WbMUzJIMTXQO4M+RkQiffJ/Mh9M88niinfz7Wt2RZZdWR
        i7o3/32r25Pbj/x/JlWYLV7ejuHIrXo=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de [80.208.213.194])
        by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 45350360549;
        Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC 2/3] dts64: mt7622: disable spi1 and uart2 because pins are used by pwm
Date:   Fri, 16 Oct 2020 22:40:18 +0200
Message-Id: <20201016204019.2606-3-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016204019.2606-1-linux@fw-web.de>
References: <20201016204019.2606-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

MDI_TP_P0 (gpio51) is used by pwm1 and uart2 (uart1 on gpio-header)
MDI_RP_P4 (gpio67) is used by pwm4 and spi1

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index ad5b1592182d..74a843e6d107 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -570,7 +570,6 @@ &spi0 {
 &spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spic1_pins>;
-	status = "okay";
 };
 
 &ssusb {
@@ -592,7 +591,6 @@ &uart0 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_pins>;
-	status = "okay";
 };
 
 &watchdog {
-- 
2.25.1

