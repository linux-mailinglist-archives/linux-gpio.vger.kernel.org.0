Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B991316117
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 09:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhBJIch (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 03:32:37 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:46922 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhBJIcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 03:32:05 -0500
Received: by mail-ot1-f44.google.com with SMTP id r21so1049281otk.13;
        Wed, 10 Feb 2021 00:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pTnNkDOH+vsAeWCJNUly+UprZNK7/32eov2aiAjk2U=;
        b=owHif0uiINVDKIU8mxFRSZSFr/nYaZKmmtXZNYtq0XhP/ukTgm97D4bkjV7O50m5Ro
         cn3xJyL27AXIrXUmqk6EOu4zAWkfDGG4h10XJAj6C0huozvvb+KujK1k84X5P8zXFubT
         dEqFlSKKbnVqcZU22VmfNYVGnhq0PRrHHDPXKGOXVfaC/OvLs1aRW+EQRLhzP9hTB66d
         2rPSs/Vac0byNkruFUh5EoV4tzjE4ymsGCemQHItLm+c/UEnRuTjZdxpbdnPczmBB4WS
         5avBkse1ywz1AakJNuWu4ht9LwwUfNiuoeW6hv0ilOa92PpWhw37j5Nz6hRXa4y441TH
         LSiw==
X-Gm-Message-State: AOAM530e03rCbacdDm2FltSiUMcMVFhsIlxHPi3EGzMoxanNXxnLzbr4
        ymY+Ew4tZZ2QtFYYrWcznMDdikFF8WT5HzzBF0A=
X-Google-Smtp-Source: ABdhPJyC4bb9e4qZMupKe9qdU9CYV3h4XZxZ0lO+yaUwQn+hll0drWEJ5bGfwX4JnIUjIYBRE1xQG+nKX5SGL6Fyst8=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr1331380otq.250.1612945880953;
 Wed, 10 Feb 2021 00:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-1-drew@beagleboard.org> <20210210074946.155417-2-drew@beagleboard.org>
In-Reply-To: <20210210074946.155417-2-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 09:31:10 +0100
Message-ID: <CAMuHMdVdHb4LGpZY0T1OKEhAx0iqviqS587Fwm56UBv3-=1kTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs files
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
> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Thanks for your patch!

> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
>                 return;
>         }
>
> -       debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-devices", 0400,

What about the loss of S_IFREG?
S_IRUGO = 0444, not 0400.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
