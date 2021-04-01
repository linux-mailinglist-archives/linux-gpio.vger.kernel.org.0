Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF2B351992
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 20:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbhDARyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 13:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235871AbhDARs2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 13:48:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424B1C05BD37
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 06:08:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i26so2753009lfl.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Apr 2021 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kgXD3U/DrQ9vSxCEaPsInQj0EAhn8kdogWYjyNQBOE4=;
        b=KE3cKfhcFR48eqKLC026k68pj4XXeu75rKpuzgjr/cCOeB3a2ZoW36SGUE4+5fJ2Kg
         anl1T6Ry7ODVw+cyx2r1T6RHnx5kkzvXPZPGKI/WinOkm3cxHCJYDKa47N7RMBmg7W4o
         bT5zsLP/Ud06DHmEe7NDDOvxnTDhyg1EfC+zGD+QJKaaFK6GMJr9QI5VTH7yhehh0ZRB
         8jsBc2SewYPaNHJ6kej06LXk7XfXSAiPhQfS9i2LVStwmZfSGw69eirzZd0H+DeFfmaV
         +Tj7OUgjmT6L8z/J7Ndvo0Fs7o0gWpUXH8ddz91BF+gO0bZ66D+xNFhJTvSJKD8cniuS
         5M8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kgXD3U/DrQ9vSxCEaPsInQj0EAhn8kdogWYjyNQBOE4=;
        b=LIFINXjcc1RhZ/JKUiTTWP7iliCr2gUKhoopSzv5IQaXgnOUFtWZYgtU8YD5sC0HIV
         7g5EV9i7Zv6DHw7udAkOJ1AjfDhaa2nuxlyI4TR+k11B2Rej1vKLzf6byxmgDBfQd9ld
         NKcdXHxw6XP9M01YhJRIe/quizMFH9/sfAwhNxdpjUPKeXgolSKOcmzGBkkWrzTcSpG5
         Q/JfXj2fTZ21VUUYWYwp7HldDii34/8JUj4nIp4/InV1I5fvd26r2ru4ZBVJU5j9/V4a
         2WIRE05MyzjPQCmJAHsq+NR2vY4srM1TNas5l9XT2NVHaF9ASCKfDXsjFBLNZCpO8L86
         Q02Q==
X-Gm-Message-State: AOAM530VW8F21WsOsZRgsazvxv5rHkO3rfPyacsI1l25i8JusJ8NAjsX
        IxO0pZ7p5BGRFIEWY/IosqogcOrj/CBp/1vcESTsNQ==
X-Google-Smtp-Source: ABdhPJzQC9jNQb6dsL7WniFLh6CGPL6/0Y6vVpiVvZ6eUfNUk61mYIzybCiFhSxh0pYAScadm4UZ9/cr5T+ZjZHLenU=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr5550624lfo.529.1617282485530;
 Thu, 01 Apr 2021 06:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com> <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Apr 2021 15:07:54 +0200
Message-ID: <CACRpkdbABbvxRLGhzmiQ8kTmwHsRqevvmDpfLKv-dUhEHVpF6g@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 10:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> This is a simple logic analyzer using GPIO polling. It comes with a
> script to isolate a CPU for polling. While this is definately not a
> production level analyzer, it can be a helpful first view when remote
> debugging. Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I am a great supporter of this idea.

When we created gpiod_get_array_value() and friends, the idea
was exactly to be able to do things like this. It's a good way to
utilize the fact that several GPIO lines can often be read from a single
register read.

> +    i2c-analyzer {
> +            compatible = "gpio-logic-analyzer";
> +            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
> +            probe-names = "SCL", "SDA";
> +    };
> +
> +The binding documentation is in the ``misc`` folder of the Kernel binding
> +documentation.
(...)
> +++ b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml

When other debugging tools for GPIO got DT bindings it was concluded that
it is possible to create bindings like this for debugging without even
specifying
any formal bindings. They are just for debugging after all.

Personally I like the bindings anyway.

> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig

I would consider housing this tool under drivers/gpio actually.
We have other funky things like gpio-sim and gpio-aggregator
so why not.

I would create a Kconfig menu with "GPIO hardware hacking tools".

But Bartosz would need to agree on that idea.

> +config GPIO_LOGIC_ANALYZER
> +       tristate "Simple GPIO logic analyzer"
> +       depends on GPIOLIB || COMPILE_TEST
> +       help

depends on EXPERT

I would say. Definitely not something for the average user.

Yours,
Linus Walleij
