Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFA529DAFF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgJ1XmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgJ1XmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:42:08 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80296C0613CF;
        Wed, 28 Oct 2020 16:42:08 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id h12so791397qtc.9;
        Wed, 28 Oct 2020 16:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=04ThpYsSViFhWqOQvQSGIlYZRGcXGFtIhUlX8pfHTD8=;
        b=OC6Zm4U5t2xQjcut4yBwkeEk5KarEkjfCrPdUlu381Nv4vJI895Svp7x8sDb3IBxS3
         fPfhT1B7HGC5UpOKgQPbPKJ8OQ+Wh5ei1AjIXfyGnvpaGsc8RYdCba4m2e8dSOSNKG0r
         6IaEkkFLl4zzAivCnLsMl8DdDeZ7xDzu5G81g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04ThpYsSViFhWqOQvQSGIlYZRGcXGFtIhUlX8pfHTD8=;
        b=DLMle3rBT5FB64Jk9Cu8f3eYwMY/3daZc7z+O2hNNbwt5pFquzv7nLowGJY4uNv0mj
         uKcBG+PN5LFZZs7P+mUs34LQg5zJWR/oLVa9t2vrARLE2fjdrzL3Ij8qUs3dhSU0QO6y
         +4w0I6BQOW7CInLVoEzrzDyL3oC4xg++q/Hg6QWSU5LYfQLRCIGNX6gAYmuIY2JeHpOh
         hbi1xa1vMnyNz6L5bCUzZ3k1+tz/QQOXXZGGsaym8W56q7asN+U8fjaU9T3OiC238qr5
         B+P/3RgZAVkkfiwH9M2aLqz8O/+3nScpD31x78+BKGDUOi9BddixEVME8i1VrIOBFgYl
         nJtQ==
X-Gm-Message-State: AOAM5300wHRy/OUwaVJZqGthLvjrALd7PddJlhopgrvW/ozb65VqlMum
        I6R+hxE++nacojzzX1wzL4GZ5uBfyI2GR19WswbUdjtlX2xVCg==
X-Google-Smtp-Source: ABdhPJyi2tYbl11+8oD/pTg7MqvJo0FJxH9J/m9YOi24yaf3RoUaPY8LWOMrUDpfxRRNH1Z9ZM9QvQ/K9quBWlRWBR8=
X-Received: by 2002:a05:620a:1303:: with SMTP id o3mr5853719qkj.66.1603861861220;
 Tue, 27 Oct 2020 22:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-3-billy_tsai@aspeedtech.com> <CACPK8XdYvSmwdAkBzAO3kC8_PYa3CtPkNb0VxcOhmb2UYz5zDA@mail.gmail.com>
 <E0B8BD13-86F6-486E-95DF-1038D7F59A8B@aspeedtech.com>
In-Reply-To: <E0B8BD13-86F6-486E-95DF-1038D7F59A8B@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 28 Oct 2020 05:10:49 +0000
Message-ID: <CACPK8Xeg_LRGv1EEm7cdDWK2xST0mBP=iG7=43UE5qmEMMDsHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Arm: dts: aspeed-g6: Add sgpio node
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Oct 2020 at 04:56, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> Hi Joel,
>
> Thanks for the review.
>
> On 2020/10/12, 12:35 PM, Joel Stanley wrote:
>
>     > On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>     > >
>     > > This patch is used to add sgpiom and sgpios nodes and add compatible
>     > > string for sgpiom.
>     >
>     > You also need to add sgpios documentation to the bindings docs.
>     >
>     > Whenever you add new device tree bindings to the kernel tree you
>     > should add documentation for them.
>     >
>     > When preparing patches for submission, use scripts/checkpatch.pl to
>     > check for common issues. It will warn you if you are adding strings
>     > that are not documented.
>     >
>     > Cheers,
>     >
>     > Joel
>     >
>    Because the driver of sgpios doesn't be implemented, so I don't know how to describe it at sgpio-aspeed.txt.
>    Can I just add  compatible string " aspeed,ast2600-sgpios " to the document for bypassing the warning of checkpatch?

Ignore the sgpios issue for now; we don't have a driver for it so
there's no need to add strings. Drop that part from your dts patch.

>     > >
>     > >  - compatible : Should be one of
>     > > -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
>     > > +  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio", "aspeed,ast2600-sgpiom"
>     >
>     > I think we should add sgpiom strings for the ast2500 (and ast2400?)
>     > too, as this is how they should have been named in the first place:
>     >
>    If I change the document whether I also need to send the patch for sgpio driver and g5/g4.dtsi?

For the sgpiom? We already have a driver for that.

As I said above, make this about fixing the sgpio master and put aside
the sgpio slave issue for now.

Cheers,

Joel

>     > >  - compatible : Should be one of
>     > >    "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
>     > >   "aspeed,ast2400-sgpiom", "aspeed,ast2500-sgpiom", "aspeed,ast2600-sgpiom"
