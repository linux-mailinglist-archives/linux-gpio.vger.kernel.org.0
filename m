Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911923B3085
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFXNyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 09:54:10 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:1088 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231949AbhFXNyK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Jun 2021 09:54:10 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Jun 2021 09:54:09 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1624542711; x=1656078711;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szCWv6rsjrqr8YsJLJS5iNF5+J9XJY8kgMjMYUHaMwc=;
  b=Ow2BJvt4o3mu6sOsZhrFnFxpGnPuGRsY+nBFAoju+G0qN8zjGO3683X7
   Oez1iH21KWOxJzJ9viOuVVODeWxJV+oDUPiegDWuZxjfwrwm1LbDS2soC
   KOxTOFdNl32KE/26nZWLFjitK6W3vjuO8ZJC3tuDk9uqE/sdv+xejRl4Z
   VEOngt0guOkuChSuPYexaj2IHpflw4TTi2sWghHh/LvBCb6aKWKTrz/rI
   n3NMCl/LH3LUuBR2Tdz5J3Yu9dNs/q++TEK/34MsjWe6qa+mk4Ym6Rcgz
   zXT3gqQL2Xzs+QmkYdIF8hwtByCZPpEhKsMuEHgKosWQEc99h9Qm/1vGP
   w==;
IronPort-SDR: mE1l8zJr8HtmH7IbMXs/kHRDB3lrXT+qwBToX101h3ON8MWIwkWicIgY0Z7vtUbZryzWGAe8dH
 ouR+W/1Wyom4DFcSudhtdUcKspOOKbiaMy3oBjvpat0Wpes0BvB/dXSf/cbhLUaOvoOrFrLXfs
 AljoPnU8Jmco47ZJLDkW5a4n1aQNibuSLw7l7Yr7NLD/CHxicWZvMEH+z17GiUOlmyT1jrOyWL
 rTWYAvy071OUmzx9DTtIMMHyZXxpwHXe/wMIMl9SFEbZhxu5nxyhOlET03JTmsCkiB2xEWJB/w
 uR8=
X-IronPort-AV: E=Sophos;i="5.83,296,1616454000"; 
   d="scan'208";a="18131940"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jun 2021 15:44:40 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Jun 2021 15:44:40 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Jun 2021 15:44:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1624542280; x=1656078280;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szCWv6rsjrqr8YsJLJS5iNF5+J9XJY8kgMjMYUHaMwc=;
  b=ISnQcVdUYZc9wXMLbjE74r+PQnCebYHZ8NjwV9Yu4kRHKqMTPBnSkDNV
   8HLaZ5qz+HIbilhUVwr9+523Hw8kpsBIvGxzJ8MTD0kCcPn3fW65Cp1KC
   0ksaaLizF5jtpdkd8mUQqw2RYzQ0uGoqock5DsqHchISINpgfk8bqOdFh
   TTnwGWG+BtHm1+oq1ZZ9VU29COAE6LiOcLqLOPSIIO82RpYfSuQpt2J4R
   7soP15QpUqm1Ulwp58y9piJOIH/PUwFnTBpX0oqyNCl6gyYCRtsocucKD
   zGXa7gu0b2XMkXztzqrGIEvsgNSoN4+g/2cdWi4xDt0YVtzux+t3oEFE4
   g==;
IronPort-SDR: KUdEmWQI2DueMle10kmfrcuruxrLFzwlunxRPp5U8qv8za1so+E5pg3pztc1KrPhhZuuNoL4oy
 j8h+fNqxpKPUw4tACodznBrhN65KLXzIosoLiYW8mWHpQ/SLKvFGMahzEeilTKzyhVrSFErGoB
 tnRAVLOdXR9HTEf85WfCxLUwO5b6rdD52N7F8nR67p4vSVbokEbv8aj4urdsmD0rw5d4L3/ZKF
 vs5N8ByvzfnLGorLkF+PeJJksh37FtJZC0Uk8NJaq4orrIlI7t6Ih4I6wR2jcTGQDK9zSNimc+
 8nw=
X-IronPort-AV: E=Sophos;i="5.83,296,1616454000"; 
   d="scan'208";a="18131938"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jun 2021 15:44:40 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 53EB3280070;
        Thu, 24 Jun 2021 15:44:40 +0200 (CEST)
Message-ID: <53e222fdbb3d488a99bb24d0205b064d3fe662b0.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 24 Jun 2021 15:44:38 +0200
In-Reply-To: <CAHp75VcuD49UgkXCrPL3VKiOsx4qSDsf=zB2vp6yVS1aJCuc2w@mail.gmail.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
         <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
         <CAHp75VfVCTj170S_4Lh9JyDYFfUQLjTtnU=O-iXgUVXcycLxwg@mail.gmail.com>
         <38b1191ce594d9fefe9e0e98b3fa8ca0a23ee3ea.camel@ew.tq-group.com>
         <CAHp75VcuD49UgkXCrPL3VKiOsx4qSDsf=zB2vp6yVS1aJCuc2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-31 at 17:03 +0300, Andy Shevchenko wrote:
> On Wed, Mar 31, 2021 at 4:36 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > 
> > On Wed, 2021-03-31 at 15:39 +0300, Andy Shevchenko wrote:
> > > On Wed, Mar 31, 2021 at 3:37 PM Matthias Schiffer
> > > <matthias.schiffer@ew.tq-group.com> wrote:
> > > > On Wed, 2021-03-31 at 15:29 +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > I don't understand which part of the code is dead now. I assume the
> > > > `return irq` case is still useful for unexpected errors, or things like
> > > > EPROBE_DEFER? I'm not sure if EPROBE_DEFER is relevant for this driver,
> > > > but just ignoring the error code completely doesn't seem right to me.
> > > 
> > > platform_get_irq() AFAIK won't ever return such a code.
> > > So, basically your conditional is always false.
> > > 
> > > I would like to see the code path which makes my comment wrong.
> > > 
> > 
> > EPROBE_DEFER appears a few times in platform_get_irq_optional()
> > (drivers/base/platform.c), but it's possible that this is only relevant
> > for OF-based platforms and not x86.
> 
> Ah, okay, that's something I haven't paid attention to.
> 
> So the root cause of the your case is platform_get_irq_optional|()
> return code. I'm wondering why it can't return 0 instead of absent
> IRQ? Perhaps you need to fix it instead of lurking into each caller.
> 


Hi Andy,

what's the plan here? "driver core: platform: Make
platform_get_irq_optional() optional" had to be reverted because it
broke existing users of platform_get_irq_optional(). I'm not convinced
that a slightly more convenient API is worth going through the trouble
of fixing them all - I know we don't care much about out-of-tree
modules, but subtly changing the behaviour of such a function doesn't
seem like a good idea to me even if we review all in-tree users.

Should I just rebase my patches with the existing ENXIO handing (and
fix up the other issues that were noted), or do you intend to give the
platform_get_irq_optional() revamp another try?

Kind regards,
Matthias

