Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442BD27D066
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 16:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgI2OCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 10:02:30 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40241 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729073AbgI2OC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 10:02:29 -0400
Received: by mail-oi1-f195.google.com with SMTP id t76so5543792oif.7;
        Tue, 29 Sep 2020 07:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jk9iyGyLhyyk1SDgqn0WKctOPbwRm9Gjuz33wrJ9IRs=;
        b=EVC9bnc8s70nWisKc2qRi/fN9aLd0hZaucF8sijp8pm+68xQQLffq1V4GDuhoNpenT
         f9sc/s5N627Xh8F3teODLS8QUhz69LuCgtuVmOhpfo8treIknD0tBoYX6/0Escc2kvFY
         XuhPLtvh+lA1lPk7ud2X6ZPHGjhVKZluw6AZMSzuU4SYxLAwbFthxPEoilQKGkfkt7db
         OydsxfLAKUNVBXqA7ZcMkBqNCzkTO7VPRV2B+82FwpPJ7YcwWd41wzRZItmv2XqbamFV
         EqLFSAz2kwB4Lb2LdowOgV1nqTqNzRBg75WCLzBVFOiB1d++JcVnqUUG9njy+GaYzNvS
         lqZA==
X-Gm-Message-State: AOAM530fwfY/cWZ+bpfsAPsmNZ7LIBLUDc3U9BANbH3idiXunSjp8ZWz
        gs4le6ndpx/SM3XlbaxPMA==
X-Google-Smtp-Source: ABdhPJwcQH7DEPuH5sq6zTX2mTVPE3mPbU8dx3rG6rQcRGRI+wRDySV7uh90SHWFA9XVZR6KR6DcQA==
X-Received: by 2002:aca:f417:: with SMTP id s23mr2645083oih.168.1601388148714;
        Tue, 29 Sep 2020 07:02:28 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j10sm1054657oif.36.2020.09.29.07.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 07:02:28 -0700 (PDT)
Received: (nullmailer pid 495718 invoked by uid 1000);
        Tue, 29 Sep 2020 14:02:27 -0000
Date:   Tue, 29 Sep 2020 09:02:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Anson Huang <Anson.Huang@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/4] dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
 compatible matching
Message-ID: <20200929140227.GA494474@bogus>
References: <20200920195848.27075-1-krzk@kernel.org>
 <20200920195848.27075-4-krzk@kernel.org>
 <CACRpkdZi_k=SeMPHADeErE3pn9ytb0dFTfVEb7mJYedg75dMbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZi_k=SeMPHADeErE3pn9ytb0dFTfVEb7mJYedg75dMbw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 01:54:44PM +0200, Linus Walleij wrote:
> On Sun, Sep 20, 2020 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > The i.MX 7ULP DTSes use two compatibles so update the binding to fix
> > dtbs_check warnings like:
> >
> >   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
> >     compatible: ['fsl,imx7ulp-gpio', 'fsl,vf610-gpio'] is too long
> >
> >   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
> >     compatible: Additional items are not allowed ('fsl,vf610-gpio' was unexpected)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This patch doesn't apply to my tree linux-gpio "devel":
> 
> $ git am --signoff
> ./v3_20200920_krzk_dt_bindings_gpio_pl061_add_gpio_line_names.mbx
> Applying: dt-bindings: gpio: gpio-vf610: fix iMX 7ULP compatible matching
> error: Documentation/devicetree/bindings/gpio/gpio-vf610.yaml: does
> not exist in index
> Patch failed at 0001 dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
> compatible matching

It's in my tree, so I've applied it.

Rob
