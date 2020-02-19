Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A61D01646FE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 15:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBSOcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 09:32:53 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56648 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727680AbgBSOcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 09:32:52 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01JEWWHR016893;
        Wed, 19 Feb 2020 15:32:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yVYeAkBr/Ft2oDd0dMTVl2kwlcLip9R6AePCGWxuxMw=;
 b=A1rBdxeVPUK94k7W2bT3X9yIQ9+tmEgoujjCkMuwgscVu+O3cVk2/o00J+uKZ0mDIXQO
 zv3BCA1w2cLnGH1wd8n2aMtXSA5hob9rrYjNkedLnLZ2XtBGSLignA0gdDWxK6i6Rp0q
 vyeSkkfWan2+6H0SOfdl+VyMszHBg0kX2V4BvNnT4TB6FPr3uRSUQYqS7xv1BOPtwZ1g
 XNvOfo8huh4wD/nS3PYiRw3UzvkXFb25E59BncK4YBXXSDTk0FrwjFv1aUrY8I34mPs4
 KQc2qUnwkIsTSnxvp2WD1pUUh+WuwAiDbn5+zSvX/yG+QoEbzp9ywxoLcPu1NxBk7/4J kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8uafkjfe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 15:32:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DEB610003A;
        Wed, 19 Feb 2020 15:32:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0722A2BEC59;
        Wed, 19 Feb 2020 15:32:31 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb 2020 15:32:30
 +0100
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <marex@denx.de>, <alexandre.torgue@st.com>
Subject: [PATCH v3 0/2] Add GPIO level-sensitive interrupt support
Date:   Wed, 19 Feb 2020 15:32:27 +0100
Message-ID: <20200219143229.18084-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_03:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds the possibility to handle gpio interrupts on level.

GPIO hardware block is directly linked to EXTI block but EXTI handles
external interrupts only on edge. To be able to handle GPIO interrupt on
level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
is retriggered following interrupt type and gpio line value.

In exti irq chip, retrigger ops function is added.

Changes since v2:
 - Fix issues reported by Marc:
   - do not retrigger uselessly a second time in exti irq retrigger callback
   - minor comments in pinctrl patch

Changes since v1:
 - Fix issue reported by Marek: return statment in "stm32_gpio_set_type"
   function.

regards
alex

Alexandre Torgue (2):
  irqchip/stm32: Add irq retrigger support
  pinctrl: stm32: Add level interrupt support to gpio irq chip

 drivers/irqchip/irq-stm32-exti.c      | 14 ++++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.c | 45 +++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.17.1

