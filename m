Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2B6257B17
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 16:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgHaOKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 10:10:48 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:40331 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgHaOKr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 10:10:47 -0400
Received: by mail-oo1-f65.google.com with SMTP id r4so266055ooq.7;
        Mon, 31 Aug 2020 07:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mg2kWSET2DD7xUcBGIDLTHE0LxU2ZfxpS0GYdkqd7Ls=;
        b=hiqN3u+bvb6x61I2OP1eDqOf32V8Z7nZCqjLfrVztFDylDTvgGnMUN08ng00WfpvBQ
         axjEasi3SA6TTIyhgCArkXI2mVRqSxakF/2gsQ+KXvSXDZfn9p4ovlRY36EJtBLIIEVF
         Le2cOGcxcoa/ioZXOTN+7Ap+BVDKKSrKqJKvTE6v/ktVPMX9mhPp0H+ymQ4LJ1lShylr
         7SOy0lE1DAlLvEZ7AqAmHBv547ZnEZl1j2x0TphknvQqPFvzbuZRNWLLBAd0CTeV6xtN
         vNs5Z5Dfp6D5A2LRa/KuzMU9z912c7fWHxDp+CwFOYs43wPj2h3DyQOpyyWzWluuPfp7
         vdtg==
X-Gm-Message-State: AOAM531f62ppf0T0yh5mlY5R2ueRPn5qDry/3i984lCgHrJdqFDRl+mo
        1bblKdCKQ0KE8RE6V0m3z+IiXObi+oeKdx8UJeE=
X-Google-Smtp-Source: ABdhPJx1op7RpM2TgbcSfLK0lG7nhjYMw09NZP05H7xYmYzxkozfhjpjxIWZcuU/tePeA91T6RHcBhr9HAsgjx1fleU=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr918697ooa.11.1598883046251;
 Mon, 31 Aug 2020 07:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <87mu2ky4rz.wl-kuninori.morimoto.gx@renesas.com> <87k0xoy4r7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k0xoy4r7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 16:10:35 +0200
Message-ID: <CAMuHMdVpDJiBpzDjm2deS=GM4-it9sJVCnQYwt3ZfvwMHQ5MjA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: collect Renesas related CONFIGs
 in one place
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Mon, Aug 24, 2020 at 7:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas related pinctrl CONFIGs are located many places,
> and it is confusable.
> This patch collects these into same place,
> and group into "Renesas pinctrl drivers" menu.
> This patch also moves pinctrl-rz{a1,a2,n1}.c into sh-pfc folder.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank, will queue in sh-pfc-for-v5.10, with the following MAINTAINERS
update folded in:

-F:     drivers/pinctrl/pinctrl-rz*

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
