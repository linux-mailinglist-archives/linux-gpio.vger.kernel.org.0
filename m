Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE7427A012
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 11:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI0JVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 05:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI0JVm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 05:21:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9276DC0613D3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2020 02:21:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so5854902ljp.13
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2020 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGGQySYw8x5K8mtOeM1SZ1tR4LeJUkuWrFy4NhZyY/w=;
        b=vzil5VrFY34NJoONQtPL/nYELXxhPOtPYRZqIQS6TjdYqGIBl+564t4RHy322T73df
         xb+Hm2TrtAGryotAam/5POHXsd3Wp2r6xmMTGo2YNVFpNAGObylnM6k7KBKKnrIgJqdw
         3L39CaUnFY7fADktI+0fGUD3gYlQg8yN4+p1m1MkgeqFJ0Q9DEzK6PBN/5QZnCxnsok4
         Dy5w5nDPkqoeYuOLE00dJ9UDBzFRyUA4sEeD4vUroneXPajV8vMg3X767XPQV+YHzi+P
         ZO/YHmUzvZs/5O7fwebLYz/wMJiWKT6dWTgKj/Q2hFJzlMqVk8KHtGD24y/NmgL3RtmY
         gwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGGQySYw8x5K8mtOeM1SZ1tR4LeJUkuWrFy4NhZyY/w=;
        b=o1mX24k9GDDrnAETnO1aro4f/XljO1695BCGVw59LP+dCFVmwTP/AN1pIGUyFJaUtq
         TXDnLzx3g/OKHUcB/ozrEXIwCXf7TJVuqWwuZcvmf6QYlw9Z5/HC7iXjt3WhlWtGcQXJ
         MXvcoPAxCLd5rFemgcVWHtGqQlM4B3qEU1iNyNWELkrkmYWAuWNuW35bmE4WIgYd1+ai
         uxS21vq5hwWFFMqvgF8loeUH67rDZ9mRrLrMd4SLPgrJZg7cEg3aKFS9/peKq/d5pa8g
         Jmcs/Z1JmRGfED/oY9aX/oFWTH7ZLnyNMC891Xx0sARcjvLWm/Q7blWE5LmNc2vvgemK
         ZzAA==
X-Gm-Message-State: AOAM533P4rdnt/vkqCRzv1D6g1RO4PBQtBTTGIPDYd2kOKZ1b6ENfOS7
        YtIg0yK0ksWq346l+qLfrMZoyb+TSV3OS73ijsrAiw==
X-Google-Smtp-Source: ABdhPJzmJTMesMo36KW0yIQlJE605hbQVVOGBYNhbkPK1+4Pe0bOs0mJvDBCOCh5tMojSqrcInaLr7oEFgooll9kBPQ=
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr3197494ljm.338.1601198500091;
 Sun, 27 Sep 2020 02:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200907110221.1691168-1-fparent@baylibre.com> <20200907110221.1691168-2-fparent@baylibre.com>
In-Reply-To: <20200907110221.1691168-2-fparent@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Sep 2020 11:21:29 +0200
Message-ID: <CACRpkdYXHzrp0-4nhQnJHdhEpzkdSEn8+8AJnmFJhrvu8=Sbuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add MT8167 Pinctrl driver
To:     Fabien Parent <fparent@baylibre.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 1:02 PM Fabien Parent <fparent@baylibre.com> wrote:

> This commit adds the pinctrl driver for the MediaTek's MT8167 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

No reaction from maintainers for 20 days so patch applied.

Yours,
Linus Walleij
