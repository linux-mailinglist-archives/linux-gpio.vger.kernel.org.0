Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE20C382D8E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 15:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235374AbhEQNi0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 09:38:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42110 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234748AbhEQNiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 09:38:25 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HDVD3h021203;
        Mon, 17 May 2021 13:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=O8xo1agX3REWXjxQUJndTeVR5fSyPXUXRmD8lmbJu8M=;
 b=nJ0mKjgJQ46+ty9wqve0Kv+3thlu0263L0L1uO4+I5Myea7l+UOT/amoeIllV0Evk8Lp
 h2JTQVFNYDNnN6RkmMZfdB1xGfoazAhDyG/Z571fQf05f08OA8iG180NbWtdr1U9+Qwr
 fk2kzRr1ggjl8C5+WJ4PJ/PpYw0z9YgezVAS3m2SDNj/M9qTOGz78M/wIsFzYePc51Yl
 EkpvgXYPQgZ4qZDH92w33nDAt/ZykhR2wt3Y/UzTg3Xiq1+TE2I0wWhaFQ60v+YIqKOr
 M7RScz0Qbuiz8RDJ0i31FqttFrF7Yj+muXTMFIU2QAwlzfdntJDX5/9Uxr4iIIUBMz6D ZA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 38kfhwg72g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 13:36:58 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14HDXXTn119439;
        Mon, 17 May 2021 13:36:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38j3dtbgse-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 13:36:57 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14HDXrvv120420;
        Mon, 17 May 2021 13:36:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 38j3dtbgrw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 13:36:56 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14HDaqhO028744;
        Mon, 17 May 2021 13:36:52 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 May 2021 06:36:51 -0700
Date:   Mon, 17 May 2021 16:36:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Colin King <colin.king@canonical.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
Message-ID: <20210517133643.GI1955@kadam>
References: <20210513085227.54392-1-colin.king@canonical.com>
 <20210514053754.GZ1955@kadam>
 <CAHp75Ve-YWh_sfupwQV0xxL7Vk8GNObJ+6O29RqRMXCgAmemCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve-YWh_sfupwQV0xxL7Vk8GNObJ+6O29RqRMXCgAmemCw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: dLB8ec6Q_IuAwH4IsNLDCEHIoe1f52oG
X-Proofpoint-ORIG-GUID: dLB8ec6Q_IuAwH4IsNLDCEHIoe1f52oG
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 10:07:20AM +0300, Andy Shevchenko wrote:
> On Fri, May 14, 2021 at 12:26 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Thu, May 13, 2021 at 09:52:27AM +0100, Colin King wrote:
> 
> ...
> 
> > >       const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
> > >
> > >       map[index] &= ~(0xFFFFFFFFul << offset);
> > > -     map[index] |= v << offset;
> > > +     map[index] |= (unsigned long)v << offset;
> >
> > Doing a shift by BIT(5) is super weird.
> 
> Not the first place in the kernel with such a trick.
> 
> >  It looks like a double shift
> > bug and should probably trigger a static checker warning.  It's like
> > when people do BIT(BIT(5)).
> >
> > It would be more readable to write it as:
> >
> >         int shift = (bit % BITS_PER_LONG) ? 32 : 0;
> 
> Usually this code is in a kinda fast path. Have you checked if the
> compiler generates the same or better code when you are using ternary?

I wrote a little benchmark to see which was faster and they're the same
as far as I can see.

regards,
dan carpenter

static inline __attribute__((__gnu_inline__)) unsigned long xgpio_set_value_orig(unsigned long *map, int bit, u32 v)
{
        int shift = (bit % 64) & ((((1UL))) << (5));
        return v << shift;
}

static inline __attribute__((__gnu_inline__)) unsigned long xgpio_set_value_new(unsigned long *map, int bit, u32 v)
{
        int shift = (bit % 64) ? 32 : 0;
        return v << shift;
}

int main(void)
{
        int i;

        for (i = 0; i < INT_MAX; i++)
                xgpio_set_value_orig(NULL, i, 0);

//      for (i = 0; i < INT_MAX; i++)
//              xgpio_set_value_new(NULL, i, 0);

        return 0;
}

