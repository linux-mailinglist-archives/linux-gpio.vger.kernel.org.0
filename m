Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32942245AB0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 04:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgHQCVS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 22:21:18 -0400
Received: from mo-csw-fb1514.securemx.jp ([210.130.202.170]:60842 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgHQCVS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 22:21:18 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 07H1l81b024184; Mon, 17 Aug 2020 10:47:08 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07H1ktob014415; Mon, 17 Aug 2020 10:46:55 +0900
X-Iguazu-Qid: 34tKNrBeFZDrgOHFHl
X-Iguazu-QSIG: v=2; s=0; t=1597628815; q=34tKNrBeFZDrgOHFHl; m=mZtFY5xQ0LIQRE3feks4YvyMEmqcK0Vl5rc1pvgS8+U=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1513) id 07H1ksbL028225;
        Mon, 17 Aug 2020 10:46:54 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx12.toshiba.co.jp  with ESMTP id 07H1ksUQ001683;
        Mon, 17 Aug 2020 10:46:54 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc03.toshiba.co.jp  with ESMTP id 07H1krJM023852;
        Mon, 17 Aug 2020 10:46:53 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 7/8] MAINTAINERS: Add information for Toshiba Visconti ARM SoCs
Date:   Mon, 17 Aug 2020 10:46:31 +0900
X-TSB-HOP: ON
Message-Id: <20200817014632.595898-8-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
index 4e2698cc7e23..6080196045ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2612,6 +2612,17 @@ M:	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
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

