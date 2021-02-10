Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CE8316EF5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 19:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbhBJSmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 13:42:31 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37651 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbhBJSkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 13:40:08 -0500
Received: by mail-ot1-f41.google.com with SMTP id a5so1594303otq.4;
        Wed, 10 Feb 2021 10:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxTS3+SRxomQSyYLoa8qx229pO2BpD0/9oWyAxDCXio=;
        b=kJycTYV4yEB65lu8kPvpI27iZ7XYAp8ZPPEi7EZ2bis+9oycFh8V+SG82H20XLYiIg
         2vnUlPfsXVU5JM5rGAF44xnSUoOxUuvM2QPwMJ3ud7KbB0gp/cfor4EXEwcnj7r3TJPd
         Kq6wWeLhV67Trig5LAWlZFvYqAs3j0x22ijz+HXHuplaorn29fXnz1I2Lp93+oafItS8
         kzyTs5yCuotW3oTAWMjOcLLrytUO232dA6X9zIC5/jGnALqDKMnRtC9FlQmLXpLasGyl
         Nvst3WEBxOVv/O+7jwJrNo/MUt6gItSdnx8+oRQ1USyel4/3boOLKUg7w5puD6/1VzB6
         Ea9g==
X-Gm-Message-State: AOAM533o2tIpM4vV/8LG6Y8n727XEGBRkqGZfR88ZYoCZEMw1YU8MMmu
        0HiiDTjdpNDYH6sAjeVCtSCSf75VBO33MFjQXWcmDepk
X-Google-Smtp-Source: ABdhPJyi5OHQZIQ/9YUyRXrNDJ8824T22VJga//Kw2/ulHXP1POBeRucokiH+t4VPegwg63sSHLgU6NE+uieV5Aduk8=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr3142306otq.250.1612982367488;
 Wed, 10 Feb 2021 10:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-3-drew@beagleboard.org> <20210210182044.GY2696@kadam>
In-Reply-To: <20210210182044.GY2696@kadam>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 19:39:16 +0100
Message-ID: <CAMuHMdUTG-0PMsP--i4KE2RA_zOaQgpUDksvtU8dLPW9dSpoug@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dan,

On Wed, Feb 10, 2021 at 7:21 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  694    buf = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  695    if (!buf)
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  696            return -ENOMEM;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  697
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  698    fname = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME, GFP_KERNEL);
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  699    if (!fname) {
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  700            ret = -ENOMEM;
> 99b2f99aa41aa7 Drew Fustini  2021-02-09  701            goto free_buf;
>
> The gotos are out of order.  They should be in mirror/reverse order of
> the allocations:
>
> free_gmane:
>         devm_kfree(pctldev->dev, gname);
> free_fname:
>         devm_kfree(pctldev->dev, fname);
> free_buf:
>         devm_kfree(pctldev->dev, buf);
>
> But also why do we need to use devm_kfree() at all?  I thought the whole
> point of devm_ functions was that they are garbage collected
> automatically for you.  Can we not just delete all error handling and
> return -ENOMEM here?

No, because the lifetime of the objects allocated here does not match the
lifetime of dev.  If they're not freed here, they will only be freed when the
device is unbound.  As the user can access the sysfs files at will, he can
OOM the system.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
