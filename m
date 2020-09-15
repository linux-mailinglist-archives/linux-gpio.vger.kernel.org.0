Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1736F26A05C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 10:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIOIEU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 04:04:20 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36944 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgIOIEJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 04:04:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id o8so2411176otl.4;
        Tue, 15 Sep 2020 01:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Xp1L0SFcEIIAt9V0AQtwR6FE6wWS8lQCf9JPr31tGg=;
        b=hp4e7ivQsWTTrGkvUSLOl00UjJEAA6LaNqCVIiYtuoF8MhNkdmMFr7HnFwQgqdP/BR
         QcMo7O4l7XU+XIRDDB3VdehTJ8edBIQ6LJIoYZG7AzwdJ4ydK8IgNlWL9A46T+67XPFW
         HGflv/NHRaS2aWqyqgWyL1x0vQJKYWaYUsuR6DW+wkQyyx9nrfuEVhBLsrbkzUigYsOI
         xWidNDPjL7riMmTdpHjkXH7OAzLvWrlalKWsqupOQQESerY5aDNQl9XmLOnBczveuQbj
         Jyt8b3UrzrGHb79XuKfEZ1q6iNDnAi7P65PAYLkahxlGljfwj/8hbMhsB7PrPQURC1dr
         CENQ==
X-Gm-Message-State: AOAM5309PBH3XRCUd8ypwYqwF3MF7c/ZSPq8QTmBzD4LkupCscwWxqhm
        u3/2IafHscx5QZwQfNA/LAiM71YXE7bSco/YKXTbatHcEIU=
X-Google-Smtp-Source: ABdhPJzZUD+IQtfhUdn/7HGR5HG0yD995AlvDX5V0bhWwcklTAD0MC/uLcr+2e9wL4OehJ1zi4mitIh4Jyc70cxgDdo=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr12324636otb.250.1600157047713;
 Tue, 15 Sep 2020 01:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200909131534.12897-1-geert+renesas@glider.be> <20200909131534.12897-3-geert+renesas@glider.be>
In-Reply-To: <20200909131534.12897-3-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Sep 2020 10:03:56 +0200
Message-ID: <CAMuHMdV1EUuc=bE3bJaXXqNOq-YBmAVKGTuqxKP5gQYav9NaeQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: Rename sh-pfc to renesas
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 6:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The drivers/pinctrl/sh-pfc subdirectory was originally created to group
> pin control drivers for various Renesas SuperH and SH-Mobile platforms.
> However, the name "sh-pfc" no longer reflects its contents, as the
> directory now contains pin control drivers for Renesas SuperH, ARM32,
> and ARM64 SoCs.
>
> Hence rename the subdirectory from drivers/pinctrl/sh-pfc to
> drivers/pinctrl/renesas, and the related Kconfig symbol from
> PINCTRL_SH_PFC to PINCTRL_RENESAS.
>
> Rename the git branch in MAINTAINERS, too, for consistency.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13688,9 +13688,10 @@ PIN CONTROLLER - RENESAS
>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
> -T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
> +T:     git

Obviously this line must not be split here.

> +git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git pinctrl-renesas

While applying, I'm renaming this to "renesas-pinctrl", for consistency
with my branches for arm-soc, and with what other people are doing.

>  F:     Documentation/devicetree/bindings/pinctrl/renesas,*
> -F:     drivers/pinctrl/sh-pfc/
> +F:     drivers/pinctrl/renesas/
>
>  PIN CONTROLLER - SAMSUNG
>  M:     Tomasz Figa <tomasz.figa@gmail.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
