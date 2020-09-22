Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BED8274585
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 17:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgIVPkW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 11:40:22 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:33292 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVPkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 11:40:22 -0400
Received: by mail-il1-f196.google.com with SMTP id y2so7038542ila.0;
        Tue, 22 Sep 2020 08:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8GdJRN6siN1K/3VUt/RzQ7dwFh0PUHODAfHPAkJXVec=;
        b=WGB1VOEU6jpfTlda4fWmes7xisIZXnU6Tzzeqph8/n3wBAOw1Zzd+FJ+curOT93GwE
         EkaZEedS9NkDk7+PI4hrva4N7KYDxzhmTY22Ix8InMEmNPOfO+FawxWqqw8Xr9jDNkp6
         nxWcILJ21C3JkJzg2pXXNe3R1uz8QvhYY7x0G38GQJSYDFOFQdq0CfM7DO68biSUS/3v
         sbs+Nxmr843R79GP+k1CPv5IhNeldoP2gLXB8+amaKE+JnXZCj8/6V4C/ACr+c49zPWC
         q+aP+op6vxuTRbnsxS17429wALAIsiQ1Y6y1x6Hy6d3TFnzZ4r9z0b+6jGcBD6dw7bDB
         EuvQ==
X-Gm-Message-State: AOAM531hp0fJc1iilTU2KuDJ2eBO3I+rtTA+fYomPskh8DUMCUJVR+yx
        o7yqgA4/0Y9liM4Z9nOKOA==
X-Google-Smtp-Source: ABdhPJyREJxSIdBKii6r07HwAtgscFY+xZM0Hzr/ADdWxpwvmnoH8SQzW6oBqLEpp2gzISGF/n+Kjw==
X-Received: by 2002:a92:b503:: with SMTP id f3mr4935318ile.23.1600789220548;
        Tue, 22 Sep 2020 08:40:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e4sm7533543iom.14.2020.09.22.08.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 08:40:19 -0700 (PDT)
Received: (nullmailer pid 2730094 invoked by uid 1000);
        Tue, 22 Sep 2020 15:40:18 -0000
Date:   Tue, 22 Sep 2020 09:40:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-unisoc@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200922154018.GA2657058@bogus>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
 <20200920193915.GA31074@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920193915.GA31074@kozik-lap>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 09:39:15PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> > On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > > controllers.  The schema enforces proper naming of GPIO controller nodes
> > > and GPIO hogs.
> > 
> > Did you not see my previous reply about a common schema? We already
> > have a common GPIO and hog schema in dtschema. Please add to it
> > whatever is missing.
> 
> Indeed, I'll enhance the dt-schema.
> 
> The trouble is that each in-kernel YAML file still has to mention
> possible gpio-hogs nodes. Is the proper solution to put them in common
> YAML inside kernel sources?

Currently, the gpio.yaml schema is applied to all nodes. That has the 
advantage that GPIO related properties are always checked whether we 
have a device specific schema or not. It has the disadvantage that you 
can't do some constraints like required properties or what's in child 
nodes.

We could (and probably should) change it to be referenced by specific 
gpio controller schemas like we do for i2c, spi, etc. Then you can 
define required properties there and do something like:

"-hogs$":
  type: object
  $ref: gpio-hogs.yaml#


> > My goal is all common schema end up in dtschema, but I haven't pushed
> > folks to do that yet. Ones I've done are there though. One issue is
> > what's in dtschema should be GPL/BSD and the existing text bindings
> > are default GPL, so there's a relicensing exercise. In some cases, the
> > schema is there but I haven't copied over the descriptions.
> 
> Right, I'll skip the descriptions when posting to dt-schema.

I was hoping someone would add the descriptions. :)

Rob
