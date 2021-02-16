Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F9431C77D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 09:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhBPInS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 03:43:18 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:44788 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhBPImA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2021 03:42:00 -0500
Received: by mail-oi1-f181.google.com with SMTP id r75so10426289oie.11;
        Tue, 16 Feb 2021 00:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ku8Xj83nLsMwP3pJntnRZwjc0a+L78DnpeGJC5WXyEc=;
        b=fdd4M9lIPY9RJ3vj3kRuFzJFLKmBLd5XPjBvXcOGiQqKVl7TqAibO83tQRbUJ3yXok
         T2jf4/LXtJA+0wY+meWSKuZSCo3PaUjgk+qOguxt3rrUAv/DRgMndVKWujd6GAfweIG0
         McaLjlESOJXrY9NlxMMUx/+/Bi3OgKDauLPliHSosUZ7Iz3dLW1uruh8i21nlMn/daf3
         4XrsVvyE607xdSpYx4SGIvUWlCr2o4CxWfsU11rZVthQGUq+hiTOLX2SGNnpSjFFkIyO
         ZbbqPA7ixWzH4arcgbX5THcBfFSsJCLNFz5wOMfG4ZmBFScDVGqAvmEXWYKaN9ez6HR1
         4Irg==
X-Gm-Message-State: AOAM5310ppoEdzBDL1+hbRkHlu9AU1VpXjfvyilZuLYkot++NIRdsDLL
        kdc18bRybspP0SrFgQUpPOX5zfO2YOHDiU5M+uM2zzp2
X-Google-Smtp-Source: ABdhPJzH59+9qfPThs4S+oDVC/b1lqufPtDmCTgP9OCeG611wdnMp8WbBZ27+38vYkskiEhsG65NlvAt7jH5m+gALyg=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr1927470oig.54.1613464878460;
 Tue, 16 Feb 2021 00:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20210212223015.727608-1-drew@beagleboard.org> <20210212223015.727608-2-drew@beagleboard.org>
In-Reply-To: <20210212223015.727608-2-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Feb 2021 09:41:07 +0100
Message-ID: <CAMuHMdULsKoPrYfPxF89-=bCVgzm5RNmOuPDnhxJg9B6j=qc6w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: use to octal permissions for debugfs files
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 11:30 PM Drew Fustini <drew@beagleboard.org> wrote:
> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").
>
> Note: S_IFREG flag is added to the mode by __debugfs_create_file()
> in fs/debugfs/inode.c
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
