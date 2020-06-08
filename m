Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0171F1B66
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 16:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgFHOuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 10:50:51 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:58878 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730050AbgFHOuv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 10:50:51 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058EmHPe105357;
        Mon, 8 Jun 2020 14:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=FHM+GoJIjL+b7tNyM+HM8MLuQws2nQzjSX1euKi+Bd0=;
 b=EYLtJ/p51gHOhTb52ef0O+ePYx19QJdCDEUBA+uoItWD6Mxqhvs5E4OXKx5mvCcgdEXB
 D2Ze/clcKATuxrTxXu10OcPitLFKQpNajoHaXY834GhJ+oMP4KILf75Z3bBkgT2x2sQ8
 820fGxevRY1tfpY6Llw7H4aBklLXCM52QBwzv2QlNTXefc7tWyKwKY2lIotl+PRDDB6j
 4SiMmQy8c+wnjUTO5S011VGHD8QGOnAOAepTb7X0t9bD3MBm8rQC+sz8LE8BukqT1YgA
 fEb8pOZDok7DEEIhRP1/zRvEaVlhFlD6wSo9fpWzcH1xd1mfxx3uV/jNefwcHPNQlsxj xQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 31g2jqya7v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 08 Jun 2020 14:50:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058EiM1D123507;
        Mon, 8 Jun 2020 14:48:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 31gmwq1k71-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Jun 2020 14:48:39 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 058EmcQr011486;
        Mon, 8 Jun 2020 14:48:38 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 08 Jun 2020 07:48:37 -0700
Date:   Mon, 8 Jun 2020 17:48:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Message-ID: <20200608144830.GT22511@kadam>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006080110
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 08, 2020 at 02:06:35PM +0000, Aisheng Dong wrote:
> > From: haibo.chen@nxp.com <haibo.chen@nxp.com>
> > Sent: Monday, June 8, 2020 6:00 PM
> > 
> > This patch block system booting, find on imx7d-sdb board.
> > From the dts we can see, iomux and iomux_lpsr share the memory region
> > [0x30330000-0x3033ffff], so will trigger the following issue:
> > 
> > [    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl
> > driver
> > [    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for
> > resource [mem 0x30330000-0x3033ffff]
> > [    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16
> > 
> > This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.

Btw, the `git revert` command really sets you up for failure by
generating a patch in the wrong format.  You did well to write a good
commit message.  I would probably also change the subject, the From:
header and add a Fixes tag and a Signed-off by.  The Fixes tag should
be:

Fixes: ba403242615c ("pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'")

regards,
dan carpenter

