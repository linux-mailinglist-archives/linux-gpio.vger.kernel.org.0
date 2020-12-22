Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876C42E0760
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 09:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgLVImb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 03:42:31 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:35420 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLVIma (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 03:42:30 -0500
Received: by mail-ot1-f43.google.com with SMTP id i6so11318408otr.2;
        Tue, 22 Dec 2020 00:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1XpA44/7GWmNDj0l2VSHEVXeX5TKQoGtwuhl2k5PB7A=;
        b=pjSlf/wF57sd9J74qbgnYSqrktOranfqT2GyBqh6GbZfrVw64hq89W5IGJQr4NPqst
         X2t93fgKP2LdUx84fxCRjTRXEp5xT/Q1yIGa5nDmhEBy1FN1Omd3HEwDvOejbtAWMP3R
         fh9ZOOCM9BIgeSkvzs2K1sdj7H6TokNcIh/bU42UWIxyEV24kago/xl4IhjAl9RB8SIm
         COid/OyiDz3DkuNS9hs7yiKi3HzoVGF9YTDFpNqG+migsZr2lvy3VskP7iE0gxA1tbli
         /hNYI4RRFDe7d9LMO6Nhs+fCtXqgPbPNW0XZEE/bBwkZ8JQoNeJjRadhWh6ltUfocE8M
         0rag==
X-Gm-Message-State: AOAM533WPH23wjyNzuPyuB5RC3b7o3YBNZGl1+5mC9fu5y/LaNOk+C+a
        oLhmG2e6oxex/qx3D5Wlh/FJXf/G3wxeDk4Nv18=
X-Google-Smtp-Source: ABdhPJwfiqOFSMZaFM8xBA2rS/jPzI8V4/5BltfMeSJZ46PzfvHc0PCC/KyWC/Rc5mvl6W7Bv/Ym6GJXKZG8z/nVquk=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr14987627oth.250.1608626509823;
 Tue, 22 Dec 2020 00:41:49 -0800 (PST)
MIME-Version: 1.0
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608519279-13341-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608519279-13341-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:41:38 +0100
Message-ID: <CAMuHMdXp8cuO8ppNbDTmt4aovDCvC9EG23NHoZNAZK5Y0eD4Ww@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] mfd: bd9571mwv: Use devm_mfd_add_devices()
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
> To remove mfd devices when unload this driver, should use
> devm_mfd_add_devices() instead.
>
> Fixes: d3ea21272094 ("mfd: Add ROHM BD9571MWV-M MFD PMIC driver")
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
