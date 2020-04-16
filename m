Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE081ABF02
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632943AbgDPLTy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632868AbgDPLTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:19:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5304C061A0F
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:19:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so7372540ljn.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NGDiAiHa7gOkZcjetP+fIoZxVSWT0kUGxzHZFTTg7do=;
        b=OtzsmKq4kHVDABFucflRXQScsA5dK0d8y+T7VpIusux0bdbzOkryTGmdsRMejMModx
         hG+VUUfuAGphGgNl/ZWXlXnkPfKW8XJTUtB2InKKwK+VcmtS133aXqUYztuRFDgCKwYr
         CuXgPqQNihksSjAt6Quo/CXuja6kdP04P2Gvo1/g98aFnINd6I9yEQ/8pZ1kl2n2D588
         7oh3h6PhgI4kgcrI04UrK/gjC7byofTga40iU9XD5p9G/tTD9nCNZdb0xlIsO1aFBAIB
         1GMRLSIgOunDZtfkEJg5DwnLQjfuOZf9TkvUJjQS3MjVtW9RVo8n1pZUQ1yFDHuupZdE
         870A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NGDiAiHa7gOkZcjetP+fIoZxVSWT0kUGxzHZFTTg7do=;
        b=CHwWugLVvB3CEzpVtU11HCT3gR9VNttGGDus20RitTyf8t51Bt1dZvIFhf1+cC1fD+
         gC7ids1oklyGJ1xFp6c5Xr/VYvvNseHgIwFutqmBRQH+XXNm8DKixS/b7NTEww5df0VD
         X53QGKOn+SPJKdMLZHt3H1H1dnjOmijpiFJDSztNarnBxrd6da2u9cvOuCmh/oZWVVBc
         vNqRJXtUjfQUIU00Nglhg1BjU9zKFgIB7XR/HYYf7PO05Cy3CEUERnJG4he5GYMd2GU1
         aKin/0BsOKqtvxzA21NOBtWDmb9xPRqlvt1hQT4BNUIDQFywKpRj49BE3mX4YecY9N1R
         M7Ng==
X-Gm-Message-State: AGi0Pub9+bGFl5z8uZ9LaQR1N2tgmnU6dOMOnywaQJoVwIM8nrwX3zEX
        y8Jq3FArOeZzvvlKux/PmFlgffwapKbceww2AVyHUg==
X-Google-Smtp-Source: APiQypJy9THPwjoS7Jo2tqNfqwFCh62pVSbwOBq6PdDLITxyc2Xnd0cf+VlMiSRhsUAbLwuDb/LTyMe0TXHxVDUdths=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr5663453ljd.99.1587035984361;
 Thu, 16 Apr 2020 04:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200320093125.23092-1-brgl@bgdev.pl> <CACRpkdZgWUwmmuXn12DS3TsQS0yQxcweqK6HGxBm=V_2LBLBMw@mail.gmail.com>
 <CAMpxmJUb09KGreHw6Bdz79rbnQE7oZnWg_5qN_FhzoS2-XccFA@mail.gmail.com>
In-Reply-To: <CAMpxmJUb09KGreHw6Bdz79rbnQE7oZnWg_5qN_FhzoS2-XccFA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:19:33 +0200
Message-ID: <CACRpkdaeWtk1fiGMX7QkkCZ-DcFqSvSB9xQmuLy1VO+QWsZo6w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't call sleeping functions with a spinlock taken
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 2:27 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 14 kwi 2020 o 14:00 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Fri, Mar 20, 2020 at 10:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > We must not call pinctrl_gpio_can_use_line() with the gpio_lock taken
> > > as it takes a mutex internally. Let's move the call before taking the
> > > spinlock and store the return value.
> > >
> > > This isn't perfect - there's a moment between calling
> > > pinctrl_gpio_can_use_line() and taking the spinlock where the situati=
on
> > > can change but it isn't a regression either: previously this part was=
n't
> > > protected at all and it only affects the information user-space is
> > > seeing.
> > >
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Fixes: d2ac25798208 ("gpiolib: provide a dedicated function for setti=
ng lineinfo")
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > I'm sorry that I lost track of this patch :(
> >
> > Do we still need something like this or has it been fixed
> > by some other patches?
> >
> > Yours,
> > Linus Walleij
>
> Nope, this is still an issue. Do you have a better idea than mine?

Nope, can you just queue it in your tree?
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
