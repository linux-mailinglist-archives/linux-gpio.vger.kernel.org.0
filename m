Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A604BC429
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 02:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiBSBDb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 20:03:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbiBSBDb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 20:03:31 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071B13F332
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 17:03:14 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id u12so8776134ybd.7
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 17:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOzuzvjOfQAoctlp3qylHqWh8mO3yUYZirwZTAq+2oI=;
        b=p3//TshUq+4DO3oq9RDJPKZQXqJLANTDWKU/ibmSnYOPtTMRTuSHyeZghulpLe4Ij0
         g/FqSfi1WS2MZ635GsfwzOuUNdxmtwTqKqSnQFdV6i4QjLUGHrYg76sFVtD7wDNAFTwc
         TJCk08+AdOzkcjKEPeT/5+SVNLyaAA4htjzS2NX3TJOTnc66Yd8dihSFPPOXX4tYBenE
         pVFfLisdVOtDeGgnAKgMDh7vuDZveKLECIUVhAOz86qQiNc/tYY8eWAPeDiUgW+HPoKk
         2PV//FDmXoMreO0z9a/3JhZIXMnggCmCsn5FSBKyQAUOZRGyIB0ry5NFEYtoXmRsq+hy
         U5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOzuzvjOfQAoctlp3qylHqWh8mO3yUYZirwZTAq+2oI=;
        b=O+2tW5sIBJIcufcHh2b+cKienRygq6N14BIysX5fyABidWsT/3J5hQ3867Dka8RZeM
         9UbcKjZU42FkkLu+8xqlao4GVyg6ICi7cPuWQl18ouGkbmARhcgLv+HVcqNiKtmUQi+x
         UQA4mG0DZEGc1zvEdyQ9SceDYcoZgJub4OYha/YuQ1THfqgoiTkvdOd8JMUOWTk/kGwt
         TOz2uoJ24awoAfse5CtO3laGlomKWuF45Z9BI9k0QvG3G3iMFZoAaaLoPjbzOLDIF/3p
         eoRPtK/LOfj4ykUf4TxR06bxBXGDz26swZwlLxhbR1c+7sJPPyBr0TedHxixn86AO7JI
         xtIg==
X-Gm-Message-State: AOAM532Ve5452TXzRTRdZ8P+yUhnlb91DCwy1MTaIFP9EZzch544fkop
        avJyLwDkaVDbiFJQS7Ri4AOqdEZtEV1myst8lVaKxA==
X-Google-Smtp-Source: ABdhPJy4fUvGvYfHgo/K0ZENFR/wEq8Pk3AZA0hsn/IedxPhAAHOCJzblhRvcA1xXMR7LPWZawt8XlPjmmN82yFd/FE=
X-Received: by 2002:a25:9108:0:b0:61e:329:700 with SMTP id v8-20020a259108000000b0061e03290700mr8954085ybl.369.1645232593276;
 Fri, 18 Feb 2022 17:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20220209162607.1118325-1-maz@kernel.org> <CACRpkdYfrAexUhFV6e86QW+GSc3hM=38VNucKLhPppJ2ZdQ7fA@mail.gmail.com>
 <CAHp75VdmKqViM5393w=frbX77te6X-VnMe5+VZwxY4PBw12Pdw@mail.gmail.com>
In-Reply-To: <CAHp75VdmKqViM5393w=frbX77te6X-VnMe5+VZwxY4PBw12Pdw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 02:03:02 +0100
Message-ID: <CACRpkdYi6Z-uyHYUEaXn5apiAyzxTC0ksH3vOhCCCAu=YvJQig@mail.gmail.com>
Subject: Re: [PATCH 00/10] irqchip: Prevent drivers abusing irq_chip::name
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 4:38 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Feb 11, 2022 at 8:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Feb 9, 2022 at 5:26 PM Marc Zyngier <maz@kernel.org> wrote:
>
> ...
>
> > Since ... I am mostly
> > playing with a baby during the daytime
>
> A bit of a side topic, since I need to send a PR for fixes before my
> vacation starts tomorrow, should I Cc my PR to that Linus as well, so
> he can accept it?
> It will contain two one-liner ID patches to pin control Intel drivers
> and won't conflict with anything (as far as I am aware and know).

I manage the pin control stuff but at a bit slow pace, so I'll pick
it up!

Yours,
Linus Walleij
