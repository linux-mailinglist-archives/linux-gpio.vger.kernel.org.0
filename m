Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30ECE79D91
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 02:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbfG3AtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 20:49:22 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60889 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729305AbfG3AtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 20:49:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C6A5B1A2A;
        Mon, 29 Jul 2019 20:49:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 29 Jul 2019 20:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=//bxTzdJC6FYnJ8JJ3y1ukSH+wo3cLC
        gVozwEDo36T8=; b=KTqftNq8QYCQrXig/XsbbLgZ+zHHDICl8jZvk56hbsWDrhf
        obn4v89riiZNIuHDriC2ksPJ1b89rg3r9tWlTC3CH6Wzdg851fBGd/VvD4MKUDB2
        CU8tdDpEhpcbX6icG3lj2WHUq4I5Qgn3lNFce8Prfk3v1uRKpjyzi0iwU+KXEPvf
        H6kBw7CxhM1mKD+MGBXqWOI7Sqtk7rm5owKYbM9FDy1bkdNTNaK0D8nYJQVq7QgZ
        qP+0yodv1KDJm5lOYVs8aacal/oEQCyVRcarx5n//9Elrt3z5v2KLuXOEVGEO9kE
        x4OnynpvS5X3PsaUn+9Pgvapb+XtrkCXGt8ONlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=//bxTz
        dJC6FYnJ8JJ3y1ukSH+wo3cLCgVozwEDo36T8=; b=djkIkPrhfyXdLZ3+GsUGa1
        /RABVspqJfLNY9ryyUmcobbeZrhGHtUlY08s0vC24nafuma6QpiY4SPlR+zoczcp
        ZZtguclDJ2oDwILiXKmgmd36kUG52pR9wWCpA6XZTMNuP/sroSo+x40J/RuTc13q
        X433pCqKlw9yslnaqdFOo8bVFbms0y2lywfOOVKfu8ysYyQcgWx8v0Orxaz8vcgZ
        bLwY9EjfmC/vArkv3dKw7pK5Hz9gKm45s/EMWA58sXEdub3xCbOXuyNjEL/gFvEj
        uTpno0xlEjddNbjpSqE7UzD1PsQoDHtu64nt3OO3VadW4veicLKRBVJzEPnAVjSA
        ==
X-ME-Sender: <xms:DpQ_XQPshh0cN23kN-QCdar2PN5kSloCkmm9b8tAHhYtKdeIH-MSew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:DpQ_XSe6CDqdG2n77zuDVY-UjeveM3u_44GJGJ5RNeYKcLOMV_soWg>
    <xmx:DpQ_XcWbDF7yzfysgOZsh8znG6OtrPetjaH8Cqch7TT8eOof5yrSFQ>
    <xmx:DpQ_XXodf1DbKrpF942pr1YAphj03s-CzJArNsqqYxzOhVlDHzt34A>
    <xmx:EJQ_XY5NdW9HEjfe7q7hFGK0QBZbWXqKxONinXKZviq_f7o7vI0M2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D66A4E00A2; Mon, 29 Jul 2019 20:49:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <1f5d34ef-ab30-4678-a44a-bdeefc41489e@www.fastmail.com>
In-Reply-To: <CACRpkdZVVgqdt=+YYEauChoxjqKk6=LNKzj-40u3CFLxJr0D7Q@mail.gmail.com>
References: <20190726053959.2003-1-andrew@aj.id.au>
 <CACRpkdZVVgqdt=+YYEauChoxjqKk6=LNKzj-40u3CFLxJr0D7Q@mail.gmail.com>
Date:   Tue, 30 Jul 2019 10:19:38 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
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



On Tue, 30 Jul 2019, at 07:25, Linus Walleij wrote:
> On Fri, Jul 26, 2019 at 7:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The aim of this series is to minimise/eliminate all the warnings from the
> > ASPEED devicetrees. It mostly achieves its goal, as outlined below.
> 
> I suppose it will all be merged in  the Aspeed tree?
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yeah, if you're happy for that. Thanks.

Andrew
