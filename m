Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506EB308AB8
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jan 2021 17:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhA2Q4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jan 2021 11:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbhA2Qz5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jan 2021 11:55:57 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12E5C061574
        for <linux-gpio@vger.kernel.org>; Fri, 29 Jan 2021 08:55:17 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id p15so6101659pjv.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Jan 2021 08:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TM/BzIeHirJmS5he9kuJW9i0G9cf1XcndnlUdoGF2cM=;
        b=GB8pztSjy2XUCA3U/Zv09U1JinlpHCAsiFkcWcz5CXN9WIrgZMjzvOLzEk8LK8P/nc
         4RHcM89ifuSh/nRMwa0gy5+rYmeiGG1mOrFiXrampFLUslL3a3Zplwy1NfHFQnInsGwY
         RTslqrzlim2DJszWe7CKuYeMftrtVc6zLfPljpkFleMPXByPVTLynz0MAWcdUlnrdthO
         MXEVFCn6J2xYadidcOwlKIajhwuSNlJxXGeLPTYHlNdTlUKsebl+IoMG0G3Od4PX5hq7
         Cko/u67ppMfhZNk//eu6J7TtiKqcLk7TF+VyR5huMMnngzjmBLT0x/XPGKQBai/Bp6HD
         84FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TM/BzIeHirJmS5he9kuJW9i0G9cf1XcndnlUdoGF2cM=;
        b=f+tTbKVjJzoPovMW2eUlDeT6hrB9Bz76x7ZKWKqoPkpo+gLF8JnD5+1R5vhbacwV1z
         0QFcpJ2QswYyax5fL0CaaB+WUYGKMmF86DIjfz5c77jLqZjO2BWoc6+dByVui1FBm4uo
         0e3/0StpAzmFaM9kNqq8lssGWsk/cY9fHqyxYTL00Gs3o2NcD/ZZTuIm/mYXpd5xY8af
         B0nNbwbJDGbrhUXfwweut/Ye/CmBs8UKm8zT0I3+AWohZdEBiYi0rVkoDHwYyOYCxvqa
         kYSQB702JrYhrkbcJpqBrPZcyEtyLZoRkqdRcwGO7VeHFRxhYoFd7dUFrkXKrLsCs+Ax
         MWUg==
X-Gm-Message-State: AOAM531HHLxxZU7uWP4b/nsnohtAVGoEqojzvniu1GSv23YXX7D0eVVx
        hNVcd3/+ULpjLrUnNGUk1eV84qBGo7pmYw==
X-Google-Smtp-Source: ABdhPJzSflS+uw1BKUlRvvG+LpwVBhKeNndJdMu6KlY+z3AKLjNJ+GoakR6hc6Qq3VjD8Bnb5sZkGQ==
X-Received: by 2002:a17:90a:d50c:: with SMTP id t12mr5240924pju.150.1611939317369;
        Fri, 29 Jan 2021 08:55:17 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:888f:e88:f361:5802])
        by smtp.gmail.com with ESMTPSA id fu17sm7993055pjb.37.2021.01.29.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 08:55:15 -0800 (PST)
Date:   Fri, 29 Jan 2021 08:55:13 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210129165513.GA384703@x1>
References: <20210129084759.372658-1-drew@beagleboard.org>
 <CAHp75VcpqbFjHX9PtC=EWafacrWMP=c0KXyDDdJJRjAuh7Xcsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcpqbFjHX9PtC=EWafacrWMP=c0KXyDDdJJRjAuh7Xcsg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 29, 2021 at 12:15:34PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 29, 2021 at 10:49 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > Add "pinmux-select" to debugfs which will activate a function and group
> > when 2 integers "<function-selector> <group-selector>" are written to
> > the file. The write operation pinmux_select() handles this by checking
> > if fsel and gsel are valid selectors and then calling ops->set_mux().
> >
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> >
> > function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> > function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> > function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> > function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> > function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> > function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
> >
> > To activate function pinmux-i2c1 (fsel 4) and group pinmux-i2c1-pins
> > (gsel 4):
> >
> > echo '4 4' > pinmux-select
> 
> Hmm... Where is the documentation? Where is the changelog? What is the
> version of this patch? What happened to my suggestion to have another
> (preparatory) patch to move to octal permissions? I'm completely
> confused.
> 
> Please, resend according to the rules.

Sorry for causing the confusion. I dropped the change long when moving
from RFC v2 to this PATCH.  But I can see how it is better to keep so
that people just looking at this for the first time have better context
for what happened in the RFC discussion.

I did post a patch this past Monday so switch all the debugfs files in
pinctrl subsystem over to octal permission [1]. But now I think that
this should have been series with this patch. Linus has not applied it
yet so I'll make a series when I send v2 of this patch.

Regarding the documentation, there is no existing documentation for any
of the debugfs enteries for pinctrl, so it seemed to have a bigger scope
than just this patch. I also noticed that rst documentation is
confusingly named "pinctl" (no 'r') and started a thread about that [2].
Linus suggested chaning that to 'pin-control'. Thus I am thinking about
a documentation patch series where the file is renamed, references
changed and a section on the debugfs files is added. Do that sound like
a reasonable approach?

Thank you,
Drew

[1] https://lore.kernel.org/linux-gpio/20210126044742.87602-1-drew@beagleboard.org/
[2] https://lore.kernel.org/linux-gpio/20210126050817.GA187797@x1/
