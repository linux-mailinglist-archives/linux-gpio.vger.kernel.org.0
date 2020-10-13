Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D2C28CF39
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 15:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbgJMNgn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 09:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgJMNgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 09:36:43 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAE6C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 06:36:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id d24so17491466ljg.10
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b/c3jOqm5GCWbl7ngdOAvWeLYoFEl8oppVa37BrtTx0=;
        b=tJis7yuaN1JSHsLBZLaRMxnuI3b1R3TPtaiy5wihu/GdcUvEXrgzbpveMQDkzE5tlj
         cbUwn/PXVvgt46YQEHILU5xNbbAhvatw8Ffn0m317aofqzuylkUQ0MlQ1hYQ1ennXije
         U9YeIYcSUcjRbpr0clUWhuA/RGEXkWwvBWaCZxXx/ZpKv4MKx4CWJo8Y0Qialmv9jI2i
         6og/C+zO9w74Fi9vW0fgzzzf8y1XrkR8U3kVMisYcUo4S19yJmlzBps7EykhqsY2u8SQ
         XZDko51TwNb8aVNexQeiHg1qyJjlu8r0hsXvbyb7K+ywzcuMjaEa0yh5+bzQK4yIwf3C
         Rvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/c3jOqm5GCWbl7ngdOAvWeLYoFEl8oppVa37BrtTx0=;
        b=VaAe414ftambkur2//dSvGLof17SCFeQdrAwMSnP1R/OTYvW/ejc5Xs5OdEPSKf+re
         dhbjoMYpkXNKpIjiWr/0ZoOqOmnByKnBC3WQ2UAF+Np00tO/pjGu1rkF6FZCeU5yxJZJ
         KMHIyOYvXAFGR3YJ0RhHJcxglhaPJblyUOFbXF6DOHU9twYJ0F6TFLkaTZWlGsh42VS2
         z07IIzw0hWa0EmW28iSC97tiuTWwRWlSFuFvTNuOj3Fsy48b+3H5r67rChm4XVIAx3+7
         YKGQwtUsDmh1MC4F5FG6mEpo93BhNlOWntK9Gbvar06HNHU8kbMpzKuTb+tGMYX9optS
         fCNg==
X-Gm-Message-State: AOAM533EtLen5Ah1WNgVRnBPXfpX3UudZkWuUevWL0d2LP69IG99Az1v
        EhnDf62DjgcgkJE7araL/Ssvp2RCmsKJZQz2+VNJEw==
X-Google-Smtp-Source: ABdhPJzzi7AZkl/99MrQJTTOaF4YrzzcdjBPIcLPj5P9/5/vIF1r09/4ln6Ey+By3eLCbHq+rqCmQeho4Uw/iJ4MT8o=
X-Received: by 2002:a2e:86d4:: with SMTP id n20mr1183020ljj.293.1602596201115;
 Tue, 13 Oct 2020 06:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201008130515.2385825-1-lars.povlsen@microchip.com>
 <20201008130515.2385825-2-lars.povlsen@microchip.com> <CACRpkdaFYoXFUuWow5s9TitrRDhMW=wiaxgfMcY6sQkYYgC-Lw@mail.gmail.com>
 <87d01ryb04.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87d01ryb04.fsf@soft-dev15.microsemi.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Oct 2020 15:36:30 +0200
Message-ID: <CACRpkdZbxohoxg3bN-XpLXwBUgTDByoP9sNEocUt10R6t9FgXQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-microchip-sgpio driver
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 9, 2020 at 12:00 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> > So here reg = 0 and the out port has reg 1. Isn't that what you also put
> > in the second cell of the GPIO phandle? Then why? The driver
> > can very well just parse its own reg property and fill that in.
>
> NO! The second cell is the second dimension - NOT the direction. As I
> wrote previously, the direction is now inherent from the handle, ie. the
> "reg" value of the handle.

OK I get it ... I think :)

> The hardware describe a "port" and a "bit index" addressing, where the
> second cell in
>
>   gpios = <&sgpio_in2 11 0 GPIO_OUT_LOW>;
>
> is the "bit index" - not the "reg" from the phandle.

As long as the bindings specify exactly what is meant by bit index
and the tupe (port, bit_index) is what uniquely addresses a certain
GPIO line then it is fine I suppose.

> In the example above, note
>
>   ngpios = <96>;
>
> As the "port" is [0; 31], this defines "bit index" to be [0; 2], so the
> (input) GPIO cells will be:
>
> p0b0, p0b1, p0b2
> ...
> p31b0, p31b1, p31b2
>
> being identical to
>
> <&sgpio_inX 0 0 GPIO_OUT_LOW>
> <&sgpio_inX 0 1 GPIO_OUT_LOW>
> <&sgpio_inX 0 2 GPIO_OUT_LOW>
> ...
> <&sgpio_inX 31 0 GPIO_OUT_LOW>
> <&sgpio_inX 31 1 GPIO_OUT_LOW>
> <&sgpio_inX 31 2 GPIO_OUT_LOW>
>
> ('X' being the SGPIO controller instance).

So 32 possible ports with 3 possible bit indexes on each?
This constraint should go into the bindings as well so it becomes
impossible to put in illegal port numbers or bit indices.

(Use the YAML min/max constraints, I suppose?)

> So no, there *really* is a need for a 3-cell GPIO specifier (or whatever
> its called).

If that is the natural way to address the hardware lines
and what is used in the documentation then it's fine, it's just so
unorthodox that I have to push back on it a bit you know.

Yours,
Linus Walleij
