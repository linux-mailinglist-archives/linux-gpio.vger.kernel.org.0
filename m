Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6602C9C78
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 10:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390542AbgLAJSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 04:18:23 -0500
Received: from mo-csw1114.securemx.jp ([210.130.202.156]:48034 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390506AbgLAJSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 04:18:18 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 0B19FxL2025937; Tue, 1 Dec 2020 18:15:59 +0900
X-Iguazu-Qid: 2wHH70gJgplKXzHYie
X-Iguazu-QSIG: v=2; s=0; t=1606814159; q=2wHH70gJgplKXzHYie; m=UbjKU69+f3FMIrmWeurlN8dKaKvlmyZo/QzXhjzYzBA=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 0B19Fw2A000420;
        Tue, 1 Dec 2020 18:15:58 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0B19Fw43012385;
        Tue, 1 Dec 2020 18:15:58 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0B19Fvt2008590;
        Tue, 1 Dec 2020 18:15:58 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 3/4] MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
Date:   Wed,  2 Dec 2020 03:14:05 +0900
X-TSB-HOP: ON
Message-Id: <20201201181406.2371881-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add entries for Toshiba Visconti GPIO Controller binding and driver.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50fbbfffb921..8565272d95c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2636,8 +2636,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
 F:	Documentation/devicetree/bindings/arm/toshiba.yaml
+F:	Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 F:	Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
 F:	arch/arm64/boot/dts/toshiba/
+F:	drivers/gpio/gpio-visconti.c
 F:	drivers/pinctrl/visconti/
 N:	visconti
 
-- 
2.29.2

