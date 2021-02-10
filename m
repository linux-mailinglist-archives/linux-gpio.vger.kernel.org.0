Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAE231639A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhBJKVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhBJKTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:19:31 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39311C06174A;
        Wed, 10 Feb 2021 02:19:12 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id j12so944751pfj.12;
        Wed, 10 Feb 2021 02:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iof9qrGrOjDVGG80uBcZwlY5H3RKsoP1e9Sucn4XJt8=;
        b=ZQa/tDejNb6Jn/RSxfU7tZw7o9wXC0gg6XpETJcn2NqqcNGTJH2uuLVD9bCACWQsz8
         C5x7mIklmdk34LcM4UlCf6yxW+ARB/gTeFrxBbUXhrPjeVJQg0aN2RdI2imYsFb2cpMB
         taiQqsApfs4YNbilt+U6X9FASV09RWp3MOs68FuZrEpluOQg3OTND6j2r2LFe6XVl8f8
         dcUhhO9ikVA+eL5YuFu+oJVic6Kasyy5eXgl1834w9Usa9qQLaSIIFsPi/kGueZqg0f0
         /75/wTr7TlV7nrO9kmy8cG6DpbFQYM4vkKbU6VjPRIgMDyWbd7VxZLftsP85aWmB3Ma9
         tgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iof9qrGrOjDVGG80uBcZwlY5H3RKsoP1e9Sucn4XJt8=;
        b=olmQjXRHY41W/osASSo+/pvY0KsZ7eFzG0NJxrOxhqlpHy1As1a5Zdyr/IT2anOdza
         W+Hh75nDS8Ai8XzBEx1ygbYjW1A08Qkh8huE83hUitgkEB8nS1XYRxI5vQC9LsRoUj4c
         GT3ht5Fu0wReT5l37R5/lRljYZA4d3tq+Q0NA98QCcET3bQRj5eVlZQNSQuFQiIv4fDT
         RhvG7XJq6HjtqkO/NBZJCB+FjXsCAeF9HWhJ7fWBgJq2VmBw+aTNrvhn0GhaLBi/4b50
         rRPJ1LtBJZZXsGPRYbrt1FEnKdwCjvxQnSluP6m1oBSsx039mtXXDHpRyNel3WaB8EG4
         cPEg==
X-Gm-Message-State: AOAM531CF94kTAXZT4WJHzfN1I6JFJtiQtMOlXLgNo1g2ry8DFwY3b5t
        /nxqkmtOHs8PGFWBzA7fseZt5pyXFNODclRVyr8=
X-Google-Smtp-Source: ABdhPJzB5oLUOxgzFNlj2kibKSE8q3WM7ypIH4vHlsOSpcHDoh9KJZ3UAonA8W5JQWfiZ6tIGXuoQYiefaV7DnfYwro=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr2361426pfk.73.1612952351766; Wed, 10
 Feb 2021 02:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-1-drew@beagleboard.org> <20210210074946.155417-2-drew@beagleboard.org>
 <87437daafdd86fa5c765ff9b17b6c7b097f0c317.camel@perches.com>
In-Reply-To: <87437daafdd86fa5c765ff9b17b6c7b097f0c317.camel@perches.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:18:55 +0200
Message-ID: <CAHp75VeJT0dPATD-Ux+JCEYxNTigbOn_6D_F1VQkfL=vuiCBPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs files
To:     Joe Perches <joe@perches.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 10:30 AM Joe Perches <joe@perches.com> wrote:
> On Tue, 2021-02-09 at 23:49 -0800, Drew Fustini wrote:

> > -     debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> > +     debugfs_create_file("pinctrl-devices", 0400,
> >                           debugfs_root, NULL, &pinctrl_devices_fops);
>
> NAK.  You've changed the permission levels.

NAK is usually given when the whole idea is broken. Here is not the
case and you may have helped to amend the patch.

...

> And you have to keep the S_IFREG or'd along with the octal.

Perhaps time to read the code?
https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L387

...

> checkpatch does this conversion using this command line:
>
> $ ./scripts/checkpatch.pl -f --show-types --terse drivers/pinctrl/*.[ch] --types=SYMBOLIC_PERMS --fix-inplace

NAK! See above.

> -       debugfs_create_file("pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pins", S_IFREG | 0444,
>                             device_root, pctldev, &pinctrl_pins_fops);

-- 
With Best Regards,
Andy Shevchenko
