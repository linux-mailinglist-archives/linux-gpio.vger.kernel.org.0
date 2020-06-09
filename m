Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21531F3706
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 11:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgFIJYr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 05:24:47 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:48704 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgFIJYr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 05:24:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0599IEua037734;
        Tue, 9 Jun 2020 09:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=hCLLjJLG7pa9rynCDyrT/mK0GXvPMbEJHEyd2NbysaE=;
 b=QwF2jcWs1z7CBp6D9qJbrti2p6Fm8Zn5zeUObKixMdF60HfQSdPXRPUMMCD+l2p3/J9v
 YmYYk567Rok+zNjGJFEShKjejlxZZ0MJwv7KEmMIr5oA12Fg1DC20Et02BRPS1iKvXd+
 yYA7MEr6XQ8OEHjwCVqoGeXQcHCWK7z/j2VYJwEYk6CWKS9ue0aFGi02EZqyuqG4fA4J
 TZFgQzVPMs3TxIDR33XZjQ4MIk71GsWtLVw27gSQ3MehGaSJiLD38Pd78r6kkwJhDjxU
 vd+1jvCtNI874eJpgT5VtVfA0kxss0GdIvbIO3+RMada7F3kj36VS7Ehtq5BzMzccIDI 7g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 31g2jr3p9r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 09 Jun 2020 09:24:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0599HfU3040258;
        Tue, 9 Jun 2020 09:24:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 31gn2wcu8v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Jun 2020 09:24:29 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0599OQbq027216;
        Tue, 9 Jun 2020 09:24:26 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 09 Jun 2020 02:24:25 -0700
Date:   Tue, 9 Jun 2020 12:24:16 +0300
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
Message-ID: <20200609092416.GV22511@kadam>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200608144830.GT22511@kadam>
 <AM6PR04MB496677335CAD190F8F888D9880820@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB496677335CAD190F8F888D9880820@AM6PR04MB4966.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006090071
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 09, 2020 at 03:22:31AM +0000, Aisheng Dong wrote:
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, June 8, 2020 10:49 PM
> > 
> > On Mon, Jun 08, 2020 at 02:06:35PM +0000, Aisheng Dong wrote:
> > > > From: haibo.chen@nxp.com <haibo.chen@nxp.com>
> > > > Sent: Monday, June 8, 2020 6:00 PM
> > > >
> > > > This patch block system booting, find on imx7d-sdb board.
> > > > From the dts we can see, iomux and iomux_lpsr share the memory
> > > > region [0x30330000-0x3033ffff], so will trigger the following issue:
> > > >
> > > > [    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl
> > > > driver
> > > > [    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for
> > > > resource [mem 0x30330000-0x3033ffff]
> > > > [    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error
> > -16
> > > >
> > > > This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.
> > 
> > Btw, the `git revert` command really sets you up for failure by generating a patch
> > in the wrong format.  You did well to write a good commit message.  I would
> > probably also change the subject, the From:
> > header and add a Fixes tag and a Signed-off by.  The Fixes tag should
> > be:
> > 
> > Fixes: ba403242615c ("pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a
> > resource leak in case of error in 'imx_pinctrl_probe()'")
> > 
> 
> By searching the kernel log, it seems most people didn't add Fixes tag for a Revert patch.
> But anyway, I'm fine to add it.

Yeah.  It's really complicated to get revert patches right.  The revert
command was created 15 years ago and it doesn't match what we expect
from commits today.  Commit 40da7d9a93c8 ("NTB: Revert the change to use
the NTB device dev for DMA allocations") is an example of a well written
revert commit.

I'm sort of surprised that patches where the subject starts with Revert
don't break Greg's email sorting scripts.

regards,
dan carpenter

