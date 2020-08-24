Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8B124FDC9
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 14:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgHXMap (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 08:30:45 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:48180 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgHXMao (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 08:30:44 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07OCULOh008502; Mon, 24 Aug 2020 21:30:22 +0900
X-Iguazu-Qid: 34tMJPQphi6dh7o7hw
X-Iguazu-QSIG: v=2; s=0; t=1598272221; q=34tMJPQphi6dh7o7hw; m=AgtQge0HMDRNecaYJInjTapyhman1xSmmcPyB3Gfh1A=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1513) id 07OCUKX3003865;
        Mon, 24 Aug 2020 21:30:20 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 07OCUKuP018052;
        Mon, 24 Aug 2020 21:30:20 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 07OCUJ4j032306;
        Mon, 24 Aug 2020 21:30:20 +0900
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
Subject: [PATCH v2 8/8] arm64: defconfig: Enable configs for Toshiba Visconti
Date:   Mon, 24 Aug 2020 21:29:57 +0900
X-TSB-HOP: ON
Message-Id: <20200824122957.1392870-9-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable support for the Toshiba Visconti SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..8faadd68f859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -57,6 +57,7 @@ CONFIG_ARCH_THUNDER=y
 CONFIG_ARCH_THUNDER2=y
 CONFIG_ARCH_UNIPHIER=y
 CONFIG_ARCH_VEXPRESS=y
+CONFIG_ARCH_VISCONTI=y
 CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZX=y
 CONFIG_ARCH_ZYNQMP=y
-- 
2.27.0

