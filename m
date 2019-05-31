Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B14309DE
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 10:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfEaILS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 04:11:18 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43959 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfEaILR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 04:11:17 -0400
Received: by mail-io1-f68.google.com with SMTP id k20so7425914ios.10
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2019 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SoTjh9fZs577qd03UCVHZ5PDINYm/FAkBw14QVtAgt0=;
        b=GM5qcB6wuBz2O2n16t/P/yLsmaN8RvJa3MtiSU+BuYRCN7yFfjBJBuBCDUHo16WM8g
         llJ/Ec58pYvBSclUWSpr/3pW/Yb5386cUc5/BN2wIVo03MbCVWOJ0ifM2pInq9r2U6jU
         lZwvomDBQSLVhkOGm4kjoQLWGHQFb2RtUTZq5GbBcW3etzQWvoK8QhQKKKJq0ehfZWFw
         KUVij+1Qcbk0ti7pYqN9tP2auVAH6EfRau1QKDt2gGVhMFFEkUQdO9n10kK8h0ASW/e+
         c10b45VjlDmE20xOz4cdfLOTw/HJ1sK3fNjJmZ77niTuTZuRAShX4QBz4bDo2dqwTE9Y
         EGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SoTjh9fZs577qd03UCVHZ5PDINYm/FAkBw14QVtAgt0=;
        b=Ecq28rE5SzWDl3Fr7N22fGGRIvTc1v31VXd9k/eKvbA0G18/6vZD1t3wBP5pgyt3ys
         uGaHbHHSwa0rsWj4/9bHtARy4WYBbHiJ1T80x6XdRAbJmA3bZBhkHvJ/nOL4Xs57Z/k8
         NZcNbNsdwKpjguquC5aGHASKqpp1TxoFx8OA1RH7xQdBmaq/gva/AUO9jTUVYa6fFnKY
         q+QwMqfY7cATL1k9q5CvsNpTCe3JeEuwQPQcGlGdyeSd1kgzcvXsgPjaIYOQ3FlFz9YV
         FQMDPqjxBJl3ij7VFSisshx5HVPDTpv8v7hNKM7xY9M99HzANOqGhucGWYyZ7MdD/VHM
         9RMw==
X-Gm-Message-State: APjAAAU0aJg1/PkHyXYBtRnkasHGN0r6s8XMiDD8AYmcIjeDvM4+TqrN
        DqmOFSNmh9ViuugiHbU0P/ZR9rZDVz/jSacj23mndw==
X-Google-Smtp-Source: APXvYqzayKC8AlTqglAElE3e/LKxj1fM2VIYzVGSM2xLMJGreMrbPIQ6wsyXD2Lw9cTs0FF9mJf/2i33D04epPncWkI=
X-Received: by 2002:a5e:8b43:: with SMTP id z3mr2079042iom.287.1559290276226;
 Fri, 31 May 2019 01:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190528154601.7597-1-brgl@bgdev.pl> <CAMuHMdW6cKkOHqLq_DtH-Yn9pYHwk5cLug6yjM88F3VetKC51w@mail.gmail.com>
In-Reply-To: <CAMuHMdW6cKkOHqLq_DtH-Yn9pYHwk5cLug6yjM88F3VetKC51w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 31 May 2019 10:11:05 +0200
Message-ID: <CAMRc=MejzsiKogRLN6hFC_L3piNc+RJgk4aLL4H6hsajzds1Vw@mail.gmail.com>
Subject: Re: [PATCH] gpio: em: use the managed version of gpiochip_add_data()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        inux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 28 maj 2019 o 18:20 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> On Tue, May 28, 2019 at 5:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Use the managed variant of gpiochip_add_data() and remove the call to
> > gpiochip_remove().
> >
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Applied.

Bart
