Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57182D9450
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 09:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407197AbgLNIqU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 03:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407115AbgLNIqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 03:46:17 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F0DC0613D6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 00:45:37 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id qw4so21362086ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 00:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xq8+jjd3xplZOrOH7tmWOFgOC3bBSAYDSpN4N1lu9vM=;
        b=ovpxmGQ8iFm6wXmjqtcMtOKo2l/p8ZK1m2B1jMQ0/0x7hzVEaGUQO+tH3r4+f5lYez
         WqzNAN2JDhAQxLwGX1DUiv4RI+ZTUWUpFNJs5m7FBZf33qorlIvL498b6S+s8orL2pZ7
         8Ajm7Ueph3DbwRz+V0hdunRoDdZs945Xou6mFMGeyHzYH1Kx13S3hmfbKbMdFfYTT7+W
         B7aDYTonXJGqhTbtPpIgFw5tMKVC56eVV3rR9HfGsocO4KIHRU4GAbeieB6NgKQqn6EJ
         tnIIW3bix5oQdopDGr51u6kg5izPvIBzoROL+cnoS5uze3q2Ld1dkIHl50xWZQxEw/vy
         kxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xq8+jjd3xplZOrOH7tmWOFgOC3bBSAYDSpN4N1lu9vM=;
        b=QGJJ9QG3oZ9dBjQjvpK+e5SUfOE4gj+ZHDCdvfDcjGiI5xwRxOCOMc1i17fTXSSNQq
         zpmJiuId7jo91+veTXtsFeF1mUm33IvlpPoTun++ZnNF1NVnbf8/Hgm11rDIwkC1Juvr
         lnsPdodgS+3fJLteaQeqGpbge2gZwf5k0YSys7CfeD4Knv3t+zBiIbzYhsaJTW4mnnKV
         kPGghTq5uRUaImsCP3j2yWmWuaYyV0P8pFKJY23ai5b4jXnSRNDbDk92Bf6NLgjUUYlf
         YSEEhy6vN5eOrzazG/XOpNcTGg2VU69CBBGN4r3WgaRo/ffdjhX372jILTAqJnJiNxWw
         NbGQ==
X-Gm-Message-State: AOAM532XSacyOyWlc00kkkAd5lNlPG0ynckf3xXXNoDOOXqofnx6d8fi
        wW4hJLDXzlTxR2EhzbZLEomzrHtRuuOlu6ano1M9L4oVj50=
X-Google-Smtp-Source: ABdhPJw5J/Ie6n7kakDsBR5+FLyXYzUxOSLydTfBb/an8vg35G655/OU32gO1L4C0O9VdZAGK8ne45RzOeIDundVIjk=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr21993760ejl.155.1607935535939;
 Mon, 14 Dec 2020 00:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org> <CAHp75VfqhXmw=eFsJuUOb9-6GsvLUEW00ivQfe6TNSmWzLD2+A@mail.gmail.com>
In-Reply-To: <CAHp75VfqhXmw=eFsJuUOb9-6GsvLUEW00ivQfe6TNSmWzLD2+A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Dec 2020 09:45:24 +0100
Message-ID: <CAMpxmJW8kOfsCMDS3hUXUu-XRHFeXU2UnDXvJWsEy3EVvBMszg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 13, 2020 at 4:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Dec 13, 2020 at 3:56 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > We need to make this namespace hierarchical: at least do not
> > allow two lines on the same chip to have the same name, this
> > is just too much flexibility. If we name a line on a chip,
> > name it uniquely on that chip.
> >
> > I don't know what happens if we just apply this, I *hope* there
> > are not a lot of systems out there breaking this simple and
> > intuitive rule.
> >
> > As a side effect, this makes the device tree naming code
> > scream a bit if names are not globally unique.
> >
> > I think there are not super-many device trees out there naming
> > their lines so let's fix this before the problem becomes
> > widespread.
>
> I think it is a right direction but the name space should be attached
> to the GPIO chip, globally it may be several GPIO chips on some boards
> which are doing the same thing semantically. So, the compound of
> gpiochipN:name should be unique globally.

I too like the idea of having the line names unique per chip. It'll
also make things easier for libgpiod.

Bartosz

>
> ...
>
> > +                               return -EINVAL;
>
> > +                               return -EINVAL;
>
> A nit: -EEXIST ?
>
> --
> With Best Regards,
> Andy Shevchenko
