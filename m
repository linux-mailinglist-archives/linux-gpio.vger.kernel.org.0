Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5E62AEC4A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgKKIuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:50:01 -0500
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:46746 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgKKIuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:50:00 -0500
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 0AB8RHLr021984; Wed, 11 Nov 2020 17:27:18 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 0AB8R1O3031490; Wed, 11 Nov 2020 17:27:01 +0900
X-Iguazu-Qid: 2wHHmca9fjm8Ybd8ro
X-Iguazu-QSIG: v=2; s=0; t=1605083221; q=2wHHmca9fjm8Ybd8ro; m=KJP6CDDJxGlPugnW+J1zzmfZpKOaWDTq6SkZ7oJbxDk=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 0AB8R0xm017970;
        Wed, 11 Nov 2020 17:27:00 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0AB8R0DO006932;
        Wed, 11 Nov 2020 17:27:00 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0AB8QxCe032365;
        Wed, 11 Nov 2020 17:27:00 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 3/4] MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
Date:   Thu, 12 Nov 2020 02:25:52 +0900
X-TSB-HOP: ON
Message-Id: <20201111172553.1369282-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
index 94ac10a153c7..7af1f9257eec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2635,8 +2635,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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

