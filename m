Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93FE732039
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfFARsB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:48:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39345 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFARsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:48:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id a10so9325699ljf.6
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDFWOamDcwclWQ44b4W8wXrrwx4uqY/RgBjU1iNelu8=;
        b=ReIJPFAl33oDUp+o8LjcGF+2oUpFciOZZ26gu2yTUCnCDRM6QCWW5WXKnwx01MPzE7
         b4Y6sXxYUYwY2MZrOoKoKLxzRl9fMloY0B9P/RW04S288V3Jcfk+JxAvH4Uy0UlStfgj
         ZiZ49jxXdNX9Za4kixvZ8dmGH2sRJ2taxlKOXydasxLlO3tPdK4RQw1UhG3R1UZUKOX+
         Z9eTLYVKkENQ8GGUNKK147+xlstt3xQmvEQau8IeooieyaKhtSiL9yoUMXXyt+ilpKIX
         bU19lZelNxeKz+Oo0oGrEWZwl2VGZcJDsaVHJWnbwCZaaGsLPLsWst73Nb1ToWzb2enV
         9aNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDFWOamDcwclWQ44b4W8wXrrwx4uqY/RgBjU1iNelu8=;
        b=qc+DDwB5kPTKiT3ME6yKnfPCtMW4HjggNF1R4WWEwK0qDsdu7qd/qeHVBNdUQYQgTJ
         BWc5C+CLgT2zwAyP16bpHU2GG/s22TBeNjSCuWU1PeLQahUBmMFJ47JcvkEiwR3wTEmY
         f1AbKfQMRMHu8VMWVmUTkYW6URf7O1sAhNzkvjZq04Hthz+bRONFQMb3wLAaUBWM1AJG
         72FgSK+bayLySggD7C0GYoyBKDdOwXSYO9xs3z9qzt1UrWCIokuLXwGSwd/2ifbHbYq4
         3E+m9qG0CuKIAA5TkLOj4i7q4XY7jkckQZZCCba6LKkcMJ3vn2Zku3M28d9oSFdEg5FF
         SuXQ==
X-Gm-Message-State: APjAAAVZg6zVt+lJYEW74zcOJPZDjxBs01ZsIsiCak94ePL6u0pPTh55
        ZcggefayMS+QtGd7cuAQ9TXPqG+LP3jFmca09VyNZQ==
X-Google-Smtp-Source: APXvYqy5OpP0IGZrGerI3GIBoPyhV7Km+3aotWslvdxyxcZf0Rb/AYL1m/dQfTtRm33uDghRZao7uhN5aYvLTK/5l3g=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr310625lje.46.1559411279300;
 Sat, 01 Jun 2019 10:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be> <20190527124051.7615-2-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:47:48 +0200
Message-ID: <CACRpkdbLfKqs-kwS0NZgU2_k6H53u7B5cJ9VSoHvsxLQEtTdbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: em: Remove error messages on out-of-memory conditions
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 2:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> There is no need to print error messages when memory allocations or
> related operations fail, as the core will take care of that.
>
> Change the returned error codes to -ENOMEM to match the failure cause
> while at it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
