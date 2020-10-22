Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF651295DEF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503516AbgJVMDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:03:09 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46097 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503515AbgJVMDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:03:09 -0400
Received: by mail-oi1-f195.google.com with SMTP id l4so1407195oii.13;
        Thu, 22 Oct 2020 05:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1CzUKOglZfsFOX6+OdmuYAX2K0useO0NqyZVDxL7if4=;
        b=Lvm08tkOqEKwet4O2drA4o9CoOa78oTwo2ujI9YGIt4qpa9i60rRzmhEU2J6vLqty5
         ObnqqGW/06ne5LS7OjLYRajpZwhI1HAvfyg5fQ30nLR4EXlTww0iyZA5TCrG2A8rp8VZ
         mlZLDsO+Dn9Rh8E+F+WIfA8nPJBJ3o4QBZXkW0LZuZ1vPXiYL4efY+R0DPNIagSRuEUK
         gJjCeDLEPpgaoQcUxyGEQzPM0jHXgBEVwq3dstYf4v7uCGw/tiqxmFiKeTj7iQp57eiW
         9mwOOl0x9bvvfAkan94M0oiYIGdqS3eTPCl9NFTsUvuPl9meTp1FcD+qgWn7iuCUAwhA
         ks9Q==
X-Gm-Message-State: AOAM531NRxqVnxa/DHpg3ln/+uxhstcVWD7zc8CgtHi1oYuvzaL5Czhy
        l7w0/vIKhr4Z0b6vCAfoDXMLWH5TzX18Q5NjOT4=
X-Google-Smtp-Source: ABdhPJz2tdEiSQzY0Tm8roOubmA2Lf8TzAKW25mSM2p2RaAZl2MO2PCxefDm3ZGlDNNk0ahA5bQLk3USXxT43rBLqDY=
X-Received: by 2002:aca:f203:: with SMTP id q3mr1202494oih.148.1603368188508;
 Thu, 22 Oct 2020 05:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201019132805.5996-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019132805.5996-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:02:56 +0200
Message-ID: <CAMuHMdUTKA+zwKfFxwNquZyhOMuwXsNeXigevukB0yjQYpMnOQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: r8a7796: Optimize pinctrl image size
 for R8A774A1
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 3:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports both RZ/G2M and R-Car M3-W/W+(R8A7796[0|1]) SoC's.
> Optimize pinctrl image size for RZ/G2M, when R-Car M3-W/W+(R8A7796[0|1])
> SoC's are disabled in the defconfig.

SoCs

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11, with comments added to
the #endifs where appropriate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
