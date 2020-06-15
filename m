Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC3E1F9667
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbgFOMSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:18:34 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:43456 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbgFOMS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 08:18:26 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05FCHIv9071938;
        Mon, 15 Jun 2020 12:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=kQq+4iR9f0rg4BQj2QPvNvq5A+juMIZDREpSm4s68U0=;
 b=uT4s2Uk+FczEXZYGYtBZhFKlBiDXJvvNy/r5hwSh7jheDZMMHPyq8ip75l46yrorq8WT
 HBKpZWLodZod7aPIop7+peQrTwjgKjeKUqY2crRblOoVhY4yBxShmLXovcSI3EAFyhkd
 oWbfguM7lIxWF2l8sM5MrcbJJnDfgs2a3Qid0+GJ+CsLAApHTUbDkoc5Cb4XzSljgOH4
 b7BLp4HTIzGHwEyIfsSaVvxpd1ZP9hu64Ac3HDnKuS5jo9Fnh5odP4uZZ+ejggYOPiAc
 0wZ55cy+0/oK3ffbTjAxsKKf9yDzrOEeS2cFf1vsH3Q4wzFI4RzXh1DBeB5AGNat73pp ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 31p6e7rpv8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jun 2020 12:17:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05FCE5cB113337;
        Mon, 15 Jun 2020 12:15:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 31p6s56wmk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 12:15:37 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05FCFUEp032563;
        Mon, 15 Jun 2020 12:15:30 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 15 Jun 2020 05:15:29 -0700
Date:   Mon, 15 Jun 2020 15:15:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com, aalonso@freescale.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid
 a resource leak in case of error in 'imx_pinctrl_probe()'
Message-ID: <20200615121520.GK4282@kadam>
References: <20200602200626.677981-1-christophe.jaillet@wanadoo.fr>
 <20200613154954.GA98985@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200613154954.GA98985@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006150099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 cotscore=-2147483648 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150100
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 13, 2020 at 08:49:54AM -0700, Guenter Roeck wrote:
> On Tue, Jun 02, 2020 at 10:06:26PM +0200, Christophe JAILLET wrote:
> > Use 'devm_of_iomap()' instead 'of_iomap()' to avoid a resource leak in
> > case of error.
> > 
> > Update the error handling code accordingly.
> > 
> > Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> When booting mcimx7d-sabre in qemu, his patch results in:
> 
> [    1.835341] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl driver
> [    1.839702] imx7d-pinctrl 30330000.pinctrl: can't request region for resource [mem 0x30330000-0x3033ffff]
> [    1.840261] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16

Yeah.  Sorry about that.  We had to revert that patch.

The problem is that that devm_of_iomap() tracks if the regions are
already used and of_iomap() does not.  In this case there were two
places mapping the same memory.  I added a comment about that to the
devm_of_iomap() so hopefully we won't introduce bugs like this in the
future.

regards,
dan carpenter


