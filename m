Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CED1EE1DC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 11:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgFDJwt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 05:52:49 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:54088 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728313AbgFDJwt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 05:52:49 -0400
X-IronPort-AV: E=Sophos;i="5.73,471,1583190000"; 
   d="scan'208";a="452941151"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 11:52:17 +0200
Date:   Thu, 4 Jun 2020 11:52:17 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Joe Perches <joe@perches.com>
cc:     Dan Carpenter <dan.carpenter@oracle.com>,
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
In-Reply-To: <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2006041147360.2577@hadrien>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>         <87h7vvb1s3.fsf@belgarion.home>         <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>         <20200601183102.GS30374@kadam>         <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
         <20200604083120.GF22511@kadam> <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 4 Jun 2020, Joe Perches wrote:

> On Thu, 2020-06-04 at 11:31 +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2020 at 12:08:49AM +0200, Linus Walleij wrote:
> []
> > > Fixes means it fixes something that was wrong in that commit.
> > > That's all. Whether syntactic or semantic or regression or
> > > serious or not does not matter. It is also not compulsory to
> > > add it is just helpful.
> >
> > Fixes tag should be compulsory for actual bug fixes.  We had a the
> > Bad Binder exploit last year because commit f5cb779ba163
> > ("ANDROID: binder: remove waitqueue when thread exits.") had no Fixes
> > tag and wasn't backported to Android kernels.
>
> Fixes tags IMO should be exclusively for actual bug fixes
> and should be mandatory.

I'm not sure that it is always possible to determine the specific commit
that a patch fixes.  Some bugs are too old.  Some bugs may arise from an
interaction of issues.  I don't have a concrete example, but I feel uneasy
about mandator and compulsory.  Neither word is in the proposed text,
though.

Should Fixes also be used when the change will make it hard to port other
fixes over it?

julia

>
> Perhaps:
> ---
>  Documentation/process/submitting-patches.rst | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 1699b7f8e63a..285a84ae79de 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -636,12 +636,14 @@ idea was not posted in a public forum. That said, if we diligently credit our
>  idea reporters, they will, hopefully, be inspired to help us again in the
>  future.
>
> -A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
> -is used to make it easy to determine where a bug originated, which can help
> -review a bug fix. This tag also assists the stable kernel team in determining
> -which stable kernel versions should receive your fix. This is the preferred
> -method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> -for more details.
> +A Fixes: tag indicates that the patch fixes a "bug". i.e.: a logic defect or
> +regression in a previous commit.  A Fixes: tag should not be used to indicate
> +that a previous commit had some trivial defect in spelling in the commit log or
> +some whitespace defect.  The Fixes: tag is used to make it easy to determine
> +where a bug originated, which can help review a bug fix. The Fixes: tag also
> +assists the stable kernel team in determining which stable kernel versions
> +should receive your fix. This is the preferred method for indicating a bug is
> +fixed by the patch.  See :ref:`describe_changes` for more details.
>
>  .. _the_canonical_patch_format:
>
>
>
