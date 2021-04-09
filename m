Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE630359497
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 07:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhDIFdq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 01:33:46 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37671 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229840AbhDIFdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 01:33:45 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D2E5C5803EA;
        Fri,  9 Apr 2021 01:33:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=6KsZEWbeiMrRF/Lxcx0y3lXRjdkXfUp
        TzDsTGr+HZU4=; b=s7aTIHdPkWUUh50pfSfs9YrIamJKh1LwCTdl5ksQMzQC06W
        EUdsfUV/ewk95//Jv4HuOkMH6DKQwTdKfwt43N2rRyyv/otaXCgjqriNAjr0oZU/
        luVeRv3frbUuwUACxK1JGYFu7MH0kGfn99b8lBJ5UQvMeOW0FaYpbGtRLf35teSt
        zEI4749bzFfvojnrKsZ6D/nzmfZWT9gP8dWOl7kHFELvpR38/e4O+3UQn2QPt3dW
        bR3r0+b3vzmlNqXNmD5E8Mh+r+n4oZ+9zI7H5do98CqAw93mTh1vM2/GxkmTBp5e
        sIA+VoXzUfbjG6f7IARyCiIvIC3+Yns+Ou0X8og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6KsZEW
        beiMrRF/Lxcx0y3lXRjdkXfUpTzDsTGr+HZU4=; b=vVjXPiJfvj7jy5w9gnua2w
        +cwGpZ82luDiAgmBszB9Z3ZlWAHaqeaIBMUjrXI9EMcSomQHDqw0vddA7kHlYB98
        6qMjW+jm0ZTMInHw/5uKOkrJcUs58Dt27z2YlBx4sXyvLuy3UcfTK5AiNvd+V5C3
        tBfc9/KnJEzRQa+sTJwqMvCjkU8b6JZVCqlwTDLHQUYKQ8Wpv73dg7NyG9dqWHfs
        ubziUCqQmYrLh5hIXH7LJeOesWu6c2agu8lY3ZHcJpIOuavtym9pkt+kuDMlGtGE
        1kOiadKVlYQGAxon/QHJ0ztKjTqy6yHJOA9i+LUbzPCrT5659Q2gCW+U0jLtBHnw
        ==
X-ME-Sender: <xms:K-dvYMWCw-GkUejkBXVxANm1D1ra_d_841lfbxXom5vnlQx9jHlSqQ>
    <xme:K-dvYAnITXOpW2LILhj2vnv0Ib0SG9IUMHl8E3_3Y6FXZF8tPz3feM1SaqU9NMxi7
    mPaHYMIhWihugK7hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
    jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghu
X-ME-Proxy: <xmx:K-dvYAaagiduEK58TzVobAp1l4DaeIotxjjLKfobRejgiw3ukhaVlQ>
    <xmx:K-dvYLVkaJ8gOLQMa4vRVpks2YCgFrQuBlUUVVgeK6aPOQjdjDkx6Q>
    <xmx:K-dvYGlDDbOalalze6k3F3zSnWA2ULCrF0DWmztLDoCJxxZ1m5Yk2g>
    <xmx:LOdvYA0u63MbxX8FXcxHeKOEZtskhce-Zm-LuDsJ4Tk9Cw8ujUDE8A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CC383A0007C; Fri,  9 Apr 2021 01:33:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <29937129-3a17-4a32-a723-191b693a1e0c@www.fastmail.com>
In-Reply-To: <YG/i9lSxxCMIzkRs@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-17-andrew@aj.id.au> <YG/i9lSxxCMIzkRs@packtop>
Date:   Fri, 09 Apr 2021 15:03:10 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Zev Weiss" <zweiss@equinix.com>
Cc:     "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "Corey Minyard" <minyard@acm.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Patrick Venture" <venture@google.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Tali Perry" <tali.perry1@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Benjamin Fair" <benjaminfair@google.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_17/21]_dt-bindings:_ipmi:_Convert_ASPEED_KCS_bin?=
 =?UTF-8?Q?ding_to_schema?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 9 Apr 2021, at 14:45, Zev Weiss wrote:
> On Fri, Mar 19, 2021 at 01:27:48AM CDT, Andrew Jeffery wrote:
> >Given the deprecated binding, improve the ability to detect issues in
> >the platform devicetrees. Further, a subsequent patch will introduce a
> >new interrupts property for specifying SerIRQ behaviour, so convert
> >before we do any further additions.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
> > .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
> > 2 files changed, 92 insertions(+), 33 deletions(-)
> > create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> >
> >diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >new file mode 100644
> >index 000000000000..697ca575454f
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >@@ -0,0 +1,92 @@
> >+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >+%YAML 1.2
> >+---
> >+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >+$schema: http://devicetree.org/meta-schemas/core.yaml
> >+
> >+title: ASPEED BMC KCS Devices
> >+
> >+maintainers:
> >+  - Andrew Jeffery <andrew@aj.id.au>
> >+
> >+description: |
> >+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
> >+  interfaces on the LPC bus for in-band IPMI communication with their host.
> >+
> >+properties:
> >+  compatible:
> >+    oneOf:
> >+      - description: Channel ID derived from reg
> >+        items:
> >+          enum:
> >+            - aspeed,ast2400-kcs-bmc-v2
> >+            - aspeed,ast2500-kcs-bmc-v2
> >+            - aspeed,ast2600-kcs-bmc
> 
> Should this have a "-v2" suffix?

Well, that was kind of a matter of perspective. The 2600 compatible was 
added after we'd done the v2 of the binding for the 2400 and 2500 so it 
never needed correcting. But it is a case of "don't use the deprecated 
properties with the 2600 compatible".

I don't think a change is necessary?

Cheers,

Andrew
