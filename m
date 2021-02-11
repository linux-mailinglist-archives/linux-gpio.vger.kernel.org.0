Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E6E3185CE
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 08:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhBKHlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 02:41:11 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:35338 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhBKHlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 02:41:06 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11B7dq2w049553;
        Thu, 11 Feb 2021 07:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Xj95ASAjbUV7QJXd/VYGSl4qH3K4T8/ob/2L5yucxTE=;
 b=epCr8gaFVA5EBWAHKhx6XGHGe7IdEqADDtgL5LJEpUs+VrnPLltvlldBmT1yx4eNiiXI
 AkrJIrv7sWjWs/rWcMTBFDDSkKT0K6buS4iJMIV//RY6kvJeq71+oWx33yAeKO1GZ8S+
 qdqrVJKGsWfNGUR0LU3ijzkP+yzRN8BdXN8ObMBonYyeygqhohZZAACc93GPHTr21YIW
 HzDQoYg/47hquPmKKT4+EavD1emFbQDJUNJenS5yNWgaVghxYqJKHrmmdCbeefECgs6/
 ULOaQSArPzklz5lGp++glSD6kvcfPwnLtsRBzNdNweusd9duG2CgMbcH8cIrwuakZHkx Tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 36hkrn6aug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 07:39:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11B7YkQ7025912;
        Thu, 11 Feb 2021 07:39:51 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 36j4vtvbar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 07:39:50 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11B7dljr025561;
        Thu, 11 Feb 2021 07:39:47 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 10 Feb 2021 23:39:46 -0800
Date:   Thu, 11 Feb 2021 10:39:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joe Perches <joe@perches.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210211073938.GL20820@kadam>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
 <20210211071153.GJ20820@kadam>
 <7b4105ca8671a2962910deb5418a934bf07d1458.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b4105ca8671a2962910deb5418a934bf07d1458.camel@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110068
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 11:24:23PM -0800, Joe Perches wrote:
> On Thu, 2021-02-11 at 10:11 +0300, Dan Carpenter wrote:
> > On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> > > +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> > > +	if (ret < 0) {
> > > +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > > +		goto free_gname;
> > > +	}
> > > +	buf[len-1] = '\0';
> > > +
> > > +	ret = sscanf(buf, "%s %s", fname, gname);
> > > +	if (ret != 2) {
> > > +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > > +		goto free_gname;
> > 
> > We need a "ret = -EINVAL;" before the goto.  sscanf doesn't return error
> > codes.  Normally we would write it like so:
> > 
> > 	if (sscanf(buf, "%s %s", fname, gname) != 2) {
> > 		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > 		ret = -EINVAL;
> > 		goto free_gname;
> > 	}
> > 
> > I'm going to write a Smatch check for this today.
> 
> It's a pretty frequently used style:
> 
> $ git grep -P '\w+\s*=\s+sscanf\b' | wc -l
> 327

Yeah.  That's true.  I looked through a couple of those and they were
fine.  (Sample size 2)  But the other format is more common.

$ git grep sscanf | grep = | wc -l
803

I have written a Smatch check to complain whenever we propogate the
return value from sscanf.  I'll let you know tomorrow how that goes.

I should write another check which says "On this error path, we know
sscanf was not equal to the value we wanted but we are still returning
success".

regards,
dan carpenter

