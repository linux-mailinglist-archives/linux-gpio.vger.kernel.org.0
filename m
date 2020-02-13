Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCE215B630
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 01:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgBMAyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 19:54:54 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:57079 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729190AbgBMAyy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Feb 2020 19:54:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 967B9EB3;
        Wed, 12 Feb 2020 19:54:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 12 Feb 2020 19:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=kvIcpzMnZDBTrKFTCocK1+6gG8eemWb
        Co4P6LYqLFvs=; b=UDW8jybLIIdDBBt9Ku/iP0HlGSMGGALp9ncys+sWCqk9rIu
        z8z14n2X3kds4Jen2mHXJvHiY8wXI57LdB1vdI2Zrf51g7VhVnaVKg/zmxl7FOCk
        URzgO8f/f7OsRbaxvKjhGN/dLZMKYIH90g83pBr6F6+FYay7MdI3i18K1thyor0S
        vgitlZFPD5KQ/I7EjW1hylmtElfuZ5UQ23hq8yAjuncEDV99TiDYw7Ka/ScKXOt5
        JwgTKrD24wt0ea4VkH6JviGjE7wEX51KbG4WVKUTYftSdmhr4up+zIRSFDf7BvJe
        SBR6ot6ROmM5+zLXfQo5oSa6zp4N1QqCM7BFM3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kvIcpz
        MnZDBTrKFTCocK1+6gG8eemWbCo4P6LYqLFvs=; b=I3yYMJOj1MN3yYFnfM0cx1
        RcbLzFg3aKsvsWTCDkMm1yPaly/2WKE4wm5JUWjoGJN8C0Vs+onpJfxwH24AVE8z
        cgQ+1hMpI8J+BxMoOjlQZ6GgU1cEmw3wLJXZPYBUe+3YDQLyU4/z3H/Y/avphF8V
        mRKGoylgYXVXn2LGN+Gdt1S45/GlG0jYY8p4RXzLddWoEKskcaLOZmRYmMXxskyE
        I2TUqIXlUZgEucs3NTxRWJXNWIQrr68EJfF2UzJtdcPHw84Ht1wjksg84wklpVOT
        8UCakDbMVO+/SDT3NIhE5bz7aRrqhFPZ+X2s2iEckqJDZVwwgJoHsp9Wx5jG71sQ
        ==
X-ME-Sender: <xms:V55EXkAzRdV4rAbWN03GGELs2jHu3cs-01UwlblbWiYJoOgPXIrvpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieejgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
    htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
    rdhiugdrrghu
X-ME-Proxy: <xmx:V55EXitAfaithfdZSxrv88Msl9bhCOoJmXkykQyPueu75xmPlVwuwg>
    <xmx:V55EXqeqPTGQoKHodorareVjiqYA8HOLTpOiIWw9CxYW_twfnSqy5g>
    <xmx:V55EXpa1i15G_s792VwBSjznbgXfEnso0YAI-Mir6eD5GF57kUnqTA>
    <xmx:XJ5EXjdH7gkCb21m1W2jjnwGtewnUIkhfZxrbk93jpDtiNPh0k1oIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F3F98E00A2; Wed, 12 Feb 2020 19:54:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <288ba2d7-77dc-40a7-90e8-f2781b3fe067@www.fastmail.com>
In-Reply-To: <CACPK8Xdg0ocBzDqtkoo8cSCpUq+QjHQ1PKrsVZd8NPUvPFeFCw@mail.gmail.com>
References: <20200206170234.84288-1-geissonator@gmail.com>
 <CACPK8Xdg0ocBzDqtkoo8cSCpUq+QjHQ1PKrsVZd8NPUvPFeFCw@mail.gmail.com>
Date:   Thu, 13 Feb 2020 11:24:36 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Andrew Geissler" <geissonator@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Andrew Geissler" <geissonator@yahoo.com>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] ARM: dts: aspeed: witherspoon: Add gpio line names
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 10 Feb 2020, at 12:59, Joel Stanley wrote:
> On Thu, 6 Feb 2020 at 17:03, Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > From: Andrew Geissler <geissonator@yahoo.com>
> >
> > Name the GPIOs to help userspace work with them. The names describe the
> > functionality the lines provide, not the net or ball name. This makes it
> > easier to share userspace code across different systems and makes the
> > use of the lines more obvious.
> >
> > Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I will wait for  Andrew before merging, but this looks good to me.

To the best of my knowledge this is the only supported approach.

I haven't checked the mapping of gpio lines to functions, but for
the concept:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Andrew
