Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 125408740A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 10:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405819AbfHIIaj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 04:30:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48546 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405395AbfHIIaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 04:30:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x798UWOR117619;
        Fri, 9 Aug 2019 03:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565339432;
        bh=qDQiI5/qZTy9JN42VQ92ukHigsrEUtNA8Bxoo+HDsW8=;
        h=From:To:CC:Subject:Date;
        b=WZk0WpY9a5710rRUUEIPmp3lBJXDwoD+B6M7Se2jyMdQoCJaPfCkQH8sB4e91QR/S
         T+z821uTQgEK/PkAa0LS3wc6DCbY1FipY5fDrThNmVLp6tUYE7EnZxXAytNLXLTmbz
         VNbJ70xRRP9IUZz2z8QCMZHqMAUe/JvSxH58b1PI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x798UW3s084400
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 03:30:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 03:30:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 03:30:32 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x798USde070370;
        Fri, 9 Aug 2019 03:30:29 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linus.walleij@linaro.org>
CC:     Keerthy <j-keerthy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/6] arm64: dts: ti: k3-j721e: Add gpio nodes
Date:   Fri, 9 Aug 2019 13:59:41 +0530
Message-ID: <20190809082947.30590-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds gpio nodes for J721E SoC and enable gpio keys
in J72E common process board.

Tested Boot log: https://pastebin.ubuntu.com/p/P6QqmZYtSC/

This series depends on Power-domain cells update series:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=152109


Lokesh Vutla (5):
  dt-bindings: gpio: davinci: Add new compatible for J721E SoCs
  arm64: dts: ti: k3-j721e: Add gpio nodes in main domain
  arm64: dts: ti: k3-j721e: Add gpio nodes in wakeup domain
  arm64: dts: ti: k3-j721e-common-proc-board: Disable unused gpio
    modules
  dt-bindings: pinctrl: k3: Introduce pinmux definitions for J721E

Nikhil Devshatwar (1):
  arm64: dts: k3-j721e: Add gpio-keys on common processor board

 .../devicetree/bindings/gpio/gpio-davinci.txt |   1 +
 .../dts/ti/k3-j721e-common-proc-board.dts     |  65 +++++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 132 ++++++++++++++++++
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  34 +++++
 include/dt-bindings/pinctrl/k3.h              |   3 +
 5 files changed, 235 insertions(+)

-- 
2.22.0

