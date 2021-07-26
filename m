Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607223D5406
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 09:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbhGZGhd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 02:37:33 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:47410 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232517AbhGZGhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 02:37:22 -0400
X-UUID: a5c4e25166ba4c85813b73fefc1c59b3-20210726
X-UUID: a5c4e25166ba4c85813b73fefc1c59b3-20210726
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1785658365; Mon, 26 Jul 2021 15:17:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:17:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 26 Jul 2021 15:17:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 15:17:47 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        "Sam Shih" <sam.shih@mediatek.com>
Subject: [PATCH 10/12] dt-bindings: watchdog: Add compatible for Mediatek MT7986
Date:   Mon, 26 Jul 2021 15:14:37 +0800
Message-ID: <20210726071439.14248-11-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726071439.14248-1-sam.shih@mediatek.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This commit adds dt-binding documentation of watchdog for Mediatek MT7986
SoC Platform.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 416d716403f6..a4e31ce96e0e 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -13,6 +13,7 @@ Required properties:
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
 	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
 	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
+	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
 	"mediatek,mt8183-wdt": for MT8183
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
-- 
2.29.2

