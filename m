Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8313EE79E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 09:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239073AbhHQHrX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 03:47:23 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49608 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238955AbhHQHrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 03:47:09 -0400
X-UUID: 64c792a303cd4805909b423755a85ad9-20210817
X-UUID: 64c792a303cd4805909b423755a85ad9-20210817
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1428143285; Tue, 17 Aug 2021 15:46:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 17 Aug
 2021 15:46:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 15:46:29 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        Sam Shih <sam.shih@mediatek.com>
Subject: [v2,08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng binding
Date:   Tue, 17 Aug 2021 15:45:53 +0800
Message-ID: <20210817074557.30953-9-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210817074557.30953-1-sam.shih@mediatek.com>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add RNG binding for MT7986 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v2: patch v1 has been applied

---
 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 61888e07bda0..bb32491ee8ae 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt7622-rng
               - mediatek,mt7629-rng
+              - mediatek,mt7986-rng
               - mediatek,mt8365-rng
               - mediatek,mt8516-rng
           - const: mediatek,mt7623-rng
-- 
2.29.2

