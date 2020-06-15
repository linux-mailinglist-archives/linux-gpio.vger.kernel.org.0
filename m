Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B381F973A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbgFOMy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:54:27 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:22274 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730218AbgFOMyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:54:24 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FCqnb7011050;
        Mon, 15 Jun 2020 14:54:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=kkty9Awoo0IVXf8uf5q3BXusDQstQvIXLN4JcfqXozQ=;
 b=aaQD18t4rb6P5c/PYFhR4q/GpllK+j9kYF9tPGd4latDf9n9WOTwJROgTVO37g+k95b7
 Oq7+yeiWcG239NEkE1UOsbfz1dqKG2E1enAMmX/6aAa7WnLP8T4TUucOkQWEabHirVC2
 2WDy85YUzUJGQtoZKny0bnC3J9qJvMmeHkmmePIAv4HHspZn8xbIcCw/oryi8MqLE7dy
 sqwM6r3ELVIbGD3lD1cmixl35c7BDWJHl/WhDhOXU4W3AcDXbJ4ex7klr+ioSVrJvMIp
 BkMUJCzoEAgQPy/ciBqdkC8MRlvTGXsCuLrRbDnZbCPHvGml4ew3IKwW2Ft/P+5lGvuF fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvspcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 14:54:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BEC610002A;
        Mon, 15 Jun 2020 14:54:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8119F2B35E0;
        Mon, 15 Jun 2020 14:54:21 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:54:21
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 0/2] pinctrl: stm32: add changes to better manage
Date:   Mon, 15 Jun 2020 14:54:05 +0200
Message-ID: <20200615125407.27632-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_02:2020-06-15,2020-06-15 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Clocks and resets for GPIO banks could be defined but not yet ready when
stm32 pinctrl is probed. This series adds changes to manage probe defer
when a clock or a reset is not yet registered in the system.

regards
alex

Etienne Carriere (2):
  pinctrl: stm32: don't print an error on probe deferral during clock
    get
  pinctrl: stm32: defer probe if reset resource is not yet ready

 drivers/pinctrl/stm32/pinctrl-stm32.c | 35 +++++++++++++++++++--------
 1 file changed, 25 insertions(+), 10 deletions(-)

-- 
2.17.1

