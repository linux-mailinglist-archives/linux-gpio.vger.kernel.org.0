Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB51B1B6FDB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 10:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgDXIg1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 24 Apr 2020 04:36:27 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:43261 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgDXIg1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 04:36:27 -0400
Received: by mail-oo1-f66.google.com with SMTP id d21so1937057ook.10;
        Fri, 24 Apr 2020 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XKUviGQehYQsdPKsJqlt0d2ewH3Dpwogjgl85Dr+3Rw=;
        b=XY5fHa7oE/1dGjuGiinKTT0AdqNxEX1tt8Zkkd0M68pryp5dJicpudxWnVUO0ydrxQ
         lCCZCrLKyN3U0A0kH3rkv5IU/bWGe4QoHG97RPHbtBxRnLBtiOlQJyJz/I/gJscqBvFk
         81EOMxcclPJdmqetgdy/ws+o/BBKAQoDEMei198qzWAiitvbKZXi1KLYhn9m7YCgEDkR
         Pl9LqsUR1lMvQeowurAARU4OVzI/QnFw8M5KeSEUhlg4g6+6rx3kbxsM9lBR/mc5bA+k
         EGQ79x+u7s5qs9cVWK1vzVH5Ju5HuL+rpubHBIBDtcEpNUO2LhA0Fn7Uw9UfgHtmh/wN
         8j6g==
X-Gm-Message-State: AGi0PubwIcPkRZVqAv9D8XN2OPuVXm3u+s2NRPKcMRAk5Q7WWAeX+81e
        kdVC2rkGdver4TNGwbiYgGY8Lpn9F+fLoqXsARo=
X-Google-Smtp-Source: APiQypIVddFc2avRWYGOIH6oeKGojSMgUbJRYGpyiRb64rLZ7Aov6VHeA2Aewh2TWUmXLDJs8MbOEd1c/ZrcZ7neZb4=
X-Received: by 2002:a4a:eb08:: with SMTP id f8mr6964772ooj.1.1587717385908;
 Fri, 24 Apr 2020 01:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200422101026.9220-1-erosca@de.adit-jv.com> <20200422101026.9220-3-erosca@de.adit-jv.com>
In-Reply-To: <20200422101026.9220-3-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Apr 2020 10:36:14 +0200
Message-ID: <CAMuHMdUV-179XEVF9UMdiB6p_2gQeWJKz+25qCfn+b_h8VSdcQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] gpio: rcar: Add support for GPIO alternative interrupt
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Yusuke Ashiduka <ashiduka@fujitsu.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

CC devicetree
CC Stefano

Thanks for forwarding this patch!

On Wed, Apr 22, 2020 at 12:11 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
>
> INTC-AP accepts both GPIO interrupt and GPIO alternative interrupt,
> but INTC-RT can only handle GPIO interrupt, as depicted in below excerpt
> from 'Figure 7.1 GPIO Block Configuration (1)' of
> 'R-Car3 HW User's Manual Rev.2.00, Jul 2019':
>
>   +------------------------------+
>   | Interrupt  display register  +----> GPIO.ch*  (to INTC-AP, INTC-RT)
>   |           (INTDTn)           +----> GPIO.ch*A (to INTC-AP)
>   +------------------------------+

Note that GPIO.ch[67]A seem to be available on INTC-RT, too. But for
the other channels, you're right in that the "A" variants are connected
to INTC-AP only.

> It seems to be also the case for earlier Renesas SoCs like RZ/G,
> as per 'Figure 6.1 GPIO Block Configuration' in
> 'RZ/G Series User’s Manual: Hardware Rev.1.00 Sep 2016' [1].

On R-Car Gen2, they're called "EXT_INT" resp. "EXT_ALT_INT" instead of
"GPIO.ch*" and "GPIO.ch*A".

> To reduce the interference between RT domain (CR7/SH) and the AP domain
> (Cortex A5x) and to independently control GPIO interrupts in these two
> domains, add support for processing GPIO alternative interrupts in AP.
>
> This allows handling normal GPIO interrupts exclusively by INTC-RT.
> The change is DT-driven and depends on the enablement of the
> 'use-alternative-interrupt' DTS property.
>
> One caveat is that the 'interrupts' property update must go hand in hand
> with the newly added 'use-alternative-interrupt' property.

As I replied to the DT bindings patch, I think the "interrupts" property
should contain both, so "use-alternative-interrupt" can pick the one it
needs.

> Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> [erosca: enrich commit description]
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

[actual patch[1] deleted, as it doesn't really matter for the discussion].

You may want to look at "LTD20-205 System Device Tree Project"[2],
where Stefano talks about using DT to describe the full system
(I've read the slides, but haven't watched the video yet).

Your patch shows that the assumption "All devices have interrupts routed
to both interrupt controllers" isn't always true.

[1] https://lore.kernel.org/linux-gpio/20200422101026.9220-3-erosca@de.adit-jv.com/
[2] https://connect.linaro.org/resources/ltd20/ltd20-205/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
