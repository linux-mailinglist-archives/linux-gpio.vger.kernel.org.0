Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BAA426B20
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 14:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhJHMuW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 08:50:22 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:33391 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhJHMuS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 08:50:18 -0400
Received: by mail-vk1-f179.google.com with SMTP id t200so4177257vkt.0;
        Fri, 08 Oct 2021 05:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2CZA5owzP75Fk3OUthJZqkUZwf9bToqDOhS3PDP9ylg=;
        b=0xiwhAHaIYXS6I4PlmgO0CR3a2nNgtpZwOrMdtqjf0sZG9eTCxFqE3zdFBNmLrFxGu
         +4GPGtR73+W31UAmqS+a7DqiYU1uMbcSRVpqFasXse6ethYaPQYoZrYE2EfpM7Fh17CB
         Wm+OG2ENJvX7hCiqlcaQXO1MhakXdLLTWwNqTonbjJMKyZ7/du3wrjyVQ5nPMPPMgJg7
         L5t3JcGdvbI301W5/ZgumlgTyYzaw1ewm2C+Xd6NkmnRAeFpYfxY1DncQpI0M9co6PQ9
         3LvRulKVS5JOBzS58qfVhMNfxfxzcNx09XklkQFEOUZX7M/YWeg4CtEoIlvvF1IXcAFb
         8Hgw==
X-Gm-Message-State: AOAM531mFOV3pNaJTs4LadrO+vRtBsvX0sarDTtlZswYZhOlBW/hZXYe
        FW1j6VGijRDVxrH1+LsLAsm7N9767mRQcWrKbkE=
X-Google-Smtp-Source: ABdhPJzhaludNGFd2M+jSs3csgSWFGRxQKaQ5CFdeS+FIxZB4w/RVLybb15Btky/2gRCvdqiCLIczqmpmRi0rz61IR4=
X-Received: by 2002:a1f:5e84:: with SMTP id s126mr9100625vkb.7.1633697303106;
 Fri, 08 Oct 2021 05:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
 <20211007200250.20661-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20211007200250.20661-1-nikita.yoush@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 14:48:11 +0200
Message-ID: <CAMuHMdU2Nr1V035Ntz-XNrc10t7femUFt_WV+Q3EHiWZD5HmkQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: r8a779[56]x: add MediaLB pins
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nikita,

On Thu, Oct 7, 2021 at 10:03 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
>
> This adds pins, groups, and functions for MediaLB device on Renesas
> H3 and M3.
>
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
> Changes from v1:
> - move mlb_3pin from common[] to automotive[] arrays
> - fix missed array size update in pfc-r8a7796.c

Thanks for the update!

Obviously not only the mlb_3pin groups, but also the functions have to
be moved to the automotive[] arrays ;-)

I'll fix these up while applying, so no need to resend.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
