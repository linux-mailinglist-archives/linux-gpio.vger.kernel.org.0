Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32FE5AF2DC
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 19:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiIFRlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 13:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiIFRkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 13:40:51 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D2EDF7;
        Tue,  6 Sep 2022 10:40:49 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id A39CA5C0112;
        Tue,  6 Sep 2022 13:40:46 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Tue, 06 Sep 2022 13:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1662486046; x=1662572446; bh=Il
        uLvD7LxFvPGQxaEMXS0bap3YchZZokW0Mbe2PU1WI=; b=zSGj2qrA1ca9iUo7QK
        rUcC38XExyPDBiK9wdOsl14C+tCugUGTdvjb/bzdLcF0ApKMCIjgLUDZ/Cs3ubHt
        X0MIIVkybjyy8ncJawu9NTI22hTnFHK7kqf406d92PT5GstyZMOlWjQXt8CdC46p
        +X19DLlbFBQk8IbvGa+7tbxEAAkEwOCWMsaeycgj4SWXVRtFdLegTIOKOX/NiM3j
        v6a5R8r2uUCn0R1v2kHa0lUNCxBvc1h5EgRf/uypfSjYgaFoqCPKwpETGgFHluSb
        /WGT5bqtIWWxcJXE1SqdYCHtST4Dfk8I/WkpNjARkg3oIVj8Uc1f/z2aepyjf1Zq
        9XWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662486046; x=1662572446; bh=IluLvD7LxFvPGQxaEMXS0bap3Ych
        ZZokW0Mbe2PU1WI=; b=GYzhCe6gD/BzcKwcws2jmcdWHw4mpu+7dWTqvsT+5pk4
        T91m7mWbE/8yrPDOXpKOgT3bYRBE7fGsU184w80f2TDoLHpvZTnKxKdzgpyuPrt4
        svLWEuJxVm8mu66Q5FN2cVOHkVqD2OQNIQFVIHxqJbZBnjdhtVMYjGZY9k2HE734
        xAHKWYBTSNd21I6mdJHKPXW58QitpKEpNDC7moDFY/QLrrAnBa32f6so6HzIqAMA
        tTFTSHqItrYzSNB9MPl22snipdrnJXNO13U+vCkKblL6h/yqvxVSZESTa+WBqogs
        iMhYE+FH0SunwwwL7UMjN2cCuw83FHiY48mR3nQsUg==
X-ME-Sender: <xms:HYYXY0jmzE48SLF_3yFwgm9WFjADMWOuNGY9eaDNWcWrfnwVtFLlyg>
    <xme:HYYXY9DYeKZjU2FwSVWf1e6toRYW34VV5qOvnTVPZNUpt6SEwHdFBZO4dyhVadFro
    TfibojbhA3ybopOO1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefg
    hfeiveeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:HYYXY8GIX6ucUtGv4QEo8zO4K8lsBmohLVRwXsOA_kcd8ceEulS4IA>
    <xmx:HYYXY1QMWoHoudZaFxEAEEi--FDtqB8fY8II8pWUyRLLQm_6Rg2Raw>
    <xmx:HYYXYxx8HmxBb63dT1DyyY6V6KF61q6uDdac962O4V8F97wmkacrjw>
    <xmx:HoYXY0qfWJ45vjObOGk6xTFD3F1ePnvXJqynNnMMTCiiBJ8G57jLnw>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A76CEA6007C; Tue,  6 Sep 2022 13:40:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <0cbfd45e-4749-424e-8c28-362d9b4f435e@www.fastmail.com>
In-Reply-To: <20220906173535.GA734389-robh@kernel.org>
References: <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <20220906161049.GC534217-robh@kernel.org>
 <91466e41-d3f7-0993-9082-80f94e53f375@marcan.st>
 <20220906173535.GA734389-robh@kernel.org>
Date:   Tue, 06 Sep 2022 19:40:18 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Rob Herring" <robh@kernel.org>, "Hector Martin" <marcan@marcan.st>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        krzysztof.kozlowski@linaro.org, "Arnd Bergmann" <arnd@arndb.de>,
        "Lee Jones" <lee@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System Management
 Controller
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, Sep 6, 2022, at 19:35, Rob Herring wrote:
> On Wed, Sep 07, 2022 at 02:00:53AM +0900, Hector Martin wrote:
>> On 07/09/2022 01.10, Rob Herring wrote:
>> >> So at this point, I think it would make sense if I post a v2 with all
>> >> the updates so far (sorry, given the long drawn out discussions on
>> >> this, I've lost track of what changes have been made to the code, so
>> >> I won't include a detailed change log.)
>> > 
>> > As I said elsewhere, sub-nodes is probably the right choice here. I 
>> > think they need compatible strings in the child nodes, and addressing 
>> > has to be sorted out which it seems may also break OpenBSD.
>> 
>> So addressing only makes sense for GPIO, out of the nodes we have so far
>> - that's the only thing with two discrete instances whose access can be
>> entirely described by a single base key name, and which are otherwise
>> compatible.
>> 
>> Everything else is pretty much single-instance, and talks to multiple
>> keys, so there isn't one single "address" key that would make semantic
>> sense to use as the node address. 
>
> Unit-addresses are just the first address in 'reg'. So multiple 
> addresses or not doesn't really matter.
>
>> There are some indexed keys, but at a
>> deeper level (e.g. multiple battery cells part of the charge control
>> subsystem, multiple Type C ports as part of the AC/power input
>> subsystem, etc.). And in those cases, these subdevices are mostly
>> homogeneous and we would never need multiple nodes for them at the DT
>> level, they'd just be implicitly handled by those drivers.
>
> Type-C will be fun depending on how much of the muxing/altmode 
> details have to get exposed. 

Type-C is going to be a lot of "fun", but the SMC is not directly involved.

I still don't have a full picture but these boards have TPS6598x chips
which trigger the entire mess whenever a new mode was negotiated and the
"Apple Type-C PHY" contains the actual mux.

The SMC has a side channel to these TPS6598x chips as well but it seems
to only handle charging without having to communicate with whatever kernel
is running on the main processor.


Sven
