Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDFB1F38A5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 12:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbgFIKuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 06:50:08 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55604 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgFIKri (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 06:47:38 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 059AgrtS159525;
        Tue, 9 Jun 2020 10:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=V634sIqAzEcugfWlVFpBbVizQNUZkstFdXIm73939oE=;
 b=Ymcn/bTu1ubls2ghrSKcDPt2xvvKAj/VCSbEfvToWmDK5LfNbq2cuaJphbU6y042Jhh5
 wjBNr20XgEQh2GHi/kklkRDlC9On5iY0gEyJQolo2NuGYHCq+CqbLLMpqTeAmkXTKdaK
 +PScmSYF2OlD7M3Bh/b9nQU7zfpbyUp1RYzq06iutl4xigB9etRkQWHe3gdtY/lcONuM
 SAJvW/zD8PwXahMWXrZACMamzXaTU3k+fl930qHkpxw9Ed9Nl7zxDxQsaKklJ7GjWt6T
 Z9xrXh+zllg89oMnw/lexh22U0X/+/H9Kw5O1ecDoEjvPfGClLHYd7Ceeg2g3fj3P4hV Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31g33m4041-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 09 Jun 2020 10:47:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 059AiNk0079158;
        Tue, 9 Jun 2020 10:47:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 31gmwr77ut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Jun 2020 10:47:04 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 059AksNo000927;
        Tue, 9 Jun 2020 10:46:55 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 09 Jun 2020 03:46:54 -0700
Date:   Tue, 9 Jun 2020 13:46:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Arnd Bergmann <arnd@arndb.de>, Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tuowen Zhao <ztuowen@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH] lib: devres: add a comment about the devm_of_iomap() function
Message-ID: <20200609104642.GA43074@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 cotscore=-2147483648 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006090082
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We recently introduced a bug when we tried to convert of_iomap() to
devm_of_iomap().  The problem was that there were two drivers mapping
the same io region.  The first driver was using of_iomap() and the
second driver was using devm_of_iomap() and the kernel booted fine.
When we converted the first drive to use devm_of_iomap() then the second
driver failed with -EBUSY and the kernel couldn't boot.

Let's add a comment to prevent this sort of mistake in the future.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/devres.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/devres.c b/lib/devres.c
index 6ef51f159c54b..0abe7c1cc4681 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -204,6 +204,12 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
  *	base = devm_of_iomap(&pdev->dev, node, 0, NULL);
  *	if (IS_ERR(base))
  *		return PTR_ERR(base);
+ *
+ * Please Note: This is not a one-to-one replacement for of_iomap() because the
+ * of_iomap() function does not track whether the region is already mapped.  If
+ * two drivers try to map the same memory, the of_iomap() function will succeed
+ * but the the devm_of_iomap() function will return -EBUSY.
+ *
  */
 void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int index,
 			    resource_size_t *size)
-- 
2.26.2

