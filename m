Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E36427295
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 22:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243046AbhJHUvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 16:51:04 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35664 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243021AbhJHUvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 16:51:04 -0400
Received: by mail-oi1-f180.google.com with SMTP id n64so15365662oih.2;
        Fri, 08 Oct 2021 13:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x/wNQQ1D/K6nlk72jDxw+T6dH+cLdjMzYx7cGW1fTl0=;
        b=AGkzDOHqpDp/ZKR9tPBqCNsjaMF8SAgzGZ2dvDDDbchD5fOz1XlQtd11ypPPtO8F/W
         GSDYl/wziutfwbznXXe73yYxzuyhGsGl2uLfVgGwr9IP9tP0pXxEhP8SY8pyp8+Bben0
         kPjG4Y5R59+ifQgRyj5YK0cFxJs+krqw186S51L/LjhvW19B2aOjqsXvx3YlqvXuZEUd
         CMY+dxSvxTxu8ZQePswmsuHbfwmb1Vw1mdXAC2FTpBJtYaJeks9R1E279d+A3GGKAG+i
         pg3rTEiCDXKCS4Lr5XbWSVhxqeRzbR9CDbrLjsjQ5u1/huhgTDjiJAZwdYKJfgF9RsTf
         DVTg==
X-Gm-Message-State: AOAM531Q4sG2hVBLIRyI5ePtoh9m9i1w5gzlu7Hkk1BfDWthCOjT3csN
        vQ7HvT1ISDpzc1offnVjGzRzaKRFOA==
X-Google-Smtp-Source: ABdhPJx5jJzk17oSljHuYT7X7WHchncK/flnGkpdq9+Xrz5iTPDKOQNSkRkNIY0rJSxbdXDF/7Tldg==
X-Received: by 2002:aca:ad16:: with SMTP id w22mr9134382oie.109.1633726148342;
        Fri, 08 Oct 2021 13:49:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 12sm85039otg.69.2021.10.08.13.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:49:07 -0700 (PDT)
Received: (nullmailer pid 3294594 invoked by uid 1000);
        Fri, 08 Oct 2021 20:49:06 -0000
Date:   Fri, 8 Oct 2021 15:49:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Scott Branden <sbranden@broadcom.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 linux-pinctrl 1/2] Revert "dt-bindings: pinctrl:
 bcm4708-pinmux: rework binding to use syscon"
Message-ID: <YWCuwlWlHcAxsKm/@robh.at.kernel.org>
References: <20211008153939.19685-1-zajec5@gmail.com>
 <1633722536.868012.3211952.nullmailer@robh.at.kernel.org>
 <cf2ca705-d6d7-d69a-3c66-59f7c997f6b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf2ca705-d6d7-d69a-3c66-59f7c997f6b8@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 08, 2021 at 10:08:46PM +0200, Rafał Miłecki wrote:
> On 08.10.2021 21:48, Rob Herring wrote:
> > On Fri, 08 Oct 2021 17:39:38 +0200, Rafał Miłecki wrote:
> > > From: Rafał Miłecki <rafal@milecki.pl>
> > > 
> > > This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.
> > > 
> > > My rework was unneeded & wrong. It replaced a clear & correct "reg"
> > > property usage with a custom "offset" one.
> > > 
> > > Back then I didn't understand how to properly handle CRU block binding.
> > > I heard / read about syscon and tried to use it in a totally invalid
> > > way. That change also missed Rob's review (obviously).
> > > 
> > > Northstar's pin controller is a simple consistent hardware block that
> > > can be cleanly mapped using a 0x24 long reg space.
> > > 
> > > Since the rework commit there wasn't any follow up modifying in-kernel
> > > DTS files to use the new binding. Broadcom also isn't known to use that
> > > bugged binding. There is close to zero chance this revert may actually
> > > cause problems / regressions.
> > > 
> > > This commit is a simple revert. Example binding may (should) be updated
> > > / cleaned up but that can be handled separately.
> > > 
> > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > ---
> > > V2: Update brcm,cru.yaml to avoid new yamllint warnings/errors
> > > ---
> > >   .../devicetree/bindings/mfd/brcm,cru.yaml     | 11 +++++----
> > >   .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
> > >   2 files changed, 19 insertions(+), 15 deletions(-)
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml: cru@1800c100: $nodename:0: 'cru@1800c100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> > 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/simple-bus.yaml
> 
> It's warning we already have and not something introduced by this
> revert.

We don't allow warnings, so you're saying this one was warning before?

> As a revert this commit should introduce as little non-revert changes
> as possible. I'm planning to improve that example later in a separated
> commit.

You have to fix the warning as part of this series.

> 
> Can you take a look at this commit despite your bot warning, please?

If 'CRU' is a hardware block, then I don't think most of the revert is 
right to use 'simple-bus'. 

If you want to just replace 'offset' with 'reg', then I'd be happy to 
see that. I've been pushing child nodes of syscons in that direction.

Rob
