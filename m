Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105F3331D18
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 03:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCICpk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 21:45:40 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38713 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229599AbhCICpP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 21:45:15 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C9CE5580795;
        Mon,  8 Mar 2021 21:45:14 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 08 Mar 2021 21:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=qRybQhRN/O0nr4FGzlsF5grYQeYZu8u
        crJLcVTZ+qd0=; b=QOXTD5AO8JgTi78Gox3qd+o0cQCodeaVASzuajwdav5Y2hC
        4avnt+mIqAteWzqQDJl9a+QBx+HWM83Gk8XIX3u3/8IoOxIpfAhVm0FteiFTDHU8
        UwnYHebv1bSlVT/QLDChvmP7j9MwiX+8RFkMT4zCiclkKaUOimes4zpaPZa94zB7
        BAu4JaRJB3JUe2FFr1s9ti6JN1lAbNCqTKBqSjZjKFnT5CkATt6/FEDBe1Fbe4gJ
        D0U2yfwxYdj1M8DA7OVJ8w0HqvbaDOcrNGrDuwksoN/ZhLutauiUsz50QyJjeiYI
        pceRzncgFai4/nRAJK/s+SQqGIgjF/NUaPhONoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qRybQh
        RN/O0nr4FGzlsF5grYQeYZu8ucrJLcVTZ+qd0=; b=aDdpVZRzVu/fS0qCUO6nOt
        oEgpCu/QYslFEzpsvzX7ndTe8eRiqTfW1+F4Fv5rSljjXczfv7nrbqAWr3zapAW0
        OjefFWXSx9RK3x20MIrnZcNoti7tW/oJNtSA/IV7IGOQHDvleipPI09EiprnhU9o
        kt5scxewJhaB6Qq51S97vCJklRMPZ9wqdCDkJp6r7hTpTZ25zNabBWCCaBJG9QKb
        9u6RelhaplCmdQf+JB8koj+J5GNSUsr4cXpmXqevWGEjrvMfmV3DRpgqVTIImVfo
        ECd+27HzMXYje4l4PuXUIUPvFoestcAbxKMjRp5oAEw7dxy3qsvV9LfT+/Sh16IA
        ==
X-ME-Sender: <xms:OeFGYDnuPNqO225nJFIOksYE4N-W8_TT57d--pKiJK5IItujip51ng>
    <xme:OeFGYG3AevxgNkp6GBMoCi17lsCIk0UfPd4Zb0S2-1acVmFRKmVe3pjedveEy_gHz
    CwHMO254a3PIWOkOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:OeFGYJo0AqsS8xJQPVQeyVcw51jBuDXitZCYSpimI6GuXdKxDCpt9g>
    <xmx:OeFGYLktDhp7hqaYr6namfV8BupM_mzss-zlC4J7CcD3HGisilXfhg>
    <xmx:OeFGYB1y7aWjmsX_j2hoYnrsWZ1vIeNG-hTGQDkdrPZnB18ZfhWOxQ>
    <xmx:OuFGYLM4Nh9o6VssFPquDGq2opK0-qo-dL8LHWiAIMvmBVsXSXAgUg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 45659A00064; Mon,  8 Mar 2021 21:45:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <331c242b-cf22-4d0e-a08c-b9dbb06f2f32@www.fastmail.com>
In-Reply-To: <20210305230940.GA809870@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-18-andrew@aj.id.au>
 <20210305230940.GA809870@robh.at.kernel.org>
Date:   Tue, 09 Mar 2021 13:14:52 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        "Corey Minyard" <minyard@acm.org>, linux-gpio@vger.kernel.org,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Patrick Venture" <venture@google.com>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, "Tali Perry" <tali.perry1@gmail.com>,
        linux-aspeed@lists.ozlabs.org,
        openipmi-developer@lists.sourceforge.net,
        "Lee Jones" <lee.jones@linaro.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        "Benjamin Fair" <benjaminfair@google.com>
Subject: =?UTF-8?Q?Re:_[PATCH_17/19]_dt-bindings:_ipmi:_Add_optional_SerIRQ_prope?=
 =?UTF-8?Q?rty_to_ASPEED_KCS_devices?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Sat, 6 Mar 2021, at 09:39, Rob Herring wrote:
> On Sat, Feb 20, 2021 at 12:55:21AM +1030, Andrew Jeffery wrote:
> > Allocating IO and IRQ resources to LPC devices is in-theory an operation
> > for the host, however ASPEED don't appear to expose this capability
> > outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
> > registers for managing these resources, so introduce a devicetree
> > property for KCS devices to describe SerIRQ properties.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > index 1c1cc4265948..808475a2c2ca 100644
> > --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > @@ -47,6 +47,18 @@ properties:
> >        channels the status address is derived from the data address, but the
> >        status address may be optionally provided.
> >  
> > +  aspeed,lpc-interrupts:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> > +    minItems: 1
> > +    maxItems: 1
> > +    description: |
> > +      A 2-cell property expressing the LPC SerIRQ number and the interrupt
> > +      level/sense encoding (specified in the standard fashion).
> 
> That would be uint32-array with 'maxItems: 2'.
> 

Ah, thanks.
