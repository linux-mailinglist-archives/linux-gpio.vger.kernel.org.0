Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5084258C0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 19:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242964AbhJGREI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 13:04:08 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:35706 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242929AbhJGREI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 13:04:08 -0400
Received: by mail-vs1-f53.google.com with SMTP id w13so7545845vsa.2;
        Thu, 07 Oct 2021 10:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Net6A8uPndAbUJ/QYF9dWGXevGNTqsRWAodqdtCMsEE=;
        b=a3AH8lJ25c2IqDesnUpgKMiv4JLi4VTKuA6iZnJT7u9QmmFoIVZonTOimgx8Cmo5BA
         OwQLqP9p3kgdXd46hYX8clAyPMNMYcszKnPOrYrKlP1LanjUdQfVhP4W1nlDTylqkm61
         ouS5oD0naWRMghQeGL+RR4fTBYFnShsMiKrMdS1UV+5m6ymQTG+7/VqibVMXBkvWd6p+
         97+qwpZfMJBusBYCtkONl9Lk9lrFqg5XZzcJT5fe1SN8BlcxwoYsn2hvJMn2STicKLPA
         8P5BPFtzLBYghvIiAPprAgj8naSK5B+Rw4CusGEDE+JOVjKy+T2SwJM221P2Alq9xat3
         rp6A==
X-Gm-Message-State: AOAM532sd+ROhdggJyVf6L4py4HQSPoapEO31H6dWu6PsKbx6I9hackS
        9Kreddm9KEN57aRyFh7IdKRo9zKkxubNJympOwcqHso6qTo=
X-Google-Smtp-Source: ABdhPJzVmcl8PZkb76DK9qwOf9kWSU1i0RLwFeh1d7XJBpKhfCCDagP8eWWePrc2v0sVe7t2WFcWBkJeMX/uQi0Udfs=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr5480132vss.35.1633626133545;
 Thu, 07 Oct 2021 10:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210930121630.17449-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210930121630.17449-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 19:02:02 +0200
Message-ID: <CAMuHMdVd8nhWX9__bo9oxE44_+FNYs3RhxmJNbz-kKnRzKJZYA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] pinctrl: pinconf-generic: Add support for
 "output-impedance" to be extracted from DT files
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

Hi Prabhakar,

On Thu, Sep 30, 2021 at 2:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add "output-impedance" property to generic options used for DT parsing
> files. This enables drivers, which use generic pin configurations, to
> get the value passed to this property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -46,6 +46,7 @@ static const struct pin_config_item conf_items[] = {
>         PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
>         PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
>         PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
> +       PCONFDUMP(PIN_CONFIG_OUTPUT_IMPEDANCE, "output impedance", "ohm", true),
>         PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
>         PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
>         PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
> @@ -179,6 +180,7 @@ static const struct pinconf_generic_params dt_params[] = {
>         { "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
>         { "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
>         { "output-high", PIN_CONFIG_OUTPUT, 1, },
> +       { "output-impedance", PIN_CONFIG_OUTPUT_IMPEDANCE, 0 },

"output-impedance-ohms", as per DT standardized property units.

>         { "output-low", PIN_CONFIG_OUTPUT, 0, },
>         { "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
>         { "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
