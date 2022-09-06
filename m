Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E455AF2D2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 19:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiIFRjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 13:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiIFRic (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 13:38:32 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7182C33;
        Tue,  6 Sep 2022 10:35:37 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 6-20020a9d0106000000b0063963134d04so8546157otu.3;
        Tue, 06 Sep 2022 10:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Axl59O4YJWSYqFaxFX2s1YiQiL8KBb3VgOdRYMsp+Bs=;
        b=icE/bXvFOeyjaprUdppJwEyWtjkN6C7bC+P3PvtKl7dcTpqDfiOGHC+PHEnlUBau9h
         mr54CTPjJSbBly2+nF/vPRXwvdcWrd0yX/IltI6+BwCKV1S8VjYOBq5AHtLzdI4USldG
         DobrOsDz/izW3g3tHE2IkQ61YVv4GHZaJZG23TFJgtdVCfAE+oV523wWqzuqXyPNS7Bd
         rmz3APPjimxXxvXyFlkcQFzXGsCkxl0s/YZ4d18czKHm9zleNfFe2QDMrfPNOdCvR2sP
         IIkmSrUQAMhMIPsXcT4vBa1jdKUnYSlf8mvxTxtuW3rQUZ5LVAm9QOXa5HVKk238RpB/
         UL3w==
X-Gm-Message-State: ACgBeo2NpCVkGTZn7jcEYWEjtYuBRhPIUayvLiwVZ/Kqja3CI+yeXrjQ
        lrcSZqxy4qwGq1HdL53LVA==
X-Google-Smtp-Source: AA6agR6OFcjRQ+joH68tfuhOfhhZXRcOZk0l3kN/CH7MxvMkzhMCwdEmiPaXYJithfHs7z2Rp7Qi1w==
X-Received: by 2002:a9d:65c2:0:b0:638:d9ec:4a9b with SMTP id z2-20020a9d65c2000000b00638d9ec4a9bmr22516719oth.83.1662485737027;
        Tue, 06 Sep 2022 10:35:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 35-20020a9d0f26000000b0063b24357269sm6079404ott.13.2022.09.06.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:35:36 -0700 (PDT)
Received: (nullmailer pid 761200 invoked by uid 1000);
        Tue, 06 Sep 2022 17:35:35 -0000
Date:   Tue, 6 Sep 2022 12:35:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        linus.walleij@linaro.org, alyssa@rosenzweig.io,
        asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220906173535.GA734389-robh@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91466e41-d3f7-0993-9082-80f94e53f375@marcan.st>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 07, 2022 at 02:00:53AM +0900, Hector Martin wrote:
> On 07/09/2022 01.10, Rob Herring wrote:
> >> So at this point, I think it would make sense if I post a v2 with all
> >> the updates so far (sorry, given the long drawn out discussions on
> >> this, I've lost track of what changes have been made to the code, so
> >> I won't include a detailed change log.)
> > 
> > As I said elsewhere, sub-nodes is probably the right choice here. I 
> > think they need compatible strings in the child nodes, and addressing 
> > has to be sorted out which it seems may also break OpenBSD.
> 
> So addressing only makes sense for GPIO, out of the nodes we have so far
> - that's the only thing with two discrete instances whose access can be
> entirely described by a single base key name, and which are otherwise
> compatible.
> 
> Everything else is pretty much single-instance, and talks to multiple
> keys, so there isn't one single "address" key that would make semantic
> sense to use as the node address. 

Unit-addresses are just the first address in 'reg'. So multiple 
addresses or not doesn't really matter.

> There are some indexed keys, but at a
> deeper level (e.g. multiple battery cells part of the charge control
> subsystem, multiple Type C ports as part of the AC/power input
> subsystem, etc.). And in those cases, these subdevices are mostly
> homogeneous and we would never need multiple nodes for them at the DT
> level, they'd just be implicitly handled by those drivers.

Type-C will be fun depending on how much of the muxing/altmode 
details have to get exposed. 

> GPIO is quite special in that 1) it only has a single key type (which is
> overloaded using advanced features to provide, effectively,
> sub-registers to control all the GPIO features per pin), 2) a single key
> represents a single pin, 3) keys are numbered in a reasoanble way, and
> 4) there are two prefixes for two discrete GPIO controllers. For pretty
> much everything else SMC does, we just have a bag of keys with no real
> rhyme nor reason from the point of view of an "address space".
> 
> Given that, how would this work? Is it legal/reasonable for only the
> gpio nodes to have addressing/reg properties, and everything else to
> just have a node name with no concept of address? 

Not ideal, but allowed.

> Does it even make
> sense to special case gpio in this way, vs. just having something like
> gpio {} / gpio-sec {} (if we ever even need gpio-sec, which is an open
> question)?

If not unit-addresses, the 2nd choice we do is 'gpio-0', 'gpio-1', etc. 
Though that is mainly in the GPIO based consumer bindings like gpio-pwm, 
spi-gpio, etc. where there's really not anything to use for an address.

If only those 2 nodes, then I really don't care so much and gpio-sec 
would be fine. It's 1 node in 1 binding.

Rob
