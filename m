Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 086391991A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 09:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfEJHmo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 03:42:44 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5118 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727159AbfEJHmo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 May 2019 03:42:44 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4A7cWJe028672;
        Fri, 10 May 2019 09:42:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Q4CttDSeHlGs3NyMtzY/R45bn2jdu2ftuKzuZpOJ83E=;
 b=lhNNj13PJ8w6uEjIvetr4ONcJ5zGcFiLzeeEtym0o5IxMHTBS2FCLdhS2GbTtLYck3CL
 hXMv1hp2RwH0N8GXywkZPgbhNgLrQddNjHYhKL9jea1id2YGjfbNfIqH6jpSxicGn6bS
 XZzk/JxOpheseE5PiRMuges+urbv3NZji9r3RaDmkJauOhEaAAHWVDkz1iMBRmqARBtL
 jmm7lzlCvbAoxEmZTw/8btxLzwOmgtE4tIp8xX3xK9nnti2sisZBtMXV21pN/4lxU4ry
 W5KjYrVDYpeHwOPUskASybPKzyDenH1tliEuBQyvV98pW2czd3e/x2LZ4gH4tPXmWOu6 ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sc9s4gpn7-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 10 May 2019 09:42:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69EEC3A;
        Fri, 10 May 2019 07:42:37 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F6315AB;
        Fri, 10 May 2019 07:42:37 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May 2019 09:42:36
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 2/2] pinctrl: stm32: Enable suspend/resume for stm32mp157c SoC
Date:   Fri, 10 May 2019 09:42:30 +0200
Message-ID: <1557474150-19618-3-git-send-email-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Apply suspend/resume management for stm32mp157c MPU.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
index 320544f..2ccb99d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
@@ -2342,11 +2342,16 @@ static const struct of_device_id stm32mp157_pctrl_match[] = {
 	{ }
 };
 
+static const struct dev_pm_ops stm32_pinctrl_dev_pm_ops = {
+	 SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, stm32_pinctrl_resume)
+};
+
 static struct platform_driver stm32mp157_pinctrl_driver = {
 	.probe = stm32_pctl_probe,
 	.driver = {
 		.name = "stm32mp157-pinctrl",
 		.of_match_table = stm32mp157_pctrl_match,
+		.pm = &stm32_pinctrl_dev_pm_ops,
 	},
 };
 
-- 
2.7.4

