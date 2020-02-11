Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18252158A82
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 08:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgBKHgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 02:36:45 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40634 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgBKHgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 02:36:44 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01B7WUVK132531;
        Tue, 11 Feb 2020 07:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=TyxNlR/PF6Q3VREoLHEFpP0iJEP9FxqYi4/FcLRChLk=;
 b=DaoHi7JUfgTFUgIoSRSZwsJ74lW8Cd3JoW9r2xkfylwh+LXS9g2VqGY4pKGNW4ucS4PR
 SzPIsslGcWTBywmNJrpeXgf0lFRaY5vYyIEmyNeAmlfqO+QCb50opqQCDO/QV+DhEkcE
 i39JXL34Tdy6wwpotGrCS9I7AulSwiRJEHgIwx1uQPs29qS/3h1rYjkGltQPAdUoSTOh
 k/nPmUTWjAvoMGTRV8l3Cp2xHd+gR3QnKmVyVk8q1jQIMLLGl4NMsYP5Sd13r+Hd1oGp
 ELIE2wytTzFuKxaqMgyk0z/WfxfYWKjeeZ3b0KnZaCU56aA4MdCCILtsqpkZraoSWDCi pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2y2k881f5e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Feb 2020 07:35:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01B7WAkR138379;
        Tue, 11 Feb 2020 07:35:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2y26huend5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Feb 2020 07:35:54 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01B7ZqMq009230;
        Tue, 11 Feb 2020 07:35:52 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 Feb 2020 23:35:52 -0800
Date:   Tue, 11 Feb 2020 10:35:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thorsten Scherer <t.scherer@eckelmann.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Gavin Schenk <g.schenk@eckelmann.de>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: siox: potentially enabling IRQs too early
Message-ID: <20200211073511.r24n3bygyjxrsuez@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110053
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Smatch thinks that gpio_siox_irq_set_type() can be called from
probe_irq_on().  In that case the call to spin_unlock_irq() would
renable IRQs too early.

Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpio/gpio-siox.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 311f66757b92..578b71760939 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -133,10 +133,11 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
 	struct irq_chip *ic = irq_data_get_irq_chip(d);
 	struct gpio_siox_ddata *ddata =
 		container_of(ic, struct gpio_siox_ddata, ichip);
+	unsigned long flags;
 
-	spin_lock_irq(&ddata->irqlock);
+	spin_lock_irqsave(&ddata->irqlock, flags);
 	ddata->irq_type[d->hwirq] = type;
-	spin_unlock_irq(&ddata->irqlock);
+	spin_unlock_irqrestore(&ddata->irqlock, flags);
 
 	return 0;
 }
-- 
2.11.0

