Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302CF35B82E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 03:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235681AbhDLBec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 21:34:32 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51123 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235543AbhDLBec (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Apr 2021 21:34:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C0D4A580424;
        Sun, 11 Apr 2021 21:34:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Sun, 11 Apr 2021 21:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=BG5hllZBbXO/uaUx2ho6c9NeeDH0XaQ
        6oWYDpW//0Ds=; b=kF6J7vJlfzPeJki4UBh4ni0qEwV1lpJbHHcYZAPVECpYBIS
        UG38LvqvRbNJVHEyps6jp558YoerrJPco4D31+TIbffAZtuRSGALC3cQrlEkIV7F
        W7Zeyl8OdGAeaqFlLbIO/JltoJHi+OClhehnx/yMxPy8HuIuRdX2T/eyUXIwAnZb
        GZg3CUTTJE7QWJsA4sAmiRV+Hm6xiAzZzlvF0L525y4PDr02c2Yi9mrqxjPORsQa
        J32GG3K1vzWi/ASdHFyZPm4mcRS6CBlDv7zPWsW2tG4PXG0ym3QwUTBHtk+GQJJn
        7nLwKiOZj7Z8K33ApJoPxgDEoRUMq0kEdv0UGzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BG5hll
        ZBbXO/uaUx2ho6c9NeeDH0XaQ6oWYDpW//0Ds=; b=G8BNco2N6IZ9Vm5RUcE29x
        aMCp6xE7gGZxnkE72tX5/VULywfeW2gcpuYWWFrhCeV8ha5kwk9s7G9t/aD9bhXH
        LBfkSDUne1tF/ygIT1Pq+aXZ1U0Lr2iIMNX/Yr8ock/cgVbJRcUCRh+fGvCCzQFc
        nOnHCob/E4U13OKAoH1hufv8mXVxmPWRBHi4SMFiYrh37hWg8vZBAkFeIoFpbbM1
        TzrXtyWy64AkaS8q5TDO5EVzL9iZ1OGO/jcCwed2PUcZ0bGHQ+//DmpNxggGeRz6
        /vkOBDjFzA+BoNayVE1p04OoCeZU11uIYL5gXk8oBsPwhuCij4AJwmxQIrkEDMqw
        ==
X-ME-Sender: <xms:laNzYHYfkdm4xZkWh1ohaN-VgrO6EdUs-eRDUnzgjNu15oZHVLOZ-g>
    <xme:laNzYGaFzKEe-bULTyvDc_hI3qKnFWN9sY8X_FtEoPwq3wmlgK67BUzdJ4y78RC3A
    stri1S7EQBO5AJccA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:laNzYJ_IVgmsW7oVD2L_M2G9J-OlwJeiVWNlgNpYIMG4LBfUEFIOcQ>
    <xmx:laNzYNqxqQvtE5pqmfQg71mk3Yq1ub6OTBQfDiOPAzmER8i7sSBubw>
    <xmx:laNzYCpaRqoJazz3ANLOaVNL-Nfuu_Qp-0kAJcg8ZwT49Fy1VTWF2g>
    <xmx:lqNzYHgjphF3n8_6Gp-wHXjnm_KPTVYBgNmZa_af57Vbu39evGVMmg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3B785A00079; Sun, 11 Apr 2021 21:34:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com>
In-Reply-To: <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-16-andrew@aj.id.au>
 <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
Date:   Mon, 12 Apr 2021 11:03:52 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Arnd Bergmann" <arnd@kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     openipmi-developer@lists.sourceforge.net,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Corey Minyard" <minyard@acm.org>, "Joel Stanley" <joel@jms.id.au>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        DTML <devicetree@vger.kernel.org>,
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
Subject: =?UTF-8?Q?Re:_[PATCH_v2_16/21]_ipmi:_kcs=5Fbmc:_Add_a_"raw"_character_de?=
 =?UTF-8?Q?vice_interface?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 9 Apr 2021, at 17:25, Arnd Bergmann wrote:
> On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> > However, KCS devices are useful beyond IPMI (or keyboards), as they
> > provide a means to generate IRQs and exchange arbitrary data between a
> > BMC and its host system.
> 
> I only noticed the series after Joel asked about the DT changes on the arm
> side. One question though:
> 
> How does this related to the drivers/input/serio/ framework that also talks
> to the keyboard controller for things that are not keyboards?

I've taken a brief look and I feel they're somewhat closely related.

It's plausible that we could wrangle the code so the Aspeed and Nuvoton 
KCS drivers move under drivers/input/serio. If you squint, the i8042 
serio device driver has similarities with what the Aspeed and Nuvoton 
device drivers are providing to the KCS IPMI stack.

Both the KCS IPMI and raw chardev I've implemented in this patch need 
both read and write access to the status register (STR). serio could 
potentially expose its value through serio_interrupt() using the 
SERIO_OOB_DATA flag, but I haven't put any thought into it beyond this 
sentence. We'd need some extra support for writing STR via the serio 
API. I'm not sure that fits into the abstraction (unless we make 
serio_write() take a flags argument?).

In that vein, the serio_raw interface is close to the functionality 
that the raw chardev provides in this patch, though again serio_raw 
lacks userspace access to STR. Flags are ignored in the ->interrupt() 
callback so all values received via ->interrupt() are exposed as data. 
The result is there's no way to take care of SERIO_OOB_DATA in the 
read() path. Given that, I think we'd have to expose an ioctl() to 
access the STR value after taking care of SERIO_OOB_DATA in 
->interrupt().

I'm not sure where that lands us.

Dmitry, any thoughts here?

> Are these
> separate communication channels on adjacent I/O ports, or does there
> need to be some arbitration?

As it stands there's no arbitration.

Cheers,

Andrew
