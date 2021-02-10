Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8859B317189
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 21:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhBJUnI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 10 Feb 2021 15:43:08 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4626 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhBJUnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 15:43:06 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DbWr0275VzY7F4;
        Thu, 11 Feb 2021 04:41:04 +0800 (CST)
Received: from dggemi759-chm.china.huawei.com (10.1.198.145) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 11 Feb 2021 04:42:20 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi759-chm.china.huawei.com (10.1.198.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 11 Feb 2021 04:42:20 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Thu, 11 Feb 2021 04:42:20 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm]  Re: [PATCH for next v1 0/2] gpio: few clean up
 patches to replace spin_lock_irqsave with spin_lock
Thread-Topic: [Linuxarm]  Re: [PATCH for next v1 0/2] gpio: few clean up
 patches to replace spin_lock_irqsave with spin_lock
Thread-Index: AQHW/fpz5jJ2/H7qpkegS3EF2g2rTapNupMAgAFOFgCAAATsgIABLhiAgAB3XwCAAJQm4P//sJmAgADhgwA=
Date:   Wed, 10 Feb 2021 20:42:20 +0000
Message-ID: <7d9c4fa854924bfc890e98da2d88ea36@hisilicon.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
 <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
 <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
 <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com>
 <CAHp75VdrskuNkvFr4MPbbg8c8=VSug0GT+vs=cMRMOqLr+-f5A@mail.gmail.com>
 <947bcef0d56a4d0c82729d6899394f4a@hisilicon.com>
 <YCP0JeEUcoPp9B/H@smile.fi.intel.com>
In-Reply-To: <YCP0JeEUcoPp9B/H@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> Sent: Thursday, February 11, 2021 3:57 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: luojiaxing <luojiaxing@huawei.com>; Linus Walleij
> <linus.walleij@linaro.org>; Grygorii Strashko <grygorii.strashko@ti.com>;
> Santosh Shilimkar <ssantosh@kernel.org>; Kevin Hilman <khilman@kernel.org>;
> open list:GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>; Linux Kernel Mailing
> List <linux-kernel@vger.kernel.org>; linuxarm@openeuler.org
> Subject: Re: [Linuxarm] Re: [PATCH for next v1 0/2] gpio: few clean up patches
> to replace spin_lock_irqsave with spin_lock
> 
> On Wed, Feb 10, 2021 at 11:50:45AM +0000, Song Bao Hua (Barry Song) wrote:
> > > -----Original Message-----
> > > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > > Sent: Wednesday, February 10, 2021 11:51 PM
> > > On Wed, Feb 10, 2021 at 5:43 AM luojiaxing <luojiaxing@huawei.com> wrote:
> > > > On 2021/2/9 17:42, Andy Shevchenko wrote:
> 
> ...
> 
> > > > Between IRQ handler A and IRQ handle A, it's no need for a SLIS.
> > >
> > > Right, but it's not the case in the patches you provided.
> >
> > The code still holds spin_lock. So if two cpus call same IRQ handler,
> > spin_lock makes them spin; and if interrupts are threaded, spin_lock
> > makes two threads run the same handler one by one.
> 
> If you run on an SMP system and it happens that spin_lock_irqsave() just
> immediately after spin_unlock(), you will get into the troubles. Am I mistaken?

Hi Andy,
Thanks for your reply.

But I don't agree spin_lock_irqsave() just immediately after spin_unlock()
could a problem on SMP.
When the 1st cpu releases spinlock by spin_unlock, it has completed its section
of accessing the critical data, then 2nd cpu gets the spin_lock. These two CPUs
won't have overlap on accessing the same data.

> 
> I think this entire activity is a carefully crafted mine field for the future
> syzcaller and fuzzers alike. I don't believe there are no side effects in a
> long
> term on all possible systems and configurations (including forced threaded IRQ
> handlers).

Also I don't understand why forced threaded IRQ could be a problem. Since IRQ has
been a thread, this actually makes the situation much simpler than non-threaded
IRQ. Since all threads including those IRQ threads want to hold spin_lock,
they won't access the same critical data at the same time either.

> 
> I would love to see a better explanation in the commit message of such patches
> which makes it clear that there are *no* side effects.
> 

People had the same questions before, But I guess the discussion in this commit
has led to a better commit log:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4eb7d0cd59

> For time being, NAK to the all patches of this kind.

Fair enough, if you expect better explanation, I agree the commit log is too
short.

> 
> --
> With Best Regards,
> Andy Shevchenko
> 

Thanks
Barry

