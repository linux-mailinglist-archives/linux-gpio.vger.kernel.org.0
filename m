Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63A5392C07
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 12:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbhE0Kni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 06:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbhE0Knh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 06:43:37 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7403FC061760
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 03:42:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q1so7289080lfo.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6tixj2haWZA8YgvzvNuK+R1Svh++ThjPtVzzpW8JkQ=;
        b=Al9KteHBTnIdbKGNyaxaNUxt21VFyIjbI2V6DBXkyoPffOwPmW87GXtXhJVf+FfQeY
         tL2DWNYkcKD7jrxoeRJmzxgMIk8bruiyFdBUfxD6lpKIm2ubMftlgU1xqvUyAC3LyiGK
         cLt2mxxzMGa7yHYU5z+jDRlFnz2uSx8Z4NuwhVQLt/C/lbaJqwDqZNQzDRT9Xn7y9m32
         3ANpa8K+mZdZUunziGhBZo9MHhTdkIGdWNyzsRAS+CcShA3bUYXiR1z+eBHotYvfw0q4
         G1Ha30jnT7Lv0fNrQVmbmkrLW1XkRY/Yw9lvGB5sZBCPozd4QP+TkWWBr+AthZ3+Re60
         t1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6tixj2haWZA8YgvzvNuK+R1Svh++ThjPtVzzpW8JkQ=;
        b=Tful5t38cbZrXb/c80j7JRupl1t2Vl9pSbjOo3W9rdWb/NQRQsSIUkQeHzMG+UBqc2
         BhQMUQj3TCsktJe+7z99/+0JBHkdN42LdV4p3Nyt4XryxMnJxyOJnH07nA8ZbAfvyQHj
         Nq6RJGOrYG8/46/7du0N+qp5hXbLpDNXXVNqBrrbuhzyFNF80V3+atbFUOTyPPkpVh2U
         0TiDhtXOivW2301j5rbJkZcN7xgUy2cqVBeIXpl8lReJ8Cfd0JXgsuX4E7l2tGAJo/j/
         aW0lxP3e9LHtG2jriPi2FXUhnEeEsZN7VOt/I7eafR8q+OSpyDvNU/a+WHSum7GePG/N
         +qww==
X-Gm-Message-State: AOAM5323njRbCwl2FBso6aBI0sQFk5VkKFKheoDvpKcfuANHOaJ64+IB
        L6BnnbMbY3v26aBl9aTdbgVssnWamHp4mgdgtJRU+Q==
X-Google-Smtp-Source: ABdhPJxV09g9PPjsrK5NP4c0f/kJebqF6beE1H6f7fzA1PK2cKWAzbE+S9UW+3Fb30OfPUif97cIbA0CTFsW24T+3s0=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr1832688lfs.157.1622112121599;
 Thu, 27 May 2021 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com> <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 12:41:49 +0200
Message-ID: <CACRpkdYK8sy26_HbQE0K0snFzKs=q5zqd5e2u4HWo939FKMW6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay
 pinctrl driver
To:     lakshmi.sowjanya.d@intel.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>, tamal.saha@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lakshmi,

some more review of the bindings!

On Mon, May 24, 2021 at 11:26 AM <lakshmi.sowjanya.d@intel.com> wrote:

> +properties:
> +  compatible:
> +    const: intel,keembay-pinctrl
> +
> +  reg:
> +    maxItems: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2

The code uses "num-gpios" but should be using "ngpios" which is the
standard.

> +  interrupts:
> +    description:
> +      Specifies the interrupt lines to be used by the controller.
> +    maxItems: 8

We need to figure out how these interrupt assign to GPIOs, and it is
relevant to write that already here, om the description. It is fine if the
same info is duplicated in the driver.

> +patternProperties:
> +  '^.$':
> +    type: object

Certainly these nodes can have a strict name?

Use includes for checking standard attributes:
$ref: pinmux-node.yaml#
$ref: pincfg-node.yaml#

> +    description:
> +      Child nodes can be specified to contain pin configuration information,
> +      which can then be utilized by pinctrl client devices.
> +      The following properties are supported.
> +
> +    properties:
> +      pins:
> +        description: |
> +          The name(s) of the pins to be configured in the child node.
> +          Supported pin names are "GPIO0" up to "GPIO79".
(...)
> +      bias-disable:
> +        type: boolean

Using $ref: pincfg-node.yaml# this becomes
bias-disable: true
etc.

> +      drive-strength:
> +        enum: [2, 4, 8, 12]

This needs to be specified though.

> +      slew-rate:
> +        description: |
> +         0: Fast
> +         1: Slow
> +        enum: [0, 1]

And this.

Yours,
Linus Walleij
