Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE281DB5E6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 16:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgETOFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 10:05:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36594 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETOFP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 10:05:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id h7so2545164otr.3;
        Wed, 20 May 2020 07:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y468/OM102awg1cAk5FSerug9LG6wCGV6DEAq6G9WYA=;
        b=DPkicKz8QuBB1JTi6QvwlwNi7joyjLkO6xvQz8SpUwzF1OwpnX/271eqXP1gYlQ+lR
         bmKM/n6SAClMMlSTTfEKOxSVbXQU7CPREnbc9i69TXkL/VOQXrSv05D4Ydwvlgkb63LV
         WaJoHuQvV8brZhYIOH6y6ChvxrnOnE2Fo5sa2aee9euOTUbRx1sWSbAJD3ZvZYvaZP26
         vbLgggtrMERT1qUvA7Vgi7qAdFdVPOyPY7RIi/m9BsUg9Ksyv0C1nbOva5yfPoPXiVsT
         zn4leMEHB9MpfITbjEaw1Jal6JUJmsCUVVXTIpz0K9b3au1VoqBOzVt5977dwMV1nEtK
         B/lg==
X-Gm-Message-State: AOAM531JxM3N1Aa2nGTeLLovmhmQBFjx0HjTppMqYf+ylgXqqViBPFUr
        6aLVOG5t3n+OAeN9KQGanJAdpnbTx2HSaMzta6xHIA==
X-Google-Smtp-Source: ABdhPJw4aD6qMweeU/cwOlh80J1NHOz26SKIhals5FPRKOQG0UpAFGUp18CDWMU+Do3JAlyWEtW7goBLnDRzWs6VjCI=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr3205845otp.145.1589983514344;
 Wed, 20 May 2020 07:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200520125357.16281-1-geert+renesas@glider.be> <83cb2005-c9e6-7711-5b78-44080256e52e@cogentembedded.com>
In-Reply-To: <83cb2005-c9e6-7711-5b78-44080256e52e@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 May 2020 16:05:03 +0200
Message-ID: <CAMuHMdW-u+z4Eqhkj5ZD_i8SOTM3f09Vi2uCufEyZVW8s4Kvrw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.8 (take two)
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergei,

On Wed, May 20, 2020 at 3:47 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 20.05.2020 15:53, Geert Uytterhoeven wrote:
> > The following changes since commit 41fe32ecc7aff4527a4ee477870d9b1164be95a4:
> >
> >    MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers (2020-04-20 13:14:05 +0200)
> >
> > are available in the Git repository at:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.8-tag2
> >
> > for you to fetch changes up to dfae0422de12265ae7c9bf57b34990200dea0c83:
> >
> >    MAINTAINERS: Renesas Pin Controllers are supported (2020-05-20 14:02:00 +0200)
> >
> > ----------------------------------------------------------------
> > pinctrl: sh-pfc: Updates for v5.8 (take two)
> >
> >    - Add support for the new RZ/H1G (r8a7742) SoC,
>
>     I think it's rather RZ/G1H. :-)

Thanks, retagged and resent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
