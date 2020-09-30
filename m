Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE4627E53B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbgI3JfS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbgI3JfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:35:17 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210E0C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:35:15 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b12so1298955lfp.9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CA8XXS74zbXT/B+bUGkpnewKStmgdl4YGDf72mQf+2w=;
        b=ix+NkitMk1HFFCzU9JgdftvUdNt3twvgdG2uD2wiAiHucbdqZDjRJ87pB20PmBDFbo
         IPGwsRTbgyytn4I54oHY33KFpHYUpia5mog7enMSLUU9dKhlpE+R+7PbOdPJb1H8xxHA
         ps5BPxJxVQW+Tdu2hG1fSiI36kSKbQaDItcFydtbk4E94QVfWxhEhh9pLpqOC/+A9bqU
         Ly+YzHHz57VsYkczIjUh0hgWnl9jBQRKl9QwRS08Nmf2JpcU6aVNX+bKB1lOVRdIUxoL
         uXHMLloh6egx4+IC5ewVgWDohsuIfYmBUaTENUSgGyC+eqb22VsRpEWYEZt8xyvRIBee
         wCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CA8XXS74zbXT/B+bUGkpnewKStmgdl4YGDf72mQf+2w=;
        b=dn+OP1J65P1LRJYmzpuFwRwgu2ly2RhAE/U4EK1hUVuJmQ3isEI2sc3L8cx2WHizzG
         kn0YP1Jl9fO1+NfrDoJQKalT8duOzmYsHUu5mUMq3AgkS4BvRsPOfPBeWVyL+/5DKz42
         yfnNDpjeZ/OiS28DkkSXoIWwcsLIWJ5nzKuiCarEKVse9t67Sy4gM0MNJIX9Yj+c5y8B
         RqF+8Q1dR6nLi0kFn+3ikvdnj4YAd44ozqcSSueUMZja0H8HSUJnBt5ccnov5r1EsIz6
         hopAQ3vERxszh0/5hsztR9MDVenk11xPqYgBA2wLmHpY1m+6yZ4gAmaP3tUO0Vl2XW8d
         QF3Q==
X-Gm-Message-State: AOAM530NaOLYz1dudqo7dN4aoZBok3N1DvRdILZyVFeEBGMTBcUSGa+n
        xPIsc1V9GRX1xG0uQAdIxKLHUjEaC6FFGJJOsg71OQ==
X-Google-Smtp-Source: ABdhPJz9GKQhxaIz5jBCULEYn/oCGASGLTSQ2xeyHdbkbBdUPvxScsyzuM0SlJ5GQFwkvK71MvimjAXOROpJEiOU6Yk=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr621056lfq.260.1601458513456;
 Wed, 30 Sep 2020 02:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200920195848.27075-1-krzk@kernel.org> <20200920195848.27075-4-krzk@kernel.org>
 <CACRpkdZi_k=SeMPHADeErE3pn9ytb0dFTfVEb7mJYedg75dMbw@mail.gmail.com> <20200929140227.GA494474@bogus>
In-Reply-To: <20200929140227.GA494474@bogus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:35:02 +0200
Message-ID: <CACRpkdZ+MExT+Gp4twgDj8j-Msg-0L7T-RXfAbuozPa80SEinQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
 compatible matching
To:     Rob Herring <robh@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 4:02 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Sep 29, 2020 at 01:54:44PM +0200, Linus Walleij wrote:
> > On Sun, Sep 20, 2020 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > > The i.MX 7ULP DTSes use two compatibles so update the binding to fix
> > > dtbs_check warnings like:
> > >
> > >   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
> > >     compatible: ['fsl,imx7ulp-gpio', 'fsl,vf610-gpio'] is too long
> > >
> > >   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
> > >     compatible: Additional items are not allowed ('fsl,vf610-gpio' was unexpected)
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > This patch doesn't apply to my tree linux-gpio "devel":
> >
> > $ git am --signoff
> > ./v3_20200920_krzk_dt_bindings_gpio_pl061_add_gpio_line_names.mbx
> > Applying: dt-bindings: gpio: gpio-vf610: fix iMX 7ULP compatible matching
> > error: Documentation/devicetree/bindings/gpio/gpio-vf610.yaml: does
> > not exist in index
> > Patch failed at 0001 dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
> > compatible matching
>
> It's in my tree, so I've applied it.

Excellent, thanks Rob.

Yours,
Linus Walleij
