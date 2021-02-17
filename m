Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB05631D677
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 09:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhBQITn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 03:19:43 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:44632 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhBQITn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 03:19:43 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H8EVJ8194598;
        Wed, 17 Feb 2021 08:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=8Fd3YC/y7oHuWnHytgKLmnWCvXnmiTYOYH8Mln3sbJY=;
 b=GDAJKbTFlLr22rRwMyqvjbaN1iVbN9tmnVf7/7hGlA6iXJ8ny3/ubVdyKZp+0dbMOGsr
 dw1ez+T/qPpyZVikS8R0HEpoKVjs6Fpk5Ors+amC6tTToxmJ3ePLYvCidY1+Yiy8nBCM
 Qq7ptHgOk58bBzKWKZCSi0mAH/5komnQK5ViIM/HvTDjPMM1OR2AUv8ypTtOrOOze/N2
 qjBvrbjQIyAgHeEFz1ZL1r6HFesqJx/DdXiPmK8vg4ewn81BPvZm9582IFOefTqrNUF6
 cfm+m41PobmwRRmhrbv++O4+SZMjMxINWSwDfu5dl538+6q0Q1K4mkICB7bbzKso9S7c zQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 36p7dnhcf2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 08:18:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H8G6Pt051826;
        Wed, 17 Feb 2021 08:18:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 36prpxup0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 08:18:43 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11H8Ib4Z024550;
        Wed, 17 Feb 2021 08:18:37 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 17 Feb 2021 00:18:36 -0800
Date:   Wed, 17 Feb 2021 11:18:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Joe Perches <joe@perches.com>,
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
Message-ID: <20210217081826.GJ2222@kadam>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
 <20210211071153.GJ20820@kadam>
 <7b4105ca8671a2962910deb5418a934bf07d1458.camel@perches.com>
 <20210211073938.GL20820@kadam>
 <20210212033533.GA347396@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212033533.GA347396@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170061
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170061
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 07:35:33PM -0800, Drew Fustini wrote:
> On Thu, Feb 11, 2021 at 10:39:38AM +0300, Dan Carpenter wrote:
> > On Wed, Feb 10, 2021 at 11:24:23PM -0800, Joe Perches wrote:
> > > On Thu, 2021-02-11 at 10:11 +0300, Dan Carpenter wrote:
> > > > On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> > > > > +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > > > > +		goto free_gname;
> > > > > +	}
> > > > > +	buf[len-1] = '\0';
> > > > > +
> > > > > +	ret = sscanf(buf, "%s %s", fname, gname);
> > > > > +	if (ret != 2) {
> > > > > +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > > > > +		goto free_gname;
> > > > 
> > > > We need a "ret = -EINVAL;" before the goto.  sscanf doesn't return error
> > > > codes.  Normally we would write it like so:
> > > > 
> > > > 	if (sscanf(buf, "%s %s", fname, gname) != 2) {
> > > > 		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > > > 		ret = -EINVAL;
> > > > 		goto free_gname;
> > > > 	}
> > > > 
> > > > I'm going to write a Smatch check for this today.
> > > 
> > > It's a pretty frequently used style:
> > > 
> > > $ git grep -P '\w+\s*=\s+sscanf\b' | wc -l
> > > 327
> > 
> > Yeah.  That's true.  I looked through a couple of those and they were
> > fine.  (Sample size 2)  But the other format is more common.
> > 
> > $ git grep sscanf | grep = | wc -l
> > 803
> > 
> > I have written a Smatch check to complain whenever we propogate the
> > return value from sscanf.  I'll let you know tomorrow how that goes.
> > 
> > I should write another check which says "On this error path, we know
> > sscanf was not equal to the value we wanted but we are still returning
> > success".
> > 
> > regards,
> > dan carpenter
> > 
> 
> Thank you for comments regarding sscanf().  And also thank you for the
> LF mentorship session on smatch this morning.  It helped me understand
> it much better.

Good deal!

The warning about propagating errors from sscanf caught a couple bugs.
The one about returning success if sscanf failed didn't catch anything.

The sscanf overflow patch didn't find anything either, but I think we've
had those bugs in the past and so I expect some in the future so I will
keep that one in my private tests without pushing it.

regards,
dan carpenter

