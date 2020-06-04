Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4E91EE897
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 18:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgFDQ3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 12:29:20 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:24163
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729587AbgFDQ3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 12:29:20 -0400
X-IronPort-AV: E=Sophos;i="5.73,472,1583190000"; 
   d="scan'208";a="350610914"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 18:29:17 +0200
Date:   Thu, 4 Jun 2020 18:29:16 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Joe Perches <joe@perches.com>
cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
In-Reply-To: <0749ac5e3868c6ba50728ced8366bfd86b0b8500.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2006041820590.2577@hadrien>
References: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>         <20200601183102.GS30374@kadam>         <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>         <20200604083120.GF22511@kadam>         <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
         <alpine.DEB.2.21.2006041147360.2577@hadrien>         <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>         <alpine.DEB.2.21.2006041228520.2577@hadrien>         <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>        
 <alpine.DEB.2.21.2006041328570.2577@hadrien> <20200604123038.GG22511@kadam> <0749ac5e3868c6ba50728ced8366bfd86b0b8500.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 4 Jun 2020, Joe Perches wrote:

> On Thu, 2020-06-04 at 15:30 +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2020 at 01:42:12PM +0200, Julia Lawall wrote:
> > > OK, I recall a discussion with Dan where he suggested that some things
> > > that were not actually bug fixes could also merit a Fixes tag.  But it's
> > > probably better if he weighs in directly.
> >
> > I generally think Fixes should only be used for "real bug" fixes.
> >
> > The one exception is when I'm reviewing a patch that fixes an "unused
> > assignment" static checker warning is that I know which commit
> > introduced the warning.  I don't have strong feelings if it's in the
> > Fixes tag or if it's just mentioned in the commit message.
>
> My view is that changes that silence compiler warnings are
> not fixing bugs and that these changes should generally not
> be backported.
>
> Compiler silencing changes marked as fixes can introduce other
> defects in working code.
>
> Backporting patches to stable trees should be conservatively
> rather than liberally applied.
>
> It seems that the actual backport maintainers disagree though.

But the rule seemed to be "bug fixing patches must contain a Fixes", and
not "backportable patches must contain a Fixes".

Overall, the relationship between backporting and Fixes is not so clear.

Patches that remove something unnecessary might benefit from having a
Fixes, but might not be worth backporting.

julia
