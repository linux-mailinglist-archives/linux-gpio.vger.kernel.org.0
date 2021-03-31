Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE756350158
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 15:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235771AbhCaNgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 09:36:44 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:60951 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235755AbhCaNgY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 09:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617197783; x=1648733783;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wnn3ZDn8rcE6pwNp5rADOBU2opfdbhIcSZs+U1m9NVY=;
  b=kjVlYrLjdr4yzqtSRl+MPgBGOj8BOmQT9ZD4UCEzvQ6T77fnu1MUM0iq
   aYTzEpujbBP4J+jpLg+uTHVDYHvbfRffhHn2HlWFg1Ej0+TrGVvDZ95lg
   73WHYKa6T1NT7+mRxYVf+gxNAZkjOQ1WfOvrXrX2/LFb9PepyDlDJn4pR
   rq1Xzb9m67O6TZaShcEoRNkJFe92sYktSlfeNykZR+X947Cm2hs/mtGUH
   dQ7yhmEtGH4+fXUsO3Wn5oX7/di7fa1+GiiNi7fhH0b5OlGiBmZh1ZibX
   TsaGSUYg8/pRjdFXKhTPJlm+k6AsE/qbCeBK1Xoqducz9+0YT+jkru440
   w==;
IronPort-SDR: +lGcHtdXEK6qjyzZoc+CViai+dUh0v6Vh3oLxHqezs1xdMMaFKM4AwzeTowV1BDqnQYISaz5ak
 YmB8Q8YpTA4ipA6xq5YBVEtXjmvRbVULVlfVhJw+KPtn2iOaojuG/jdMm2clGjIbN1NtNPovrl
 vEIaop7QfK3PZfNT96a1ed2i5liHnCZ4JyqBsGp68N4ihg2zHgXLHFY5NRewMcR6YlAN7lF0M4
 cdrqxhldsdX3cPXPqwcx9IVTfJGlENMNptUaagq4IbtHmoFl425/WfOqedhDE6De6wLK7eUoq6
 fYc=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16745527"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Mar 2021 15:36:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Mar 2021 15:36:22 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Mar 2021 15:36:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617197782; x=1648733782;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wnn3ZDn8rcE6pwNp5rADOBU2opfdbhIcSZs+U1m9NVY=;
  b=lF/7tCwDpgPZDjzl6PXNqbTFdapwnVik0Ulb5wT3vUBOun3ZlHkmyZdc
   x5IZasS0lMxLuwqTXnVqPuL0OXSWGIwoN8yJOuhvvmSfENd8xIJb8kgB9
   GBw1pOYta9SX6lYl+f3A2JFRU7i66iqRbduwun+qC9CtHAy3pMVSDCLG5
   EC7kZWqRBcL8K6V1W5a4bGfjiMHrVBmu41h5CkvEum3zeQXkSf1slZcfD
   jFGIQ5ozHJq/9I8J3b+xz7VWizmHaJnXv3WrwrIQAUcW+xOhdNchhrT6w
   1gVi7kKCh1721cAODN/mxwh5ycuOygx782cmKj4esKsTMQUBDGmphREIO
   w==;
IronPort-SDR: b7us9y9ngDqHwVLUNtUEtOohfTfhuHWkbf35aaBXNrH1Z0OHsppwgobBUAPle+aKqECduTwVB+
 nr7LXC/RZfU9TkFfBCYI472Xh78lCWnLlbjSEkz8HwbCJ/mLelTNBZ5yzHRRPtQ9i8sqZbrx2A
 6cAne4QvGzFqrKzAFaM4n7k/nzLotBGFncuOGmmdWZA0Lxgf3S43HExoaIFd7XF1nbtQwda8gw
 e7L56C79lmrfeqWYL3WD9Wlcnp5eh9UDrHU4kPEu7TnxRCOWJOLDYJRK2RwRbuejNBqtSY7W8F
 sVY=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16745526"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Mar 2021 15:36:22 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 62A8F280070;
        Wed, 31 Mar 2021 15:36:22 +0200 (CEST)
X-CheckPoint: {60647AD6-2-66C6C1C5-CB93E0DA}
X-MAIL-CPID: 6D3FBD7872C830B4A47300475FB685CF_4
X-Control-Analysis: str=0001.0A782F16.60647AD6.008E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Message-ID: <38b1191ce594d9fefe9e0e98b3fa8ca0a23ee3ea.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 31 Mar 2021 15:36:22 +0200
In-Reply-To: <CAHp75VfVCTj170S_4Lh9JyDYFfUQLjTtnU=O-iXgUVXcycLxwg@mail.gmail.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
         <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
         <CAHp75VfVCTj170S_4Lh9JyDYFfUQLjTtnU=O-iXgUVXcycLxwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-31 at 15:39 +0300, Andy Shevchenko wrote:
> On Wed, Mar 31, 2021 at 3:37 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > On Wed, 2021-03-31 at 15:29 +0300, Andy Shevchenko wrote:
> > > On Wed, Mar 31, 2021 at 2:37 PM Matthias Schiffer
> > > <matthias.schiffer@ew.tq-group.com> wrote:
> 
> ...
> 
> > > > -       irq = platform_get_irq(pdev, 0);
> > > > -       if (irq < 0)
> > > > +       irq = platform_get_irq_optional(pdev, 0);
> > > > +       if (irq < 0 && irq != -ENXIO)
> > > >                 return irq;
> > > 
> > > This is a dead code now. I suggest you to do the opposite, i.e.
> > > if (irq < 0)
> > >   irq = 0;
> > 
> > I don't understand which part of the code is dead now. I assume the
> > `return irq` case is still useful for unexpected errors, or things like
> > EPROBE_DEFER? I'm not sure if EPROBE_DEFER is relevant for this driver,
> > but just ignoring the error code completely doesn't seem right to me.
> 
> platform_get_irq() AFAIK won't ever return such a code.
> So, basically your conditional is always false.
> 
> I would like to see the code path which makes my comment wrong.
> 

EPROBE_DEFER appears a few times in platform_get_irq_optional()
(drivers/base/platform.c), but it's possible that this is only relevant
for OF-based platforms and not x86.

