Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46293A28FA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 12:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFJKGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 06:06:30 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54466 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhFJKGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 06:06:30 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AA3vn2078475;
        Thu, 10 Jun 2021 10:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=lAlXKTUYFVtdYmGMQ6HXL059Okrk6IgLJMPdlUwF2C4=;
 b=oaHcKDFf3rOWnc11Kr5RMZNEygl3zK3A9YiggP2xONU5/O5TI2m4t4njQEqW+NgtRjC9
 wJUhWWuJLLSKYdDFUGf/2J4afxveQpRS3SuiKpraqx4HggElbymrkt9O2S1U2NzR3wSX
 e9a0kJh2pAC9SIr3OxSh5+Ykr1EOLkJ399npMkbLzc/x6DSGL6pCK4I+2v/q7/9R/6MI
 y0Cnl4oBKsyN/4KcIiFbxDFg9wtH+yNP3Nn2O7vKXIIZLOCninC9rb5grJrkVJVzP8cw
 qVI+m+GmxUvPirGoBcrkPoJwQ2eLEhJVqOcRBtDoo0oGgXITlmJmI49OYXhV8eXaBrIK VA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 39017nkjyj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Jun 2021 10:04:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AA19OY004916;
        Thu, 10 Jun 2021 10:04:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 390k1su7yn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Jun 2021 10:04:28 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15AA4S4D009578;
        Thu, 10 Jun 2021 10:04:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 390k1su7yd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Jun 2021 10:04:28 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15AA4PXi023282;
        Thu, 10 Jun 2021 10:04:26 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Jun 2021 03:04:25 -0700
Date:   Thu, 10 Jun 2021 13:04:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Radim Pavlik <radim.pavlik@tbs-biometrics.com>
Cc:     linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: mcp23s08: missing unlock in mcp23s08_irq()
Message-ID: <YMHjoagGxEfVBW1t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: Zj75F3jTtF3FPWtg9tAUQVqv5YWs_Pok
X-Proofpoint-ORIG-GUID: Zj75F3jTtF3FPWtg9tAUQVqv5YWs_Pok
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10010 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106100066
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This code needs to drop the lock before returning.

Fixes: 897120d41e7a ("pinctrl: mcp23s08: fix race condition in irq handler")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 799d596a1a4b..d0259577934e 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -353,7 +353,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 
 	if (intf == 0) {
 		/* There is no interrupt pending */
-		return IRQ_HANDLED;
+		goto unlock;
 	}
 
 	if (mcp_read(mcp, MCP_INTCAP, &intcap))
-- 
2.30.2

