Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272271F1B3B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 16:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgFHOpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 10:45:02 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40472 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729958AbgFHOpB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 10:45:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058Ed6W4177254;
        Mon, 8 Jun 2020 14:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Ng2DZMEEFt6us9y/d3tf/ej/fd16SJO3Qp6cqK8UaYc=;
 b=tC+NAthJIAF0mA6zj9xNkSMsqtInLknvWz924TxVGh2xjttS9EoeY8odc6MjhgmI3PnO
 oYkfvsRHXbvrthnpTCFKMB6Uot8TL2n/HPmfw33W0Yl98qYJaA42A5k/yBG1xE5ehRxY
 FeZIBYa+/4dEizdtvWN0ig25dK6CkkB4utcQET6+iohd0s8K83dKqMqEordYAbCXzI8e
 Hur/RoEYfOw2NhqXJ9xCV66rOI2eBXu0HN5JOz45lBz8zCFgZPpPE+pjovMT094otH+P
 wM4O1c2AdyQJJKipjJtRfe2X9WNrB/npxG5oLzeFoeDp3qWBOzmdjckVlwy4EZuepBnx 7Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 31g3smq5w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 08 Jun 2020 14:44:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058EhmRw013233;
        Mon, 8 Jun 2020 14:44:41 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 31gmqmag1c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Jun 2020 14:44:41 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 058EidNZ009474;
        Mon, 8 Jun 2020 14:44:39 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 08 Jun 2020 07:44:38 -0700
Date:   Mon, 8 Jun 2020 17:44:31 +0300
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
Message-ID: <20200608144431.GS22511@kadam>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 cotscore=-2147483648 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080109
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
> 
> Better add your sign-off.
> Otherwise:
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Maybe you or Christophe could resubmit another proper fix for the original issue.

I'm really sorry about that.  This was largely my fault.

I still don't understand how commit ba403242615c caused a problem.

It sounds like in the original code ipctl->input_sel_base was released
somehow?  I do a `git grep input_sel_base` and it doesn't show anything.
What am I missing?

regards,
dan carpenter

