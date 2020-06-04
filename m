Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C801EDFCE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 10:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgFDIbu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 04:31:50 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34318 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgFDIbt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 04:31:49 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0548S7eE162710;
        Thu, 4 Jun 2020 08:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=+U9pBSfXjXliRGgKHYuTmpAMur9djQ6OelvtEfxEzig=;
 b=UO/LN4Bzs6xjnoWtETZZ9tUKZi4IMXwj8kxT3lDrze66+DSq4UYaQiVpuocgZ06E6dPw
 zTdJ6CqCbO/4qG+IQcpHUA9vL5TruB9frU7HjIxssuyCJDZuFlcEEqZX1PB8Oy5VRzD3
 3HLknCF6aeDGKs8Pyb+uO2rudpgM85OgLzpEac/Vn/kuwNWYNcpUGqKKpIiturlJQkSn
 loymQNZZIz/wVm+kZBlNzDnJlKDBB1OiqGKWgNuJlBS8tZtpSWOlJohD4LYzTd+wZOsV
 msAF445HU/jAKAVI9QqBklUp4yzhv7ynQSdBSjiGWzVf2B+3F6qba7kEj3ciKfUKcCZj QQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 31evvn06hp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 04 Jun 2020 08:31:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0548TMjT116781;
        Thu, 4 Jun 2020 08:31:37 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 31c1e1dqyu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Jun 2020 08:31:37 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0548VVjI025648;
        Thu, 4 Jun 2020 08:31:31 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Jun 2020 01:31:30 -0700
Date:   Thu, 4 Jun 2020 11:31:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
Message-ID: <20200604083120.GF22511@kadam>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
 <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
 <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006040058
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 cotscore=-2147483648 suspectscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006040058
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 12:08:49AM +0200, Linus Walleij wrote:
> On Mon, Jun 1, 2020 at 8:31 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Mon, Jun 01, 2020 at 01:31:23PM +0200, Christophe JAILLET wrote:
> > > Le 01/06/2020 à 10:58, Robert Jarzmik a écrit :
> > > > Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> > > >
> > > > > Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> > > > > has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> > > > > 'pxa2xx_pinctrl_init()'.
> > > > > However, the corresponding 'pinctrl_unregister()' call in
> > > > > 'pxa2xx_pinctrl_exit()' has not been removed.
> > > > >
> > > > > This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> > > > > Remove it now to avoid some wondering in the future and save a few LoC.
> > > > >
> > > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > > >
> > > > Would be even a better patch with a :
> > > > Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> > >
> > > I was wondering it was was needed in this case.
> > > The patch does not really fix anything, as the function is unused. Or it
> > > fixes things on a theoretical point of view.
> >
> > There is no concensus...  We should call a vote on this at Kernel
> > Summit.  :P
> 
> Fixes means it fixes something that was wrong in that commit.
> That's all. Whether syntactic or semantic or regression or
> serious or not does not matter. It is also not compulsory to
> add it is just helpful.

Fixes tag should be compulsory for actual bug fixes.  We had a the
Bad Binder exploit last year because commit f5cb779ba163
("ANDROID: binder: remove waitqueue when thread exits.") had no Fixes
tag and wasn't backported to Android kernels.

regards,
dan carpenter

