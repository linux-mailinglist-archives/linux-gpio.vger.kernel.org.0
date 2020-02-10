Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE8D157CBB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 14:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgBJNt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 08:49:26 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:41346 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727632AbgBJNt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Feb 2020 08:49:26 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01ADkXk1030772;
        Mon, 10 Feb 2020 14:49:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cITEAYl7nEAOFwC8GIedkKHGxNjOkyc26Tp0ZsiHXd4=;
 b=EjcdUPpUjsFQTV8YUurJssgFINbtJhZ3CYUac/XmxMlMwxRDQVd8auSjASVPCiFATJdT
 gMZRU1DDYhfGs0El2czpDnTL0clsDaG0qaim81DGDdeqXMCNXBYlByoWz8Pw83TFm4uC
 Y8yXjJakVCB4a+BFKM9qbZYNPiEWSYIKvoKA11FHZEjSY1u7D7lwlSLVtu5iTnP0pNJc
 MJHyP7NXyQbdOZ4DFHi6pKRI15VgFH13y9oXRiqnSInSTDAq6OnVVWVKe7QH2z9xYjtD
 mVLBWKKSt8Pc2ENxQV8tm1/egsKcfp45YJPaWFQTgg2aPPxzwvWbgdRkR8djEOO2SAlA XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1ud9av50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Feb 2020 14:49:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2703100034;
        Mon, 10 Feb 2020 14:49:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AA2A2BD418;
        Mon, 10 Feb 2020 14:49:04 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb 2020 14:49:04
 +0100
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <marex@denx.de>
Subject: [PATCH 0/2] Add GPIO level-sensitive interrupt support
Date:   Mon, 10 Feb 2020 14:48:59 +0100
Message-ID: <20200210134901.1939-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_04:2020-02-10,2020-02-10 signatures=0
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

Regards
Alex

Alexandre Torgue (2):
  irqchip/stm32: Add irq retrigger support
  pinctrl: stm32: Add level interrupt support to gpio irq chip

 drivers/irqchip/irq-stm32-exti.c      | 14 +++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.c | 47 +++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 3 deletions(-)

-- 
2.17.1

