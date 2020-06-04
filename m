Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB961EEA09
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 20:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730384AbgFDSCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 14:02:30 -0400
Received: from smtprelay0191.hostedemail.com ([216.40.44.191]:59524 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730055AbgFDSCa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 14:02:30 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 99980F4D1E;
        Thu,  4 Jun 2020 18:02:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2892:2911:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4425:5007:6119:7903:10004:10400:10848:11232:11658:11914:12297:12663:12679:12740:12760:12895:13069:13095:13255:13311:13357:13439:14096:14097:14659:21080:21433:21451:21627:21790:21939:21987:30054:30075:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: sugar90_6017dc626d99
X-Filterd-Recvd-Size: 3603
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Thu,  4 Jun 2020 18:02:25 +0000 (UTC)
Message-ID: <c925d033cf566743a1f6255da7843d1b85451d2f.camel@perches.com>
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Date:   Thu, 04 Jun 2020 11:02:23 -0700
In-Reply-To: <20200604173500.GI22511@kadam>
References: <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
         <20200604083120.GF22511@kadam>
         <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
         <alpine.DEB.2.21.2006041147360.2577@hadrien>
         <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
         <alpine.DEB.2.21.2006041228520.2577@hadrien>
         <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
         <alpine.DEB.2.21.2006041328570.2577@hadrien> <20200604123038.GG22511@kadam>
         <0749ac5e3868c6ba50728ced8366bfd86b0b8500.camel@perches.com>
         <20200604173500.GI22511@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2020-06-04 at 20:35 +0300, Dan Carpenter wrote:
> On Thu, Jun 04, 2020 at 09:08:44AM -0700, Joe Perches wrote:
> > On Thu, 2020-06-04 at 15:30 +0300, Dan Carpenter wrote:
> > > On Thu, Jun 04, 2020 at 01:42:12PM +0200, Julia Lawall wrote:
> > > > OK, I recall a discussion with Dan where he suggested that some things
> > > > that were not actually bug fixes could also merit a Fixes tag.  But it's
> > > > probably better if he weighs in directly.
> > > 
> > > I generally think Fixes should only be used for "real bug" fixes.
> > > 
> > > The one exception is when I'm reviewing a patch that fixes an "unused
> > > assignment" static checker warning is that I know which commit
> > > introduced the warning.

Sometimes those warnings are introduced by new compiler
versions.

That's why I don't care for -Werror use in Makefiles.

> > > I don't have strong feelings if it's in the
> > > Fixes tag or if it's just mentioned in the commit message.
> > 
> > My view is that changes that silence compiler warnings are
> > not fixing bugs and that these changes should generally not
> > be backported.
> > 
> The Fixes tag is useful for backports but that's not whole the point of
> it.  It's also for collecting metrics.

Hmm, how are these metrics used?

> Also sometimes we fix the bug
> before the kernel is released so the Fixes tag means we can automatically
> ignore those ones when we look at which patches to backport.
> 
> I don't care if the "unused assignment" patches use a Fixes tag or just
> mention the commit.  Either way the information is there for when I
> review the patch.

Perhaps there could/should be some distinction between
"real bug" fixes and trivialities like "unused assignment"

Maybe something like:
	Updates: <commit> ("commit description")
vs
	Fixes: <commit> ("commit description")


