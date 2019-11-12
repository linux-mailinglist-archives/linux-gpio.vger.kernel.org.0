Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E173FF9862
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 19:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfKLSRv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 13:17:51 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41385 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLSRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 13:17:51 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so15694455oif.8;
        Tue, 12 Nov 2019 10:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=apbcn+4sF2345Jm7spGk7DwHgRpb64aZnTUJ4t12uLg=;
        b=JeqAw+j1OoT8YbIFVA3pbXRK2Tari0Ywafu6AvEeXTRcYhaw+6VGXp5mSyANmNQ4eK
         DrA4hdV3IfGNdI+lky8Bhxl+R9xz2RwmjUmhU8ZOjOgAJIkx+UTnKSrbhf4Yg0CiAesU
         UhetPaAa0GHZNP1msy1xIuyWmxxKw/MyyLsofaEmeodKIS9Ua9xWJNMHtQissol0yhMc
         QnIdAMt9WBhGg44jMRXo+CfhnEjrqWiBh8Z763rXvyfhExFdxxi30+0+QKpIgJoVrLGU
         InmZLb+qfTV2+f9HbXQDSS1ZtWSvAMeXNZ7cSRWBd0VydNb2pclmDcktwY2jhfvc2ut4
         GHog==
X-Gm-Message-State: APjAAAVgyBW0L8XIGnqSSmz8fSHR75NtsGa3nDubR42EMo9fwaOQb/PI
        WmIoq9JzYgvk6uEGqFE4v7xbphi7xEligbxZLRw=
X-Google-Smtp-Source: APXvYqyVJRey7Eo3u6IB7XCIegs7fVJAoP+7XL/QcuCsEX4q0nKSDAcDk7fBaRLT6qKtY/fuhfTCipYmaHShCQVE3xE=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr258343oia.148.1573582670146;
 Tue, 12 Nov 2019 10:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20191112141748.GA22061@localhost.localdomain>
In-Reply-To: <20191112141748.GA22061@localhost.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Nov 2019 19:17:39 +0100
Message-ID: <CAMuHMdWUWPdRvVJ_pdDqUdZpahYCyjDDS0KWGw9JzjUjaunHQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: rza1: remove unnecerssary static inline function
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 12, 2019 at 3:18 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

s/unnecerssary/unnecessary/

> Having static inline oneliner does not benefit too much when it is
> only called from another oneliner function. Remove some of the
> 'onion'. This simplifies also the coming usage of the gpiolib
> defines. We can do conversion from chip bits to gpiolib direction
> defines as last step in the get_direction callback. Drivers can
> use chip specific values in driver internal functions and do
> conversion only once.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As this is a dependency for 2/2, which will go in through the GPIO tree:

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
