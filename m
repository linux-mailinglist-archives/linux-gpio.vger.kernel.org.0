Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C703A2DCC2F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 06:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgLQFsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 00:48:06 -0500
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:37860 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbgLQFsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 00:48:05 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 0BH5jgHO015126; Thu, 17 Dec 2020 14:45:42 +0900
X-Iguazu-Qid: 2wGrT5MSNgHV6wvH5o
X-Iguazu-QSIG: v=2; s=0; t=1608183941; q=2wGrT5MSNgHV6wvH5o; m=kunDsOD/zTd+YWMq+Xk+Cfr6kP5MAhRKFOjL/Z+lWZI=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 0BH5jfxI020386;
        Thu, 17 Dec 2020 14:45:41 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0BH5jfot028762;
        Thu, 17 Dec 2020 14:45:41 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0BH5je4d027848;
        Thu, 17 Dec 2020 14:45:40 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v5 3/4] MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
Date:   Thu, 17 Dec 2020 23:43:37 +0900
X-TSB-HOP: ON
Message-Id: <20201217144338.3129140-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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

