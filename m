Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893A73D3B1E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbhGWMsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:05 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:49120 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235072AbhGWMsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:03 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDDRWV020340;
        Fri, 23 Jul 2021 15:28:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=awDnnbvaQDlhaGIqUJdPGXponCoQuQxoZArIjRJUl0I=;
 b=hGQHlMGZT1gIKZHMQco8fOtAbac8CyBAKc4mwyfh8SjeBFvvxwgR9I1/eZnxpqQr25Xn
 aHyrjM2XsZjjVE44mtnbYmSjPp86XAxlBQqS05LdudYqVWltyGDucHyLQhp4scZvTCkh
 iIx0Wm5aSDntTjPsbvW0MvvyTAGvG+FDjD6KcEdPd4k+pNiuhsWQfIXM83K3VURvFBhe
 rxr5EZgrnqfdh0eozxc0cDVI0cn6a/A3qj0v2t7TTVymaZ1cR1v1XkBrwDNqMUlxRVXN
 rPET0G1viydNEOkxkboWoNnnFv5i9JmKXr4XXFf8W0bD1L/72APrP9A9h6zxo4O2pT3k 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39yt689gnt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77204100034;
        Fri, 23 Jul 2021 15:28:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CF1A221784;
        Fri, 23 Jul 2021 15:28:13 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:12
 +0200
From:   Alexandre Torgue <alexandre.torgue@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 1/7] dt-bindings: pinctrl: stm32: add new compatible for STM32MP135 SoC
Date:   Fri, 23 Jul 2021 15:28:04 +0200
Message-ID: <20210723132810.25728-2-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_05:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

New compatible to manage ball out and pin muxing of STM32MP135 SoC.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 72877544ca78..dfee6d38a701 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -24,6 +24,7 @@ properties:
       - st,stm32f746-pinctrl
       - st,stm32f769-pinctrl
       - st,stm32h743-pinctrl
+      - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
 
-- 
2.17.1

