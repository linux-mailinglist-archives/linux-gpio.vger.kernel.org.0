Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0972D1D186E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 17:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389299AbgEMPBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 11:01:11 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36890 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728692AbgEMPAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 11:00:03 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04DEv03a016527;
        Wed, 13 May 2020 16:59:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ZgpAUyUBhezUtCmK/K3PuawVI1AJV9N0ktEyTGWGChE=;
 b=FCEurBkqNDjhkxHwJgxnJZlZ+ky03QXvODmzl5OqMiNV8vu1MwZcc5EAHSqgftOwlnpt
 cYS9N5oKrLTT/b3plyMtMKqsnRWr0SmP+E5pLQZqf665qsSJ57C8z7V1qv47mJK6In/3
 nIDZoRk1HxCmWKddNbn0TIgz9ofQQKVHldNMaLMMH8dM+VbfJiNXA4oCt6+GJKBfKja1
 ngMpB2LFEyPDjhVdWVMen2ZmdircFUhnXbXBY6dOrFEzGupCwnQyYFsr8vZt0udxjl+/
 rWrb52J1lhP2iUpmQV+Bqp928hFlqcTi7AyJthG/pXzCapxpF5X0w1ZF922L7GpZfFXh xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vydgkn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 May 2020 16:59:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92BD010002A;
        Wed, 13 May 2020 16:59:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D0852D3004;
        Wed, 13 May 2020 16:59:41 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May 2020 16:59:40
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <gregkh@linuxfoundation.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 00/15] Fix STM32 DT issues on v5.7-rc4
Date:   Wed, 13 May 2020 16:59:20 +0200
Message-ID: <20200513145935.22493-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-13_06:2020-05-13,2020-05-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series fixes issues hight lighted by dtbs_check on STM32 devicetrees.
The patches has been developped on top of v5.7-rc4 tag.

Benjamin Gaignard (15):
  ARM: dts: stm32: remove useless interrupt-names property on stm32f429
  ARM: dts: stm32: update pwm pinctrl node names for stm32f4
  ARM: dts: stm32: update led nodes names for stm32f249-disco
  ARM: dts: stm32: update led nodes names for stm32f469-disco
  ARM: dts: stm32: remove useless interrupt-names property on stm32f746
  ARM: dts: stm32: update led nodes names for stm32f429-eval
  ARM: dts: stm32: update led nodes names for stm32f769-disco
  ARM: dts: stm32: update led nodes names for stm32f746-eval
  ARM: dts: stm32: remove useless interrupt-names property on stm32f743
  ARM: dts: stm32: Update nodes names for stm32h743 pinctrl
  ARM: dts: stm32: Update nodes names for stm32mp15 pinctrl
  ARM: dts: stm32: Add missing #address and #size cells on spi node for
    stm32mp151
  ARM: dts: stm32: update led nodes names for stm32f746-eval
  dt-bindings: pinctrl: stm32: Add missing interrupts property
  dt-bindings: usb: dwc2: Fix issues for stm32mp15x SoC

 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          |  3 +++
 Documentation/devicetree/bindings/usb/dwc2.yaml                |  6 ++++--
 arch/arm/boot/dts/stm32429i-eval.dts                           |  8 ++++----
 arch/arm/boot/dts/stm32746g-eval.dts                           |  8 ++++----
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi                         |  4 ++--
 arch/arm/boot/dts/stm32f429-disco.dts                          |  4 ++--
 arch/arm/boot/dts/stm32f429.dtsi                               |  1 -
 arch/arm/boot/dts/stm32f469-disco.dts                          |  8 ++++----
 arch/arm/boot/dts/stm32f746.dtsi                               |  1 -
 arch/arm/boot/dts/stm32f769-disco.dts                          |  4 ++--
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi                       | 10 +++++-----
 arch/arm/boot/dts/stm32h743.dtsi                               |  1 -
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi                       |  6 +++---
 arch/arm/boot/dts/stm32mp151.dtsi                              |  2 ++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                         |  2 +-
 15 files changed, 36 insertions(+), 32 deletions(-)

-- 
2.15.0

