Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB96E42A6B6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 16:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbhJLOGw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 10:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237144AbhJLOGv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Oct 2021 10:06:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6859C60EBB;
        Tue, 12 Oct 2021 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634047489;
        bh=CM715X93mwOfebn9okb1cn60LPdLuCAP97k7YQ925Zs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eE9l10nRCwFP9JwQm5CBzQbVgED40qFbvqxZpS5Q594VM0NaFYDhIkmPkAkKOkSZR
         dxZAbcyVHosz4i/m8hC0JZOLlrm+vfeElh/CoV7xACEAy9YYB58wGK0+7oWREfS0Tn
         SZUf50ExqKsXNgJGlJnIGB7D4zXnaNnuS6W1/aEtPmjLz5HqVvQSkosNBjE4vLuymR
         HavTbMLdHrzty3LZB1zgEVpi2uZOjTMxORXrdBwfcLBy+YkJNVU4C6OP45p5fUY3nj
         3XCJGo+s7Rw1tmMc2qJH9VKxe/FK2Lw1GOte1jKrxgJRxqmEC6kd/+x9w1oXU61jtN
         1SlCjNnCzg6Hg==
Received: by mail-ed1-f47.google.com with SMTP id w19so146604edd.2;
        Tue, 12 Oct 2021 07:04:49 -0700 (PDT)
X-Gm-Message-State: AOAM531aBn+dx7QnmTSm18A09d2pJ+WzYYAOiX5GWJRyTAYPeiSE4S+9
        e/RFyTBWGCEf3wVi9MzX/O2EPLFZn3FP8vS5hA==
X-Google-Smtp-Source: ABdhPJwPDiBfN77c2V77s+DF2ulIEohbF2WPsDSFsQtO7KsY/+TG1HOFqiE53/kzqDEpDbfGFVsXC/v7dU3yjLvJBdM=
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr158659ede.70.1634047487830;
 Tue, 12 Oct 2021 07:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech>
In-Reply-To: <20210924071614.868307-1-maxime@cerno.tech>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Oct 2021 09:04:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
Message-ID: <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To:     Maxime Ripard <maxime@cerno.tech>, Lee Jones <lee.jones@linaro.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 2:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> Changes from v1:
>   - Removed the example and moved it in the mfd schema
> ---
>  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
>  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
>  2 files changed, 55 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml

This one not being applied with the rest of the series is also
breaking linux-next.

b4 am -P_ -sl -o - 20210924071614.868307-1-maxime@cerno.tech | git am
