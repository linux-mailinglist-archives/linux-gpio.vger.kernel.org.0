Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D179279DBE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 03:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbfG3BJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 21:09:36 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58955 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728351AbfG3BJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 21:09:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3E9B01BF6;
        Mon, 29 Jul 2019 21:09:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 29 Jul 2019 21:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=eN6StjwqcbFvBGm255dFKEDbANWqniw
        k/QHr4l2B8Yk=; b=f9JjiX8oQOMQXV/cuozHUCB4pzOqt3MgGW5j+ieLKBluIxW
        9qTwq16SPmkbKZ2pU0uVnnexkGeGhPnlufG7wmA9iOB42se/Uf/FR/SHRk5vwHMb
        rQ0Kj3wnv5HEKZnzXLIyQSCyTI2BpBfwflzcNYzctlZqmI+CiNJ4l4JgrgYy6r1m
        NJ9miZpWKnckdH5OlyCDvoQhsp3Kvkw/0tg7IdjqtutG3J+VFry8r4NtTXuQMCpM
        Y6Et7QDm66hADgvC81l39Y6KDmUmhQwayD2oFZUbxxLT5/9WVXrd39o8b0C+4VIy
        iVWvG6oFint2AoFBApfI8FzvRiWseYT3VPb+7zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eN6Stj
        wqcbFvBGm255dFKEDbANWqniwk/QHr4l2B8Yk=; b=RSnK+zp5XQ2Pj5z+B23X3U
        FxtVThX/Pze3piInoA1RfkTO/LJ0EGEq98eNVSd1eayua0j3DZTD7yqo/zuzj9Hz
        BJWf2XEEi2wSi2MjH8aXEb8hcpxabAx/M0QK+2q9n9lpZ9NWpF3alykQ+Bv6xtgx
        /XWZAievp2xWgqhiB2Ym8D5RZ+YPNw4BrNm2whyqOcknssCzFWm/Z3P1yuBzQNoj
        11ctvzcg61B2PnNNPi7X5dSMMmi9/DyZdlAGJb8biY1URabakNUt7sRc807uNwMX
        itWgUD4bHFSaAjDddJCQ1vLncAc4VDDt0s59RTrrMKeF8c9RXtnLxt12QtMWj8fg
        ==
X-ME-Sender: <xms:ypg_XWD0fvgphH0bKAtdbmjhhV4XR9GAIDKsRB10kWINyjXLH4Wc0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:ypg_XaL_sEFBx_mHFMgwgdfWYKnqPOJC6LSyKiv9-P9kg1toiahNEg>
    <xmx:ypg_XZlbMtW5I8SQZPxmkF3EJHXElDHsuPGNjGotVFbMyyLiQfev6w>
    <xmx:ypg_XYF-Rlh1zv2TKQf5VjLD5Ztb6lISs-krArhgwH0JB916oBBO-A>
    <xmx:zpg_XY3LE8XATRTj3ADjatzlERoBIPOZF0DQiunqP5xql6r5inXSmQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C726FE00A2; Mon, 29 Jul 2019 21:09:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
In-Reply-To: <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
References: <20190726053959.2003-1-andrew@aj.id.au>
 <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
