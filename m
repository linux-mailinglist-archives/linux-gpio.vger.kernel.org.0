Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A94125DA4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSJ2J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:28:09 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:51624 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726599AbfLSJ2J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 04:28:09 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBJ9Rwt2005346;
        Thu, 19 Dec 2019 03:27:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=r5zL0mWbhXUAlQ6GTa/5A4wMXYncj5xrQu/3spYSd70=;
 b=JJTzD+dagB42aszPNCXvj5ZyAR6hwpVRaicZMzidXv3ZYJvVdnbflQdYYv0dmFSu2A4W
 3TT0pRwr3hoED+EcVXyt1O1Diq7vx4m8FET5j5FEf1JSr1C5d2vSBf8GU06LJLLss/A9
 sGQ3BYWIGLy5t7WbfLtaMmRJ7jXYu1JEcQ/dXSqjcHG8bAsT6wQxHnvzKcVNxZfIXWjd
 BJWZGEgMnl0KMOPu5f1jV73xXKi54eFhvw4mJ8tgQnc03+AR1LSoYBEboqq7Tcnlkzsi
 713zIwvStQdkubA/R2ka0cjInafK6avnSFiz1e2Xigp0t3caGWpwA4lkzAR7WD9NN2EF dw== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
        by mx0a-001ae601.pphosted.com with ESMTP id 2wyynh8g5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 Dec 2019 03:27:58 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Dec
 2019 09:27:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 19 Dec 2019 09:27:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F3012A1;
        Thu, 19 Dec 2019 09:27:52 +0000 (UTC)
Date:   Thu, 19 Dec 2019 09:27:52 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: lochnagar: select GPIOLIB
Message-ID: <20191219092752.GF10451@ediswmail.ad.cirrus.com>
References: <20191218163701.171914-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191218163701.171914-1-arnd@arndb.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 suspectscore=2 mlxlogscore=794
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190080
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 05:36:46PM +0100, Arnd Bergmann wrote:
> In a rare randconfig build I came across one configuration that does
> not enable CONFIG_GPIOLIB, which is needed by lochnagar:
> 
> ERROR: "devm_gpiochip_add_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_generic_free" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_generic_request" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_get_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> 
> Add another 'select' like all other pinctrl drivers have.
> 
> Fixes: 0548448b719a ("pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
