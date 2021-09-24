Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E15416E2B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 10:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244420AbhIXIr4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 04:47:56 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:35468 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244324AbhIXIr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 04:47:56 -0400
Received: by mail-vs1-f46.google.com with SMTP id f18so9281961vsp.2;
        Fri, 24 Sep 2021 01:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8afsKzMbCIpvtE8Me8mu99Ibo9pfwL9+Xv6zyVV3Isw=;
        b=ifg7WprpfMgprZNI49YVrto4aRjpTxrxer1fepKKQS4xjMmHNqnRwXHFdf2jOy1p/6
         oD9KDo6xf7X6izdkc7uyyyDLPOG4RWChxuOS51rCkdhVnyXWf9XOtDIOJcuFTgaeLtCA
         JX8fOgYr6RXRVB384dtlUUDHP1B4Vm2hpQvUbVBRpwxSOP7bComXP2/M0w4cm0ZY4/Hg
         AbYpo79NTKEabwfUTKnVeWEpCYzK9fsKUZeb1kZfQRkFyNfFIcy2jUSI2r0DeAP4HIwt
         S5qSQdQOxpMgR88tuhsaji09XSkcY82Hoyl+fW/meqgOYc6qPnT8ipeMoG0xZxAbQ2bF
         3XbQ==
X-Gm-Message-State: AOAM533UTEd4lNTefxy6brFD6FCjtkvPg3G/8MjwwzpXQ1E2buoXeKVd
        /9jpnmcumkhkl9iXei+VkG0hIkTXeOXzpewsjP/uE3PS
X-Google-Smtp-Source: ABdhPJwoADKVuKxU8f1Jt1hnenbujFcIr8AkPldUgNhQmF4WcI+ivYWFbcDZfWSh/S0oUfhgbfVvo95dqL3GIwEC1CM=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr8019646vsl.37.1632473182854;
 Fri, 24 Sep 2021 01:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210922074140.22178-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210922074140.22178-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:46:11 +0200
Message-ID: <CAMuHMdXpELNRXbLTidmSdAqio27WLm8JK=sk0Vhz=wMdN3UX8A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix missing port register 21h
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Wed, Sep 22, 2021 at 9:54 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Remove the duplicate port register 22h and replace it with missing port
> register 21h.

Thanks for your patch!

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue as a fix in renesas-pinctrl-for-v5.15, as this will
become a dependency when enabling SDHI/SD0, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
