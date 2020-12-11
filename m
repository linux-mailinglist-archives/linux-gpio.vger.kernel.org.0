Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8892D6CB4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 01:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394594AbgLKAqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 19:46:51 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:48000 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394578AbgLKAqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 19:46:12 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0BB0hYWl019728; Fri, 11 Dec 2020 09:43:34 +0900
X-Iguazu-Qid: 34tru22SmqaEXY52m3
X-Iguazu-QSIG: v=2; s=0; t=1607647414; q=34tru22SmqaEXY52m3; m=twkiAwUEEtsXeSnr+h5Wtq15u274Mx4wSJ9dXQOSn9E=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 0BB0hXpe032372;
        Fri, 11 Dec 2020 09:43:33 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0BB0hXvj001525;
        Fri, 11 Dec 2020 09:43:33 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0BB0hXUq012074;
        Fri, 11 Dec 2020 09:43:33 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v4 3/4] MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
Date:   Fri, 11 Dec 2020 18:41:37 +0900
X-TSB-HOP: ON
Message-Id: <20201211094138.2863677-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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

