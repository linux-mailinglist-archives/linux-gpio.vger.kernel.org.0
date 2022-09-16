Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0BC85BA740
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 09:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiIPHL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 03:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiIPHL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 03:11:26 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F2C4F6A8
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 00:11:25 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id f20so25698427edf.6
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Il+J/IwMFN/OCdB5DdRAkgc0HSi0POdp4fgf6XHbeZQ=;
        b=uafbJYHO0nXthCNVl/f1A12HqDv77g5b0PVj/pevJ86KWX1CykSglGrG9jy7kLPBg3
         RBfmEact4LzUiJPyvix5RuCB/7cx0lSdQaeE8UIFm3NFYdFJendNdRrr0288sEGHeYfj
         jhPxd7W5Hxh9TSxV6o7K62mJ0r2NEkcghKBAUrU4UzhIbpslURCSu/mqtpZL9N7O1UMq
         LONXMpb0dd71vq2LvTJdBAtICVVFrGLl869ysi9QoCOiWTSf320QEx39lCQfEAkwiebP
         bUTv5sMRK8HhVo43GCkhz0Ev5sX8J7qO+01odWoQ5lTDxVY30EiZ4w0Y7wVlDIlgHmNL
         zJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Il+J/IwMFN/OCdB5DdRAkgc0HSi0POdp4fgf6XHbeZQ=;
        b=Rpq3SCZKQoORzGdfZ92i51zsf9ATc41Ba3VqV9Fm8fOWhYnD/Kk+UlaHr2/CBPvWRM
         96k1ELCIOn2Rld4CsoWIl8wv6O/dQBxCU2t0tK4H45QaoiLZN1HcWdz7K9tOvc03zDvP
         oPWHjaNc+HVLdqRatJBBSjCmzqEvleM6c/YmvMX51FGjKLLrvVR7sYeAsO3jjs71BTlG
         DzGHkXlU3LwNaa9Ij/2/RWoBivJclu4woNwPoCTfgSeKzjwXT4MhGOOVAnOh5PSWPT/D
         WgHjSaWMKMSafxlgfMuy7I/cBGPsxQsc7eGnqM4Yv6AlL+aZmyFaYRJWDt6N3zY5WDvr
         Bm/A==
X-Gm-Message-State: ACrzQf0cKbAAV4kUhM/zawMIu/bopHIBUIj4AByaIhNAqsArXgyCMWKO
        /nUU69EixLgUZYxGTT3i8VtdGUToiPqCVuoPA5X1cg==
X-Google-Smtp-Source: AMsMyM76+YUwjkcs2v3ngXlJLdIIFa9mphvYhzVOIKV4xRlWLAO2vtwJhbKU3gbBabMd24APLXhPaU2MbBHdQEIhKN8=
X-Received: by 2002:a05:6402:34cc:b0:451:62bf:c816 with SMTP id
 w12-20020a05640234cc00b0045162bfc816mr2822485edc.213.1663312283959; Fri, 16
 Sep 2022 00:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220914151145.73253-1-brgl@bgdev.pl> <CACRpkdZaSL_pkmrVGOT-y7+3i4y6f6Cjgehycq2FKLwPxrbFvw@mail.gmail.com>
In-Reply-To: <CACRpkdZaSL_pkmrVGOT-y7+3i4y6f6Cjgehycq2FKLwPxrbFvw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Sep 2022 09:11:13 +0200
Message-ID: <CAMRc=Me+srb_rwwaUxx1a=8+Wqm5sc2APzfCoFG3+QxRK5kEKA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: TODO: add an item about GPIO safe-state
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 10:59 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Sep 14, 2022 at 5:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > This adds a new TODO item for gpiolib and can also be used to start
> > a discussion about the need for it and implementation details.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Several approaches have been tried in the past. Consider adding
> these lore links:
>
> "[PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO
> subnodes" (2016)
> https://lore.kernel.org/linux-devicetree/1456214089-13954-3-git-send-email-mpa@pengutronix.de/
> "[PATCH] gpio: 74x164: add lines-initial-states property" (2018)
> https://lore.kernel.org/lkml/20180815201855.29738-1-mail@david-bauer.net/"
> "[RFC] Initial state for GPIOs" (2019)
> https://lore.kernel.org/linux-gpio/bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com/
>
> Just so we don't have to constantly look them up for referral.
>

Of course we were not the first ones to think about it...

I'll read through it later. Was there any particular reason why this
never made its way into the kernel?

Bart
