Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61E642E217
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 21:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhJNTli (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 15:41:38 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:38443 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbhJNTli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 15:41:38 -0400
Received: by mail-ua1-f41.google.com with SMTP id h19so13541862uax.5;
        Thu, 14 Oct 2021 12:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKswVKHsYaVmj+miEFc+WAd+jtG8tqDfzq5v7oYhDog=;
        b=16PiWEFEbRFaVMrcDdPUz1zP4cjqKbgFLADx9g09QrXstQWEUtXKaHD7cmSAiMXqsr
         pNrbdytIiZsW8l+UPSIGrk0+dfI3+GOXOIJ0vtWciFuTMy8v5dQ1C3bH9VDFeGlix8SK
         d0AwiLZMX6+GIud//JZFohyaBUovnAfwzJHeytjT/FmAMevYBO0QXuLqDkYDVfSwWyUv
         meMrIGeMOwNPXLN3+jN5KKZQKV+rtIWV3RWAa7WFST1lIOVz4dGKunZB7EAKTk3gA3+M
         WppQ6EIfpNI8h0AsHAuQr+52M1wg1Dkgy9rYkDFFFQVXKT3FX+T6v9+rBI4Y2PS2IN/w
         dmAg==
X-Gm-Message-State: AOAM530f+KG+bhi2KElHwcHDZX4Ays2THfny7GzDirzya1ZoYyRxI43S
        xr/kw0ROdJKeA2oZ1VTM0FhoGFtyMp/NvM5i
X-Google-Smtp-Source: ABdhPJxLjwf6uJlAsnft6IqvwXKkqPfUiIJP+N7srcfQG3q4NjgeuuEy3jj4Ea7URiBx8sLxElVO1g==
X-Received: by 2002:ab0:70d6:: with SMTP id r22mr8702107ual.139.1634240372314;
        Thu, 14 Oct 2021 12:39:32 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id q12sm2465114uae.15.2021.10.14.12.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 12:39:31 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id f4so13560326uad.4;
        Thu, 14 Oct 2021 12:39:31 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:: with SMTP id cz12mr9646854vsb.35.1634240371444;
 Thu, 14 Oct 2021 12:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
 <20211007200250.20661-1-nikita.yoush@cogentembedded.com> <CAMuHMdU2Nr1V035Ntz-XNrc10t7femUFt_WV+Q3EHiWZD5HmkQ@mail.gmail.com>
 <c8234074-a22e-72f9-fbe7-e65d6af74eec@cogentembedded.com>
In-Reply-To: <c8234074-a22e-72f9-fbe7-e65d6af74eec@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Oct 2021 21:39:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1OhyqnREnwpEUubUsR1DUF_3a1z2MpWxe5U6rWCLUUA@mail.gmail.com>
Message-ID: <CAMuHMdU1OhyqnREnwpEUubUsR1DUF_3a1z2MpWxe5U6rWCLUUA@mail.gmail.com>
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

On Thu, Oct 14, 2021 at 9:27 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> > Obviously not only the mlb_3pin groups, but also the functions have to
> > be moved to the automotive[] arrays ;-)
> >
> > I'll fix these up while applying, so no need to resend.
>
> Looking at error mail from build robot (cited below).
>
> Looks like also must put definitions of mlb_3pin_groups[] / mlb_3pin_mux[] / mlb_3pin_pins[] under GEN3
> ifdefs.
>
> What are the proper steps now - send a v3 of the original patch, or send a fix to what is in linux-next ?

No worries, I'll fix it up tomorrow myself (unless you beat me to it,
then I'll fold
your fix into the original commit ;-)

>  > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>  > head:   8006b911c90a4ec09958447d24c8a4c3538f5723
>  > commit: 23f87fe82c0341ff79807fb5f92a05a33ce1b055 [7355/7806] pinctrl: renesas: r8a779[56]x: Add
> MediaLB pins
>  > config: sh-buildonly-randconfig-r002-20211014 (attached as .config)
>  > compiler: sh4-linux-gcc (GCC) 11.2.0
>  > reproduce (this is a W=1 build):
>  >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross
>  >          chmod +x ~/bin/make.cross
>  >          #
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=23f87fe82c0341ff79807fb5f92a05a33ce1b055
>  >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>  >          git fetch --no-tags linux-next master
>  >          git checkout 23f87fe82c0341ff79807fb5f92a05a33ce1b055
>  >          # save the attached .config to linux build tree
>  >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=sh
>  >
>  > If you fix the issue, kindly add following tag as appropriate
>  > Reported-by: kernel test robot <lkp@intel.com>
>  >
>  > All errors (new ones prefixed by >>):
>  >
>  >>> drivers/pinctrl/renesas/pfc-r8a77965.c:5030:27: error: 'mlb_3pin_groups' defined but not used
> [-Werror=unused-const-variable=]
>  >      5030 | static const char * const mlb_3pin_groups[] = {
>  >           |                           ^~~~~~~~~~~~~~~
>  >>> drivers/pinctrl/renesas/pfc-r8a77965.c:2616:27: error: 'mlb_3pin_mux' defined but not used
> [-Werror=unused-const-variable=]
>  >      2616 | static const unsigned int mlb_3pin_mux[] = {
>  >           |                           ^~~~~~~~~~~~
>  >>> drivers/pinctrl/renesas/pfc-r8a77965.c:2613:27: error: 'mlb_3pin_pins' defined but not used
> [-Werror=unused-const-variable=]
>  >      2613 | static const unsigned int mlb_3pin_pins[] = {
>  >           |                           ^~~~~~~~~~~~~
>  >     cc1: all warnings being treated as errors
>  > --
>  >>> drivers/pinctrl/renesas/pfc-r8a77951.c:4807:27: error: 'mlb_3pin_groups' defined but not used
> [-Werror=unused-const-variable=]
>  >      4807 | static const char * const mlb_3pin_groups[] = {
>  >           |                           ^~~~~~~~~~~~~~~
>  >>> drivers/pinctrl/renesas/pfc-r8a77951.c:2460:27: error: 'mlb_3pin_mux' defined but not used
> [-Werror=unused-const-variable=]
>  >      2460 | static const unsigned int mlb_3pin_mux[] = {
>  >           |                           ^~~~~~~~~~~~
>  >>> drivers/pinctrl/renesas/pfc-r8a77951.c:2457:27: error: 'mlb_3pin_pins' defined but not used
> [-Werror=unused-const-variable=]
>  >      2457 | static const unsigned int mlb_3pin_pins[] = {
>  >           |                           ^~~~~~~~~~~~~
>  >     cc1: all warnings being treated as errors
>  >
>  >
>  > vim +/mlb_3pin_groups +5030 drivers/pinctrl/renesas/pfc-r8a77965.c
>  >
>  >    5029
>  >> 5030        static const char * const mlb_3pin_groups[] = {
>  >    5031              "mlb_3pin",
>  >    5032      };
>  >    5033

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
