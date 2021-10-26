Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422E043BAC4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 21:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237151AbhJZTaL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 15:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236282AbhJZTaK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 15:30:10 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B654C061570;
        Tue, 26 Oct 2021 12:27:46 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id b9so284274ybc.5;
        Tue, 26 Oct 2021 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l+wfMzT5pI4KeLbKtOYEjGxFkq26O6EhH+jW3fAP20s=;
        b=Ncb4t9TNinjO48UvUq1B0xRaynko7cysjTONTPP77SCo8bzaNeTehUbHgptpcjwUAQ
         23GyyxUGfAH0D2Qixvy9RCx9oHmRVc+iA9CdvRRdCMyAITQPzJ98zD4CjMZoJBdfSOmO
         7vY/yf6YzYJlxSRxjJiKpBARv09ri+ZJ5D6sB9MkFjHAF5/O7A+ia8hFPfqEnppxIm+n
         sTpmuNvubZ/gjBxB3leJNLEEdUFaPA9RATJ3IEND4lg6sOnQ948Ncdj2RKMu908Z0w2M
         1+sQya9KQ/Z5DwXHKvkbqEqiOO/NwrPLsjoqPPskqxef7pUwepf0KhVAuBb4GMqLdGqa
         dQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+wfMzT5pI4KeLbKtOYEjGxFkq26O6EhH+jW3fAP20s=;
        b=dAVU7C6Dzu5vQ1THsKl1x4UC33QEHT9rBUFdkcnDpVrle19E8fWgoVbC0Na/HJbxrT
         HYxjdmmDbtf0GQYOgirm79gykAgfjFbFbFvzbRpv+q8XCcyuG65ajKS8bNcH8TKcEsJm
         A+xyhwT1KTL+62A4tMSv7lF0oUuum9C239P5RS3lJ+MGcZMXaPoNk4ZbbbKq4o+iOcR2
         BNvpFqd+WL6O4SRhiUJywBndwc4Chb2kl58FwXxIto7oeqRwNfLkNJmZhsH+lT3UYZuq
         zNuuesKcPg/5NimmbxekhL2mmiyfzm9W2HYAlLQKCWQ7WHaa/4VqR15KjO3WVAobGmgw
         9UNQ==
X-Gm-Message-State: AOAM532Q4dbsNJrUp+XeJLtKVpeL1L0Llhmh5bozVwARjbpkvUNI1iWg
        i6bixt65hjEKye3zlaWHIiRqlGtl/5DCs59TpaQ=
X-Google-Smtp-Source: ABdhPJw/2ChRJ5oj3dv8OSYqLhqvL0LlcghhuyFBiV0TA3STVk75KQikO8lmp8LLAAvGSQgf7rIaQ8GxdXCqyOoBuHw=
X-Received: by 2002:a25:c08a:: with SMTP id c132mr25961947ybf.49.1635276465259;
 Tue, 26 Oct 2021 12:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVm5gYFKZa=4jSm+GAsMYRUFwXjjXNhr16Z-ROVzpsZbA@mail.gmail.com>
In-Reply-To: <CAMuHMdVm5gYFKZa=4jSm+GAsMYRUFwXjjXNhr16Z-ROVzpsZbA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 26 Oct 2021 20:27:19 +0100
Message-ID: <CA+V-a8sgmocz+EPALfSytcmQYHbUeMWcz4ac6g5gzUARWDUaPA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance" property
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Oct 7, 2021 at 5:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Sep 30, 2021 at 2:17 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > On RZ/G2L SoC for Group-B pins, output impedance can be configured.
> > This patch documents "output-impedance" property in pincfg-node.yaml so
> > that other platforms requiring such feature can make use of this property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > @@ -114,6 +114,10 @@ properties:
> >      description: enable output on a pin without actively driving it
> >        (such as enabling an output buffer)
> >
> > +  output-impedance:
>
> output-impedance-ohms (ugh, the standard suffix is plural)
>
> Yes, I know only one other property has a standard unit suffix from
> dt-schema/schemas/property-units.yaml. Should we add properties
> including standard unit suffixes, and deprecate the old ones?
>
Yes, that should be the way to go forward.

Cheers,
Prabhakar

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: set the pins output impedance at most X ohm
> > +
> >    output-low:
> >      type: boolean
> >      description: set the pin to output mode with low level
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
