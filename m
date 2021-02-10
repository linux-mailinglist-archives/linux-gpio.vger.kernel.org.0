Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298D631612B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 09:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhBJIgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 03:36:53 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:35745 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhBJIgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 03:36:11 -0500
Received: by mail-ot1-f50.google.com with SMTP id k10so1110160otl.2;
        Wed, 10 Feb 2021 00:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vqpklVwZsvlYgxzSjH8suIxDySU+Irpf/Vq8Oa4SfJg=;
        b=MNwQhqFlUBRL071X5MiE2aV3theSIEDgoBnXXttTn6SLGs4GYMIh7/6030qK16nKsl
         GCWA2KJM7CIJedCP98ZKUFEk5gRXxM2LnyvpUE3GgZByFbxk7lH7YIaI8+xa/icbxmOT
         dzkyQQIhNuiZdu6b9/rmMick3PS9Ge80VN51SJhUiKMfPi9HZK8PRal1nBQlRWBiZ3NR
         Ok3eD0jZznYHIUMLopP6C+QyJaZe/o7ZtATKQGOcG/Ukn0NzB65GKbBCymNcEUbnjugq
         Bt3CwiycrGdEM49+/8rG/4gUqTqkMSBKz1cK1UbFZoo9Zbt6MygdB0t8q51CHLIxWjUJ
         IqYg==
X-Gm-Message-State: AOAM532f9aXHIkd2HDzkMYt6y+z/EOSlasxHiWqfN1uu2LWOa3Dl/snx
        9rokwEj5HosJpadAx/XG7zMVTcEWhmrHLkjwsWQ=
X-Google-Smtp-Source: ABdhPJwTmD2qiGCoyFFCPHV2KgKBDaQ/CttPX7ZQFpl4FJNfT3Tt66Qjb9TDczYkUH8hpoM0Y7BDu9nb/h4tmhQ+M3g=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr1349139otl.145.1612946130704;
 Wed, 10 Feb 2021 00:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-1-drew@beagleboard.org> <20210210074946.155417-3-drew@beagleboard.org>
In-Reply-To: <20210210074946.155417-3-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 09:35:19 +0100
Message-ID: <CAMuHMdXVKtJi4qFj1ODUtc7qZVwfB-wNWrj_hyAwox=JMbAphg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Wed, Feb 10, 2021 at 8:50 AM Drew Fustini <drew@beagleboard.org> wrote:
> Add "pinmux-select" to debugfs which will activate a function and group
> when 2 integers "<function-selector> <group-selector>" are written to
> the file. The write operation pinmux_select() handles this by checking
> if fsel and gsel are valid selectors and then calling ops->set_mux().

Thanks for your patch!

> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
> function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
>
> To activate function pinmux-i2c1 (fsel 4) and group pinmux-i2c1-pins
> (gsel 4):
>
> echo '4 4' > pinmux-select

I think you forgot to update the example.

I assume

    echo pinmux-i2c1 pinmux-i2c1-pins > mux-select

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
