Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4AE1BA581
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2020 15:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgD0N5B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Apr 2020 09:57:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42857 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgD0N5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2020 09:57:00 -0400
Received: by mail-ot1-f66.google.com with SMTP id m18so26194421otq.9;
        Mon, 27 Apr 2020 06:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lbW4CP+foDZ7c7LiUzqrWQ0Yn8i7eKW7LGOFzJFSjRk=;
        b=TlpzW9uOKqrCvDYgdR0vIYgnLI2Sd2U4PQUJ02dLh1VIaVhnmTmZ6cDs2IPMWl9Bdh
         3v83dwrbHc7OmRK5IeNov2Z+vCVx2BEUXegv5wnJBzgIulGH2Jlym1WtqtHVlFMdPBmL
         8Rq7eVIph9DTNKlYC/d4sKL6eAYdNCV93pP6g4Nhr7szWxmilYsCaWpdja3L0+um3NZN
         dZrMYFUzrLgwJpb3eQ8XmR/B8K0LCXgzifME6lBq4+uBEb4wq5H57o/m8HjapSHGPPeF
         2AAdMKPmlbXp+B9xaQsdFDmc72GTAhMFc8OWlrrIAfDiFYDCYNwaaI4/OFX6SEx7fzCw
         TJaw==
X-Gm-Message-State: AGi0PuYtu+oQOxAkPZQ5jBZzDQJBw7/7YqMIY11qjwshUksMCtquL42q
        rmUMmiNjG8i2ZFivvg8nqAigCuUmfwYACqmZAnI=
X-Google-Smtp-Source: APiQypItatage2dW1ybVsZrW2pFyPk+1PxaK/KIBR0r2hz/mKUjiljs4/lAKgCXRXVtD2OMVZzrJKtiDNWGJfv4MhzQ=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr15973637oig.54.1587995819823;
 Mon, 27 Apr 2020 06:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200417140920.22596-1-geert+renesas@glider.be>
In-Reply-To: <20200417140920.22596-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Apr 2020 15:56:48 +0200
Message-ID: <CAMuHMdWzkV1SGvpOg31ZBLHPCGYSEOB1yM=vEKVDqnqJsXj3-Q@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: sh-pfc: Convert to json-schema
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 4:09 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Convert the Renesas Pin Function Controller (PFC) Device Tree binding
> documentation to json-schema.
>
> Document missing properties.
> Drop deprecated and obsolete #gpio-range-cells property.
> Update the example to match reality.
> Drop consumer examples, as they do not belong here.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> How to describe that pin configuration nodes can have subnodes?
> E.g.
>
>     arch/arm/boot/dts/sh73a0-kzm9g.dt.yaml: pin-controller@e6050000: mmc: Additional properties are not allowed ('cfg', 'mux' were unexpected)
>
> Dropping "additionalProperties: false" from the patternProperties
> section gets rid of these warnings, but of course it would be better if
> the subnodes would be validated, too.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml

> +patternProperties:
> +  "^.*$":
> +    if:
> +      type: object
> +    then:
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +      description:
> +        Pinctrl node's client devices use subnodes for desired pin
> +        configuration.
> +        Client device subnodes use below standard properties.
> +
> +      properties:
> +        phandle: true
> +        pins: true
> +        groups: true
> +        function: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-strength:
> +          enum: [ 3, 6, 9, 12, 15, 18, 21, 24 ] # Superset of supported values
> +        power-source:
> +          enum: [ 1800, 3300 ]
> +        gpio-hog: true
> +        gpios: true
> +        output-high: true
> +        output-low: true

The above list lacks the "input" property. Will add.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
