Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABDA35012F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 15:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbhCaNYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 09:24:32 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:40963 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235789AbhCaNYY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 09:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617197064; x=1648733064;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HmgP3Yli7Tth3loHHid+iLrNhrFcOSrcV55jhKjEoKo=;
  b=B55volFmUIV3dGoIUWsfsJwT+8oRgRzPNWyztKnB6Yk6SubJZFeb2Y8l
   y/GlqPiEOyCWnWGoWAI2PpdQzvSbYDStDbugoe+TG0ZxByO4f3zZd3wS7
   rblGdepy3Ddm+DEkjRa1otnn7f9Ira4sxBNZWKRE0ZBHI4wRYODYb7WUy
   qyN28AQkyUudp38wBYcDXc4reaANIRtqNuqUdcF7ANoLjrvQSFtz88Ytp
   b4K1QPpxonYSMEWvqB2FHqSPtaAO/UsuoLg0NfnBIPRL7nAj7X1djyJ3I
   1ueeXjJZdydhRwBpTKdemImK9gYfjtZEQ4ScE4lPP3qtpehMtoY19HESq
   g==;
IronPort-SDR: Gvty9VKIQGeyXZgzeykyVahp8tOPvgqn7DtFanDSaX8uXPe2XXtxOHOzwYurdT7+kft+QMLsX4
 yPlO7pB75n/Bmf16GivXuz2Om3Dh/WX45SQVuvyirlHB8y9PhJN+NxEXvkfEtseEhDCu1yx7QA
 gwOsIgc93/bZ+CpnOHDgwQyjGpbYuMiFej8BuB4KeSwhoxImw1w9cyA+SmbESOwnAJrVdPr5Rg
 zaCRlHefQEKQ0WjJ3YC6bJ7T3/iGTTIDj6LDG5Az4DMj5ueKdfJ0YFjt9cyIoe1/Bz59mtYxU7
 2DM=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16745274"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Mar 2021 15:24:23 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Mar 2021 15:24:23 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Mar 2021 15:24:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617197063; x=1648733063;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HmgP3Yli7Tth3loHHid+iLrNhrFcOSrcV55jhKjEoKo=;
  b=IbUfjLJLrXT2pR/smtNDprtqxlZkTXrny0zmQizSU1Qxpwste4RaU7Je
   e3oKw+9BWzhvcNeS/PmKPuKzx/udu2kS2AyCNiZkZNwVJolejjN/t5h9K
   cis5nhZFK6NHIC+Vbun2cdIr3DPLFclf1Q+llEzeCc8xFhsDoHKlBOpLs
   pXoa7HkXAZd9nBLGu0u5gxUNpEyqOaXcmUc/NDAk3jreRj92HpLaFr4N8
   iJhNCG25fbiCkAXtWkOPOaCQanbNJYvWGvQEeG3ddvrriM7dZT4MCYf+N
   2Gq6a9WlQr74NyTQoo8OwSQRtD3RNCTXPkPStePbYQDyXREvtSKMrbLjd
   g==;
IronPort-SDR: g+4TVZ2uDU92PjAG+UGLDVNGfOB1JfMoyzMvCbx10XuQvK1b0eDj4nFXeFUPzpsIG2Kv+VfVYb
 b+4mLhsOWvBP4zLYYh6CbGPVWLY3M6RxbWAKeDNP/D9gq1CFrgH2ALM7LKjgb99NHWaBoD3YDE
 bjCL9c6gauPbKj1Ch4qmTcNfbcJE8/36gk6b05lqsgVSxmxy+Csg4QDm61UZOI34J9ZbBrWKJd
 wEl5ml1UWIB5ZIeDACrb5vO0+a6dXDnOzoSuEwbiAMky9+nyts5vuIAldpsxHLSwj1FUsmThmL
 cSI=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16745273"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Mar 2021 15:24:23 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id C0043280070;
        Wed, 31 Mar 2021 15:24:22 +0200 (CEST)
X-CheckPoint: {60647806-F-C3D5825A-FBADBBC7}
X-MAIL-CPID: 01143EE542A86B6CCBF2B55EA702DDFA_3
X-Control-Analysis: str=0001.0A782F1A.60647807.000C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Message-ID: <5e80dc9aeddd46d837e1c317a008e237bf0b4f8f.camel@ew.tq-group.com>
Subject: Re: [PATCH 2/3] mfd: tqmx86: clear GPIO IRQ resource when no IRQ is
 set
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 31 Mar 2021 15:24:22 +0200
In-Reply-To: <CAHp75VeCGHUBtfZ7b+m7eA01KukWkL0n01kmv-Q00m9+6FTWQg@mail.gmail.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <f38e80b6b439e4a9cc349a090923207865b3d3ed.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <CAHp75VeCGHUBtfZ7b+m7eA01KukWkL0n01kmv-Q00m9+6FTWQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-31 at 15:35 +0300, Andy Shevchenko wrote:
> On Wed, Mar 31, 2021 at 2:39 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > 
> > The driver was registering IRQ 0 when no IRQ was set. This leads to
> > warnings with newer kernels.
> > 
> > Clear the resource flags, so no resource is registered at all in this
> > case.
> 
> ...
> 
> >                 /* Assumes the IRQ resource is first. */
> >                 tqmx_gpio_resources[0].start = gpio_irq;
> > +       } else {
> > +               tqmx_gpio_resources[0].flags = 0;
> 
> Please set IORESOURCE_DISABLED flag in the initial structure instead.

Is there any documentation for the correct usage of this flag? I think
I tried IORESOURCE_DISABLED originally, but it didn't have any effect
(platform_get_irq() ignored the flag and returned the resource
anyways). I might misremember though, I originally wrote the series
some time ago.


> 
> >         }
> 
> 

