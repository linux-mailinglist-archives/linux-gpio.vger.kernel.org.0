Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A4743DBC3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 09:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhJ1HRs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 03:17:48 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:42634 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1HRr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 03:17:47 -0400
Received: by mail-ua1-f51.google.com with SMTP id v20so9716504uaj.9;
        Thu, 28 Oct 2021 00:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fd0A4kINjaHErhsbdwDU7+kl4csF742c8BAWf6V/9/M=;
        b=zn4MAvatZIJgATIOZsxhz+KCk3PeE7oX5rDFtQZ+o/aVMwvtivPHWMSADK7SFKpcCu
         QNVBkZBkGCi6jAEXG6qPHXubx9GCNnBQzu9lMoXIaSJ6fgEZELfrKSySoFGjWVECWZiw
         O00FHTKJlPp87QoE4qTuPi1iHxVS0gdpBWjV4pFPKyjnBYVQqK5EuZVVfBzcFKaO/3a5
         Ukx8AbVsWz211+q5EZz08ioDR/L2HZO/5Dj2WkJI6hUYIHQrtKXTMAIsLkz5mc2L5beU
         IEJJGwc+Y2VPi8zdaGYS0lKj9wI/pbcr3/MxFt47efATvmwzGNZrBBfjHimijXwN+Jvq
         8SDw==
X-Gm-Message-State: AOAM532AEvP8b/hy5/B7EHIQT+SRl3bvgCFlWk7K9ZWMRxkBxeiK4g5L
        +/A4F2Yoj5wX11KIYgtT2pRC29drsvnWPw==
X-Google-Smtp-Source: ABdhPJy8dZCWOfhkYDDqQpPeSH5uH5K+Qmq2109l/I2uWO50g9jefhCklXCBJDcz4dvQdB0nLLl5ww==
X-Received: by 2002:a05:6102:e13:: with SMTP id o19mr2301478vst.54.1635405320403;
        Thu, 28 Oct 2021 00:15:20 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id p195sm332148vkp.50.2021.10.28.00.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 00:15:20 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id o26so9747875uab.5;
        Thu, 28 Oct 2021 00:15:19 -0700 (PDT)
X-Received: by 2002:a67:3208:: with SMTP id y8mr2615189vsy.37.1635405319660;
 Thu, 28 Oct 2021 00:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211027134509.5036-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211027134509.5036-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Oct 2021 09:15:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0iZTJCa0RGOKk5Ug8_tid-Zx514XCW2Ob1QM7Weu6ew@mail.gmail.com>
Message-ID: <CAMuHMdX0iZTJCa0RGOKk5Ug8_tid-Zx514XCW2Ob1QM7Weu6ew@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance-ohms" property
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> On RZ/G2L SoC for Group-B pins, output impedance can be configured. This
> patch documents "output-impedance-ohms" property in pincfg-node.yaml so
> that other platforms requiring such feature can make use of this property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
