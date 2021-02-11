Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9584A318590
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 08:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhBKHNY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 02:13:24 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51000 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhBKHNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 02:13:22 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11B78kFm120041;
        Thu, 11 Feb 2021 07:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pSbVfKgu7eIJjgTqh9AyZUoJkFb11jRAkYyjkWpaPf4=;
 b=B98kCmijzkCGspzl9qXlkBLuXQWXCxkPB9lKcbYHMEMb2YPKhKpD7nHcbpj5VRzHbvbX
 UzydUYHWtBeuI12D0lv1FPU0vi9/6UzBG7L+mjTN2nCcZYz13gjd4UQu7RCkkXQ/3SR9
 XGiTwnjlo8CpJAi600/8j9om9VLIlcZFqmdYVUmPbrjWmswcsCqy/KBYlD8B6dlcBbOL
 J34TBFj0l4EBEfV96Vbogn9yAJKWyNsi5auYaT7peRkji9WgQm/egkZZei2PxUD4uW1U
 29OysGP36FTgzcpvfo7zAtK0na1GHg4zXehCBlmOfs2itIVeZrmKOuAIj/Fc55TkRy4V XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 36mv9drh2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 07:12:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11B7A1Je064036;
        Thu, 11 Feb 2021 07:12:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 36j4pr5g7r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 07:12:16 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11B7C5WS011045;
        Thu, 11 Feb 2021 07:12:06 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 10 Feb 2021 23:12:05 -0800
Date:   Thu, 11 Feb 2021 10:11:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210211071153.GJ20820@kadam>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210222851.232374-3-drew@beagleboard.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110063
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102110063
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> +	if (ret < 0) {
> +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> +		goto free_gname;
> +	}
> +	buf[len-1] = '\0';
> +
> +	ret = sscanf(buf, "%s %s", fname, gname);
> +	if (ret != 2) {
> +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> +		goto free_gname;

We need a "ret = -EINVAL;" before the goto.  sscanf doesn't return error
codes.  Normally we would write it like so:

	if (sscanf(buf, "%s %s", fname, gname) != 2) {
		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
		ret = -EINVAL;
		goto free_gname;
	}

I'm going to write a Smatch check for this today.

> +	}
> +
> +	fsel = pinmux_func_name_to_selector(pctldev, fname);
> +	if (fsel < 0) {
> +		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
> +		ret = -EINVAL;

ret = fsel;

> +		goto free_gname;
> +	}
> +

regards,
dan carpenter