Date:   Tue, 30 Jul 2019 10:39:50 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh+dt@kernel.org>
Cc:     linux-aspeed@lists.ozlabs.org,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Adriana Kobylak" <anoo@us.ibm.com>,
        "Alexander A. Filippov" <a.filippov@yadro.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        =?UTF-8?Q?YangBrianC=2EW_=E6=A5=8A=E5=98=89=E5=81=89_TAO?= 
        <yang.brianc.w@inventec.com>, "Corey Minyard" <minyard@acm.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Haiyue Wang" <haiyue.wang@linux.intel.com>,
        "John Wang" <wangzqbj@inspur.com>,
        "Ken Chen" <chen.kenyy@inventec.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        "Patrick Venture" <venture@google.com>,
        "Stefan M Schaeckeler" <sschaeck@cisco.com>,
        "Tao Ren" <taoren@fb.com>, "Xo Wang" <xow@google.com>,
        yao.yuan@linaro.org
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 30 Jul 2019, at 10:23, Rob Herring wrote:
> On Thu, Jul 25, 2019 at 11:40 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello,
> >
> > The aim of this series is to minimise/eliminate all the warnings from the
> > ASPEED devicetrees. It mostly achieves its goal, as outlined below.
> >
> > Using `aspeed_g5_defconfig` we started with the follow warning count:
> >
> >     $ make dtbs 2>&1 >/dev/null | wc -l
> >     218
> >
> > and after the full series is applied we have:
> >
> >     $ make dtbs 2>&1 >/dev/null | wc -l
> >     2
> >
> > for a 100x reduction.
> >
> > Getting there though isn't without some potential controversy, which I've saved
> > for the last half of the series. The following patches I think are in pretty
> > good shape:
> >
> >   ARM: dts: aspeed-g5: Move EDAC node to APB
> >   ARM: dts: aspeed-g5: Use recommended generic node name for SDMC
> >   ARM: dts: aspeed-g5: Fix aspeed,external-nodes description
> >   ARM: dts: vesnin: Add unit address for memory node
> >   ARM: dts: fp5280g2: Cleanup gpio-keys-polled properties
> >   ARM: dts: swift: Cleanup gpio-keys-polled properties
> >   ARM: dts: witherspoon: Cleanup gpio-keys-polled properties
> >   ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
> >   ARM: dts: ibm-power9-dual: Add a unit address for OCC nodes
> >
> > With these patches applied we get to:
> >
> >     $ make dtbs 2>&1 >/dev/null | wc -l
> >     144
> >
> > So they make a dent, but fail to clean up the bulk of the issues. From here
> > I've mixed in some binding and driver changes with subsequent updates to the
> > devicetrees:
> >
> >   dt-bindings: pinctrl: aspeed: Add reg property as a hint
> >   dt-bindings: misc: Document reg for aspeed,p2a-ctrl nodes
> >   ARM: dts: aspeed: Add reg hints to syscon children
> >   dt-bindings: ipmi: aspeed: Introduce a v2 binding for KCS
> >   ipmi: kcs: Finish configuring ASPEED KCS device before enable
> >   ipmi: kcs: aspeed: Implement v2 bindings
> >   ARM: dts: aspeed-g5: Change KCS nodes to v2 binding
> >   ARM: dts: aspeed-g5: Sort LPC child nodes by unit address
> >
> > By `dt-bindings: ipmi: aspeed: Introduce a v2 binding for KCS` the warnings are
> > reduced to:
> >
> >     $ make dtbs 2>&1 >/dev/null | wc -l
> >     125
> >
> > The bang-for-buck is in fixing up the KCS bindings which removes all-but-two of
> > the remaining warnings (which we can't feasibly remove), but doing so forces
> > code changes (which I'd avoided up until this point).
> >
> > Reflecting broadly on the fixes, I think I've made a mistake way back by using
> > syscon/simple-mfds to expose the innards of the SCU and LPC controllers in the
> > devicetree. This series cleans up what's currently there, but I have half a
> > mind to rev the SCU and LPC bindings to not use simple-mfd and instead have a
> > driver implementation that uses `platform_device_register_full()` or similar to
> > deal with the mess.
> >
> > Rob - I'm looking for your thoughts here and on the series, I've never felt
> > entirely comfortable with what I cooked up. Your advice would be appreciated.
> 
> The series generally looks fine to me from a quick scan. As far as
> dropping 'simple-mfd', having less fine grained description in DT is
> generally my preference. It comes down to whether what you have
> defined is maintainable. As most of it is just additions, I think what
> you have is fine. Maybe keep all this in mind for the next chip
> depending how the SCU and LPC change.

Okay, I think the timing of that suggestion is good given where things are with
the AST2600. I'll keep that in mind.

Consensus so far seems to be that the series is fine. I'll split it up and send out
the sub-series to the relevant lists with the acks accumulated here.

Thanks all for taking a look.

Andrew
