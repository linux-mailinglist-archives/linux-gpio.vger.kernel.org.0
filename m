Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C511EB09F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 23:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgFAVD2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 17:03:28 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37380 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgFAVD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2020 17:03:28 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 051IGOkB133702;
        Mon, 1 Jun 2020 18:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=klYhvleN5+bHtn61y7WVGwD1VVLVcs1uWE0ZQPZDGoA=;
 b=XpxeXoezca5asoGN6eYmhtqWCb0uWLJ+p24yfEsWCpdUE+jBOyMKCU+0HfW8ABik6+5D
 b/9JkCwWFahi4LJ5zZ8D9LpQcUbeZVtfWaDGSCawUrSVAMyPlrnwo4McWwN2WxLTEH3s
 nvsNw2+qt4H8maj/l24WmychyKJAUJSGR0KDsVSUyDSyYPyXye0j9Kq1UaFu3WAIhpyV
 dIQuYbWKfpTbwQfkLxixpmlAQp9wQVoayGzRRGW8VPww8YOaVK6j1Y9XkQtvocbMs5mu
 20q1gicdQ8F1TqrcBaZzgxslNayWq5KUcYdI/19OB1499ZgF/8GfwGmobQWtzUztoz/l GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 31bfem05wg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 01 Jun 2020 18:31:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 051IDrYw029652;
        Mon, 1 Jun 2020 18:31:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 31c25ke6xs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Jun 2020 18:31:13 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 051IVBmD031819;
        Mon, 1 Jun 2020 18:31:11 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 01 Jun 2020 11:31:11 -0700
Date:   Mon, 1 Jun 2020 21:31:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>, daniel@zonque.org,
        haojian.zhuang@gmail.com, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
Message-ID: <20200601183102.GS30374@kadam>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
 <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=1 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006010137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=3 phishscore=0 clxscore=1011
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=3
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006010137
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 01, 2020 at 01:31:23PM +0200, Christophe JAILLET wrote:
> Le 01/06/2020 à 10:58, Robert Jarzmik a écrit :
> > Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> > 
> > > Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> > > has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> > > 'pxa2xx_pinctrl_init()'.
> > > However, the corresponding 'pinctrl_unregister()' call in
> > > 'pxa2xx_pinctrl_exit()' has not been removed.
> > > 
> > > This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> > > Remove it now to avoid some wondering in the future and save a few LoC.
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > 
> > Would be even a better patch with a :
> > Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> 
> I was wondering it was was needed in this case.
> The patch does not really fix anything, as the function is unused. Or it
> fixes things on a theoretical point of view.

There is no concensus...  We should call a vote on this at Kernel
Summit.  :P

regards,
dan carpenter


