Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA4837103
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 11:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbfFFJz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 05:55:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57174 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfFFJz4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 05:55:56 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x569tlk6004393;
        Thu, 6 Jun 2019 04:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559814947;
        bh=CazWKvKzn9wEOWjpAGC3vTqMbxulB3SnH+10lTJ0/Fk=;
        h=From:To:CC:Subject:Date;
        b=oNxFOyskPxzToIs3Ob/pY/+Qp5xvE+Nz8dpIc7D3lzmE7SzNGokolIvARUCRrTyWK
         1ZpaNtcUTTqhoUnppg3Iv+iuaEmcukoH871La+GpMh0bAXrha+jv3hGdk/SxYRrCQH
         qZNMNMBmS32+PGevywEbKEGxohNnhhuex9qvUfYo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x569tlDD054436
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Jun 2019 04:55:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 6 Jun
 2019 04:55:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 6 Jun 2019 04:55:47 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x569thsq016817;
        Thu, 6 Jun 2019 04:55:43 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <t-kristo@ti.com>, <nm@ti.com>, <robh+dt@kernel.org>
CC:     <lokeshvutla@ti.com>, <bgolaszewski@baylibre.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-keerthy@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC RESEND PATCH v2 0/4] arm64: dts: ti: am6: Add gpio nodes
Date:   Thu, 6 Jun 2019 15:26:16 +0530
Message-ID: <20190606095620.6211-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

K3 AM6 platform has 2 instances of gpio banks on main domain
and 1 instance on wakeup domin. All are capable of generating
banked interrupts.

This series also adds 2 goio_keys nodes connected to SW6 SW5
switches and tested for gpio_keys interrupts.

The series depends on:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=112791

Posting as RFC as it has dependencies to be merged.

Resending with the linux-gpio and gpio Maintainers copied.

Changes in v2:

  * Added a separate am654 compatible. 

Keerthy (4):
  dt-bindings: gpio: davinci: Add k3 am654 compatible
  arm64: dts: ti: am6-wakeup: Add gpio node
  arm64: dts: ti: am6-main: Add gpio nodes
  arm64: dts: ti: am654-base-board: Add gpio_keys node

 .../devicetree/bindings/gpio/gpio-davinci.txt | 18 +++++++++++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 32 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    | 15 +++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 27 ++++++++++++++++
 4 files changed, 92 insertions(+)

-- 
2.17.1

