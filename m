Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F1D331D1D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 03:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhCICqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 21:46:18 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41097 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229599AbhCICqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 21:46:18 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6A18658077B;
        Mon,  8 Mar 2021 21:46:17 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 08 Mar 2021 21:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=Tpdvc0wIJyQlbESu9uTMwNjhu6BkX05
        ntP+NLrip8N8=; b=fbbwAutXo3dNbhPjH2Fc1TRDi2WNPtt0PdwmRmCbuKRQKwb
        xQuFJ731mrIMCsLQgutAkbEf70bBP1WGd3mVLmYe6lhIDO4S0c9r6Yqo3JuNySsY
        t/J+2h9QRN7qGNsdZe8JNm9xSQgNkyGPW9CmWugKQY1J9R9n2w8Zx6Uh9KFejqe2
        udZ3LqayR2e/L5fiQEwTS8983sMNoCMV0KeQRejejOKoDTqGuad2OrL+jj6gIeA2
        iA5j0VLgU1GDh/rm4GhTP3gywPbqXMFpzasrCnEO1CbN9DBGiDpOifXIS4j3X0/U
        eZjYArRiIFeLDtrfAosCiYljBtu0buWpaH2qzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Tpdvc0
        wIJyQlbESu9uTMwNjhu6BkX05ntP+NLrip8N8=; b=AjTM0mIH1z4B0Xh+oM/oxt
        QoP+Sr+ZU+EX78gTuEN+l2i/Snz9ejRcszvXnJr+lTCh3099W0rw0JYDMw5vuteg
        Kj5FUMRKXRHSQR7qJ2euBD0MzEhVMZq/ECyLR9Bw+ERheiPEhpwCpeet9vgD5CER
        J9IDNanmdMsH/iIBt6gQpqMYY1eSu9PnParU9FjiGVmVJeaKy975dKoVoe6iFOsi
        PaW+1a+gSDwV5OXtDq27oNiQJEm/n2tzmRq38q8dliUT8Q9DpydfnVA2arahdSDl
        B8j+Ftqb9wQm7hL1OVjOmvI21NmkwUCVUXuP9UdVUtSjLc50y9xXI95eHEwfIvug
        ==
X-ME-Sender: <xms:d-FGYKvxk6NSN9cSuRTS6hi-JLu0eUiu8dpDVbBEx6sqCk8JaNHTSw>
    <xme:d-FGYPejt-whBncMjC81hZLfrIBSsxX49iCp8bvbev35w4Nv9dY-_xlULMIdQu7bI
    HQMI4LCPnwd6S3djg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
    jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghu
X-ME-Proxy: <xmx:d-FGYFwSlRjhgPZQxeJ519D6v7UCNOZtcj3Ij1BCTVHy6cTJFPts7Q>
    <xmx:d-FGYFPlql9I9BSvNVg_KSslgT6Z201lJcETny7WP08g9NoCGBKwfQ>
    <xmx:d-FGYK_6k-S6NEstvVd7f93XPQFmjBeq0bEIowfTCBkVhq2aWopLjQ>
    <xmx:eeFGYKOMhTmwCBXjdbzOroRCsY3EGwpmWTQTM3N9RYG5LzxwnAr8MQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A3B3FA00068; Mon,  8 Mar 2021 21:46:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <0fbc1435-1f0f-4c0e-935f-95874d438fbf@www.fastmail.com>
In-Reply-To: <20210305230710.GA798530@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-17-andrew@aj.id.au>
 <20210305230710.GA798530@robh.at.kernel.org>
Date:   Tue, 09 Mar 2021 13:15:55 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh@kernel.org>
Cc:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        "Corey Minyard" <minyard@acm.org>, "Joel Stanley" <joel@jms.id.au>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        "Tali Perry" <tali.perry1@gmail.com>,
        "Patrick Venture" <venture@google.com>,
        "Nancy Yuen" <yuenn@google.com>,
        "Benjamin Fair" <benjaminfair@google.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_16/19]_dt-bindings:_ipmi:_Convert_ASPEED_KCS_bindin?=
 =?UTF-8?Q?g_to_schema?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Sat, 6 Mar 2021, at 09:37, Rob Herring wrote:
> On Sat, Feb 20, 2021 at 12:55:20AM +1030, Andrew Jeffery wrote:
> > Given the deprecated binding, improve the ability to detect issues in
> > the platform devicetrees. Further, a subsequent patch will introduce a
> > new interrupts property for specifying SerIRQ behaviour, so convert
> > before we do any further additions.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
> >  .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
> >  2 files changed, 92 insertions(+), 33 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > new file mode 100644
> > index 000000000000..1c1cc4265948
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED BMC KCS Devices
> > +
> > +maintainers:
> > +  - Andrew Jeffery <andrew@aj.id.au>
> > +
> > +description: |
> > +  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
> > +  interfaces on the LPC bus for in-band IPMI communication with their host.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: Channel ID derived from reg
> > +        items:
> > +          enum:
> > +            - aspeed,ast2400-kcs-bmc-v2
> > +            - aspeed,ast2500-kcs-bmc-v2
> > +            - aspeed,ast2600-kcs-bmc
> > +
> > +      - description: Old-style with explicit channel ID, no reg
> > +        deprecated: true
> > +        items:
> > +          enum:
> > +            - aspeed,ast2400-kcs-bmc
> > +            - aspeed,ast2500-kcs-bmc
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reg:
> > +    minItems: 3
> > +    maxItems: 3
> > +    description: IDR, ODR and STR register addresses
> 
> items:
>   - description: IDR register
>   - description: ODR register
>   - description: STR register

Oh, neat.

> 
> > +
> > +  aspeed,lpc-io-reg:
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    minItems: 1
> > +    maxItems: 2
> 
> A uint32 can only have 1 item. uint32-array perhaps?

That sounds more appropriate.

> 
> 
> > +    description: |
> > +      The host CPU LPC IO data and status addresses for the device. For most
> > +      channels the status address is derived from the data address, but the
> > +      status address may be optionally provided.
> > +
> > +  kcs_chan:
> > +    deprecated: true
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    maxItems: 1
> 
> Drop

Ack.

> 
> > +    description: The LPC channel number in the controller
> > +
> > +  kcs_addr:
> > +    deprecated: true
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    maxItems: 1
> 
> Drop

Ack.
