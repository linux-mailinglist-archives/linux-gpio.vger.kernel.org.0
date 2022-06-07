Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058AA53422E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 19:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245684AbiEYR2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 13:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245270AbiEYR2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 13:28:19 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F409344FE
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 10:28:15 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id v4-20020a1cac04000000b00397001398c0so1495012wme.5
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wN5Z1sp0tdcSIvXWY7HQoJeIR7CM7NXDblhbKWMdgk=;
        b=mFI1Wp+Y3Cx5vpGRNPwKaQ7c2A1hROuIUOJG+McCGpIuG0xM+ehtyZ/T6SKyypafAx
         oPrmJnVM0/wt1tgCIe5Nt2Oe6rjTwF6aNrJlYUGDp3uoI0dOyOfhVfve5iB48qAX0zre
         f64IRWsxbTTPK6ONiOw1srs14BAxBnCe0LhiKSL4txovloLEWdmSwRBlxkO91tHj6SFh
         6Qp71YV0tY0UO5OTt2UCizL+n3IJ4fAStWIvm2hGhrJJN/NL2+oN7gyQ0d86pQeVvEkS
         ck32xhDsjfkz8lsbqQnIFxjD0mfSpAXmSGeZTfSveMRavywgmVWW4G4aQM37JxkawkmU
         1D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wN5Z1sp0tdcSIvXWY7HQoJeIR7CM7NXDblhbKWMdgk=;
        b=fl0bG6+xa9TUCD1hH4nt0wENAyp+BtFWvHK5IO8gPdLnHLfxAINq++zjdhtLKgLnId
         qLnPPxgBy99ogw5WxKiNB34bUzuEU/5ootYHafb5dZSgCKRd2Xfprb//St3sYu2bF7zf
         PooM09NgSTM/lhLI/3yue94aq2F9+gBXI/s7GxJeZydRux/ZO314auIpFUB+47Oncotm
         2kxe4p++TsnAFbVcwyHYfjgdAmkqrr+FwlYBITcfxTOYu2f/brwu1Awq0ei3otyHZext
         wTlBqHAdbUJALR7VyNV3vHN/xSbamAEiYjM4osbUAuFX86Uc/+d5nNjRqEgZAP3DMZsM
         MibQ==
X-Gm-Message-State: AOAM533gr2kAbd3r0myWv4V8eP8eLqYWpxWgD3Gju5fIZAE1AxXBAKQ0
        iMnOfK+HWXt0KvppURPozmaPTqVoyVJMgXv1Qwik5A==
X-Google-Smtp-Source: ABdhPJx6DRtgAoKLyjqFjkaaX34xnnuGV9Xtj2C2Yh02kMXEfEL4eCaCfewk5Rpm9nkxm+tIIC4hFL0K9GY/vHY4Nes=
X-Received: by 2002:a1c:acc4:0:b0:392:9dd4:fbcc with SMTP id
 v187-20020a1cacc4000000b003929dd4fbccmr9101955wme.78.1653499693969; Wed, 25
 May 2022 10:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220406233648.21644-1-brad@pensando.io> <20220406233648.21644-12-brad@pensando.io>
 <9c08f621be28dba65e811bc9cdedc882@kernel.org> <CAK9rFnyRTX+VM5g9P-ar=3VaExhHcwR8DzLvxtv-tG8cN9gqEQ@mail.gmail.com>
 <87tub21uoz.wl-maz@kernel.org>
In-Reply-To: <87tub21uoz.wl-maz@kernel.org>
From:   Brad Larson <brad@pensando.io>
Date:   Wed, 25 May 2022 10:28:02 -0700
Message-ID: <CAK9rFnzbexhS7htxkO9S4-kBF_nTeUkryE7DGTq=a1GHDLwcEQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: Add Pensando Elba SoC support
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        David Clear <dac2@pensando.io>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

On Sat, Apr 9, 2022 at 2:18 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 09 Apr 2022 03:38:55 +0100,
> Brad Larson <brad@pensando.io> wrote:
> >

> > > You are still missing the GICV and GICH regions that are
> > > provided by the CPU. I already pointed that out in [1].
> > >
> > > The Cortex-A72 TRM will tell you where to find them (at
> > > an offset from PERIPHBASE).
> >
> > Hi Marc,
> >
> > Got the addresses, neither region is used, and will be included in the
> > next submission.
>
> Not sure what you mean by these regions being unused here (the Linux
> kernel definitely makes use of them). Note that you'll also need to
> add GICC (which I forgot to mention above).

Added missing GICV, GICH and GICC regions.

Regards,
Brad
