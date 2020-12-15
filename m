Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7282DB0F5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 17:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgLOQJP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 11:09:15 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33032 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbgLOQJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 11:09:10 -0500
Received: by mail-ot1-f65.google.com with SMTP id b24so2359277otj.0;
        Tue, 15 Dec 2020 08:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bIGwa8qIdG11yi4lkC6PUFj7lWs1ZZRJPr8AkJQsF0=;
        b=c64mU1SNh7Gip3oqLJ/0e3be9knq5qpOtk1hfmMByWFocgmR0ws20zumPkW5xr9HA+
         jONtxfmD/s5KnB3Cprhtc1tPTjO4vbVMHv0wKayjVU9MnxG/7vOZ79VE1y0B0xKHk0tE
         bJ5nP4eVHVJVr8KpEXHShyWd0CLM8258tIrp0zz2fEvl13uubH2KHdZS3HR0DReu38fT
         nn8moUm3VEM4maRND0D3fR7r0+Hyu9O36Qd0tvryBL3x9xQCAhLXkQvdB09GO0v+XMuC
         w++AJM4grM1DLhm6Zvjw108IoZ7SxxVYZcBJ3eZOgbpdlb1utc/J3iIs8EA1bl2RMsD8
         rD+w==
X-Gm-Message-State: AOAM530uS1BUtKPOz/gyzsCQdU96KIRl8Z9JjEUO+zmw1UwrknICGiqc
        ICV7+4Z16T7OkdkabAbnuYCimgkZExYDUWGDqk8=
X-Google-Smtp-Source: ABdhPJxuMxvjFoL22r/bQ0iRWcPfiqor04Cbpcnmb44WPWu2t5yvUOoEfePVpPPocYav/JfrThx/muHKsg8dhZnHwjM=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr23700116oth.250.1608048509343;
 Tue, 15 Dec 2020 08:08:29 -0800 (PST)
MIME-Version: 1.0
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607686060-17448-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 17:08:18 +0100
Message-ID: <CAMuHMdUPAih4ymcYisFeQYVBz+L2WRAbt_hnYnw3rH0Pnkkh-Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpio: bd9571mwv: Use the SPDX license identifier
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 2:47 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Use the SPDX license identifier instead of a local description.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
