Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916F71EE984
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 19:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgFDRf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 13:35:28 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44250 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730155AbgFDRfZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 13:35:25 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 054HWaC0121293;
        Thu, 4 Jun 2020 17:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ObplRmi+jG9I0z1J/0oKAqoN5PRaLJMQ+tKAUmH6AIQ=;
 b=fbZF3pI3xe7DX9q9YqsNNsLicfihlLjOi4/H9UCVXJovOGUnRapo9epGMpoyrs4d1VTN
 RYzCZkDH7ROKr3hPGgv1EG090F210wkrzNRtBb4nJM7dzwVC+XbFEwSVDnkuJxCsz12Z
 Pt5OnwLV9DjmLyhvpyEJ/o/bAIDkn4PwZoeO83E2I/CKKGuftU9/f38MedDKI9SeC0dF
 2CQ3KJhVLCM6lwWXlTZD5KR8kTUGl2bpUwg+61Vx44zcjoQoWueh44jfU7tzde/aNY0F
 PjNwPbvdWoz6u5viCZcxEC27LqAX8pORCIH33Bm5cYHVa631RUccSsIlnlIz0JtKV1PF vw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 31evap2yuw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 04 Jun 2020 17:35:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 054HY4cT091154;
        Thu, 4 Jun 2020 17:35:11 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 31c25vux74-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Jun 2020 17:35:11 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 054HZ9uA027835;
        Thu, 4 Jun 2020 17:35:09 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Jun 2020 10:35:08 -0700
Date:   Thu, 4 Jun 2020 20:35:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joe Perches <joe@perches.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
Message-ID: <20200604173500.GI22511@kadam>
References: <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
 <20200604083120.GF22511@kadam>
 <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
 <alpine.DEB.2.21.2006041147360.2577@hadrien>
 <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
 <alpine.DEB.2.21.2006041228520.2577@hadrien>
 <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
 <alpine.DEB.2.21.2006041328570.2577@hadrien>
 <20200604123038.GG22511@kadam>
 <0749ac5e3868c6ba50728ced8366bfd86b0b8500.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0749ac5e3868c6ba50728ced8366bfd86b0b8500.camel@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040122
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 09:08:44AM -0700, Joe Perches wrote:
> On Thu, 2020-06-04 at 15:30 +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2020 at 01:42:12PM +0200, Julia Lawall wrote:
> > > OK, I recall a discussion with Dan where he suggested that some things
> > > that were not actually bug fixes could also merit a Fixes tag.  But it's
> > > probably better if he weighs in directly.
> > 
> > I generally think Fixes should only be used for "real bug" fixes.
> > 
> > The one exception is when I'm reviewing a patch that fixes an "unused
> > assignment" static checker warning is that I know which commit
> > introduced the warning.  I don't have strong feelings if it's in the
> > Fixes tag or if it's just mentioned in the commit message.
> 
> My view is that changes that silence compiler warnings are
> not fixing bugs and that these changes should generally not
> be backported.
> 

The Fixes tag is useful for backports but that's not whole the point of
it.  It's also for collecting metrics.  Also sometimes we fix the bug
before the kernel is released so the Fixes tag means we can automatically
ignore those ones when we look at which patches to backport.

I don't care if the "unused assignment" patches use a Fixes tag or just
mention the commit.  Either way the information is there for when I
review the patch.

regards,
dan carpenter

