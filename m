Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB6B75AEFF9
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 18:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbiIFQK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 12:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiIFQKO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 12:10:14 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D6683F38;
        Tue,  6 Sep 2022 08:34:47 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-127ba06d03fso5507546fac.3;
        Tue, 06 Sep 2022 08:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=l7uSke96ZhFxge6iy3UtQtr/iInY2wiHvxBC9B8pAes=;
        b=6y2L6q2T8FkjmKLxKnnD6gTba34VVQ24yU/jRZhtdfLN5WZ2AiKAtxs6UnK7Pa8cTw
         TPkZFAvp6rwkcJPg9UF4Z0GuNsjiEWm41EqxiSudiHrqUtQ6a6jGPfvE4lVmjsrXMcal
         gp3Vc/ccLd50+IU7SNJgChTVFU6ADzNJJfPCWer73R0FKUuPG41zKU6cMfDckozxgiFn
         xRp9NAK/zjy7XLzJCP3z4LNmY7vdA2lTLqCohTvXtHbOMK9OiHfqvyksIzIrBAzzh/bo
         jciJRwqs+k7klhkD7ZXQiJpnQYdKWqhFQ+xg3E0xFf0i+Iz+bJKVMAC+vawAvSljzhPA
         PbmA==
X-Gm-Message-State: ACgBeo1Afywu2SlyJ075QY6ISeUBpyfwfOwc8Y/nxViHDJK003FN5u6g
        yhge4T7FqHM3LzKHcIrWDw==
X-Google-Smtp-Source: AA6agR4bRLs6qUCZD96wFxze0xCdaCbw+EDzXwyV0jACkyYccl7rlpXBjFm9cJoGrQ3oFJxa7v/7LA==
X-Received: by 2002:a05:6808:21a5:b0:345:81a8:ab6 with SMTP id be37-20020a05680821a500b0034581a80ab6mr9587695oib.91.1662478486008;
        Tue, 06 Sep 2022 08:34:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g12-20020a056870c14c00b0012644cc4feasm4520251oad.55.2022.09.06.08.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:34:43 -0700 (PDT)
Received: (nullmailer pid 558222 invoked by uid 1000);
        Tue, 06 Sep 2022 15:34:42 -0000
Date:   Tue, 6 Sep 2022 10:34:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220906153442.GA534217-robh@kernel.org>
References: <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
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

On Tue, Sep 06, 2022 at 08:36:25PM +0900, Hector Martin wrote:
> On 06/09/2022 20.22, Linus Walleij wrote:
> > On Tue, Sep 6, 2022 at 11:31 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > 
> >> Another argument for having sub-nodes is that the firmware actually
> >> exposes *two* GPIO controllers.  For now we only support the "master"
> >> PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
> >> separate set of SMC "keys".  We currently don't need any of the pins
> >> on the "slave", so we don't expose it in the DT yet.
> > 
> > That sounds backward, like we don't expose device X as DT node
> > because $OS doesn't use it yet. DT should just expose (by nodes or
> > other ways) all hardware that exist or at least all hardware we know
> > about no matter what $OS is using.
> 
> How so? The are piles and piles of unused hardware not exposed in the
> DT, and piles and piles of hardware that will be used but we haven't
> figured out how to do it yet, so it's not exposed. For example, we know
> there are like 8 or so UARTs, but we don't define them in the DT because
> they are not connected to anything on any existing device and we don't
> need them. Apple does the same thing in their DTs (only used hardware is
> defined).
> 
> I don't really see the point of exposing a GPIO controller when we don't
> actually do anything with the pins yet, and might never do so. Having
> drivers bind and stay unused just increases the amount of code running
> without any ultimate purpose, so why do it? It's not like any other OS
> would use the hardware either - GPIOs are only useful if they are
> referenced in the DT for something, and we don't have anything that
> would reference these.
> 
> For SMC in particular, there's a huge amount of functionality we don't
> have drivers for yet, and I don't see the point of trying to conjure up
> DT bindings for it until someone writes a driver (and has a reason to do
> so) :)

Exposing in a DT is one thing. Defining in the binding is another. Even 
if it's not complete bindings, but just a fuller description of what 
functionality the MFD contains is. For example, just knowing there 
are 2 instances of GPIO, I'm much more inclined to agree GPIO should be 
a subnode.

Rob
