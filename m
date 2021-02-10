Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E787316FA2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 20:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhBJTGr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 14:06:47 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51986 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhBJTGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 14:06:44 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11AJ4aeD162805;
        Wed, 10 Feb 2021 19:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wJepcm1G3WY4luzOFFwanPvz7D03bJCF3/6VVjzKfs8=;
 b=We/AJ+CnE3Yo4RIreHwhZCi91BQ5thRZUlodewhIaBfOZehW48Gmh7cE6o+wNn00+Z+z
 ucfaNG3J3B4urgiTva03GEmdydUy6T0Jm+0tm8GjS3X2ciFxTy1vqa0cuVkJ3Mgw8NCl
 cBa3aBxU7b7RFeWFqeN4CM9Q2toZ7Zkm5xGxcTWNMMeTtDLySPT211zQgkHsAs5rzcNj
 hUMZu8EoPhXbQB5PDiIf3TMu/D9AzNHfBKxo8rjBlHt2kG9Q4c49pROLaxhxateEgixf
 RnPCffN0MRLkbp0rOKE+Rpaq9gNHp4KXwBr003bDn8bh2DGI75bavAsH255hB6naI8J1 8A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 36hjhqvqee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Feb 2021 19:05:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11AJ54sl144233;
        Wed, 10 Feb 2021 19:05:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 36j51xys52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Feb 2021 19:05:46 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11AJ5iai031925;
        Wed, 10 Feb 2021 19:05:44 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 10 Feb 2021 11:05:42 -0800
Date:   Wed, 10 Feb 2021 22:05:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kbuild@lists.01.org, Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210210190528.GE20820@kadam>
References: <20210210074946.155417-3-drew@beagleboard.org>
 <20210210182044.GY2696@kadam>
 <CAMuHMdUTG-0PMsP--i4KE2RA_zOaQgpUDksvtU8dLPW9dSpoug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUTG-0PMsP--i4KE2RA_zOaQgpUDksvtU8dLPW9dSpoug@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100169
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100169
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 07:39:16PM +0100, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Wed, Feb 10, 2021 at 7:21 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  694    buf = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  695    if (!buf)
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  696            return -ENOMEM;
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  697
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  698    fname = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME, GFP_KERNEL);
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  699    if (!fname) {
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  700            ret = -ENOMEM;
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  701            goto free_buf;
> >
> > The gotos are out of order.  They should be in mirror/reverse order of
> > the allocations:
> >
> > free_gmane:
> >         devm_kfree(pctldev->dev, gname);
> > free_fname:
> >         devm_kfree(pctldev->dev, fname);
> > free_buf:
> >         devm_kfree(pctldev->dev, buf);
> >
> > But also why do we need to use devm_kfree() at all?  I thought the whole
> > point of devm_ functions was that they are garbage collected
> > automatically for you.  Can we not just delete all error handling and
> > return -ENOMEM here?
> 
> No, because the lifetime of the objects allocated here does not match the
> lifetime of dev.  If they're not freed here, they will only be freed when the
> device is unbound.  As the user can access the sysfs files at will, he can
> OOM the system.
> 

Then why not use vanilla kmalloc()?

regards,
dan carpenter

