Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1202AD0C0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 09:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgKJIAR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 03:00:17 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44252 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKJIAQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 03:00:16 -0500
Received: by mail-oi1-f196.google.com with SMTP id t16so13328692oie.11;
        Tue, 10 Nov 2020 00:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b7MGp7ErjnHg/VmHDY9yGLffwEtBld7+Vr4hNPrka3M=;
        b=rQw1qW5K5NS6FsPiYNXX85cgsf6eRnspXc+Nix+3GiSq1Ay+ybCHc2T1DtnaqMgi8l
         mOfzAGTaWHvuvR1VPMAx40pzgaHeWuZ14SoChlD7w+bcD6xlduszQWDnUiwMhK4/zIsM
         2qES6moQv8/T6Bn7GLXXTEXduCt2uMQNaGq0h7h5pnX7hxWhqWKclP+6cTPkekpVJUFN
         703P/xYOjSy7tWGz1kegVrH1OOd8/HHdGgVO+zrnpSEbD1TESZ1RO9R4c6+u72wgh1ZE
         lBmTZwb5G49WH5LnFBCm0ozNmYtIflmnlgspxQjzxkna8r8MK+kZgXsPWIbDA8X6l+M7
         pmvg==
X-Gm-Message-State: AOAM531zeAItrBJLrLg80yJIyxOvMMxuBaAC8Y/MuA4+9egYYV4Ka2uC
        iNQXaDmEf+9b3WqnLrOj8mDAdRTfjJn1IdfBRLAQS1AGeTA=
X-Google-Smtp-Source: ABdhPJw1dBWrKadl84msABjdY55TaEUqhSGaLSoN70ypSifnpy2cHi2L/dguuN86Y1mXNCcFjlrf84WG1kbg22W41SM=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr1928472oia.153.1604995216178;
 Tue, 10 Nov 2020 00:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20201109221012.177478-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201109221012.177478-1-rikard.falkeborn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Nov 2020 09:00:05 +0100
Message-ID: <CAMuHMdVJNZvXpumMJzJxcNFaE_ccRhepbUvyMxzGynCd-QD+xg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Constify sh73a0_vccq_mc0_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 11:10 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
> The only usage of sh73a0_vccq_mc0_ops is to assign its address to the
> ops field in the regulator_desc struct, which is a const pointer. Make
> it const to allow the compiler to put it in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
