Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F2E3594D1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 07:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhDIFkR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 01:40:17 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54223 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233049AbhDIFkQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 01:40:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3177F580421;
        Fri,  9 Apr 2021 01:40:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=9/lrkNKQgX532J6LtOYs1h+x2FGLXOO
        m2n2LZx04Go4=; b=XYYNzWn6qtQHgAwxMzM7SO7Tyu/wpCek+5jKlLklxhExW1W
        JfAUY7t9BDsHOTt+R7EyeV/H5X9A3iwhOUl25tVF0J0LfyD5YNsus9qLaclC9B7G
        ebv9se2wTPexG+ug13QeaFmN1Php5sOcN2JZt93CeFxKCI6sbHAL62WzHcb7coKX
        63maXhoMEkH6rSSKAVqEcjZR8NAWlARn2nanfmhvHwusJu15uR8hSHHD90I17BDS
        jwudPPni1lEz26Bsf2eUgyyQg1fXkNy3fj/v1r4nMbwgE4sFE2sWpPNeHbwDNbMJ
        dsEaoWQAYAikNYbESJgo9rnD6zs4nHZK02nLPlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9/lrkN
        KQgX532J6LtOYs1h+x2FGLXOOm2n2LZx04Go4=; b=UbgJO4ax7uN6hF01JE7fdY
        Z0ASNFXANpSRcnmqsRymd1yypIxElULfbmnEUaZZ3AXnKjuZjWEkDSYBnlBttlfm
        85OLDTm91BwejHMW0MlurZeQz9z8cBj/hEVsQ6MZy6H7K44hv6NiCjcy47pK+PZR
        Rn8/rlo/cloOWfkYZcGvts3dgNaSKjPONUBEypPcBqoTe9TV/G2+yNxn12lmVJGI
        bVbSXWFuslvAQGnVWaS7/um+lQ8fTAHykCRxbjzQXGJn9Ppf7qiR1p3r7oMzdNYZ
        SnNFpdLLUOCOeNyWbx2FsXtKWwa2ijlr/xUaPH8wPWux6lrIkQy4X8fQQk3xQuXg
        ==
X-ME-Sender: <xms:suhvYH452vZ4Ocfc8d3MtmphqRuo0a8bnNCdeWA4lPDjmgCiuTtN6Q>
    <xme:suhvYM7Kr7ahS9OFdOwJtwuYf1pTEcuANehrV92QxhfqewhG36NwM1cZ0XL_KKbGE
    FJj4G6hwUlwxD1RIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:suhvYOfFVkotxjANrM4v20M2n8oaWldUxDKLQxDK-uvIxk47CzLspQ>
    <xmx:suhvYII5l6TdEya8viJsfh45vsECcBz1cf1mM4vgsjjV44kkJlFLGw>
    <xmx:suhvYLIMKu7BJi-p6OKPchO9mb1J5mQbVJvFxjkTBd0COQy-2keuFA>
    <xmx:tOhvYACRQL8HypBNWid_tgovkX-XBoqblJIGWYQyq862-732nBu7AA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C793FA0007C; Fri,  9 Apr 2021 01:40:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <b718a500-87e9-4958-a15f-56e024837ec8@www.fastmail.com>
In-Reply-To: <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
References: <20210319061952.145040-1-andrew@aj.id.au>
 <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
 <20210408121441.GG7166@minyard.net>
 <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
 <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
Date:   Fri, 09 Apr 2021 15:09:30 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>, "Arnd Bergmann" <arnd@arndb.de>,
        "Zev Weiss" <zweiss@equinix.com>
Cc:     "Corey Minyard" <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Patrick Venture" <venture@google.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Tali Perry" <tali.perry1@gmail.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "Benjamin Fair" <benjaminfair@google.com>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 9 Apr 2021, at 13:37, Joel Stanley wrote:
> On Thu, 8 Apr 2021 at 23:47, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 8 Apr 2021, at 21:44, Corey Minyard wrote:
> > > On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:
> 
> > > > > 1. It begins with patches 1-5 put together by Chia-Wei, which I've
> > > > > rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
> > > > > non-KCS LPC-related ASPEED device drivers in a way that enables the
> > > > > SerIRQ patches at the end of the series. With Joel's review I'm hoping
> > > > > these 5 can go through the aspeed tree, and that the rest can go through
> > > > > the IPMI tree.
> 
> > > > >
> > > > > Please review!
> > > >
> > > > Unfortunately the cover letter got detached from the rest of the series.
> > > >
> > > > Any chance you can take a look at the patches?
> > >
> > > There were some minor concerns that were unanswered, and there really
> > > was no review by others for many of the patches.
> >
> > Right; I was planning to clean up the minor concerns once I'd received
> > some more feedback. I could have done a better job of communicating
> > that :)
> 
> I'll merge the first five through the aspeed tree this coming merge
> window. We have acks from the relevant maintainers.
> 
> Arnd: would you prefer that this come as it's own pull request, or as
> part of the device tree branch?
> 
> Andrew, Corey: once I've got my pull requests out I'll look at
> reviewing the rest of the series. Perhaps it would pay to re-send that
> hunk of patches Andrew with the nits fixed?

Yep; Zev has done some reviews for me so I'll address those, rebase on 
your tree once you've sent out the pull-req and send out a v3.

Corey: Are you okay with that for now?

Cheers,

Andrew
