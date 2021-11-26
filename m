Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A7145E8DD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 08:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344139AbhKZHxZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 02:53:25 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:37589 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244165AbhKZHvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 02:51:20 -0500
Received: by mail-ua1-f41.google.com with SMTP id o1so16941605uap.4;
        Thu, 25 Nov 2021 23:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C+WB98uVMoTfL9kTGPdtgqlO5TacGgYCY8mjvq5BMMc=;
        b=6GW42FgWv/SRNrHIXez+fp7gdKRYwpxonAkRcyVhHMynMKQdy2afIa1n6vdxe+Nedp
         9sFjQZPTyfSHZ88mXrpB3UxvXAmOLGqMtcoYVWvZogSRjcecHOMevYyhXnTbUtsRitzu
         zwk47DqqS4eyF5myrMwTayeFE9Tcrlbf2xvT1IrMllnjA79TfJq2yXg5ydxG0bIGpD1j
         6sHmNcc0+wD/sB5iYdvTUpgRruviRbYVTFOyUccYMx/JAFxuQ1TBDfUI/4Tqb6hed+fH
         CO9WJTz5Mwxe12WBaTSRF8Ddw1IRkeAwOKH7L+12MQa+Gjv4JdIMZrJeUyfRquXOSkwT
         3iJQ==
X-Gm-Message-State: AOAM53353rAd4pzS9O2AeXjSp1Mc+dyrsDZPquSe4arykJm2/AaocHq+
        Cg3d/yJA80FxQYMmuCx82PDVJAAKuMjq0A==
X-Google-Smtp-Source: ABdhPJw79oK6QjZMavEgkcUbGU1uolbLyl7qbjakwUYOAnHHFcRNjPLNYuwiswZxowTCzNEnMtwkww==
X-Received: by 2002:a67:63c4:: with SMTP id x187mr14052939vsb.69.1637912887080;
        Thu, 25 Nov 2021 23:48:07 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a128sm3139529vki.11.2021.11.25.23.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 23:48:06 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id o1so16941517uap.4;
        Thu, 25 Nov 2021 23:48:06 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr32201048uar.14.1637912886319;
 Thu, 25 Nov 2021 23:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20211125152043.162655-1-geert@linux-m68k.org> <CACRpkdaFBOq4-Pok3au+Q8uAXe5QscO81JYAhXwMS9B2FjuUiw@mail.gmail.com>
In-Reply-To: <CACRpkdaFBOq4-Pok3au+Q8uAXe5QscO81JYAhXwMS9B2FjuUiw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Nov 2021 08:47:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0awdFCB+vWyy5TZMUeKoii8_Y8NaZO77sMaOniaOy1g@mail.gmail.com>
Message-ID: <CAMuHMdX0awdFCB+vWyy5TZMUeKoii8_Y8NaZO77sMaOniaOy1g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Nov 26, 2021 at 2:22 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 25, 2021 at 4:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > To improve human readability and enable automatic validation, the tuples
> > in "interrupts" properties should be grouped using angle brackets.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> (...)
> > -        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> > +        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> > +                     <17>, <18>, <19>, <20>, <21>, <22>;
>
> Tuples? Hm they look single. Like singletons?

Yeah, plic has #interrupt-cells = <1>.

> Anyway:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
