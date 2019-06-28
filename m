Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E27F58F7C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 03:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfF1BBR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 21:01:17 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46729 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726595AbfF1BBR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Jun 2019 21:01:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2A3631448;
        Thu, 27 Jun 2019 21:01:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 27 Jun 2019 21:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=6QkdIpPNZcez0nWZJny4hrwMOIoRT7+
        z3YW1PJJsa+0=; b=MyBHZuXxdmX/5SpLOi1pAk1sCtJy3enfybuFzaWKTrrihqf
        fjNZULa6ESDWG9Nb1IhjNaUOpYZKHFIDcgFyiFPg4JC97AXqbNcayZ0rTx2sGaZ2
        zQCnMf7nezIurCkUGAugjDNs4PXdf9Mha1OwOLdIRy2JuJnmOrIKCu5dWMRve7ny
        IHU5fjAUSZCjOCDUTaJO0hOwf1aHHz8yh64OjkbITBempZkcG9vMe0kchf7gViUc
        q6wJasjAVeHjWXYKG2uB5UjyTlH+3+p4iL28aEN82uexhYbGjCX9iIlFx5Bb8E0x
        Dt5XRi/Mqf0398zbAzSg9WVWxEeo5ebcPkwZeCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6QkdIp
        PNZcez0nWZJny4hrwMOIoRT7+z3YW1PJJsa+0=; b=aOvbE5MWRlWu77Pg+XZaA/
        u4PlEqmN0NQRyeeEAHI37JRT5naI2Yzcgh5r+3Ovx+A6tOZ0YUE69dSLNvvnlgtC
        0rr+BGnl0AmCuryqoZyldci7C9uWKjCRB7RYblWj70Akm9wL8e7Yfpa4nAE+9RVZ
        47G8Q4DC8RfQSoughbd67uc4HGwhmNZVA6ZxBve8RQERZ29ep0tQFWEfmZS1kYyB
        mckAxPBzpheOfqxG/Q54sP+aGp0V3afVQY8wAZrr6TFdxwVo1PbUmUoJc8dS6Vs+
        Tafs4h/6x+M7+MM80WUPi/WmfEUXhGkYriNoBojwrgVVuDYKaVoDDkVAjsDhmzIA
        ==
X-ME-Sender: <xms:2mYVXZRh07v3m3dtSpcqvSBZhb3GnfbHz-u-bsw1kRb6Mvs22kxfdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:2mYVXQRnCamIqGoCcwQ4HGTSFXWpd7-rjjS744xveIwEbLYzbV5eiw>
    <xmx:2mYVXRdoBHmREkPzHUUNTFrBhroqsf2TSy20snTyK8odUSz6fSUTAQ>
    <xmx:2mYVXWdJECu90yIqi6uBcSVlaESB7fOX6doZKI4a18B3urbJj8mAUg>
    <xmx:3GYVXdkcWIdXmwbmCLrdk1-KHTzuUFRg8uGxViV45__3yffNc6InwA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 17816E00A3; Thu, 27 Jun 2019 21:01:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <67703d84-a827-4a5c-bf75-37a619f1de94@www.fastmail.com>
In-Reply-To: <CACRpkdZtTy-HHu2O4aOaqV5ZdxcYYPFRuxK2jjnw+_O1xcF1rg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
 <CACRpkdZtTy-HHu2O4aOaqV5ZdxcYYPFRuxK2jjnw+_O1xcF1rg@mail.gmail.com>
Date:   Fri, 28 Jun 2019 10:31:13 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Joel Stanley" <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        linux-aspeed@lists.ozlabs.org,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/8]_dt-bindings:_pinctrl:_aspeed:_Split_bindings_d?=
 =?UTF-8?Q?ocument_in_two?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 27 Jun 2019, at 20:56, Linus Walleij wrote:
> On Thu, Jun 27, 2019 at 4:32 AM Joel Stanley <joel@jms.id.au> wrote:
> 
> > I think we can use this as an opportunity to drop the unused g4-scu
> > compatible from the bindings. Similarly for the g5.
> >
> > Acked-by: Joel Stanley <joel@jms.id.au>
> 
> I assume I should wait for a new version of the patches that does
> this?

I'll take a look at the gX compatibles more broadly in a separate series.
I'm cleaning up the current series wrt Rob's comments and I hope to
send it out shortly.

Andrew
