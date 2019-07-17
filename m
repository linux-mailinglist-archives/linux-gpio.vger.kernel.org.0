Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEA66B52D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 05:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbfGQDvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 23:51:46 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54717 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728414AbfGQDvq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jul 2019 23:51:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7B1463D4;
        Tue, 16 Jul 2019 23:51:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 16 Jul 2019 23:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=4thMvaSx0dpdp8DeVpL+Ehe2s0YHQve
        mqdikPWzNKA8=; b=Ittckpy2uxPxMjk3vbo4z3p6QAjtzQ56b7VaChGXt5GhQR7
        raffad0sc3NM7F+FzXEML/2ezsfrxis739rcK0x2BVVHJz7WcifPsvQarI41gr82
        xzqJiwKTHOS4ecaBV3Y6awKMy5r8V4hP2kyqPPj0M1oTrRL7wmc8/AbvVB/v+0Tu
        ze3AwaSZDtxXazDMuIPxzIlNk30f5u9I0hwxcjtMu14aNb2em+qBNatHfkVmp87i
        gG/m4Bm+UFVSmZhckwoCTJwxyML6z9MwP5C4w/FFXis9DgzdQbG4RCHOg6U09Atl
        4aNny7PHO333Nx9xn6JBgoGLA4TBjC/RvM9AnMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4thMva
        Sx0dpdp8DeVpL+Ehe2s0YHQvemqdikPWzNKA8=; b=MNHcRQMsbJd56eano2zAeE
        7HjQLYOzNzGZrnT0sRqoLYDN2Y06t3xZm1D6SNg8mrZzlsVeCUxsobqI52A9nOkb
        ppvid8kfSF5a3QBzPb4eqbt4mrt3/YmZS4iObo9feApW5lLwBWnoN0U1UcdPjWVp
        hSQwH1HGU5/r40Hsu08s5DZhl7tiEGOMipf5srb4vGLbhqL2QutbtmWxJ6JLUE9Z
        U0lrygUA4ScATFBq0R/owdLQY8TuZwb8pMrEmP7lOVaH/MBKn6TBv+op1qRCPdg5
        OJjOHIK0dsI+zRfvA6UKjhYxmOa3fMwSUjL6W7+l0Thra3cxg2hpwtQit/yFs2kQ
        ==
X-ME-Sender: <xms:UJsuXa9AKq8eTdfjqInMIzFJmHl-qjr2eYXJEVOmibOw4dZtk7CNGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:UJsuXczKHxs6tx-PDyyyxJADh6EYzkly6D-elgEZFQTDhP77mq4bnw>
    <xmx:UJsuXaHoN2wACqzUMoyEqMAV3Hub67ooom2BhoP1o6re9Hs-1BRu2w>
    <xmx:UJsuXdKd42ax_K_IlmkLJzMX9iP6VYraDloBauLf2RayGj3T2HEaZQ>
    <xmx:UZsuXaCap9UL7j-gXkYzNknX1GMJglrxqMYx8QG5SfuUTg1Z4nXCWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 80240E00CC; Tue, 16 Jul 2019 23:51:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <7b027585-27ab-4070-bf2e-5d08800e1a90@www.fastmail.com>
In-Reply-To: <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
References: <20190715223725.12924-1-robh@kernel.org>
 <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
 <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
Date:   Wed, 17 Jul 2019 13:21:54 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh@kernel.org>, "Joel Stanley" <joel@jms.id.au>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-aspeed@lists.ozlabs.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_dt-bindings:_pinctrl:_aspeed:_Fix_'compatible'_sch?=
 =?UTF-8?Q?ema_errors?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 17 Jul 2019, at 00:35, Rob Herring wrote:
> On Mon, Jul 15, 2019 at 5:17 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
> > >
> > > The Aspeed pinctl schema have errors in the 'compatible' schema:
> > >
> > > Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> > > properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> > > Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> > > properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
> > >
> > > Flow style sequences have to be quoted if the vales contain ','. Fix
> > > this by using the more common one line per entry formatting.
> >
> > >
> > >  properties:
> > >    compatible:
> > > -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> > > +    enum:
> > > +      - aspeed,ast2400-pinctrl
> > > +      - aspeed,g4-pinctrl
> >
> > Thanks for the fix. However, we've standardised on the first form for
> > all of our device trees, so we can drop the second compatible string
> > from the bindings.
> 
> Doing that would introduce validation warnings until the dts file is
> updated. So we still need this change until that happens.

My series takes care of that.

Andrew
