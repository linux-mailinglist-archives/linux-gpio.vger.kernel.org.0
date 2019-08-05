Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D1781301
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 09:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfHEHUI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 03:20:08 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37720 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726394AbfHEHUI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 03:20:08 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DD4B71A01E4;
        Mon,  5 Aug 2019 09:20:05 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1DDBC1A0013;
        Mon,  5 Aug 2019 09:20:00 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 930A340296;
        Mon,  5 Aug 2019 15:19:52 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v1] gpio: mpc8xxx: Add new platforms GPIO DT node description
Date:   Mon,  5 Aug 2019 15:10:24 +0800
Message-Id: <20190805071024.7992-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

Update the NXP GPIO node dt-binding file for QorIQ and
Layerscape platforms, and add one more example with
ls1028a GPIO node.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
index 69d4616..fbe6d75 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -28,7 +28,7 @@ gpio0: gpio@1100 {
 Example of gpio-controller node for a ls2080a SoC:
 
 gpio0: gpio@2300000 {
-	compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
+	compatible = "fsl,ls1028a-gpio","fsl,ls2080a-gpio", "fsl,qoriq-gpio";
 	reg = <0x0 0x2300000 0x0 0x10000>;
 	interrupts = <0 36 0x4>; /* Level high type */
 	gpio-controller;
-- 
2.9.5

