Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088662D23CE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 07:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgLHGrh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 01:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgLHGrh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 01:47:37 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA324C061749;
        Mon,  7 Dec 2020 22:46:56 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id q25so3179394otn.10;
        Mon, 07 Dec 2020 22:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHeqGcpUq0K/LfMy6iWPf10Yt7dCiT+hVL7+V0mFEG4=;
        b=ZbufPNenq+pVtfYd22sI3tBeluvAD8zx/IiJrcTWvRq860NWC0mMJJHhbKqPS5+NgE
         8upDHajGqUXVsdHjBST0+zFB8YJ6XajUAxvMLj20nUp/hyUCmPW1oMcr7M6XymwcjmPR
         kYhQCbjFAjoRe4PcglK8ifIY0sdoa+5kjQN+WhWtjctcnQtsEdqu1BudMB46JMRKp82J
         0enoOHiIZkJo4+dTATwDHgroskEV4f5EhMVHJIiX91xDJL0GF4wyxw6qZ+pE2/qAvgHy
         DP7RX0Fb8l634zbgR/py2EBOqcGbEJqAonYYWTCQ2Y7NTQ/GFbGC1XlYH+obVoBsLZn7
         4jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHeqGcpUq0K/LfMy6iWPf10Yt7dCiT+hVL7+V0mFEG4=;
        b=AauOHelPJLhorD03FJffEj4+mnjlxtgxyCT0dxvGsJiaNFYpb0QTMg9GVdIntfJQBx
         fRvHTbbU0wXcd4UBI5/E/2zICmXyxv59WtQieNRzSLmTVNA/bjzipqjFecVGaWgolKqp
         utTiUgz+omt6KZwb2frd4ucZ9rZ5M2PVwyU65oCCKtJNKAWGg9M18DN6Ma3jA4JkJSlx
         Bt+wYxYs/KIYfL5zZPGATovcDVB9Cxkw3S08uSaCVtlBs0NNA5u0Pb+gzfmvT718rv9z
         SXbiJvg9Nz7PVww4uS6L96njd6PdHKHHiBxugL6eqTIlfnMA9+6zU/faoC7oBwghUNjI
         5IVg==
X-Gm-Message-State: AOAM5322UkgAnMsgewzcwYUke5wGnMq3JzN8Xvv3q6cire+Inbe9wkEz
        hw3stQE2xdV82wpOTeh6PevQp2U7/TkF1gVT3y8=
X-Google-Smtp-Source: ABdhPJzCAaa7yN+Wk5sFAvAe9YX5TxXG43cpkSCDjtkK9c8g7PvLcNOUJnzq9Y0HW6a+IRBMoNzYb6/AZ+oHIaDen3I=
X-Received: by 2002:a9d:589:: with SMTP id 9mr15977543otd.72.1607410016335;
 Mon, 07 Dec 2020 22:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
 <20201207192104.6046-2-sergio.paracuellos@gmail.com> <CACRpkdavpQ+QP56MVQ5E0oxNKWb0tR9g8vHay6-LAc+Bj7tAQQ@mail.gmail.com>
In-Reply-To: <CACRpkdavpQ+QP56MVQ5E0oxNKWb0tR9g8vHay6-LAc+Bj7tAQQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 8 Dec 2020 07:46:45 +0100
Message-ID: <CAMhs-H8rT7ofTsBn7mkp5rWhGfSrMCUHtbn1KLeEUKEeH20=1Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: rt2880: add binding document
To:     Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

Thanks for the review. There weren't too many yaml samples for this so
as you had seen this was a bit messy and I really needed this review,
especially in the 'if' clause part :).

On Mon, Dec 7, 2020 at 11:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Sergio,
>
> thanks for driving this!
>
> On Mon, Dec 7, 2020 at 8:21 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > The commit adds rt2880 compatible node in binding document.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> (...)
> > +description:
> > +  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
> > +  is not supported. There is no pinconf support.
>
> OK!
>
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ralink,rt2880-pinmux
> > +
> > +  pinctrl-0:
> > +    description:
> > +      A phandle to the node containing the subnodes containing default
> > +      configurations.
>
> As it is a node on the pin controller itself, this is a hog so write something
> about that this is for pinctrl hogs.

Ok, will do.

>
> > +  pinctrl-names:
> > +    description:
> > +      A pinctrl state named "default" must be defined.
> > +    const: default
>
> Is it really compulsory?

Not really, I guess. The current device tree contains one so I added
here because of this.
>
> > +required:
> > +  - compatible
> > +  - pinctrl-names
> > +  - pinctrl-0
>
> I wonder if the hogs are really compulsory.

Ok, so I guess I should remove both 'pinctrl-names' and ' pinctrl-0'
from the required but maintain its desciption.

>
> > +patternProperties:
> > +  '^.*$':
>
> That's liberal node naming!
> What about [a-z0-9_-]+ or something?

hahaha. Yeah, I like freedom :), but yes, you are right, I will change
the pattern using the one proposed here.

>
> > +    if:
> > +      type: object
> > +      description: |
> > +        A pinctrl node should contain at least one subnodes representing the
> > +        pinctrl groups available on the machine.
> > +      $ref: "pinmux-node.yaml"
> > +      required:
> > +        - groups
> > +        - function
> > +      additionalProperties: false
> > +    then:
> > +      properties:
> > +        groups:
> > +          description:
> > +            Name of the pin group to use for the functions.
> > +          $ref: "/schemas/types.yaml#/definitions/string"
> > +          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
> > +                 pcie, sdhci]
> > +        function:
> > +          description:
> > +            The mux function to select
> > +          $ref: "/schemas/types.yaml#/definitions/string"
> > +          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
> > +                 mdio, nand1, nand2, sdhci]
>
> Why do we have this complex if: clause?

To be honest to avoid problems with other pinctrl root nodes because
they are not type 'object' and not having real idea in what way this
should be achieved :).

> $ref: "pinmux-node.yaml" should bring in the groups and
> function properties. Then you can add some further restrictions
> on top of that, right?
>
> I would just do:
>
> patternProperties:
>   '^[a-z0-9_]+$':
>     type: object
>       description: node for pinctrl
>       $ref "pinmux-node.yaml"
>
>       properties:
>         groups:
>           description: groups...
>           enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
> pcie, sdhci]
>         function:
>           description: function...
>           enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
> mdio, nand1, nand2, sdhci]
>
> Note: the function names are fine but the group names are a bit
> confusion since often a group can be used for more than one
> function, and e.g.
>
> function = "i2c";
> group = "uart1";
>
> to use the uart1 pins for an i2c is gonna look mildly confusing.
>
> But if this is what the hardware calls it I suppose it is
> fine.

This is the way is currently being used in the device tree.

>
> Yours,
> Linus Walleij

Thanks again. I will change this and send v2.

Best regards,
     Sergio Paracuellos
