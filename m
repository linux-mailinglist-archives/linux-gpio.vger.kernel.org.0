Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC5C24FDD3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgHXMbT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 08:31:19 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:43354 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgHXMbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 08:31:15 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 07OCUMPd012981; Mon, 24 Aug 2020 21:30:22 +0900
X-Iguazu-Qid: 2wGrCcip2hXRtcuCJv
X-Iguazu-QSIG: v=2; s=0; t=1598272221; q=2wGrCcip2hXRtcuCJv; m=BEWrf4c4v9HuIo5xV4MTCrX09jJ5o7mAkRtJz70S+DQ=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1110) id 07OCUJgZ036441;
        Mon, 24 Aug 2020 21:30:20 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 07OCUJC5018049;
        Mon, 24 Aug 2020 21:30:19 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 07OCUJYa032302;
        Mon, 24 Aug 2020 21:30:19 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 7/8] MAINTAINERS: Add information for Toshiba Visconti ARM SoCs
Date:   Mon, 24 Aug 2020 21:29:56 +0900
X-TSB-HOP: ON
Message-Id: <20200824122957.1392870-8-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add information about Toshiba Visconti ARM SoCs to MAINTAINERS.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0068bceeb61..cbc445ab2cc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2651,6 +2651,17 @@ M:	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
 M:	Dirk Opfer <dirk@opfer-online.de>
 S:	Maintained
 
+ARM/TOSHIBA VISCONTI ARCHITECTURE
+M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
+F:	Documentation/devicetree/bindings/arm/toshiba.yaml
+F:	Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
+F:	arch/arm64/boot/dts/toshiba/
+F:	drivers/pinctrl/visconti/
+N:	visconti
+
 ARM/UNIPHIER ARCHITECTURE
 M:	Masahiro Yamada <yamada.masahiro@socionext.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.27.0

