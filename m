Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867A6413334
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 14:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhIUMM2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 08:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhIUMMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 08:12:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70ABBC061574;
        Tue, 21 Sep 2021 05:10:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id dj4so17718775edb.5;
        Tue, 21 Sep 2021 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gnHp9W9tpMJ93FgjbDcsYJnMdjBLWakKWF+667XwxdI=;
        b=PP3MVhD0mKRRrDh5TRhcjFoqsMzxsRG2tmeqli/gck9GjyjeHa62pOsEU2mKfFXtTV
         8hroET+GkHlGegL2astWVuKx+u++I6NikgAAJuYzMm7i70ZHcc6M+Nh7BNgNQvxPKB2j
         +cwbedix3zwQn+pRPQMxhmwS5ABmmpS5v1wO6GJDA0sWr4HusVAWopbFqwwFpuETQ+vG
         mrWdqhJkVks8Rdm5RoQqhWbdh0x2A4j32xHAXPQxscK1JFsUvA71pHOSSKDf6JIfATJv
         p8knOZotQlHXD9rK/IFffLpF25KlU/EQK5xgx0VZfRa6RL0nLoifYbgHPuw/Ko/C0Fmo
         jeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gnHp9W9tpMJ93FgjbDcsYJnMdjBLWakKWF+667XwxdI=;
        b=30BVsgLAuviq159fV7E2HTKTCUe6f3B2feM7iBO5B6pKIwNv4iQIiyrwnCEJJwIo4F
         qPhPVvbys0Uk4obN84d6d60h6sDtKjNAqPfAubvPvuqEz0aCGZhhq2qlx9AAhCaAH7WD
         cNXh1h2mJ9IdabVG8rpos+yTdvciWjVo7BU62Du7SdrJGV85BEFZ94ZIbIjOlJZTTRw+
         cg3y0N0TkOxVzGGiyX0jT3TQJKKqqglDbmJhjZTI9dupsynRxP+8m/LCCnC/UXzaDe4I
         tt4taVG5lUHMyZEhWjTbKim+497sstrzMo4EFq1nx8YtMibmgWEbiZUtSfKHFv0OPErl
         y72g==
X-Gm-Message-State: AOAM532/9hcaCyyy5UFoiQQUlAdW9rTP7n9lgIzy90wgh7j89H/w67Ak
        0qdPlsWJh9VlEj6LTuFAJQDVmU6D1FkB24fzISQH4AToefTXeQ==
X-Google-Smtp-Source: ABdhPJz9F95jhhbvvfmN1NpFh1Avay80Hhpiq+1bFUNsLNPgvaC7MxatoxjIUL69w9lL0hjJbRKQEKrb6WeN/Jawc+8=
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr34397150edc.238.1632226255997;
 Tue, 21 Sep 2021 05:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Sep 2021 15:10:18 +0300
Message-ID: <CAHp75VfzFh4Tp5-P-p-6=Oafd=xhQAL5i=XC5PUXedd-fVWz_g@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 7:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This is a rework of a Rube Goldberg-inspired RFC I posted previously:
>
> https://lore.kernel.org/lkml/20210723075858.376378-1-andrew@aj.id.au/
>
> This time around there's a lot less Rube - the series:
>
> 1. Contains no (ab)use of pinctrl
> 2. Always exposes all pins as GPIOs
> 3. Internally tracks the active pins

Thanks for the rework! Briefly looking it looks very nice to me, hence, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Without these patches the driver limits the number of pins exposed on
> the gpiochip to the number of pins specified as GPIO in the devicetree,
> but doesn't map between the GPIO and pin number spaces. The result is
> that specifying offset or interleaved GPIOs in the devicetree gives
> unexpected behaviour in userspace.
>
> By always exposing all pins as GPIOs the patches resolve the lack of
> mapping between GPIO offsets and pins on the package in the driver by
> ensuring we always have a 1-to-1 mapping.
>
> The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
> possible to not expose any pins as LEDs (and therefore make them all
> accessible as GPIOs). This has a follow-on effect of allowing the driver
> to bind to a device instantiated at runtime without requiring a
> description in the devicetree.
>
> I've tested the series under qemu to inspect the various interactions
> between LEDs vs GPIOs as well as conflicting GPIO requests.
>
> Please review!
>
> Andrew
>
> Andrew Jeffery (2):
>   leds: pca955x: Make the gpiochip always expose all pins
>   leds: pca955x: Allow zero LEDs to be specified
>
>  drivers/leds/leds-pca955x.c | 65 +++++++++++++++++++------------------
>  1 file changed, 34 insertions(+), 31 deletions(-)
>
>
> base-commit: 239f32b4f161c1584cd4b386d6ab8766432a6ede
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko
