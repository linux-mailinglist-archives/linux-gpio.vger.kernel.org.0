Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E3838E570
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 13:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhEXL2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbhEXL2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 07:28:43 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CCFC061574;
        Mon, 24 May 2021 04:27:16 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id w206so5923345ybg.7;
        Mon, 24 May 2021 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n4lZKQ7D/b+Y1RnAe1IHv907xEM4UrKrYxjGnKdhmJs=;
        b=kCzxdZSgQ+Qvkuemg1RliV7PQ15KS5a1Qe+OwDcyfwKRqZeAeqlfwqbMGUopNBnIGO
         xV7tKYPuyGNDSKbtaR5y5JTrluPYIrSv+x8WL4KkqbqDpwfn8gmHIv8y1mjjlb32uubI
         mpZujOUm6T+yU1K4psAp0SByHHHZxtsFW91ACMCFLavQWd+vdcrJzhfeJABoSlyFw8mq
         5VImmopVl4M+pEntrlWzGFmO4UESaMhuUe1vhotgHvf1w0503oYPNlau5+SvFNteTdZD
         SPgs1sG5x09+Z1s4CBdp50r+5+w3KJxgzfxR5YRlYN3J8gUZk/+1Fp7P038BtOhnedpi
         H0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n4lZKQ7D/b+Y1RnAe1IHv907xEM4UrKrYxjGnKdhmJs=;
        b=ZoeBGi/pzX0HzljNBaPniT7DYWTyAlMXqpIOYwMDrBZRukRxgFjdK3H4q5l59SIKiq
         ZPjap28EAosKsICc/bXQGOg2cNYdOuGjmaB9hT4Nm+zL7mcBWrkIY0WvPosxUhzQhKnx
         ox86/3pza4XEehs8xkBG4RlEm0iuaEVANqWRmkdoxjqquZ0Nvo6JkhWX85YGYuiDKwgU
         og7WNaOIZSX8eDkRdTbUbAsWYR2efjMsAkGzTLGGgLz+MQYTC1ytanAkEG2Sx3EzT5+b
         R66hdgmegnRUgvNvgDhP/1R8AuZWrCXf5IcKtRXEX1muh1ToFNPaHGp9Wr63vXOmsSzN
         kALg==
X-Gm-Message-State: AOAM5318jFPClJkN2sV/F2n7vQZvsrZycUR4T1xCytdBcjhLHCHaQX/5
        b8aX9YNttlb54EHffKF+AMNLR3XT91NARkPSmg8=
X-Google-Smtp-Source: ABdhPJy2CiQGQD9PVjlvfc77AiGZksg4u2goErRpB2fkP/7pbqKE9HS5KbzuJSWj6Tjl5TG5N7AmZEE5geyLUdWuD1U=
X-Received: by 2002:a25:b78e:: with SMTP id n14mr35491542ybh.474.1621855635345;
 Mon, 24 May 2021 04:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net> <20201203191135.21576-2-info@metux.net>
In-Reply-To: <20201203191135.21576-2-info@metux.net>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Mon, 24 May 2021 16:57:03 +0530
Message-ID: <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 4, 2020 at 12:51 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Introducing new gpio driver for virtual GPIO devices via virtio.
>
> The driver allows routing gpio control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
>
> Changes v2:
>     * fixed uapi header license
>     * sorted include's
>     * fixed formatting
>     * fixed unneeded devm allocation - plain kzalloc/kfree is enough
>     * fixed missing devm_kzalloc fail check
>     * use devm_kcalloc() for array allocation
>     * added virtio-gpio protocol specification

Hi Enrico,

We (Linaro's Project Stratos
https://linaro.atlassian.net/wiki/spaces/STR/overview)
 are interested in this stuff. I was trying to look at the last status
of all this. Few
questions for you:

- Was the spec ever posted to virtio-dev list ? I thought that's the
very first step before
we merge the code.

- Any follow up on this patchset ?

Thanks. I will be happy to help otherwise and have cycles to work on
this if you need my help.

--
viresh
