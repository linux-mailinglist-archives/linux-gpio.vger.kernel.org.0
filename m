Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C9A380367
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 07:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhENFkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 01:40:01 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:34576 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhENFkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 01:40:00 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14E5Yv5f024442;
        Fri, 14 May 2021 05:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=U4WmGOoHEOZyxtBGaQ7iAVlEntFbwFTELaSYsOVR8BE=;
 b=wBj1Nl6WhOV5v6S+rPLaiMnOdVhnGkKPSua1IOkScHpieXxp2mTtX8+GJGbX7B0TIAq4
 U2Ye0a3G3oQiazD8sr3ZE75G0wfJydKTSDbOd09rmSxxATB/fWTkVhK8JsGMCGR4+P+p
 O5f+cI1PVGPcBxaXsmGnlcwFeyUiFLlCQx/QfSSspRskVGELdTZFLhoYPxPquF9Y6ZN3
 oJp+8ba969aNgQQkX6AXrcCAbYOj8/rFsg+YkhNWk7fkIvtehO4E8kLArCNrEVfKKyEb
 hxuSFJdtBqe9GSAdIxCtYIoyUXcTBpJsch1E5P/kPcj2ezEQXSqvDWnkIbBB6cw1eF8p 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 38gpnekd61-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 05:38:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14E5Tnbo188411;
        Fri, 14 May 2021 05:38:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38gpq2rpw9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 05:38:26 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14E5cPGD002297;
        Fri, 14 May 2021 05:38:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 38gpq2rpvq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 05:38:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14E5cI2p027480;
        Fri, 14 May 2021 05:38:18 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 13 May 2021 22:38:16 -0700
Date:   Fri, 14 May 2021 08:37:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
Message-ID: <20210514053754.GZ1955@kadam>
References: <20210513085227.54392-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513085227.54392-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: aq9JcMCzhOS1vHkJe9ZQMHGnxm2a3Aca
X-Proofpoint-ORIG-GUID: aq9JcMCzhOS1vHkJe9ZQMHGnxm2a3Aca
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105140038
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 13, 2021 at 09:52:27AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of the u32 integer v is evaluated using 32 bit
> arithmetic and then assigned to a u64 integer. There are cases
> where v will currently overflow on the shift. Avoid this by
> casting it to unsigned long (same type as map[]) before shifting
> it.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 02b3f84d9080 ("gpio: xilinx: Switch to use bitmap APIs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/gpio-xilinx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 109b32104867..164a3a5a9393 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -99,7 +99,7 @@ static inline void xgpio_set_value32(unsigned long *map, int bit, u32 v)
>  	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
>  
>  	map[index] &= ~(0xFFFFFFFFul << offset);
> -	map[index] |= v << offset;
> +	map[index] |= (unsigned long)v << offset;

Doing a shift by BIT(5) is super weird.  It looks like a double shift
bug and should probably trigger a static checker warning.  It's like
when people do BIT(BIT(5)).

It would be more readable to write it as:

	int shift = (bit % BITS_PER_LONG) ? 32 : 0;

regards,
dan carpenter

