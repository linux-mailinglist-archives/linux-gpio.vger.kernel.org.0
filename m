Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0EF4CC590
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbfJDWBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:01:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33650 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730507AbfJDWBQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:01:16 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so7976712ljd.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y1bY0KVOLdqaxZzHXVxRASkDbZHI1Jwst64oZBnjbtM=;
        b=puzCLjwO6cuw6xl5Zku8gTUDkG390dIuF7x+3qmfnKTkAIdbGIACO39OXw2l5D3Twv
         fOXpikjHgcdocfNe81UmjYmoyoQsUcvB+luFxSuKQGfNkVM9FUzG40Tqcyz2pBK0AsHm
         lebwFE9FPQcyQByeHaU8f6vaS/J76x+/ghDVg5WLj7ItcDHc9VJsePYNHe0+xc0PdZuN
         7vWDXa6qAOMHNQuXn6rupJkd7MVKoRDhlR3iFR1GEvCf2jCLYICoai7n048mZs3RxAHB
         u37YuDykgMZVc5BEmv+J251rLcSqZQb+9lQ2AlExh12zpdtusPNQBB3Hg3WfvZY920Kl
         ZwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y1bY0KVOLdqaxZzHXVxRASkDbZHI1Jwst64oZBnjbtM=;
        b=LqhYO3Ng7DaI62TutvfQljNwcyLVl44meNfF6BcV8v/piP8ZJpqfhXEEk3RDB4YZJo
         DGcrNYUQtWlF++QPu2QliLxK6x5OrnMs4okXoBHA6iUbAZ8Ks0GP+GVdsrrNxn2Avch4
         1P+eh0yiBuz5Z6wUhk3F6xYZKiZ0qvSaYwfY9Z4n/HHQYDPmLs1vuaQ9+F4aAa2IYCgz
         y0TCA6WXROC55pCqZHayTPoj3d4we2Ma2aKeHVqDWtq25xEBzNn9VdGk2YDs62AW3RNv
         e28sa/wVXSOqeHw1AEauEqBNVqetHVFck4bnkPB0et4c0pY0qExPGRuM96UF3qR9WJXN
         PkOg==
X-Gm-Message-State: APjAAAWaetv2bWdUXMc0sqfIKvGFflS53zHyhjQc+GN+8K9PcuuI3im2
        11BFedIk1ANfkz7W4AH2t/YcPAbfIStpRDQw+bTaUA==
X-Google-Smtp-Source: APXvYqzhZymHpUQVGfeDr5rGaewTboWRXad6eeZ/g+OizIgaKqgd2vXP+EpQoQMWDer74/NYUzOmh59PU8dmZNq/vYw=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr9429352ljc.99.1570226474469;
 Fri, 04 Oct 2019 15:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122825.3948322-1-thierry.reding@gmail.com> <20191002122825.3948322-2-thierry.reding@gmail.com>
In-Reply-To: <20191002122825.3948322-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:01:03 +0200
Message-ID: <CACRpkdafEeMKDqmqoxk-6FcNBYoJtfUCD4QzTdCR_5hxzHz_OQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: max77620: Do not allocate IRQs upfront
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Timo Alho <talho@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> regmap_add_irq_chip() will try to allocate all of the IRQ descriptors
> upfront if passed a non-zero irq_base parameter. However, the intention
> is to allocate IRQ descriptors on an as-needed basis if possible. Pass 0
> instead of -1 to fix that use-case.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij

Yours,
Linus Walleij
