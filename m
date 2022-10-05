Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C675F5525
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Oct 2022 15:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiJENPJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Oct 2022 09:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiJENPG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2022 09:15:06 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A4327CC2
        for <linux-gpio@vger.kernel.org>; Wed,  5 Oct 2022 06:15:02 -0700 (PDT)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1FB4C420E5
        for <linux-gpio@vger.kernel.org>; Wed,  5 Oct 2022 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1664975701;
        bh=43tB+oN5u9kqV99UwdxFly8NamC26x6sMRPje8H/VPc=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=V4VpIdCcbb4sFrpRb4XiEwMLviDTDb3OXb18K9lqJ3Lhku1D/5SWxueRCe81WD7pr
         ORy/D8iH9endO/jiXJAy+AEL8n4WKOsnnB0UsvEJ4FeBXcud/6Rfo/q3wTuiYWLEWw
         SeISh9mVLjVFcSDD+Ak4dYmUiGnznCLGDGNNOnugngJKTzAYzNF1wj4FVriFUcntFi
         Cl/5DWuAs8I4UZv4eu01xeQCT6i4CaatGiRTvdmFsWRpiS1o3K7HN0THxlLRsLQQzT
         ulrH1ICMxCEcDsxo8QQcm8SRDWN8cBqevnAIlnz8e3BcVg3Qkn01RgZn0jzgGwMYKM
         gyVeujYxmM0zw==
Received: by mail-qk1-f197.google.com with SMTP id j13-20020a05620a288d00b006be7b2a758fso14055909qkp.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2022 06:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=43tB+oN5u9kqV99UwdxFly8NamC26x6sMRPje8H/VPc=;
        b=zsju8bcjLhwlMkdMaanKA5TzzFoQ0zJCYq9U2se6bcK25hSFThrM2TJKF7AoAN2ieH
         hJ4vtGCWeBRt3PIPfiUQ2BTqHXq2GGf8xUTxp5K8azq36zJq17QWdrTWTHYdQvL+wv9l
         RMa8FLLObqsRBfbE/OmbeT+s8LPKro5UycMNwsQCIOm+WaGTIJSGLWEq6JDJOKTjbvMJ
         ZweLEbSYIIrD1ITaNcCEmLBJGycRzZ8USYRfMA6a7hFUrHSCunkdJpTEjVaW3KwFVn3J
         YhCdgu95ZkWfoYOoN4PhihzRTSrSsAxssnvv06XTj4CoFAs72SeiCcR4+5vH7Xcfnwo9
         wh1w==
X-Gm-Message-State: ACrzQf3cZ/5piI4zAR0rcWIdTNsiZiL7IHHj+CpgK9vBxxSuuE/7VaEL
        KQv7S0bZTNEriNwXNJFGY9kj6KXd/hWrJiQBkfbstNtncktY6hgtVxlSqEWII/ff5p/4pbjFXRA
        X47vza21YsHoD2j+kAY7E7CSBW9hrP2ltTI4EqXIZNwGLFgMJtMZdbZI=
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr23582953qvb.5.1664975700196;
        Wed, 05 Oct 2022 06:15:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wt/vXR3jPZ0ZzH+M8vyR7l4+/c8ynGqR4VHfaN5+wFmw2zgoeKxSLqm3HFrEhtrfCmvkn8FDOVAHCdxyUUpg=
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id
 gc1-20020a056214230100b004989f6f028dmr23582896qvb.5.1664975699745; Wed, 05
 Oct 2022 06:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175602.19946-1-hal.feng@linux.starfivetech.com> <20220930214824.A14ACC433D6@smtp.kernel.org>
In-Reply-To: <20220930214824.A14ACC433D6@smtp.kernel.org>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 5 Oct 2022 15:14:44 +0200
Message-ID: <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com>
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate registers
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Hal Feng <hal.feng@linux.starfivetech.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Sept 2022 at 23:50, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Hal Feng (2022-09-29 10:56:02)
> > Clock registers address region is shared with reset controller
> > on the new StarFive JH7110 SoC. Change to use regmap framework
> > to allow base address sharing and preparation for JH7110 clock
> > support.
>
> Do the reset and clk parts share actual registers, where we would need
> to lock between rmw? Or is regmap just nice to have because it wraps up
> the register APIs with some extra features?

No, the registers aren't shared, but on the JH7100 clock and reset had
separate ranges, but on the JH7110 there is just one memory range for
each "CRG", clock and reset generator I presume, and the reset
registers are placed after the clock registers in the same range.

> >
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> [...]
> > diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> > index 014e36f17595..410aa6e06842 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/device.h>
> >  #include <linux/init.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> >
> > @@ -295,11 +296,13 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> >         if (!priv)
> >                 return -ENOMEM;
> >
> > -       spin_lock_init(&priv->rmw_lock);
> >         priv->dev = &pdev->dev;
> > -       priv->base = devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(priv->base))
> > -               return PTR_ERR(priv->base);
> > +       priv->regmap = device_node_to_regmap(priv->dev->of_node);
>
> This is sad. Why do we need to make a syscon? Can we instead use the
> auxiliary bus to make a reset device that either gets a regmap made here
> in this driver or uses a void __iomem * mapped with ioremap
> (priv->base)?

In my original code the clock driver just registers the resets too
similar to other combined clock and reset drivers. I wonder what you
think about that approach:
https://github.com/esmil/linux/commit/36f15e1b827b02d7f493dc5fce31060b21976e68
and
https://github.com/esmil/linux/commit/4ccafadb72968480aa3dd28c227fcccae411c13b#diff-ffec81f902f810cb210012c25e8d88217ea5b4021419a4206d1fd4dd19edfce8R471

> > +       if (IS_ERR(priv->regmap)) {
> > +               dev_err(priv->dev, "failed to get regmap (error %ld)\n",
> > +                       PTR_ERR(priv->regmap));
> > +               return PTR_ERR(priv->regmap);
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
