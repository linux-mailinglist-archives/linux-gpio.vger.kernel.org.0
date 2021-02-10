Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DBA317170
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 21:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbhBJUee (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 15:34:34 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55562 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbhBJUed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 15:34:33 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11AKTw8b032123;
        Wed, 10 Feb 2021 20:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Qe5RVsPxANiTw71awkW3MnpMHQaQ6y+DfIOdG6MhMx8=;
 b=eyeLcxmPMIhsbyenG70s5z6TXJr+BdC6MTjgWltpmXqz8KiPnAWcph5PYmgsxA+4ro5n
 gKA7DGLSwT9Qawx+5YRy+eCMTVNjM9CEdz477AoH7IT7RryjV3eCXoKyVxOnHDgy470F
 5VuLje8ogCQm5HYnnlutqD/FN6GZTM0zSIIRdg+W6F80BTVtOZnkNqEqYs/tWWF8mfHq
 HDbuoiL35PRyQU6g7RoG7bJgM9pRHKI7wbqyw6nk26cM4pK1T1SHriyriAtAX3x7hkkw
 SdkjEsurvJ4L9JY+P3J5Pwg8P9smVZ55/3y1f5HNSsm/NMDOEXJYHEx01pFAcEUSJca8 mg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 36hgman4x7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Feb 2021 20:33:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11AKUkVr093845;
        Wed, 10 Feb 2021 20:33:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 36j4vta8q5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Feb 2021 20:33:34 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11AKXVJi007651;
        Wed, 10 Feb 2021 20:33:31 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 10 Feb 2021 12:33:30 -0800
Date:   Wed, 10 Feb 2021 23:33:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     kbuild@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>, lkp@intel.com,
        kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210210203317.GH20820@kadam>
References: <20210210074946.155417-3-drew@beagleboard.org>
 <20210210182044.GY2696@kadam>
 <20210210190428.GA188420@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210190428.GA188420@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100182
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100182
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 11:04:28AM -0800, Drew Fustini wrote:
> On Wed, Feb 10, 2021 at 09:20:44PM +0300, Dan Carpenter wrote:
> > Hi Drew,
> > 
> > url:    https://github.com/0day-ci/linux/commits/Drew-Fustini/pinctrl-pinmux-Add-pinmux-select-debugfs-file/20210210-160108 
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
> > config: i386-randconfig-m021-20210209 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Does it makes sense for me to include that tag in this patch?
> 

This stuff is just in the autogenerated portions of the kbuild bot
email.  I normally just hit forward, without all the extra pontifying
that I included this time.  :P

regards,
dan carpenter

