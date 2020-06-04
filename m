Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B613B1EE398
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 13:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgFDLmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 07:42:16 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:48604
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgFDLmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 07:42:15 -0400
X-IronPort-AV: E=Sophos;i="5.73,472,1583190000"; 
   d="scan'208";a="350573905"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 13:42:12 +0200
Date:   Thu, 4 Jun 2020 13:42:12 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Joe Perches <joe@perches.com>
cc:     Julia Lawall <julia.lawall@inria.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
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
In-Reply-To: <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2006041328570.2577@hadrien>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>           <87h7vvb1s3.fsf@belgarion.home>           <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>           <20200601183102.GS30374@kadam>           <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
  <20200604083120.GF22511@kadam>   <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>   <alpine.DEB.2.21.2006041147360.2577@hadrien>  <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>  <alpine.DEB.2.21.2006041228520.2577@hadrien>
 <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 4 Jun 2020, Joe Perches wrote:

> On Thu, 2020-06-04 at 12:33 +0200, Julia Lawall wrote:
> >
> > On Thu, 4 Jun 2020, Joe Perches wrote:
> >
> > > On Thu, 2020-06-04 at 11:52 +0200, Julia Lawall wrote:
> > > > Should Fixes also be used when the change will make it hard to port other
> > > > fixes over it?
> > >
> > > If it's a logic defect or regression that's being fixed,
> > > shouldn't the logic defect or regression be fixed as
> > > reasonably soon as possible?
> >
> > Sure, but I recall seeing some patches that mentioned that the problem had
> > existed since the beginning of git.  Of course, it should be rare.
>
> git history goes back 15 years already.
> There are scant few bugs that old.
>
> There is a tree with even older history that Rob Landley
> still has here: https://landley.net/kdocs/fullhist/
>
> It does make git blame research a bit easier for those
> rare and extremely old defects.
>
> > > The nature of the fix should ideally be optimal for
> > > backporting, but I believe that should not stop any
> > > consideration for the standalone fix itself.
> >
> > I'm not sure to follow this.
>
> I think it comes down to defects in current need to be
> fixed.  Describing
> the base commit that is being fixed
> is useful for backporting.
>
> I believe it's not reasonable to ask the author of a
> fix to research how it could or should be backported.
>
> > Sometimes non-bug fixes that block
> > backporting a bug fix have to be backported as well.  So the fixes would
> > again highlight the range of versions affected by the issue.
>
> Sure, but the non-bug fixes that may also need backporting
> to enable easy backports of the actual fix should not be
> described in the Fixes: <commit> as those are  generally
> easily researched from a command like:
>
> $ git log <commit>.. <files in fix>
>
> by whoever needs to backport.

OK, I recall a discussion with Dan where he suggested that some things
that were not actually bug fixes could also merit a Fixes tag.  But it's
probably better if he weighs in directly.

It would be unfortunate if someone doesn't submit a fix because they can't
figure out how to make the Fixes tag properly, though.

For example, when there is a lot of concurrency involved, some of the bugs
reported by syzkaller can be hard to fully understand.  In the case of a
NULL pointer dereference can a patch only be submitted if it is known
where the NULL comes from, and at what time the reason for producing the
NULL was introduced into the kernel?  Adding a NULL test without fully
understanding how the NULL can arise could reasonably be seen as papering
over a real problem.  But sometimes it could be better to paper over the
problem than incur the problem in a critical situation.

But I agree that these are corner cases.  Hopefully if such a NULL test
was submitted with an explanation on why the submitter was not able to
find the source of the problem and why the problem is important, then the
maintainer could provide some guidance that would resolve the situation.

julia
