Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D290B417D37
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 23:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhIXVuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 17:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhIXVuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 17:50:11 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118ADC061571;
        Fri, 24 Sep 2021 14:48:38 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id m70so8741062ybm.5;
        Fri, 24 Sep 2021 14:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0zLyeg+HnNBHyfJ2Gaj3wqhdcjSDpgrhHMZdzYFdWo=;
        b=dREPaIGedrp9Bi9YwYuDZlKU0x0rlsrMnnAkEXsyxtC/KrOpA+KS/THhI5dAHo5fO5
         ZK1L3JBu2G/n6M+W6yOSttpEDQtBW3QpE/dMjxnlRfUKjhbfPpzJWY/9YpP9Z2rrIpce
         MFM7xzX5VlLyw74Zcx/2PYKt0Edu4GHsulSqrZGyMoAERUYeGcVSKbI+ZjEIdY0HlMMS
         ed768LJgxeiIFX3f7/eZT6z8e2l/Wvu9DCwupAGKURECFCpo5DdX7+d3LdpmHHAfgvJP
         xSLJGpvHRAn7zpNqM3E0Nz8VPcS4E5ww2u61tnvZ9nTeQBvmJ75LI6dFpNnFfEe3PLLO
         X5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0zLyeg+HnNBHyfJ2Gaj3wqhdcjSDpgrhHMZdzYFdWo=;
        b=2oPTTie0rFMMpq36YVOZ/YIcP4GtyR2dnDOcaxOQlmAXnokyfzfzV62nICtyreVD1E
         2yfrz47ia2VUP9t8DSTfPIuDXPyQ1B8yQuQme8BYl8pBxmxYg1v6QNdvUVL0QRApbNvn
         Qiupaf5fBTMxeWktkyH5Y8KAkR2TFEsOu6m9cT04QQuLNdZRI9TitCnAb3/ebmTe5RMI
         qQW9BJvPsN+T+wBFSq8Ah+1Yn9oRTsrcHZjCr5ABGr8CFYgfuNDdRdGBBYwVmeWo6wJl
         D998/asKV95ky6JAQd8H58GKdStyaLmyfKO0C+aBkgzlMEcaYYPgBDPehbBCNVdWneqm
         vTtg==
X-Gm-Message-State: AOAM531DdGztUAvp6KQI8UsvH4JxWbFnbU4aXkBz/hbR8oH5vxsNBy0J
        VG7Q0dA8DLjBbhVIUpuYFRuhWXolBf1AWYX24uU=
X-Google-Smtp-Source: ABdhPJym5K5Lberhm0ErZvNZ6SaJ/2TXK5RyQ6zIvMsi8uqby8nWjDIYoWpz7qZqidvQx/qEVYAEVDTdmVpv7h9vEYo=
X-Received: by 2002:a25:2492:: with SMTP id k140mr15464219ybk.254.1632520117288;
 Fri, 24 Sep 2021 14:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210921193028.13099-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CACRpkdaJk-G0YE63uvH9C=G3n7k2gZqf9QrwGfAZC2O4hhps=A@mail.gmail.com>
In-Reply-To: <CACRpkdaJk-G0YE63uvH9C=G3n7k2gZqf9QrwGfAZC2O4hhps=A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 24 Sep 2021 22:48:11 +0100
Message-ID: <CA+V-a8sBfFgnh1sL5ueLO0b+XeWqeiwg4ACv6yOz3JJ14pdzLg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] pinctrl: renesas: pinctrl-rzg2l: Add IRQ
 domain to handle GPIO interrupt
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Thank you for the review.

On Thu, Sep 23, 2021 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 21, 2021 at 9:30 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> > Add IRQ domian to RZ/G2L pinctrl driver to handle GPIO interrupt.
> >
> > GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
> > used as IRQ lines at given time. Selection of pins as IRQ lines
> > is handled by IA55 (which is the IRQC block) which sits in between the
> > GPIO and GIC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Why can't you just use the hierarchical IRQ domain handling inside
> gpiolib?
>
Will do that in the next version.

> See for example drivers/gpio/gpio-ixp4xx.c for an example of how this
> is used.
>
Thank you for the pointer.

Cheers,
Prabhakar
