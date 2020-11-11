Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD8F2AF44E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgKKPBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgKKPBV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 10:01:21 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7972CC0613D1;
        Wed, 11 Nov 2020 07:01:21 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so1728062pfm.13;
        Wed, 11 Nov 2020 07:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dTw07PXCm9f+sMZyny8xFD7GUyUJB8EhOILXJ7ADhU0=;
        b=Gq25Dk2U3e7nhbUC55/HaiMEDdF/29apkSnG//wL1MJev+p2AAKA+xeSBcUeEhlXTg
         Vx18yBrBEIrUqYqCgd5tk2YjrlccH7gJI8MJeJ8NrkZXfniKoWRYZUDRbb9bZWGCDbJG
         /BB+rRHJIpbnQmTAodPSIioz8NWB9Xrfp8nWyGLwE9B6ctxT1C6LQEuCbRz/A4E4CNYj
         tOnE16BVnIMTrBKSngDJjKzu60o9RTphGZj1kdZTGnrRxl1r9yWAG0/oVlrPhahwsXk6
         41BWB0x0zaqFZ4A1CtFl4lK8h8e16J5gAUOU8QjyCMPayToZQgX227YwtfgyK2WVL8ea
         z7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dTw07PXCm9f+sMZyny8xFD7GUyUJB8EhOILXJ7ADhU0=;
        b=rkV27qyt6hmmuCgIjhdCA6x2HnEUVj3OET6tknSNOXaXG/aCDobkV8uhUWAU4pXQvG
         1EijwMhsTLRGkQiixJZaCtwj9ksN+vKbJCG1eFWBvuYMYqlblhu2se9dmoXFXsraFFMY
         A5KrxhL1J/1F36gQctPgzPxtRKLuSKgt++owkeNFF1HRC2T82Wc14GqI/CJ0lTJ2TvDS
         A7QLY9oMNOGyJlvEpogfiSejmyWShRaIAjXCwaZECGmrvKQZSuM2zti3hxF14CX5bcQE
         BJs+ijOkrb2HDm7f+TLv2fVFyg4VG1RtQz3ZkmCewWb2Q/7Sm0ERmQcDbQiJ7FEipCkH
         CJpA==
X-Gm-Message-State: AOAM530G+sIuSNJDi62XMu58BBLIxwmYm5MMWCAj1HY0ORqYRI6JRTmo
        +gnMeUE1luyAtcwZdbIx7cW2nU+w5mKGnOFZWuE=
X-Google-Smtp-Source: ABdhPJy0wQdnzPQ9LXaMVo3zj2ttIqZISP0y5zmG28vToQ8AtXVbVKI+sA5Id11mwX7nUu19CajZLaJZf7OpA720+hc=
X-Received: by 2002:a62:7c95:0:b029:18c:5002:a1ab with SMTP id
 x143-20020a627c950000b029018c5002a1abmr6885612pfc.40.1605106880991; Wed, 11
 Nov 2020 07:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20201110093921.3731-1-brgl@bgdev.pl>
In-Reply-To: <20201110093921.3731-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 17:02:09 +0200
Message-ID: <CAHp75VeRvO-PpNpcQHKXBRdWQqavfvQwqai2gRys+FbhBuVy4Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: devres: shrink devm_gpiochip_add_data_with_key()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> If all we want to manage is a single pointer, there's no need to
> manually allocate and add a new devres. We can simply use
> devm_add_action_or_reset() and shrink the code by a good bit.

Yes, it is possible to convert all one-function-based devm_*()
wrappers to use this approach.

The problem is, it will call the release() function on error which is
new (and probably undesired) behaviour.
I suppose you meant devm_add_action() here.


-- 
With Best Regards,
Andy Shevchenko
