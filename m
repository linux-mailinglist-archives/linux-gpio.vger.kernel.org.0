Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C6C243556
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgHMHtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:25 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39086 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMHtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:24 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7n9fQ5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7n9fQ5028965
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 13 Aug 2020 15:49:09 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/9] arm64: dts: realtek: rtd129x: fix SDIO pinctrl node
Date:   Thu, 13 Aug 2020 15:49:05 +0800
Message-ID: <20200813074908.889-7-tychang@realtek.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813074908.889-1-tychang@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix sdio function value of pinctrl property.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 arch/arm64/boot/dts/realtek/rtd129x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd129x.dtsi b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
index 59a68581f542..38ec852dfc6c 100644
--- a/arch/arm64/boot/dts/realtek/rtd129x.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
@@ -313,7 +313,7 @@ sdmmc_wp_pin: sdmmc-wp-pin {
 	};
 
 	sdio_pins: sdio-pins {
-		function = "sdio";
+		function = "sdio_0";
 		groups = "sdio_cmd", "sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3";
 	};
 };
-- 
2.28.0

