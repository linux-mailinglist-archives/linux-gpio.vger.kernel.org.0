Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030AF4629DE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 02:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbhK3Bjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 20:39:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236652AbhK3Bjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 20:39:51 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9C7C061714
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 17:36:33 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso28097073otj.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 17:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bkKJSaouiSl3MZWJNEaP90lU/eu+6PH4+TkdzrZfVM=;
        b=d7tQ7aWzXsLTRLUZzEa/V+bGEgKrWdt8hHOJ3b9+Wh7/ljk8/Y8tA+1YLsNkOUlrU4
         ZYvQIK8Tu4RX+T1RGIHW1+375Y/eEnMLI6Krrq5ToT68LJ2VoKWCX8QQYk9mSP+fTQst
         /sKqTrspWPi50muqTsJaYcUPN/eYK/p28V+XnuMMLaAJ6hSgKNs+2EEQmt3qO4DIm52L
         AK3IYyL+bcZr+5yEoYQcvqBCoP4LqYpAqQ6YjmAWzHUrwCy7YbRS7Gh297/s41nQe133
         Cp7NCe/3MoehHlKO/93bmWy8hNb+IPqYNopmM3svscKd5jgmM0g1xWAP/HvaAujQIxp2
         /X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bkKJSaouiSl3MZWJNEaP90lU/eu+6PH4+TkdzrZfVM=;
        b=tuLCvOxn7gtAfyzWNKqwyPI8x26UfxwrwcVJ+zCpVti448FgQxNgC06tA4Ke51tfrI
         50PSWlr77M6BJCY4dJ7c7qHBftKc5ol11LHydBVcIRLg8jFEl0NFw8O17Wrtuqtpu7FQ
         voehGp71TEaQUkpZoJu+VzeUKp9566Cn5Hxj+pJTQp2TGKLQ7yu4hTd59rtd2F6I0OnP
         JI5EbXx4jZOgk21gwlyy+13RhsL8x5pAiuXj6DSliLaCnYv90CxwbsY+pS0ddRPg8wva
         BYXksWjJ7I6DMnJ5KocOBqbX4DBMOVmuPAPYA1pe9N9LuGYzSXh+YyXfWFwjNAxVlkxr
         DyBw==
X-Gm-Message-State: AOAM530gYn3sLyoT9eeTL9NpsXSIDgORbsYcOA5eCydEApBkhXK+38c4
        KZ+g0pahJmgiMn3QkKCUZGlcuaEa9kxRGeuYrSTJww==
X-Google-Smtp-Source: ABdhPJzwrns8Zsnpi4oJB2u7KPEXT7RKogihtUoB/0QcdwLDwrw/RZ6DmnQN+b//RNBdmR5zjIzdfU0n/Y4pbML/iJY=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr47447824otj.35.1638236192907;
 Mon, 29 Nov 2021 17:36:32 -0800 (PST)
MIME-Version: 1.0
References: <20211127192510.35723-1-demonsingur@gmail.com> <20211127192510.35723-3-demonsingur@gmail.com>
In-Reply-To: <20211127192510.35723-3-demonsingur@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Nov 2021 02:36:20 +0100
Message-ID: <CACRpkdYbqBH=EFC4NK3G0-BU2g6kFXLB8CkWGdughWR2So35_w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: iio: add AD74413R
To:     Cosmin Tanislav <demonsingur@gmail.com>
Cc:     cosmin.tanislav@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 27, 2021 at 8:25 PM Cosmin Tanislav <demonsingur@gmail.com> wrote:

> The AD74412R and AD74413R are quad-channel software configurable input/output
> solutions for building and process control applications. They contain
> functionality for analog output, analog input, digital input, resistance
> temperature detector, and thermocouple measurements integrated
> into a single chip solution with an SPI interface.
> The devices feature a 16-bit ADC and four configurable 13-bit DACs to provide
> four configurable input/output channels and a suite of diagnostic functions.
> The AD74413R differentiates itself from the AD74412R by being HART-compatible.
>
> Signed-off-by: Cosmin Tanislav <cosmin.tanislav@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
