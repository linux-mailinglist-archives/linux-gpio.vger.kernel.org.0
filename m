Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562E12E076D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 09:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgLVIud (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 03:50:33 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:46977 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgLVIuc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 03:50:32 -0500
Received: by mail-ot1-f44.google.com with SMTP id w3so11252186otp.13;
        Tue, 22 Dec 2020 00:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jY18YEcF5xOHELJM57FjJ/aGJT6euUtJ4hSpkcgklt4=;
        b=VjfTXqPP0JLErDYpB82lzpD7YzdeV9RPFaqprNkaeLIkugBB4s2PyWisn1uM1eA1Aq
         69U3GLr/uOdhEMpVwKU3yrv86wbGNdqAtMMdr3adZL5aXAkALLVjOwWTfKRXBQQz+FLL
         r5/zZBDHFbKch31F2tX3T//me3ydfryXO2ICANt4ax1DRgydmwdurt5e6Js871u8viIJ
         Hhy9de5I9TNHohZHfsoDBe1f6Wb8b7nt7AoFEoUpEOuAAqV3I8xAO7MOrQ+xKJgfb3dM
         5iun4/yC4DQ3KxtVIjyAcUEdAjp7f/3gWHQkFW1ZXE1gz3i6j4SbGAGTUHuEUM9uvKyG
         Dfdw==
X-Gm-Message-State: AOAM531YSrNafH77PXPqKST2IZG37V7J7J7w+plcd1oDTWD7UpG5Zwcp
        AZuSlBgUjki9y77KzV1l9eG0/GiM6N2uP8c2kc8=
X-Google-Smtp-Source: ABdhPJxTemkIvaNdloVrP3Z3Q+MIjTq/I4aPxEec+ZcQBTwXd79keU9QscBGUx+ycOChoqCZs8tuTSiRtz2Im9uBTkw=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr15041926otc.145.1608626991901;
 Tue, 22 Dec 2020 00:49:51 -0800 (PST)
MIME-Version: 1.0
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608519279-13341-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608519279-13341-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:49:40 +0100
Message-ID: <CAMuHMdVw_+dj78oygsVFnc4j9sTj97h1Q0GBp7oGWzakxCPfQA@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 21, 2020 at 3:57 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Use dev_regmap_add_irq_chip() to simplify the code.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
