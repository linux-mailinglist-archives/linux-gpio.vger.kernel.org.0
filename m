Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80A838C106
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 09:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbhEUHzk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 03:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbhEUHzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 03:55:39 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1B7C061574
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 00:54:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:18b5:4195:d4ed:57e1])
        by laurent.telenet-ops.be with bizsmtp
        id 7KuA2501k46MpxJ01KuBBV; Fri, 21 May 2021 09:54:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz0-007iyQ-En; Fri, 21 May 2021 09:54:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzyz-00A3uG-Vv; Fri, 21 May 2021 09:54:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pcf857x: DTS fixes and DT binding to json-schema conversion
Date:   Fri, 21 May 2021 09:54:05 +0200
Message-Id: <cover.1621583562.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series converts the PCF857x-compatible I/O expanders Device
Tree binding documentation to json-schema, after fixing a few issues in
DTS files.

Thanks for your comments!

Geert Uytterhoeven (3):
  ARM: dts: dra7x-evm: Align GPIO hog names with dt-schema
  ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells
  dt-bindings: gpio: pcf857x: Convert to json-schema

 .../devicetree/bindings/gpio/gpio-pcf857x.txt |  69 ----------
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 120 ++++++++++++++++++
 arch/arm/boot/dts/dra7-evm.dts                |   2 +-
 arch/arm/boot/dts/dra71-evm.dts               |   2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi       |   2 +-
 arch/arm/boot/dts/dra76-evm.dts               |   2 +-
 arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi    |   2 +-
 7 files changed, 125 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

-- 
2.25.1

