Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815721F9782
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbgFONAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:00:04 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36530 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730270AbgFONAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 09:00:02 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FCq4WF001659;
        Mon, 15 Jun 2020 14:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=a+/ALK3THVscsxKzBuqYICXhJ6Fgulb3uVPQcBiLSxs=;
 b=oAHfUjpS6HBzDTqripKJQAN/FmyVfvPka6PwfsNHIDu7MjuJEGEHuZC367njC2XIaAnx
 8CLrgYZgHvWjjGwhlQ6ypb/M/+t9o0ajsaQQsiHyCjrWSoj1p92q/pqjG43Vx1j6/FIi
 eoN5tWYEd12bFWbPy/FHgb87gCcEd4Vh/bUTG5CaJVOpiwTfttkbnLJMcCoTyZRlvSq0
 IOPhcb5mzVlDAlcUWbF+N3t0ZoT+O5XF3JIZ6jiAigDHQTkqFTFtqjoyxK0SNR+0smkv
 kkdSnrcHMBsI3oXQ1WHKlvrdZrJmbUK21da07nl+cmRobmrPzoeqmh3TRg41+pAuBxo/ TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mnph1h21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 14:59:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 565CD10002A;
        Mon, 15 Jun 2020 14:59:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D3C72B3613;
        Mon, 15 Jun 2020 14:59:58 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:59:58
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 1/2] pinctrl: stm32: return proper error code in pin_config_set
Date:   Mon, 15 Jun 2020 14:59:50 +0200
Message-ID: <20200615125951.28008-2-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615125951.28008-1-alexandre.torgue@st.com>
References: <20200615125951.28008-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_02:2020-06-15,2020-06-15 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

".pin_config_set" or ".pin_config_group_set" can be called with a
configuration not supported (i.e. PIN_CONFIG_PERSIST_STATE). In this case,
it is more suitable to return -ENOTSUPP instead of -EINVAL.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a657cd829ce6..5d9839beaa07 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1084,7 +1084,7 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
 	default:
-		ret = -EINVAL;
+		ret = -ENOTSUPP;
 	}
 
 	return ret;
-- 
2.17.1

