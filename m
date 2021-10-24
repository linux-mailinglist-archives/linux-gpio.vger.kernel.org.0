Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AD5438C4C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 00:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhJXWUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 18:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJXWUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 18:20:18 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC82C061764
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 15:17:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id w23so4667811lje.7
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 15:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJaQllcwUzGd4qxnMR+A86sauTQSNS36fTnnI/uULQM=;
        b=GQ+zacEvuIRSW8rKG/z7bNab0DMU6w/J4LIs6RCDHju9nVo1ufu9qJ9aDN0QJNxejY
         0FL926egcpBAegVGFn999GDpXrzXuR0g4jSjEjkqinSx9UutX/P7KOiiUeMk2It6MaEo
         rRHzucaXtlYVjA3ligXrHAhCQn+VAnngnZworLl41Rcs1XgMfoUs0XE9+ywYpBqjif0Y
         145L74F8X6SKmrGpzzZ0a0SX87Stx23qWWYI1iu7U2e4F91knBiglw4EpyuTZiSSocg3
         7WqpX796Rj1dGzcnbqfcuMw01bWvOI4Fx9g4xGw+3ubQMZKk1c22FSXIVbj+xJg2o29T
         UZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJaQllcwUzGd4qxnMR+A86sauTQSNS36fTnnI/uULQM=;
        b=eJmWp2reR5Des1YzS5VxloCjznc9OqRu4d+MALPdMtFFGDKVHVYDA89WyNT1SFOSXl
         rQ4ylIIAvn/EJ6eXWMNXugXjuJpbR9NE+l2Gbh7cQ9FnZzSAEKV6YE+yL6cHP0GelXt9
         py4YCnoMazlQHfIJkF29NIBL7cPaVV9u5n5Y97WXBNZhNqUPnB5JYLmeTVj92jmObUsD
         yBLhJIAHPlcL1haYZsc/AwdBr6pQFcM0a4gf877Guzc1e+5PNBpZHEX4ToZZim5F9/qb
         1OGk7al570S/odqpfy8WyXLSbIxB4eeXNn+ZFBm8tkLJjUsyRPnK11puSpxBN8FFDYAv
         y6kg==
X-Gm-Message-State: AOAM5300haf2y7LsqDA8DTZFMXIJfW/c4BW8CVApT3UlqwjjPOM4Iwwf
        hTwbWscnI2Re0pPdUJhHoUPDgjEUjUmQWYPeXMFHeA==
X-Google-Smtp-Source: ABdhPJzoqTpYQ5TpW5Izs9igH8k5pOJrErUUiisSDzyj8MrLgy4z8bzWFA9jSxPgHlJRRbjcka6RCXHo8VBMTWnTrq4=
X-Received: by 2002:a2e:b748:: with SMTP id k8mr15148284ljo.358.1635113875297;
 Sun, 24 Oct 2021 15:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20211019200831.3817-1-maukka@ext.kapsi.fi> <20211019200831.3817-3-maukka@ext.kapsi.fi>
In-Reply-To: <20211019200831.3817-3-maukka@ext.kapsi.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 00:17:44 +0200
Message-ID: <CACRpkdYvhM53GVLpDp6mHmy+U0kTz2t-yDz5afeXeWTgp=bsXw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] gpio: gpio-cascade: add generic GPIO cascade
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 10:10 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:

> Adds support for building cascades of GPIO lines. That is, it allows
> setups when there is one upstream line and multiple cascaded lines, out
> of which one can be chosen at a time. The status of the upstream line
> can be conveyed to the selected cascaded line or, vice versa, the status
> of the cascaded line can be conveyed to the upstream line.
>
> A multiplexer is being used to select, which cascaded GPIO line is being
> used at any given time.
>
> At the moment only input direction is supported. In future it should be
> possible to add support for output direction, too.
>
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> ---
> v6 -> v7:

This v7 looks like clean and nice merge material to me,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
