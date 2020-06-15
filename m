Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796B11F9784
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730081AbgFONAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:00:04 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:49544 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730267AbgFONAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 09:00:01 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FCrtX6032708;
        Mon, 15 Jun 2020 14:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=oi/6CIu6hVas5iNZUeHi3AM89JZcZHcG025NTbOHqXo=;
 b=WNf7upJmZQ9CnxPSTRdoUHRc8u3ybD1h2qttVUSkLg8VSn+ADjlxpH8E3wqkSvR/4s2X
 EAAYr6t/VJ4XRWnRqux4ZDh3Dm3N4dS5m2cRD9WgBNw8YLLlKlYQNQJ156AziPM7pGMI
 YQ1yPM9LKJ44hZI4hCswO9YLAptmfo6rAV3rthu2X+zQF7M7kbgyo4VyKGapglafDjva
 ippAz3IGgv+V4d38CskbClon4qe4d/P7C5D7NU4ZZpIdBld9VKPqTKA5e0L0DDBhUu0H
 fugvuM+HJ6HWBMMglJdFmOKzwx/9t19+ohYXJ+wQR7bIdyOWJgy0K2YIQyxU4LwZQ2p7 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mm91hsf7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 14:59:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 995FE10002A;
        Mon, 15 Jun 2020 14:59:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C62D2B3612;
        Mon, 15 Jun 2020 14:59:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:59:57
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 0/2] pinctrl: stm32: Add possibility to configure only one pin
Date:   Mon, 15 Jun 2020 14:59:49 +0200
Message-ID: <20200615125951.28008-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_02:2020-06-15,2020-06-15 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Currently stm32 pinctrl driver offers only the possibility to configure pins
groups thanks "pin_config_group_set" callback. To configure pins thanks to the
GPIOlib (i.e. GPIO_PULL_UP ...) this driver needs also to support
"pin_config_set" callback.

Regards
Alex

Alexandre Torgue (2):
  pinctrl: stm32: return proper error code in pin_config_set
  pinctrl: stm32: add possibility to configure pins individually

 drivers/pinctrl/stm32/pinctrl-stm32.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

-- 
2.17.1

