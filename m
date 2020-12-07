Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FBE2D1D98
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 23:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgLGWnK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 17:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgLGWnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 17:43:10 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C91C061793
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 14:42:30 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id s11so8173575ljp.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 14:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cImNfTxV3yatbn+FwY8M9bZp9qMjG8D8HnYsrobPKBM=;
        b=l/3wAoeuSBrTZ5kzXGqkOaoPHawgUXp/mHZNKiEgADA645+ISC1YZ5iqJSJE4+v7XZ
         xITpXU1sinnNXZW40rT7HZ9HShZ2VXfN0X+Aub2v/zs7L1Z9Rpi5mG56cCwHWGDM7EfC
         TYf097m6CnVspCAAUT7WedGTeh+kjr78Ck97MfE4ZiBDJSdNjadXF8AF0c3WKqiv5gQy
         1K3PB9Gu3LhF7EApfg/b+njaSxfT7CJBuj0f6/eB6HvN3aeATU7Ogpo0xxmALvGEUhrK
         UmnvAGyBnC3OfhTcxyd1TAzTPNXz9tUs239JVEq2mS0RhykttT9WUZEjnT9zoW+1x9QF
         W4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cImNfTxV3yatbn+FwY8M9bZp9qMjG8D8HnYsrobPKBM=;
        b=axZ0IZuxRu61OrUZA6LcGxwvKFB2yTMl7uDJ3vP9ZBpwmJQ3m1G4VKIBqSNDTXCn+C
         PUi2UPp11abrttTwRFGxmBitYXQk0qsdyjHE4rRVuUueN47JfI6JCEsnP4JMqJNkEQyU
         nY7q6gchPJSqFuOyJNL+blB1ir7OLmYGb/n+5d5kPTgWvWZ2ltM5hvJtHmwewFYAtQj8
         Q6458pDJ0NqyZmX9GIZFFw5y8TOiovCIVHVFw8xnIKzuKqqY9fX51OS9UPCFk/FKN7QJ
         9NTNC1ebefZlBcMQUzmP2ECnBGIuyM4JJsIqHpjorqGdCtvZhPA9cxsRqvTlbDZ6Lpkp
         r6qw==
X-Gm-Message-State: AOAM532ZNPfReWeCBMVhB4plybUraNCdNtt1KCyDhqF8sHU7xMMQaXGt
        nJFvtPuVRo/zHRuoBnTe0Cyb1KxBq/PdQ0QpAxEj+w==
X-Google-Smtp-Source: ABdhPJy8Ot+W5f80Fu6BvEpJfkPnwWQJWnUoywlXCUa7zl1OOM6UIV8Ecm6vA/ioB3u0PzOzFPstmhe2dwDhcTnSjz8=
X-Received: by 2002:a2e:9ad3:: with SMTP id p19mr4433350ljj.286.1607380948588;
 Mon, 07 Dec 2020 14:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com> <20201207192104.6046-2-sergio.paracuellos@gmail.com>
In-Reply-To: <20201207192104.6046-2-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Dec 2020 23:42:16 +0100
Message-ID: <CACRpkdavpQ+QP56MVQ5E0oxNKWb0tR9g8vHay6-LAc+Bj7tAQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: rt2880: add binding document
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergio,

thanks for driving this!

On Mon, Dec 7, 2020 at 8:21 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> The commit adds rt2880 compatible node in binding document.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
(...)
> +description:
> +  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
> +  is not supported. There is no pinconf support.

OK!

> +properties:
> +  compatible:
> +    enum:
> +      - ralink,rt2880-pinmux
> +
> +  pinctrl-0:
> +    description:
> +      A phandle to the node containing the subnodes containing default
> +      configurations.

As it is a node on the pin controller itself, this is a hog so write something
about that this is for pinctrl hogs.

> +  pinctrl-names:
> +    description:
> +      A pinctrl state named "default" must be defined.
> +    const: default

Is it really compulsory?

> +required:
> +  - compatible
> +  - pinctrl-names
> +  - pinctrl-0

I wonder if the hogs are really compulsory.

> +patternProperties:
> +  '^.*$':

That's liberal node naming!
What about [a-z0-9_-]+ or something?

> +    if:
> +      type: object
> +      description: |
> +        A pinctrl node should contain at least one subnodes representing the
> +        pinctrl groups available on the machine.
> +      $ref: "pinmux-node.yaml"
> +      required:
> +        - groups
> +        - function
> +      additionalProperties: false
> +    then:
> +      properties:
> +        groups:
> +          description:
> +            Name of the pin group to use for the functions.
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
> +                 pcie, sdhci]
> +        function:
> +          description:
> +            The mux function to select
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
> +                 mdio, nand1, nand2, sdhci]

Why do we have this complex if: clause?
$ref: "pinmux-node.yaml" should bring in the groups and
function properties. Then you can add some further restrictions
on top of that, right?

I would just do:

patternProperties:
  '^[a-z0-9_]+$':
    type: object
      description: node for pinctrl
      $ref "pinmux-node.yaml"

      properties:
        groups:
          description: groups...
          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
pcie, sdhci]
        function:
          description: function...
          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
mdio, nand1, nand2, sdhci]

Note: the function names are fine but the group names are a bit
confusion since often a group can be used for more than one
function, and e.g.

function = "i2c";
group = "uart1";

to use the uart1 pins for an i2c is gonna look mildly confusing.

But if this is what the hardware calls it I suppose it is
fine.

Yours,
Linus Walleij
