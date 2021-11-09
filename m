Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D4244A7E1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 08:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243773AbhKIHy0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 02:54:26 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:45662 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243770AbhKIHyX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 02:54:23 -0500
Received: by mail-ua1-f42.google.com with SMTP id ay21so36775177uab.12;
        Mon, 08 Nov 2021 23:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgffDUjQsjill25nUFT5ffn4jKhCqwcafM+ZOC9z8Sc=;
        b=5Lgb6hCAwI0ht8PRU4Ppg3vs9SwTUpWNp47npmJaNNFeSDv2DLwnihgoiIelsTric0
         tUteG7hcdsjNED768RT7dzsn5t6gJt4bDgpYBLnNjr739FaIIZsinoC6eRJUPoGow0IH
         Yg5InvcriiLv/uLxumtV2jwzGlCw9gLbkbQOk6s34l8+G/CC5ingS6mwEY5Af2/hjjM0
         9ZOxvnvtsv6zOB8j4HWpcRbUTM/oDDaK2vMeLa2Rhml/LrQAI3u5JWDaxuVidE7PPRsi
         ZGGZRqe2BaQAd9LXQA89TVfY6ckJ+brf4Gr01CGA7tHaolWd4AxsGAyqPxu6RQdYzpM/
         3nBQ==
X-Gm-Message-State: AOAM531wFwTNXCh0NdUmyNWjOdFvOeFzeZ/gxlai1HRPlRDbAknp4zEl
        RZLzC9Sg+OvBrCs0oh9aYGCRDLqtyKWYTNJF
X-Google-Smtp-Source: ABdhPJydjmdCIS54GRDPSEIFdAFiCIDTsfbp4DCvJWnXcUwuWt6bfBNKCbYhf4iZpJAh5LSPhsGNFg==
X-Received: by 2002:a67:a20d:: with SMTP id l13mr9301001vse.59.1636444296563;
        Mon, 08 Nov 2021 23:51:36 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id v68sm2928569vkb.30.2021.11.08.23.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 23:51:36 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id e10so36886594uab.3;
        Mon, 08 Nov 2021 23:51:36 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr38156641vsl.41.1636444296027;
 Mon, 08 Nov 2021 23:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211027134509.5036-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CACRpkdbY7QtjACCu63k+=Mn-XeLN3+fOjmKYR0w2NbhEZYGbeQ@mail.gmail.com>
In-Reply-To: <CACRpkdbY7QtjACCu63k+=Mn-XeLN3+fOjmKYR0w2NbhEZYGbeQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 08:51:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcx3E-pc9MDMjE08kFHQ=LAr2kHP8Xitu0YfkPP3QNAA@mail.gmail.com>
Message-ID: <CAMuHMdWcx3E-pc9MDMjE08kFHQ=LAr2kHP8Xitu0YfkPP3QNAA@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: pinconf-generic: Add support for
 "output-impedance-ohms" to be extracted from DT files
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Nov 9, 2021 at 5:32 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> > Add "output-impedance-ohms" property to generic options used for DT
> > parsing files. This enables drivers, which use generic pin configurations,
> > to get the value passed to this property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Looks good to me:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I suppose Geert will queue this patch with the rest of the Renesas stuff?

Yes, that's the plan.
Unless you have another user in mind that cannot wait until I will
have sent a PR for v5.17?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
