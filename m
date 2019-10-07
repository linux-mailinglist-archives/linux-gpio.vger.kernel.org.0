Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED27ECE408
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 15:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfJGNon (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 09:44:43 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:53699 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727490AbfJGNoc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 09:44:32 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97DfgGC028131;
        Mon, 7 Oct 2019 15:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Zgu7CgUTWBRiwjLIz2RPkFnnw9oE35cPJi/V125/2YA=;
 b=rKt3LHc1Qv6MsCK7bvNvvOmuO1+FwV4jQj7yEZWErWQi8Jy+iGrgbcCz4MxN+/aUMFEh
 AJN/3qyPJ9wF1KSVWvfSYUNEp5rHPJz4g8ltTzXJEpMYYeTYdQGo/zdgHWFWnQD/bqzP
 i9ECsG9TsM9dXSgO8PjarAEf/De/rzIZ1w8GJ+KzCzGFmNySGsr3if3mm7geLh9ZmN1U
 g83u72LpoGvZX4Llb5KRd3AJvK008C8rtKF8o5qQ6Yu23bNuE/gzk8hDFlCJlXcij45Q
 0OLoCyGJAoyNFp+k0Lb+M9cMBi1abw5I9Misw8j23iv4er7M8EuPbI/0bR7mbsJdwS/h UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vegxvjk6h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 15:44:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26AF810002A;
        Mon,  7 Oct 2019 15:44:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E65A2B8A5E;
        Mon,  7 Oct 2019 15:44:12 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct 2019 15:44:11
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH 0/3] dt-bindings: fix issues seen during STM32 DT validation   
Date:   Mon, 7 Oct 2019 15:44:07 +0200
Message-ID: <20191007134410.10337-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series updates yaml files to clean some issues seen during STM32 device
trees validation. 

Alexandre Torgue (3):
  dt-bindings: arm: stm32: Add missing STM32 boards
  dt-bindings: pinctrl: stm32: Fix 'st,syscfg' description field
  dt-bindings: usb: generic-ehci: Add "companion" entry

 .../devicetree/bindings/arm/stm32/stm32.yaml  | 27 ++++++++++++++++---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |  7 +++--
 .../devicetree/bindings/usb/generic-ehci.yaml |  5 ++++
 3 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.17.1

