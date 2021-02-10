Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2FA316989
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 15:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhBJO53 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 09:57:29 -0500
Received: from mga06.intel.com ([134.134.136.31]:61841 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229888AbhBJO52 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Feb 2021 09:57:28 -0500
IronPort-SDR: fdi66C2t2dwZ+/gK89fEmj+UDUTi2DXFcfhCJjwRHYOA31yWZm9NE5q0zc/9SAKmdnenIji15c
 gQitbFoMJv8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="243575327"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="243575327"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 06:56:42 -0800
IronPort-SDR: Uv/sQUYf46bgYDKfel7rXV+9Fn8OF1Z98xSc8zWQy6IB7TB+HDS3Q5dLxFo8a9fCUlIDvQQ7Lp
 lbLsyioiTD4g==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="421074065"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 06:56:40 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1l9quz-003klX-JR; Wed, 10 Feb 2021 16:56:37 +0200
Date:   Wed, 10 Feb 2021 16:56:37 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: Re: [Linuxarm]  Re: [PATCH for next v1 0/2] gpio: few clean up
 patches to replace spin_lock_irqsave with spin_lock
Message-ID: <YCP0JeEUcoPp9B/H@smile.fi.intel.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
 <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
 <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
 <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com>
 <CAHp75VdrskuNkvFr4MPbbg8c8=VSug0GT+vs=cMRMOqLr+-f5A@mail.gmail.com>
 <947bcef0d56a4d0c82729d6899394f4a@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <947bcef0d56a4d0c82729d6899394f4a@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 11:50:45AM +0000, Song Bao Hua (Barry Song) wrote:
> > -----Original Message-----
> > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > Sent: Wednesday, February 10, 2021 11:51 PM
> > On Wed, Feb 10, 2021 at 5:43 AM luojiaxing <luojiaxing@huawei.com> wrote:
> > > On 2021/2/9 17:42, Andy Shevchenko wrote:

...

> > > Between IRQ handler A and IRQ handle A, it's no need for a SLIS.
> > 
> > Right, but it's not the case in the patches you provided.
> 
> The code still holds spin_lock. So if two cpus call same IRQ handler,
> spin_lock makes them spin; and if interrupts are threaded, spin_lock
> makes two threads run the same handler one by one.

If you run on an SMP system and it happens that spin_lock_irqsave() just
immediately after spin_unlock(), you will get into the troubles. Am I mistaken?

I think this entire activity is a carefully crafted mine field for the future
syzcaller and fuzzers alike. I don't believe there are no side effects in a long
term on all possible systems and configurations (including forced threaded IRQ
handlers).

I would love to see a better explanation in the commit message of such patches
which makes it clear that there are *no* side effects.

For time being, NAK to the all patches of this kind.

-- 
With Best Regards,
Andy Shevchenko


