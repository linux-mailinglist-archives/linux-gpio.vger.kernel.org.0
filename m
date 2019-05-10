Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7C71991E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 09:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfEJHmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 03:42:50 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10722 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727010AbfEJHmn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 May 2019 03:42:43 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4A7cYSq028701;
        Fri, 10 May 2019 09:42:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=N1v+zxTZE44tr6xZHlbxMHCvWy6h3ciCGaY/rbHViTk=;
 b=a3QCQoY3R8nEO8Y32dWwA5wH5/dpmNaO2RWr6VTmU7jIFh7vyzTNByjPUx4/8sSFFo0v
 dUAUkMCoQ7Abuptg4YLoUf7Icw2NDODJs4UH/o7Sy+whdv7qTsWtYUJvBQgkz0BYx2kl
 yih3y6T17fxLnL96mLWfALBw7a/4WvR9ANOzySz1AZgK6NdWOiUFodUIepPWGnFuwoZw
 PowJnbuKFkqqrGk+c+oFRxSf79vCD3VmlIaHsVPsjCDda7jWNU06NduMlwo5R8vThEIM
 UspZc+xoPOeUAJ5XTEARNg+F0eSZ26/Vy9nqcOFPiLDgQUDYnyPhabkKjyc94GYy6sZU KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sc9s4gpn3-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 10 May 2019 09:42:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07FFA3A;
        Fri, 10 May 2019 07:42:35 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B752A15AD;
        Fri, 10 May 2019 07:42:35 +0000 (GMT)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May 2019 09:42:35
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 0/2] pinctrl: stm32: add suspend/resume management
Date:   Fri, 10 May 2019 09:42:28 +0200
Message-ID: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During power sequence, GPIO hardware registers could be lost if the power
supply is switched off. Each device using pinctrl API is in charge of
managing pins during suspend/resume sequences. But for pins used as gpio or
irq stm32 pinctrl driver has to save the hardware configuration.
Each register will be saved at runtime and restored during resume sequence.

Regards
Alex


Alexandre Torgue (2):
  pinctrl: stm32: add suspend/resume management
  pinctrl: stm32: Enable suspend/resume for stm32mp157c SoC

 drivers/pinctrl/stm32/pinctrl-stm32.c      | 132 +++++++++++++++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   2 +
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c |   5 ++
 3 files changed, 139 insertions(+)

-- 
2.7.4

