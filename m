Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C01341C5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 10:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfFDI0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 04:26:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37537 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfFDI0U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 04:26:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id 131so6260714ljf.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 01:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBxdPv6zcE+kvCXwS3KPxMalBIePFd8zPEiYRiE/TMo=;
        b=YtlDMPVXce1KAHoSSrETvJ1UKbUlpG5mr9sYkAXF6yGy831CwL+geYTRylr99O73c7
         pRwowFZLO4RZlkawU3RyctueE3b7UArXN9opvPxJj5r85xfj+KuXIfJSo/l7AEl1UBXS
         SgU2Ph7sYjJbPjCCmlBERrDBYpRkEJAENzHydKErTSE8zXCxqE8arnkL9owG9P+sdm/w
         wtQWWjEJDjOFNvF+/EvqcsoBCzMwRuTASNHiFtoR2p6+QOoVAcyOda1D5+k3XJyxeirK
         K7gllaQgJp7aj+5NYhh0hQealECI8B0sK73U/OzSA2YeKM5jN/VWW1MEI2MgyK0NK5V2
         vh0g==
X-Gm-Message-State: APjAAAXdMBk1iWWkJk5L35ozj8gOL4K7kpW8naoxc92v/2cDmxqoMARz
        +VSu0D08QqXnBm7MCdAunJKA61gPcI0NlpMcKi1RT22RQlE=
X-Google-Smtp-Source: APXvYqzk579P0riSKTlDUci/Xwu91LEc1tQ9yLdMx/OhPunWbQv6sJgiHRIBwcNHaxL80SFJIkONTSyQDHCSZqF2g8A=
X-Received: by 2002:a2e:9255:: with SMTP id v21mr9243588ljg.178.1559636778419;
 Tue, 04 Jun 2019 01:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190602210918.32741-1-linus.walleij@linaro.org>
In-Reply-To: <20190602210918.32741-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 10:26:06 +0200
Message-ID: <CAMuHMdX8idAx9QnOMYyS0htYFw66Zs08pbGb7OEf5ED7Egv9rg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Fix SPDX tags
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Sun, Jun 2, 2019 at 11:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> Some files were missing the appropriate SPDX tags so
> fixed it up.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/nomadik/Kconfig           | 2 ++
>  drivers/pinctrl/nomadik/pinctrl-ab8500.c  | 5 +----
>  drivers/pinctrl/nomadik/pinctrl-ab8505.c  | 5 +----
>  drivers/pinctrl/nomadik/pinctrl-abx500.c  | 6 +-----
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +----
>  5 files changed, 6 insertions(+), 17 deletions(-)

Please note this conflicts with commit ec8f24b7faaf3d47 ("treewide: Add
SPDX license identifier - Makefile/Kconfig") upstream, which added
(different) tags.

> diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
> index c3efe7d7e91f..749466fa8f97 100644
> --- a/drivers/pinctrl/nomadik/Kconfig
> +++ b/drivers/pinctrl/nomadik/Kconfig
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  if ARCH_U8500

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
