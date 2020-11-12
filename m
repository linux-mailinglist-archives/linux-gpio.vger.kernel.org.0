Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D852AFD0C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 02:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgKLBcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 20:32:19 -0500
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:46068 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgKKXmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 18:42:19 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 0ABNg60K004764; Thu, 12 Nov 2020 08:42:06 +0900
X-Iguazu-Qid: 2wHHjV7mwWUIDZ33GT
X-Iguazu-QSIG: v=2; s=0; t=1605138126; q=2wHHjV7mwWUIDZ33GT; m=jyakLShm0Bev/o62iVwFa/TrK4a36eZtpzVyQH9viLQ=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1112) id 0ABNg5Fu007407;
        Thu, 12 Nov 2020 08:42:05 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0ABNg5jN016619;
        Thu, 12 Nov 2020 08:42:05 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0ABNg4M7003436;
        Thu, 12 Nov 2020 08:42:05 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 3/4] MAINTAINERS: Add entries for Toshiba Visconti GPIO controller
Date:   Thu, 12 Nov 2020 17:40:56 +0900
X-TSB-HOP: ON
Message-Id: <20201112084057.1399983-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112084057.1399983-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201112084057.1399983-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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

