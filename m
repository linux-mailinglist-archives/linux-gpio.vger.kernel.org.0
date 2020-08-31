Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560E725750D
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 10:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgHaIL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 04:11:28 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:46198 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbgHaIL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:11:26 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07V8Aoc0026145; Mon, 31 Aug 2020 17:10:51 +0900
X-Iguazu-Qid: 34tMSeeoT6LWFoIb18
X-Iguazu-QSIG: v=2; s=0; t=1598861450; q=34tMSeeoT6LWFoIb18; m=eNdXhv/eylLFttYwEi5b5AMBkjIiogyux4syjc1qTWk=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 07V8Anou001744;
        Mon, 31 Aug 2020 17:10:49 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07V8AmSw025544;
        Mon, 31 Aug 2020 17:10:48 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07V8AmKG026401;
        Mon, 31 Aug 2020 17:10:48 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 5/8] arm64: visconti: Add initial support for Toshiba Visconti platform
Date:   Mon, 31 Aug 2020 17:10:22 +0900
X-TSB-HOP: ON
Message-Id: <20200831081025.2721320-6-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the initial device tree files for Toshiba Visconti platform.
For starters, the only SoC supported will be Visconti5 TMPV7708.

https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 arch/arm64/Kconfig.platforms | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cd58f8495c45..dce74d34d18a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -300,6 +300,13 @@ config ARCH_VEXPRESS
 	  This enables support for the ARMv8 software model (Versatile
 	  Express).
 
+config ARCH_VISCONTI
+	bool "Toshiba Visconti SoC Family"
+	select PINCTRL
+	select PINCTRL_VISCONTI
+	help
+	  This enables support for Toshiba Visconti SoCs Family.
+
 config ARCH_VULCAN
 	def_bool n
 
-- 
2.27.0

