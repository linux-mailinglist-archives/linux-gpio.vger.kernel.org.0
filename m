Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC7C3EA188
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 11:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhHLJGu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 05:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235158AbhHLJGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 05:06:49 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B326FC061765;
        Thu, 12 Aug 2021 02:06:24 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id x5so2369783ybe.12;
        Thu, 12 Aug 2021 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UfZh+k1iAdsLIsImkWxhdGBlZUauAKUc9V8AaIWdDLA=;
        b=jmBbkkDTZSYO+UGViOLwdhrmdon+GQ54mQKtBIbMHMQA5FfuXjF1thDh/9/Ner/wsq
         FI/EQq+VcGGJJiY9q5EMACIzdsSU88V4Bms6zg8oW7csFrSOWslRAEdnD67waOvrUXCU
         ezIvaltAF1G0U6phNkV51luNWQt+G7qHIzJB0umhKZZcdnN5ihouBisCBMI1XCvPS7ZG
         COSVOwgzNJYlX+3hqR4YXYQuUfeoV6wPq8qiVi2zgiZFsVsWJQwqVOvl/aDfuiXlH66r
         SNGYXx4rQ0nC7OH4w1Yt1saXrqh8Ebb2LqnrEEISt5oInxJ9lqadwqoDBC0iX3wZ2X1J
         ob3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UfZh+k1iAdsLIsImkWxhdGBlZUauAKUc9V8AaIWdDLA=;
        b=ZjTsEK4VcMFiXS+/3hpN/CxpTIUJu10TwlK6twsfXvkpWm9YEKUF0r1dY8a3TAG/qH
         5wQLU3WXZ+iLlxm6hwf0LC5rAv3KfrobLcRX/ger+ssSttThANNWR0UxhT7NmoVeN1/1
         PFP4jTI5uJZInA7Y66lI3M/o6PSc/gVxY+MiG4z/PaT4sOAzIKjZAzsppTHh+sOE6J2E
         /Hk3fxWMEeplvjtIH7kiquVXrlqjkl71U3X18SLuMl3Z/sELbEhew3REqo4zSSk8DmW2
         JyZgm5wzHSCxS6csFvGmG7Xumjwbh+8cq6J7SXpAkAM4nnFj5UR3sW7HWYu4rr7b/Mu3
         FTTw==
X-Gm-Message-State: AOAM530TTInIaxP5IpQOCpwD9Q66N/+klD8s7/N1WZQTAnpdlukY7CPd
        aQz+oUkGXtSa0JiIGO8B3xXobnWlazVb7g12mvw=
X-Google-Smtp-Source: ABdhPJy6v1oi26KbRlEl5TfTKWL5oHZpUSdR0vUs9uYXaket0TYLZL/E4Q4aSTLbQfOqX4FNCGzY3kmNCIv4sRqspAQ=
X-Received: by 2002:a05:6902:703:: with SMTP id k3mr3009285ybt.47.1628759184010;
 Thu, 12 Aug 2021 02:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210803175109.1729-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CACRpkdaMmGCwmA6j0CvJUX3S6cthoeqWRmY1RssSTmSKukwHkg@mail.gmail.com>
In-Reply-To: <CACRpkdaMmGCwmA6j0CvJUX3S6cthoeqWRmY1RssSTmSKukwHkg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 12 Aug 2021 10:05:57 +0100
Message-ID: <CA+V-a8u25EN3fuGG9CnYoSwt9nk-=DduUR9RAZwZWLr0=PW9BA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: interrupt-controller: Add Renesas
 RZ/G2L Interrupt Controller
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Thank you for the review.

On Wed, Aug 11, 2021 at 1:10 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Aug 3, 2021 at 7:51 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> > +description: |
> > +  The RZ/G2L Interrupt Controller is a front-end for the GIC found on Renesas RZ/G2L SoC's
> > +    - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts,
> > +    - GPIO pins used as external interrupt input pins, mapped to 32 GIC SPI interrupts,
> > +    - NMI edge select.
>
> Not that we don't have weird documentation but what on earth is an
> "NMI edge"???
>
On this SoC NMI is not treated as an NMI exception, the irqc has bits
to select the NMI interrupt (Rising/Falling-edge) detection.

> I know about rising and falling edges, and I know about non-maskable
> interrupts. But NMI edge? Maybe expand this to explain what it is?
>
sure will add more details on the above.

Cheers,
Prabhakar
